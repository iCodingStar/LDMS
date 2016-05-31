package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.TeacherMapper;
import cn.cug.laboratory.model.persistent.Student;
import cn.cug.laboratory.model.persistent.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TeacherExtendMapper extends TeacherMapper{

    public List<Teacher> getPageData(@Param("startPosition") Integer startPosition,
                                                @Param("offset") Integer offset,
                                                @Param("t") Teacher teacher);

    public Integer getTotalRecords(@Param("t") Teacher teacher);
}