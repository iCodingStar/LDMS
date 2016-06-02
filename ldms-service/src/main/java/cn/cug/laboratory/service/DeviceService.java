package cn.cug.laboratory.service;

import cn.cug.laboratory.model.extend.DeviceExtend;
import cn.cug.laboratory.model.persistent.Device;
import cn.cug.laboratory.model.persistent.PageModel;

import java.util.List;

/**
 * Created by HXY on 2016/5/27.
 */
public interface DeviceService {
    public List<Device> getAll();

    public Integer getLeftAmountById(String id);

    /**
     * @author: shixing
     * @function:根据id和name分页查询设备信息
     * @since : 1.0.0
     */
    public PageModel<DeviceExtend> getDevicePageInfoByIdOrName(Integer currentPage, Integer offset, DeviceExtend deviceExtend);

    /**
     * @author: shixing
     * @function:根据id分页查询设备信息
     * @since : 1.0.0
     */
    public PageModel<DeviceExtend> getDevicePageInfoById(Integer currentPage, Integer offset, DeviceExtend deviceExtend);

    /**
     * @author: shixing
     * @function:根据id添加设备信息
     * @since : 1.0.0
     */
    public void insertDeviceByPrimaryKey(DeviceExtend deviceExtend);

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:
     */
    public void updateDeviceByPrimaryKey(String id, DeviceExtend deviceExtend);

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:根据id删除设备信息
     */
    public void deleteByPrimaryKey(String id);
}
