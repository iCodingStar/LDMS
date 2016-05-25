package cn.cug.laboratory.mapper;

import cn.cug.laboratory.model.persistent.Lab;

public interface LabMapper {
    int deleteByPrimaryKey(String id);

    int insert(Lab record);

    int insertSelective(Lab record);

    Lab selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Lab record);

    int updateByPrimaryKeyWithBLOBs(Lab record);

    int updateByPrimaryKey(Lab record);
}