package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.StudentMapper;
import cn.cug.laboratory.model.persistent.Student;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentExtendMapper extends StudentMapper{
    /**
     *
     * @return
     * 返回最后插入的一条学生记录的id
     */
    String selectLastId();
}