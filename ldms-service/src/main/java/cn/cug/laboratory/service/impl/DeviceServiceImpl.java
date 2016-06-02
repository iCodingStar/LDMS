package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.DeviceMapper;
import cn.cug.laboratory.mapper.extend.DeviceExtendMapper;
import cn.cug.laboratory.model.extend.DeviceExtend;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by HXY on 2016/5/27.
 */
@Service
public class DeviceServiceImpl implements DeviceService {

    @Autowired
    private DeviceMapper deviceMapper;
    @Autowired
    private DeviceExtendMapper deviceExtendMapper;

    /**
     * @author: shixing
     * @function:根据id或name查询实验信息
     * @since : 1.0.0
     */
    @Override
    public PageModel<DeviceExtend> getDevicePageInfoByIdOrName(Integer currentPage, Integer offset, DeviceExtend deviceExtend) {
        Integer totalRecords = deviceExtendMapper.getTotalRecords(deviceExtend);
        PageModel<DeviceExtend> pm = new PageModel<>(currentPage, offset, totalRecords);
        List<DeviceExtend> data = deviceExtendMapper.getPageData(pm.getStartPosition(), offset, deviceExtend);
        pm.setData(data);
        return pm;
    }

    /**
     * @author: shixing
     * @function:根据id查询实验信息
     * @since : 1.0.0
     */
    @Override
    public PageModel<DeviceExtend> getDevicePageInfoById(Integer currentPage, Integer offset, DeviceExtend deviceExtend) {
        Integer totalRecords = deviceExtendMapper.getTotalRecords(deviceExtend);
        PageModel<DeviceExtend> pm = new PageModel<>(currentPage, offset, totalRecords);
        List<DeviceExtend> data = deviceExtendMapper.getPageData(pm.getStartPosition(), offset, deviceExtend);
        pm.setData(data);
        return pm;
    }

    /**
     * @author: shixing
     * @function:添加设备信息
     * @since : 1.0.0
     */
    @Override
    public void insertDeviceByPrimaryKey(DeviceExtend deviceExtend) {
        deviceMapper.insertSelective(deviceExtend);
    }

    /**
     * @author: shixing
     * @function:根据id修改设备信息
     * @since : 1.0.0
     */
    @Override
    public void updateDeviceByPrimaryKey(String id, DeviceExtend deviceExtend) {
        deviceMapper.updateByPrimaryKeySelective(deviceExtend);
    }


    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:
     */
    @Override
    public void deleteByPrimaryKey(String id) {
        deviceMapper.deleteByPrimaryKey(id);
    }

}
