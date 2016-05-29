package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.extend.DeviceExtendMapper;
import cn.cug.laboratory.model.persistent.Device;
import cn.cug.laboratory.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by HXY on 2016/5/27.
 */
@Service
public class DeviceServiceImpl implements DeviceService{


    @Autowired
    private DeviceExtendMapper mapper;

    @Override
    public List<Device> getAll() {
        return mapper.getAll();
    }

    @Override
    public Integer getLeftAmountById(String id) {
        return mapper.queryLeftById(id);
    }
}
