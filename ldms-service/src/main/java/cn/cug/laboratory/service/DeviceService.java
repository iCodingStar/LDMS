package cn.cug.laboratory.service;

import cn.cug.laboratory.model.persistent.Device;

import java.util.List;

/**
 * Created by HXY on 2016/5/27.
 */
public interface DeviceService {
    public List<Device> getAll();

    public Integer getLeftAmountById(String id);
}
