package cn.cug.laboratory.mapper;

import cn.cug.laboratory.model.persistent.Device;

public interface DeviceMapper {
    int deleteByPrimaryKey(String id);

    int insert(Device record);

    int insertSelective(Device record);

    Device selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Device record);

    int updateByPrimaryKeyWithBLOBs(Device record);

    int updateByPrimaryKey(Device record);
}