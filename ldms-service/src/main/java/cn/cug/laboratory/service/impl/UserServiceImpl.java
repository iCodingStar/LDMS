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

    @Override
    public void updatePassword(String stuId, String newPwd) {
        mapper.updatePassword(stuId,newPwd);
    }
}
