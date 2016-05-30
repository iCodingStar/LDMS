package cn.cug.laboratory.service;

import cn.cug.laboratory.model.persistent.User;

/**
 * Created by HXY on 2016/5/24.
 */

public interface UserService {
    /**
     *
     * @param user
     * @return
     */
    public String getAuth(User user);

    /**
     * 更新密码
     * @author:PP
     * @param stuId
     * @param oldPwd
     * @param newPwd
     * @return
     * 原密码验证不通过，返回0，
     * 原密码验证通过（基本上相当于修改成功），返回1
     */
    public Integer updatePassword(String stuId,String oldPwd,String newPwd);
}
