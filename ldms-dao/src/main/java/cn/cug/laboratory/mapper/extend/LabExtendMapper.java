package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.LabMapper;
import cn.cug.laboratory.model.persistent.Lab;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LabExtendMapper extends LabMapper{
    public String getLabIdByName(@Param("lab_name") String lab_name);
    public List<Lab> getAll();
}