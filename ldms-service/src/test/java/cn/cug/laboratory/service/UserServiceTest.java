package cn.cug.laboratory.service;

import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Student;
import cn.cug.laboratory.model.persistent.Teacher;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by PP on 2016/5/27.
 * 1个函数测试通过
 */

public class UserServiceTest extends AbstractSpringTest {

@Autowired
private UserService userService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Test
    public void test(){
        PageModel<Student> studentPageModel = studentService.selectMultiInfoByPage(500,6,new Student());
        System.out.println(studentPageModel);
        PageModel<Teacher>  pm = teacherService.selectMultiInfoByPage(500,6,new Teacher());
        System.out.println(pm);
    }
    public void updatePasswordTest(){
        String stuId="20131000008";
        String oldPwd="2";
        String newPwd="222";
        userService.pp_updatePassword(stuId,oldPwd,newPwd);
    }
}
