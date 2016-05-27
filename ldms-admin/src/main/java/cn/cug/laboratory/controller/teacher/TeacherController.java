package cn.cug.laboratory.controller.teacher;

import cn.cug.laboratory.model.persistent.User;
import cn.cug.laboratory.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by HXY on 2016/5/22.
 */
@Controller
public class TeacherController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"/login"}, method = RequestMethod.POST)
    public ModelAndView login(HttpSession session, User user) {
        ModelAndView mav = new ModelAndView();
        switch (user.getAuth()) {
            case "学生":
                mav.setViewName("student/home");
                mav.addObject("msg","hhhh");
                break;
            case "教师":
                mav.setViewName("teacher/home");
                break;
            case "管理员":
                mav.setViewName("admin/home");
                break;
        }
        session.setAttribute("user",user);
        return mav;
    }


    @RequestMapping(value = "validateuser", method = RequestMethod.GET)
    public
    @ResponseBody
    String validateuser(User user) {
        String auth = userService.getAuth(user);
        String result = "";

        if (auth.equals(user.getAuth()))
            result = "success";
        else
            result = "Error";
        return result;
    }
}
