package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.StudentMapper;
import cn.cug.laboratory.model.extend.StudentExtend;
import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.model.persistent.Student;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudentExtendMapper extends StudentMapper{
    /**
     *
     * @return
     * 返回最后插入的一条学生记录的id
     */
    String selectLastId();

    List<StudentExtend> getAlStudentByProid(@Param("id") String id);
}