package cn.cug.laboratory.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * Created by HXY on 2016/5/27.
 */
public class UserServiceTest extends AbstractSpringTest {

    @Autowired
    private UserService service;

    @Test
    public void test(){
        System.out.println("test");
    }

}
