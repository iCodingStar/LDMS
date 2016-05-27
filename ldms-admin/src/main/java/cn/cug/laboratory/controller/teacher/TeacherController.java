package cn.cug.laboratory.controller.teacher;

import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.persistent.Teacher;
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

    /**
     * session中保存用户参数为user
     * @param session
     * @param user
     * @return
     */
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

    /**
     *
     * @param project
     * @return
     * 申请实验第一步，提交信息，在controlller里面保存用户提交的信息，并不存入数据库
     * 要生成一个实验ID
     * 根据传过来的实验室名称查询lab_id
     * 将实验状态设置为0,标识为提交状态
     *从当前session里面获取tea_id
     *将上传文件保存到临时文件夹(在确认信息无误,确认申请以后放到upload文件夹)
     */
    @RequestMapping(value = "saveprojectinfo",method = RequestMethod.GET)
    public
    @ResponseBody
    String saveprojectinfo(ProjectExtend project,HttpSession session){
        project.setState(0);
        project.setTeaId(((Teacher)session.getAttribute("user")).getId());

        return "sucess";
    }
}
