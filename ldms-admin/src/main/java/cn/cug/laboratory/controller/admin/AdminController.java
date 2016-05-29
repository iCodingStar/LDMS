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

import cn.cug.laboratory.model.persistent.User;
import cn.cug.laboratory.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @autor shixing
 * @since 1.0.0
 */
@Controller
@RequestMapping("/admin")
public class AdminController extends BaseController{

    //进入后台
    @RequestMapping(value = {"/home"})
    public String home(Model model) {
        User user = (User) getHttpSession().getAttribute("user");
        if (user != null){
            model.addAttribute("msg", "welcome");
            return "admin/home";
        }else {
            model.addAttribute("msg", "failure");
            return "redirect:toLogin";
        }
    }

    //进入登陆
    @RequestMapping("/toLogin")
    public void login() throws IOException {
        HttpServletResponse response = getHttpServletResponse();
        response.sendRedirect("../index.jsp");
    }

    //注销
    @RequestMapping("/logout")
    public String logout(){
        getHttpSession().invalidate();
        return "redirect:toLogin";
    }
}