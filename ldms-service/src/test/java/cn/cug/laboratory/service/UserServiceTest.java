package cn.cug.laboratory.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by PP on 2016/5/27.
 * 1个函数测试通过
 */

public class UserServiceTest extends AbstarctSpringTest {

@Autowired
private UserService userService;

    @Test
    public void updatePasswordTest(){
        String stuId="20131000008";
        String oldPwd="2";
        String newPwd="222";
        userService.updatePassword(stuId,oldPwd,newPwd);
    }
}
