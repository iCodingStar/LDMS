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
     *
     * @param stuId
     * @param newPwd
     */
    public void updatePassword(String stuId,String newPwd);
}
