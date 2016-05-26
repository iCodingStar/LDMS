package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.UserMapper;
import cn.cug.laboratory.model.persistent.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserExtendMapper extends UserMapper{
    void updatePassword(@Param("stuId") String stuId, @Param("newPwd") String newPwd);
    public String getAuth(User user);
}