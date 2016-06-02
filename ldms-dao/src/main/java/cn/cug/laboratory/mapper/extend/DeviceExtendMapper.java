package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.DeviceMapper;
import cn.cug.laboratory.model.extend.DeviceExtend;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import cn.cug.laboratory.model.persistent.Device;

import java.util.List;

public interface DeviceExtendMapper extends DeviceMapper{
    public List<Device> getAll();

    /**
     * @author: shixing
     * @function:查询项目信息
     * @since : 1.0.0
     */
    List<DeviceExtend> getPageData(@Param("startPosition") Integer startPosition,
                                            @Param("offset") Integer offset,
                                            @Param("de") DeviceExtend deviceExtend);


    /**
     * @author: shixing
     * @function:查询项目信息条数
     * @since : 1.0.0
     */
    Integer getTotalRecords(@Param("de") DeviceExtend deviceExtend);
    public Integer queryLeftById(String id);
}