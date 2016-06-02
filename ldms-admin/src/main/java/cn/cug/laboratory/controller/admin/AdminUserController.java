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

import cn.cug.laboratory.model.extend.UserExtend;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Student;
import cn.cug.laboratory.model.persistent.Teacher;
import cn.cug.laboratory.model.persistent.User;
import cn.cug.laboratory.service.StudentService;
import cn.cug.laboratory.service.TeacherService;
import cn.cug.laboratory.service.UserService;
import cn.cug.laboratory.utils.StringUtils;
import org.springframework.beans.BeanUtils;
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
@RequestMapping(value = {"/admin/user"})
public class AdminUserController {

    private Integer offset = 8;

    @Autowired
    private UserService userService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;


    @RequestMapping("")
    public ModelAndView adminUser() {
        return new ModelAndView("admin/user/user");
    }

    @RequestMapping(value = {"/add"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String add(User user, Student student, Teacher teacher) {
        String id = user.getUsername();
        String auth = user.getAuth();

        if (id != null) {
            //检测数据库中是否存在该用户
            if (this.isExistUser(id)) {
                return "-1";
            }

            //根据用户身份进行添加
            if (!StringUtils.isEmpty(auth) && auth.equals("学生")) {
                userService.insertSelective(user);
                studentService.insertSelective(student);
                return "success";
            } else if (!StringUtils.isEmpty(auth) && auth.equals("教师")) {
                userService.insertSelective(user);
                teacherService.insertSelective(teacher);
                return "success";
            }

        }
        return "-2";
    }

    @RequestMapping(value = {"/delete"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String delete(User user) {
        userService.deleteByPrimaryKey(user.getUsername());
        return "success";
    }

    @RequestMapping(value = {"/update"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String update(User user) {
        userService.updateByPrimaryKeySelective(user);
        return "success";
    }

    @RequestMapping(value = {"/query/page"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    PageModel<User> query(Integer page, User user) {
        PageModel<User> pm = userService.selectUserByUserNameAndAuth(page, offset, user);
        return pm;
    }


    /**
     * @author: shixing
     * @function:判断数据库中是否存在该用户
     * @since : 1.0.0
     */
    private boolean isExistUser(String id) {
        if (userService.selectByPrimaryKey(id) != null ||
                studentService.selectByPrimaryKey(id) != null ||
                teacherService.selectByPrimaryKey(id) != null)
            return true;
        else
            return false;
    }

}
