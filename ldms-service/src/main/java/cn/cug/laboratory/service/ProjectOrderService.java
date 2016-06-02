package cn.cug.laboratory.service;

import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.extend.ProjectOrderExtend;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.ProjectOrder;
import cn.cug.laboratory.utils.RetuValueClass;

/**
 * Created by PP on 2016/5/23.
 */


public interface ProjectOrderService {
    /**
     * 根据实验编号和学号插入，实验预约编号根据上一条+1的规则自动生成
     * Project的相应实验的余量也要-1
     *
     */
    public void insert(String proId, String stuId, Float score);


    /**
     * @author:PP
     * 根据学号在project_order表中列出已选的实验
     * 分页显示
     */
    public PageModel<ProjectOrderExtend> selectByStuId(Integer currentPage, Integer offset, ProjectOrderExtend projectOrderExtend);


    /**
     * @author:PP
     * 如果当前时间还未到达项目开始时间，那么可以退课
     * 在project_order表中删除记录，同时project表的left+1
     * @param proOrderId 实验预约记录的ID
     */
    public Integer delete(String stuId,String proId);

    /**
     * 查询个人成绩并分页
     * 根据学号选出成绩>0的科目
     * @author:PP
     */
    public PageModel<ProjectOrderExtend> selectScore(Integer currentPage, Integer offset, ProjectOrderExtend projectOrderExtend);

}
