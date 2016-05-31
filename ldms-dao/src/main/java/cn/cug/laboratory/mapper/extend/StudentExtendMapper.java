package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.StudentMapper;
import cn.cug.laboratory.model.extend.StudentExtend;
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

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:学生模糊查询
     */

    public List<Student> getPageData(@Param("startPosition") Integer startPosition,
                                     @Param("offset") Integer offset,
                                     @Param("s") Student student);

    public Integer getTotalRecords(@Param("s") Student student);


    List<StudentExtend> getAlStudentByProid(@Param("id") String id);
}