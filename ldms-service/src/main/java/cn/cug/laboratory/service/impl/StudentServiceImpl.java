/*
 * Copyright 2016-2016 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package cn.cug.laboratory.service.impl;

import cn.cug.laboratory.mapper.StudentMapper;
import cn.cug.laboratory.mapper.extend.StudentExtendMapper;
import cn.cug.laboratory.model.extend.StudentExtend;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Student;
import cn.cug.laboratory.service.StudentService;
import cn.cug.laboratory.utils.DBUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @autor shixing
 * @since 1.0.0
 */

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentExtendMapper studentMapper;
    @Autowired
    private StudentExtendMapper studentExtendMapper;
    private DBUtils dbUtils;

    /**
     * @param name
     * @param major
     * @param classId
     * @param academy
     * @param sex
     */
    public void insert(String name, String major, Integer classId, String academy, String sex) {
        String lastID = studentMapper.selectLastId();
        System.out.print(lastID);
        String ID = dbUtils.StringAddOne(lastID);
        Student student = new StudentExtend(ID, name, major, classId, academy, sex);
        studentMapper.insert(student);
    }

    /**
     * @author: shixing
     * @function:动态插入信息
     * @since : 1.0.0
     */
    @Override
    public void insertSelective(Student student) {
        studentMapper.insertSelective(student);
    }

    /**
     * @author: shixing
     * @function:根据id删除
     * @since : 1.0.0
     */
    @Override
    public void deleteByPrimaryKey(String id) {
        studentMapper.deleteByPrimaryKey(id);
    }

    /**
     * @author: shixing
     * @function:根据id修改任意信息
     * @since : 1.0.0
     */
    @Override
    public int updateByPrimaryKeySelective(Student record) {
        return studentMapper.updateByPrimaryKeySelective(record);
    }

    /**
     * @author: shixing
     * @function:根据id查询信息
     * @since : 1.0.0
     */
    @Override
    public Student selectByPrimaryKey(String id) {
        return studentMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageModel<Student> selectMultiInfoByPage(Integer currentPage, Integer offset, Student student) {
        Integer totalRecords = studentExtendMapper.getTotalRecords(student);
        PageModel pm = new PageModel(currentPage, offset, totalRecords);
        List<Student> data = studentExtendMapper.getPageData(pm.getStartPosition(), offset, student);
        pm.setData(data);
        return pm;
    }
}
