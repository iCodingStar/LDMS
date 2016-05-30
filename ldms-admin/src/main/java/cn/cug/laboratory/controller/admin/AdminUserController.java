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
import cn.cug.laboratory.model.persistent.User;
import cn.cug.laboratory.service.UserService;
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

    private Integer offset = 5;

    @Autowired
    private UserService userService;

    @RequestMapping("")
    public ModelAndView adminUser() {
        return new ModelAndView("admin/user/user");
    }

    @RequestMapping(value = {"/add"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String add(User user) {
        userService.insertSelective(user);
        return "success";
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
}
