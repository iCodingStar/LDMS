package cn.cug.laboratory.mapper;

import cn.cug.laboratory.model.persistent.Subject;

public interface SubjectMapper {
    int deleteByPrimaryKey(String id);

    int insert(Subject record);

    int insertSelective(Subject record);

    Subject selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Subject record);

    int updateByPrimaryKey(Subject record);
}