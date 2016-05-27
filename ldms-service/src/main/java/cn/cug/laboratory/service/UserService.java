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
     *更新密码，
     * 需要先判断[用户名，密码]记录在数据库中是否存在
     * @param stuId
     * @param newPwd
     */
    public void updatePassword(String stuId,String oldPwd,String newPwd);
}
