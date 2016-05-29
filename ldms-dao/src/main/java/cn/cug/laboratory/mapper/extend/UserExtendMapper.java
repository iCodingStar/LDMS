package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.UserMapper;
import cn.cug.laboratory.model.extend.UserExtend;
import cn.cug.laboratory.model.persistent.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserExtendMapper extends UserMapper{
    void updatePassword(@Param("stuId") String stuId, @Param("newPwd") String newPwd);

    /**
     * 根据用户名和密码获取用户权限
     * @param user
     * @return
     */
    public String getAuth(User user);
}