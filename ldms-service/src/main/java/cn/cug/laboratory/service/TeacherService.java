package cn.cug.laboratory.service;

import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Student;
import cn.cug.laboratory.model.persistent.Teacher;

/**
 * Created by PP on 2016/5/27.
 */

public interface TeacherService {
    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:动态插入信息
     */
    public void insertSelective(Teacher record);


    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:根据id删除
     */
    public void deleteByPrimaryKey(String id);

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:根据id修改任意信息
     */
    public int updateByPrimaryKeySelective(Teacher record);

    /**
     * @author: shixing
     * @function:根据id查询信息
     * @since : 1.0.0
     */
    public Teacher selectByPrimaryKey(String id);

    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:模糊查询
     */
    public PageModel<Teacher> selectMultiInfoByPage(Integer currentPage,
                                                    Integer offset,
                                                    Teacher teacher);
}
