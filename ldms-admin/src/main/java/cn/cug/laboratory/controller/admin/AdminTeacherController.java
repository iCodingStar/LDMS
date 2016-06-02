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
import cn.cug.laboratory.model.persistent.Teacher;
import cn.cug.laboratory.service.TeacherService;
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
@RequestMapping(value = {"/admin/teacher"})
public class AdminTeacherController {
    private Integer offset = 8;

    @Autowired
    private TeacherService teacherService;

    /**
     * @author: shixing
     * @function:反问teacher页面
     * @since : 1.0.0
     */
    @RequestMapping("")
    public ModelAndView adminTeacher() {
        return new ModelAndView("admin/teacher/teacher");
    }

    /**
     * @author: shixing
     * @function:
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/add"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String add(Teacher teacher) {
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
    String delete(Teacher teacher) {
        if (teacher.getId() != null) {
            teacherService.deleteByPrimaryKey(teacher.getId());
            return "success";
        }else{
            return "error";
        }
    }

    /**
     * @author: shixing
     * @function:
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/update"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String update(Teacher teacher) {
        if (teacher.getId() != null){
            teacherService.updateByPrimaryKeySelective(teacher);
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
    Teacher query(Teacher teacher) {

        return new Teacher();
    }

    @RequestMapping(value = {"/query/page"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    PageModel<Teacher> queryPage(Integer page, Teacher teacher) {
        PageModel<Teacher> pm = teacherService.selectMultiInfoByPage(page, offset, teacher);
        return pm;
    }
}
