package cn.cug.laboratory.service;

import cn.cug.laboratory.model.persistent.Lab;

import java.util.List;

/**
 * Created by HXY on 2016/5/27.
 */
public interface LabService {
    public String getLabIdByName(String name);
    public String getLabNameByid(String name);
    public List<Lab> getAll();
}
