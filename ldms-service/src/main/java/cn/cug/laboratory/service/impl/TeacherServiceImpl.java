package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.extend.TeacherExtendMapper;
import cn.cug.laboratory.model.persistent.Teacher;
import cn.cug.laboratory.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by HXY on 2016/5/27.
 */
@Service
public class TeacherServiceImpl implements TeacherService {


    @Autowired
    private TeacherExtendMapper teacherExtendMapper;

    @Override
    public Teacher getTeacherByUsername(String username) {
        return teacherExtendMapper.selectByPrimaryKey(username);
    }
}
