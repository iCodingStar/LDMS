package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.TeacherMapper;
import cn.cug.laboratory.mapper.extend.TeacherExtendMapper;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Teacher;
import cn.cug.laboratory.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author: shixing
 * @function:
 * @since : 1.0.0
 */

@Service
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Autowired
    private TeacherExtendMapper teacherExtendMapper;
    /**
     * @author: shixing
     * @since : 1.0.0
     * @function:动态插入信息
     */
    @Override
    public void insertSelective(Teacher record) {
        teacherMapper.insertSelective(record);
    }

    /**
     * @author: shixing
     * @function:根据id删除
     * @since : 1.0.0
     */
    @Override
    public void deleteByPrimaryKey(String id) {
        teacherMapper.deleteByPrimaryKey(id);
    }

    /**
     * @author: shixing
     * @function:根据id修改任意信息
     * @since : 1.0.0
     */
    @Override
    public int updateByPrimaryKeySelective(Teacher record) {
        return teacherMapper.updateByPrimaryKeySelective(record);
    }

    /**
     * @author: shixing
     * @function:根据id查询信息
     * @since : 1.0.0
     */
    @Override
    public Teacher selectByPrimaryKey(String id) {
        return teacherMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageModel<Teacher> selectMultiInfoByPage(Integer currentPage, Integer offset, Teacher teacher) {
        Integer totalRecords = teacherExtendMapper.getTotalRecords(teacher);
        PageModel pm = new PageModel(currentPage,offset,totalRecords);
        List<Teacher> data = teacherExtendMapper.getPageData(pm.getStartPosition(),offset,teacher);
        pm.setData(data);
        return pm;
    }


    @Override
    public Teacher getTeacherByUsername(String username) {
        return teacherExtendMapper.selectByPrimaryKey(username);
    }
}
