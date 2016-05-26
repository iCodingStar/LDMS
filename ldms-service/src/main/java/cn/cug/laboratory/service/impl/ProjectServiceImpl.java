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
    private ProjectExtendMapper projectMapper;

    public Project selectByPrimaryKey(String id){
        return projectMapper.selectByPrimaryKey(id);
    }

    //pageNo表示第几页，从1开始，pageNum表示每页的记录数目
    public RetuValueClass<Project> selectByTeaId(String teaId, int pageNo, int pageNum){
        int startSite=(pageNo-1)*pageNum;
        List<Project> projectList=projectMapper.selectByTeaId(teaId,startSite,pageNum);
        int projectCount=projectMapper.selectCountByTeaId(teaId);
        return new RetuValueClass<Project>(projectList,projectCount);
    }

    public RetuValueClass<Project> selectByName(String name, int pageNo, int pageNum){
        int startSite=(pageNo-1)*pageNum;
        List<Project> projectList=projectMapper.selectByName(name,startSite,pageNum);
        int projectCount=projectMapper.selectCountByTeaId(name);
        return new RetuValueClass<Project>(projectList,projectCount);
    }
}
