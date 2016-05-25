package cn.cug.laboratory.mapper;

import cn.cug.laboratory.model.persistent.ProjectOrder;

public interface ProjectOrderMapper {
    int deleteByPrimaryKey(String id);

    int insert(ProjectOrder record);

    int insertSelective(ProjectOrder record);

    ProjectOrder selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ProjectOrder record);

    int updateByPrimaryKey(ProjectOrder record);
}