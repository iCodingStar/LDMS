package cn.cug.laboratory.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by HXY on 2016/5/27.
 */
public class StudentServiceTest extends AbstarctSpringTest {
    @Autowired
    private StudentService studentService;

    @Test
    public void insertTest()throws Exception{
        studentService.insert("鹏鹏","软件工程",111132,"信息工程","女");
    }

    @Test
    public void SelectByPrimaryKeyTest() throws Exception {
        studentService.selectByPrimaryKey("2013100");
    }
}
