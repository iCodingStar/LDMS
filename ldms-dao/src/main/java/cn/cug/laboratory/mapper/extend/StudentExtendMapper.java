package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.StudentMapper;
import cn.cug.laboratory.model.persistent.Student;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentExtendMapper extends StudentMapper{
    String selectLastId();
}