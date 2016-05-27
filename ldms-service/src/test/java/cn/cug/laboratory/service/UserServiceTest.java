package cn.cug.laboratory.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by PP on 2016/5/27.
 */
public class UserServiceTest extends AbstarctSpringTest {
    @Autowired
    private UserService userService;

    @Test
    public void UpdatePasswordTest() throws Exception{
        String stuId="2013101";
        String newPwd="2";

        userService.updatePassword(stuId,newPwd);
    }
}
