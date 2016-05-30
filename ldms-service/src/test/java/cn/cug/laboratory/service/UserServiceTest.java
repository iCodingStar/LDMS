package cn.cug.laboratory.service;

import cn.cug.laboratory.mapper.extend.TeacherExtendMapper;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Student;
import cn.cug.laboratory.model.persistent.Teacher;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by HXY on 2016/5/27.
 */
public class UserServiceTest extends AbstractSpringTest {
    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Test
    public void test(){
        PageModel<Student> studentPageModel = studentService.selectMultiInfoByPage(0,6,new Student());
        System.out.println(studentPageModel);
        PageModel<Teacher>  pm = teacherService.selectMultiInfoByPage(0,6,new Teacher());
        System.out.println(pm);
    }
}
