package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.extend.UserExtendMapper;
import cn.cug.laboratory.model.persistent.User;
import cn.cug.laboratory.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by HXY on 2016/5/24.
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserExtendMapper mapper;

    /**
     *
     * @param user
     * @return
     * 返回用户权限
     */
    @Override
    public String getAuth(User user) {
        String auth= mapper.getAuth(user);
        if (auth == null) {
            return "-1";
        }else {
            if(auth.equals("0"))
                return "学生";
            else if(auth.equals("1"))
                return "教师";
            else if (auth.equals("2"))
                return "管理员";
        }
        return "-1";
    }

    /**
     * @author:PP
     * @param stuId
     * @param oldPwd
     * @param newPwd
     * @return
     */
    public Integer updatePassword(String stuId,String oldPwd,String newPwd) {
        User user=mapper.selectByPrimaryKey(stuId);
        if(user.getPassword().equalsIgnoreCase(oldPwd)){
            System.out.println("原密码正确");
            mapper.updatePassword(stuId,newPwd);
            return 1;
        }
        else{
            System.out.println("原密码不正确");
            return 0;
        }
    }
}
