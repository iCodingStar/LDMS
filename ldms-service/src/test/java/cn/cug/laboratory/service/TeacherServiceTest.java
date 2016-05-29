package cn.cug.laboratory.service;

import cn.cug.laboratory.mapper.extend.TeacherExtendMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by HXY on 2016/5/27.
 */
public class TeacherServiceTest extends AbstractSpringTest {


    @Autowired
    private TeacherExtendMapper teacherExtendMapper;
    @Test
    public void test(){
        System.out.println("test");
    }

    @Test
    public void testgetTeacherByUsername(){
        teacherExtendMapper.selectByPrimaryKey("05002");
    }
}
