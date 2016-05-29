package cn.cug.laboratory.service;

import cn.cug.laboratory.model.persistent.Teacher;

/**
 * Created by HXY on 2016/5/27.
 */
public interface TeacherService {

    public Teacher getTeacherByUsername(String username);
}
