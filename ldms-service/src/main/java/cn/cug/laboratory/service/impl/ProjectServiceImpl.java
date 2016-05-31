package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.ProjectMapper;
import cn.cug.laboratory.mapper.extend.ProjectExtendMapper;
import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.service.ProjectService;
import cn.cug.laboratory.utils.RetuValueClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by PP on 2016/5/22.
 */

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectExtendMapper projectMapper;

    @Autowired
    ProjectExtendMapper projectExtendMapper;

    /**
     * @param id
     * @return 根据主键获取实验
     */
    public Project selectByPrimaryKey(String id) {
        return projectMapper.selectByPrimaryKey(id);
    }

    /**
     * @param teaId
     * @param pageNo
     * @param pageNum
     * @return
     */
    //pageNo表示第几页，从1开始，pageNum表示每页的记录数目
    public RetuValueClass<ProjectExtend> selectByTeaId(String teaId, int pageNo, int pageNum) {
        int startSite = (pageNo - 1) * pageNum;
        List<ProjectExtend> projectList = projectMapper.selectByTeaId(teaId, startSite, pageNum);
        int projectCount = projectMapper.selectCountByTeaId(teaId);
        return new RetuValueClass<ProjectExtend>(projectList, projectCount);
    }


//    public RetuValueClass<Project> selectByTeaId(String teaId, int pageNo, int pageNum) {
//        int startSite = (pageNo - 1) * pageNum;
//        List<Project> projectList = projectMapper.selectByTeaId(teaId, startSite, pageNum);
//        int projectCount = projectMapper.selectCountByTeaId(teaId);
//        return new RetuValueClass<Project>(projectList, projectCount);
//    }

    /**
     * @param name
     * @param pageNo
     * @param pageNum
     * @return
     */
    public RetuValueClass<ProjectExtend> selectByName(String name, int pageNo, int pageNum){
        int startSite=(pageNo-1)*pageNum;
        List<ProjectExtend> projectExtendList=projectMapper.selectByName(name,startSite,pageNum);
        int projectCount=projectMapper.selectCountByName(name);
        return new RetuValueClass<ProjectExtend>(projectExtendList,projectCount);
    }

    @Override
    public List<ProjectExtend> selectByMultipleInfo(Integer currentPage, Integer offset, ProjectExtend projectExtend) {
        return projectMapper.selectByMultipleInfo(currentPage, offset, projectExtend);
    }
    @Override
    public Integer selectByMultipleInfoCounts(ProjectExtend projectExtend) {
        return projectMapper.selectByMultipleInfoCounts(projectExtend);
    }

    @Override
    public List<ProjectExtend> selectProByMultipleInfo(Integer currentPage, Integer offset, ProjectExtend projectExtend) {
        return projectMapper.selectProByMultipleInfo(currentPage, offset, projectExtend);
    }
    @Override
    public Integer selectProByMultipleInfoCounts(ProjectExtend projectExtend) {
        return projectMapper.selectProByMultipleInfoCounts(projectExtend);
    }

    @Override
    public ProjectExtend selectMultipleInfoById(String id) {
        return projectMapper.selectMultipleInfoById(id);
    }

    /**
     * 项目信息
     *
     * @author: shixing
     * @function:分页查询
     * @since : 1.0.0
     */
    @Override
    public PageModel<ProjectExtend> getProjectInfoByPage(Integer currentPage, Integer offset, ProjectExtend projectExtend) {
        //获取总的记录数
        Integer totalRecords = projectMapper.selectByMultipleInfoCounts(projectExtend);
        //创建PageModel对象
        PageModel<ProjectExtend> pm = new PageModel<>(currentPage, offset, totalRecords);
        //获取当前页面数据
        List<ProjectExtend> data = projectMapper.selectByMultipleInfo(pm.getStartPosition(), offset, projectExtend);
        //设置数据
        pm.setData(data);
        //返回页面
        return pm;
    }

    /**
     * 查询已发布的实验项目信息
     * @author:PP
     * @param currentPage
     * @param offset
     * @param projectExtend
     * @return
     */
    @Override
    public PageModel<ProjectExtend> getStuProjectInfoByPage(Integer currentPage, Integer offset, ProjectExtend projectExtend) {
        //获取总的记录数
        Integer totalRecords = projectMapper.selectProByMultipleInfoCounts(projectExtend);
        System.out.println("totalRecords--"+totalRecords);
        //创建PageModel对象
        PageModel<ProjectExtend> pm = new PageModel<>(currentPage, offset, totalRecords);
        //获取当前页面数据
        List<ProjectExtend> data = projectMapper.selectProByMultipleInfo(pm.getStartPosition(), offset, projectExtend);
//        for (ProjectExtend pExtend:data
//             ) {
//            System.out.println(pExtend.toString());
//        }

        //设置数据
        pm.setData(data);
        //返回页面
        return pm;
    }

    @Override
    public void updateProjectStateById(Project project) {
        projectMapper.updateByPrimaryKeySelective(project);
    }
}
