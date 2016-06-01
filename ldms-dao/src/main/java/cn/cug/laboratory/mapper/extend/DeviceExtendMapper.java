package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.DeviceMapper;
import cn.cug.laboratory.model.persistent.Device;

import java.util.List;

public interface DeviceExtendMapper extends DeviceMapper{
    public List<Device> getAll();

    public Integer queryLeftById(String id);
}