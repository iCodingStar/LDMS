package cn.cug.laboratory.controller;

import cn.cug.laboratory.model.extend.UserExtend;
import cn.cug.laboratory.model.persistent.Teacher;
import cn.cug.laboratory.model.persistent.User;
import cn.cug.laboratory.service.TeacherService;
import cn.cug.laboratory.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by HXY on 2016/5/27.
 */
@Controller
public class Logincontroller {
    @Autowired
    private UserService userService;



    /**
     * session中保存用户参数为user
     * @param session
     * @param user
     * @return
     */
    @RequestMapping(value = {"/login"}, method = RequestMethod.POST)
    public String login(HttpSession session, UserExtend user) {
        session.setAttribute("user",user);
        switch (user.getAuth()) {
            case "学生":
                return "redirect:student/home";
            case "教师":
                return "redirect:teacher/home";
            case "管理员":
                return "redirect:admin/home";
        }
        return "404";
    }
    /**
     *
     * @param user
     * @return
     * 登录部分的ajax验证用户信息
     */
    @RequestMapping(value = "validateuser", method = RequestMethod.GET)
    public
    @ResponseBody
    String validateuser(UserExtend user) {
        String auth = userService.getAuth(user);
        String result = "";

        if (auth.equals(user.getAuth()))
            result = "success";
        else
            result = "Error";
        return result;
    }

}
