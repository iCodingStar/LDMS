package cn.cug.laboratory.mapper;

import cn.cug.laboratory.model.persistent.Project;

public interface ProjectMapper {
    int deleteByPrimaryKey(String id);

    int insert(Project record);

    int insertSelective(Project record);

    Project selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Project record);

    int updateByPrimaryKeyWithBLOBs(Project record);

    int updateByPrimaryKey(Project record);
}