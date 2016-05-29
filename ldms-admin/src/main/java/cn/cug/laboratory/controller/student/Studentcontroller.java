package cn.cug.laboratory.controller.student;

import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.model.persistent.Student;
import cn.cug.laboratory.model.persistent.User;
import cn.cug.laboratory.service.ProjectService;
import cn.cug.laboratory.service.StudentService;
import cn.cug.laboratory.utils.RetuValueClass;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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

    @Autowired
    private ProjectService projectService;

    @Autowired
    private StudentService studentService;

    @RequestMapping("/home")
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("student/home");
        return mav;
    }

    @RequestMapping("order")
    public ModelAndView order() {
        ModelAndView mav = new ModelAndView("student/home");
        return mav;
    }

    @RequestMapping("queryproject")
    public @ResponseBody List<ProjectExtend> queryproject(@Param("search_value") String search_value) {
        System.out.println("here");
        List<ProjectExtend> list=projectService.selectByName(search_value,1,3).getRetuList();
        for(ProjectExtend projectExtend: list){
            System.out.println(projectExtend.toString());
        }
        return list;
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
