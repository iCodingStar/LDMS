package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.extend.TeacherExtendMapper;
import cn.cug.laboratory.mapper.extend.UserExtendMapper;
import cn.cug.laboratory.model.extend.UserExtend;
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

    @Autowired
    private TeacherExtendMapper teacherExtendMappermapper;
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
            return auth;
        }
    }

    /**
     *
     * @param stuId
     * @param newPwd
     * 更新密码
     */
    @Override
    public void updatePassword(String stuId, String newPwd) {
        mapper.updatePassword(stuId,newPwd);
    }

    @Override
    public String getTeacherNameById(String name) {
        return teacherExtendMappermapper.selectByPrimaryKey(name).getId();
    }
}
