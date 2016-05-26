package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.ProjectMapper;
import cn.cug.laboratory.model.persistent.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProjectExtendMapper extends ProjectMapper{
    List<Project> selectByTeaId(@Param("teaId") String teaId, @Param("startSite") int startSite, @Param("pageNum") int pageNum);
    int selectCountByTeaId(@Param("teaId") String teaId);
    List<Project> selectByName(@Param("name") String name, @Param("startSite") int startSite, @Param("pageNum") int pageNum);
    int selectCountByName(@Param("name") String name);

    void reduceLeft(String id);
    void addLeft(String id);
}