package cn.cug.laboratory.controller.student;

import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.model.persistent.Student;
import cn.cug.laboratory.model.persistent.User;
import cn.cug.laboratory.service.ProjectOrderService;
import cn.cug.laboratory.service.ProjectService;
import cn.cug.laboratory.service.StudentService;
import cn.cug.laboratory.service.UserService;
import cn.cug.laboratory.utils.RetuValueClass;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by PP on 2016/5/27.
 */
@Controller
@RequestMapping("/student")
public class Studentcontroller {
    private Integer offset = 2;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ProjectOrderService projectOrderService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private UserService userService;

    @RequestMapping("/home")
    public ModelAndView home(HttpSession session) {
        User user=(User)session.getAttribute("user");
        String stu_name=studentService.selectByPrimaryKey(user.getUsername()).getName();
        session.setAttribute("stu_name",stu_name);
        ModelAndView mav = new ModelAndView("student/home");
        return mav;
    }

    @RequestMapping("/order")
    public ModelAndView order() {
        ModelAndView mav = new ModelAndView("student/home");
        return mav;
    }

//    @RequestMapping("queryproject")
//    public @ResponseBody List<ProjectExtend> queryproject(@Param("search_value") String search_value) {
//        System.out.println("here");
//        List<ProjectExtend> list=projectService.selectByName(search_value,1,3).getRetuList();
//        for(ProjectExtend projectExtend: list){
//            System.out.println(projectExtend.toString());
//        }
//        return list;
//    }


    @RequestMapping(value = {"/queryproject"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody List<ProjectExtend> queryProjectInfo(@Param("page") Integer currentPage,
                                         ProjectExtend projectExtend) {
        List<ProjectExtend> projectExtendList = projectService.selectProByMultipleInfo(currentPage, offset, projectExtend);
        return projectExtendList;
    }

    @RequestMapping(value = {"/queryproject/page"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    PageModel<ProjectExtend> queryProjectInfoByPage(Integer page,
                                                    ProjectExtend projectExtend) {
        PageModel<ProjectExtend> pm = projectService.getStuProjectInfoByPage(page, offset, projectExtend);
        return pm;
    }

    @RequestMapping(value = {"/queryproject/orderbyid"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    void orderProjectById(@Param("pro_id") String pro_id,HttpSession session) {
        System.out.println("controller-orderbyid--");
        User user=(User)session.getAttribute("user");
        Student student=studentService.selectByPrimaryKey(user.getUsername());
        projectOrderService.insert(pro_id,student.getId(),0.0f);
    }

    @RequestMapping(value = {"/updatePwd"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String updatePwd(HttpSession session,String oldPwd,String newPwd){
        System.out.println("进入Controller函数--"+oldPwd+newPwd);
        User user=(User)session.getAttribute("user");
        Student student=studentService.selectByPrimaryKey(user.getUsername());
        return userService.pp_updatePassword(student.getId(),oldPwd,newPwd).toString();
    }


    @RequestMapping("record")
    public ModelAndView record() {
        ModelAndView mav = new ModelAndView("student/search_project_order_record");
        return mav;
    }

    @RequestMapping("score")
    public ModelAndView score() {
        ModelAndView mav = new ModelAndView("student/query_score");
        return mav;
    }

    @RequestMapping("info")
    public ModelAndView info(HttpSession session) {
        ModelAndView mav = new ModelAndView("student/personal_info");
        User user=(User)session.getAttribute("user");
        System.out.println(user.getUsername());
        Student student=studentService.selectByPrimaryKey(user.getUsername());
        mav.addObject("student",student);
        return mav;
    }

}
