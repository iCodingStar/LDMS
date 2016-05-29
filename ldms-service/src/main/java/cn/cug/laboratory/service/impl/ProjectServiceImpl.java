package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.ProjectMapper;
import cn.cug.laboratory.mapper.extend.ProjectExtendMapper;
import cn.cug.laboratory.model.extend.ProjectExtend;
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
    private ProjectExtendMapper projectExtendMapper;

    /**
     *
     * @param teaId
     * @param pageNo
     * @param pageNum
     * @return
     *
     */
    //pageNo表示第几页，从1开始，pageNum表示每页的记录数目
    public RetuValueClass<ProjectExtend> selectByTeaId(String teaId, int pageNo, int pageNum){
        int startSite=(pageNo-1)*pageNum;
        List<ProjectExtend> projectList=projectExtendMapper.selectByTeaId(teaId,startSite,pageNum);
        int projectCount=projectExtendMapper.selectCountByTeaId(teaId);
        return new RetuValueClass<ProjectExtend>(projectList,projectCount);
    }

    /**
     *
     * @param name
     * @param pageNo
     * @param pageNum
     * @return
     */
    public RetuValueClass<ProjectExtend> selectByName(String name, int pageNo, int pageNum){
        int startSite=(pageNo-1)*pageNum;
        List<ProjectExtend> projectExtendList=projectExtendMapper.selectByName(name,startSite,pageNum);
        int projectCount=projectExtendMapper.selectCountByName(name);
        return new RetuValueClass<ProjectExtend>(projectExtendList,projectCount);
    }

    public List<ProjectExtend> selectByMultipleInfo(ProjectExtend projectExtend) {
        return projectExtendMapper.selectByMultipleInfo(projectExtend);
    }
}
