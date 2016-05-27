package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.LabMapper;
import org.apache.ibatis.annotations.Param;

public interface LabExtendMapper extends LabMapper{
    public String getLabIdByName(@Param("lab_name") String lab_name);
}