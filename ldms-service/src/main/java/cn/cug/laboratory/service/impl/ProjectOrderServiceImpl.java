package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.ProjectMapper;
import cn.cug.laboratory.mapper.ProjectOrderMapper;
import cn.cug.laboratory.mapper.extend.ProjectExtendMapper;
import cn.cug.laboratory.mapper.extend.ProjectOrderExtendMapper;
import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.extend.ProjectOrderExtend;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.model.persistent.ProjectOrder;
import cn.cug.laboratory.service.ProjectOrderService;
import cn.cug.laboratory.utils.DBUtils;
import cn.cug.laboratory.utils.RetuValueClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by PP on 2016/5/23.
 */

@Service
public class ProjectOrderServiceImpl implements ProjectOrderService {

    @Autowired
    private ProjectOrderExtendMapper projectOrderMapper;
    @Autowired
    private ProjectExtendMapper projectMapper;
    @Autowired
    private ProjectOrderExtendMapper projectOrderExtendMapper;

    /**
     *
     * @param proId
     * @param stuId
     * @param score
     * 实验预约成功，插入一条记录
     */
    public void insert(String proId,String stuId,Float score) {
        System.out.println("serviceImpl--insert"+proId+"--"+stuId+"--"+score);
        DBUtils dbUtils=new DBUtils();
        String lastID=projectOrderMapper.selectLastId();
        String ID=dbUtils.StringAddOne(lastID);
        ProjectOrder projectOrder=new ProjectOrderExtend(ID,proId,stuId,score);
        projectOrderMapper.insert(projectOrder);

        //Project相对应的余量也要减1
        projectMapper.reduceLeft(proId);
    }


    /**
     *
     * @param stuId
     * @param pageNo 当前页数
     * @param pageNum 每页显示的条数
     * @return
     * 在页面上显示学生条目
     */
    public RetuValueClass<ProjectOrder> selectByStuId(String stuId, int pageNo, int pageNum){
        int startSite=(pageNo-1)*pageNum;
        List<ProjectOrder> projectOrderList=projectOrderMapper.selectByStuId(stuId,startSite,pageNum);
        int projectOrderCount=projectOrderMapper.selectCountByStuId(stuId);
        return new RetuValueClass<ProjectOrder>(projectOrderList,projectOrderCount);
    }

    /**
     *@author:PP
     * 根据学生ID和预约的实验ID删除一条记录
     */
    public Integer delete(String stuId,String proId){
        String proOrderId=projectOrderExtendMapper.selectProOrderIDByMultiInfo(stuId,proId);

        System.out.println("该记录的ID为："+proOrderId);
        Date todayDate=new Date();
        System.out.println(todayDate);

        Project project=projectMapper.selectByPrimaryKey(proId);
        Date startTime=project.getStartTime();
        //System.out.println(startTime);

        if(todayDate.after(startTime)){
            System.out.println("0");
            return 0;
        }
        projectOrderMapper.deleteByPrimaryKey(proOrderId);
        projectMapper.addLeft(proId);
        System.out.println("1");
        return 1;
    }

    /**
     * 查询个人成绩并分页
     * 根据学号选出成绩>0的科目
     * @author:PP
     */
    public PageModel<ProjectOrderExtend> selectScore(Integer currentPage, Integer offset, ProjectOrderExtend projectOrderExtend){
        System.out.println("ProjectOrderServiceImpl");
        //获取总的记录数
        System.out.println(projectOrderExtend.toString());
        Integer totalRecords = projectOrderExtendMapper.pp_selectOrderScoreCounts(projectOrderExtend);
        System.out.println("totalRecords"+totalRecords);
        //创建PageModel对象
        PageModel<ProjectOrderExtend> pm = new PageModel<>(currentPage, offset, totalRecords);
        //获取当前页面数据
        System.out.println(projectOrderExtend.getProName()+"--");
        List<ProjectOrderExtend> data = projectOrderExtendMapper.pp_selectOrderScore(pm.getStartPosition(), offset, projectOrderExtend);
        for (ProjectOrderExtend pOrderExtend:data
                ) {
            System.out.println(pOrderExtend.toString());
        }
        //设置数据
        pm.setData(data);
        //返回页面
        return pm;
    }

    /**
     * @author:PP
     * 根据学号在project_order表中列出已选的实验
     * 分页显示
     */
    public PageModel<ProjectOrderExtend> selectByStuId(Integer currentPage, Integer offset, ProjectOrderExtend projectOrderExtend){
//        System.out.println("ProjectOrderServiceImpl");
        //获取总的记录数
//        System.out.println(projectOrderExtend.toString());
        Integer totalRecords = projectOrderExtendMapper.pp_selectOrderRecordCounts(projectOrderExtend);
//        System.out.println("totalRecords"+totalRecords);
        //创建PageModel对象
        PageModel<ProjectOrderExtend> pm = new PageModel<>(currentPage, offset, totalRecords);
        //获取当前页面数据
//        System.out.println(projectOrderExtend.getProName()+"--");
        List<ProjectOrderExtend> data = projectOrderExtendMapper.pp_selectOrderRecord(pm.getStartPosition(), offset, projectOrderExtend);
        for (ProjectOrderExtend pOrderExtend:data
                ) {
            System.out.println(pOrderExtend.toString());
        }
        //设置数据
        pm.setData(data);
        //返回页面
        return pm;
    }


}
