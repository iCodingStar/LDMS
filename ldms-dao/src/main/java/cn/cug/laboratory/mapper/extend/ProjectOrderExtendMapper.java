package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.ProjectOrderMapper;
import cn.cug.laboratory.model.persistent.ProjectOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectOrderExtendMapper extends ProjectOrderMapper{
    String selectLastId();

    List<ProjectOrder> selectByStuId(@Param("stuId") String stuId, @Param("startSite") int startSite, @Param("pageNum") int pageNum);
    int selectCountByStuId(@Param("stuId") String stuId);
}