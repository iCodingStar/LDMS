package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.UserMapper;
import cn.cug.laboratory.model.persistent.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserExtendMapper extends UserMapper{

    public String getAuth(User user);
}