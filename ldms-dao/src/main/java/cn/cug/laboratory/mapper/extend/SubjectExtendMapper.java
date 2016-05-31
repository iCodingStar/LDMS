package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.SubjectMapper;
import cn.cug.laboratory.model.persistent.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SubjectExtendMapper extends SubjectMapper{

    public List<Student> queryStudentInfoByPage(@Param("startPosition") Integer startPosition,
                                                @Param("offset") Integer offset,
                                                @Param("s") Student student);

    public Integer getTotalRecords(Student student);

}