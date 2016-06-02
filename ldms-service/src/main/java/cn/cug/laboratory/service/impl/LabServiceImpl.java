package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.extend.LabExtendMapper;
import cn.cug.laboratory.model.persistent.Lab;
import cn.cug.laboratory.service.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by HXY on 2016/5/27.
 */
@Service
public class LabServiceImpl implements LabService{

    @Autowired
    private LabExtendMapper mapper;

    @Override
    public String getLabIdByName(String name) {
        return mapper.getLabIdByName(name);
    }

    @Override
    public String getLabNameByid(String id) {
        return mapper.getLabNameByid(id);
    }

    @Override
    public List<Lab> getAll() {
        return mapper.getAll();
    }


}
