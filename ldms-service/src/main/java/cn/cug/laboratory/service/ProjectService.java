package cn.cug.laboratory.service;

import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.utils.DBUtils;
import cn.cug.laboratory.utils.RetuValueClass;

import java.util.List;

/**
 * Created by PP on 2016/5/22.
 */
public interface ProjectService {
    /**
     * @param id
     * @return 根据主键获取实验
     */
    public Project selectByPrimaryKey(String id);

    /**
     * @author: shixing
     * @function:查询记录条数
     */
    public Integer selectByMultipleInfoCounts(ProjectExtend projectExtend) ;
    /**
     * @author: shixing
     * @function:查询记录数据
     * @since : 1.0.0
     */
    public List<ProjectExtend> selectByMultipleInfo(Integer currentPage, Integer offset, ProjectExtend projectExtend);
    /**
     * @author: shixing
     * @function:分页查询项目信息
     * @return:存放着List和Count数据
     * @since : 1.0.0
     */
    public PageModel<ProjectExtend> getProjectInfoByPage(Integer currentPage, Integer offset, ProjectExtend projectExtend);

    /**
     * @author: PP
     * @function:查询记录数据
     * @since : 1.0.0
     */
    public List<ProjectExtend> pp_selectByMultipleInfo(Integer currentPage, Integer offset, ProjectExtend projectExtend);
    /**
     * @author: PP
     * @function:查询记录条数
     */
    public Integer pp_selectByMultipleInfoCounts(ProjectExtend projectExtend);
    /**
     * @author: PP
     * @function:分页查询项目信息
     * @return:存放着List和Count数据
     * @since : 1.0.0
     */
    public PageModel<ProjectExtend> pp_getProjectInfoByPage(Integer currentPage, Integer offset, ProjectExtend projectExtend);

    public ProjectExtend selectMultipleInfoById(String id);

    public void updateProjectStateById(Project project);

    /**
     * @author:HXY
     * @param currentPage
     * @param offset
     * @param project，传入的参数不同
     * @return
     */
    public PageModel<Project> getProjectByMultipleinfo(Integer currentPage, Integer offset, Project project);

    public String getNewId();

    public int insert(Project project);

    public Project getById(String id);

    public void setfilenameBYId(Project project);

}
