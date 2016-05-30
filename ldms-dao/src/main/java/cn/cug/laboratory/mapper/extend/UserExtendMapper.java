package cn.cug.laboratory.mapper.extend;

import cn.cug.laboratory.mapper.UserMapper;
import cn.cug.laboratory.model.persistent.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserExtendMapper extends UserMapper{
    void updatePassword(@Param("stuId") String stuId, @Param("newPwd") String newPwd);

    /**
     * 根据用户名和密码获取用户权限
     * @param user
     * @return
     */
    public String getAuth(User user);

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:
     */
    public List<User> getPageData(@Param("startPosition") Integer startPosition,
                                                  @Param("offset")Integer offset,
                                                  @Param("user") User user);

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:
     */

    public Integer gettotalRecords(User user);


    /**
     * @author: shixing
     * @function:
     * @since : 1.0.0
     */
    public User selectUserByUserNameAndPWD(User user);
}