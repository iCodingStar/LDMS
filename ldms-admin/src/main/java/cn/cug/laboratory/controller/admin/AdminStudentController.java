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
package cn.cug.laboratory.controller.admin;

import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Student;
import cn.cug.laboratory.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * @autor shixing
 * @since 1.0.0
 */

@Controller
@RequestMapping(value = {"/admin/student"})
public class AdminStudentController {
    private Integer offset = 8;

    @Autowired
    private StudentService studentService;

    /**
     * @author: shixing
     * @function:
     * @since : 1.0.0
     */
    @RequestMapping("")
    public ModelAndView adminStudent() {
        return new ModelAndView("admin/student/student");
    }

    @RequestMapping(value = {"/add"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String add(Student student) {

        return "success";
    }

    /**
     * @author: shixing
     * @function:
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/delete"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String delete(Student student) {
        if (student.getId() != null) {
            studentService.deleteByPrimaryKey(student.getId());
            return "success";
        }
        return "error";
    }

    /**
     * @author: shixing
     * @function:
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/update"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String update(Student student) {
        if (student.getId() != null) {
            studentService.updateByPrimaryKeySelective(student);
            return "success";
        }
        return "error";
    }

    /**
     * @author: shixing
     * @function:
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/query"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    Student query(Student student) {

        return new Student();
    }

    /**
     * @author: shixing
     * @function:
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/query/page"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    PageModel<Student> query(Integer page, Student student) {
        PageModel<Student> pm = studentService.selectMultiInfoByPage(page, offset, student);
        return pm;
    }
}
