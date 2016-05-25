package cn.cug.laboratory.mapper;

import cn.cug.laboratory.model.persistent.DeviceType;

public interface DeviceTypeMapper {
    int deleteByPrimaryKey(String id);

    int insert(DeviceType record);

    int insertSelective(DeviceType record);

    DeviceType selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(DeviceType record);

    int updateByPrimaryKey(DeviceType record);
}