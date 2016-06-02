package cn.cug.laboratory.controller.student;

import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.extend.ProjectOrderExtend;
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
    //分页，每页显示的条数
    private Integer offset = 1;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ProjectOrderService projectOrderService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private UserService userService;

    /**
     * 转到主页[查询已发布的实验]
     * @author:PP
     * @return
     */
    @RequestMapping("/home")
    public ModelAndView home(HttpSession session) {
        User user=(User)session.getAttribute("user");
        String stu_name=studentService.selectByPrimaryKey(user.getUsername()).getName();
        session.setAttribute("stu_name",stu_name);
        ModelAndView mav = new ModelAndView("student/home");
        return mav;
    }

//    @RequestMapping(value = {"/queryproject"}, method = {RequestMethod.GET, RequestMethod.POST})
//    public @ResponseBody List<ProjectExtend> queryProjectInfo(@Param("page") Integer currentPage,
//                                         ProjectExtend projectExtend) {
//        List<ProjectExtend> projectExtendList = projectService.pp_selectByMultipleInfo(currentPage, offset, projectExtend);
//        return projectExtendList;
//    }

    /**
     * 分页实现查询已发布的项目
     * @author:PP
     * @param page
     * @param projectExtend
     * @return
     */
    @RequestMapping(value = {"/queryproject/page"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody  PageModel<ProjectExtend> queryProjectInfoByPage(Integer page,
                                                    ProjectExtend projectExtend) {
        System.out.println("controller");
        PageModel<ProjectExtend> pm = projectService.pp_getProjectInfoByPage(page, offset, projectExtend);
        return pm;
    }

    /**
     * 分页显示已预约的实验的成绩
     * @author:PP
     * @param page
     * @param projectOrderExtend
     * @return
     */
    @RequestMapping(value = {"/queryorderproject/page"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody  PageModel<ProjectOrderExtend> queryOrderProjectInfoByPage(
            HttpSession session,Integer page,ProjectOrderExtend projectOrderExtend) {
//        System.out.println("controller");
//        System.out.println(projectOrderExtend.toString());
        User user=(User)session.getAttribute("user");
        projectOrderExtend.setStuId(user.getUsername());
        PageModel<ProjectOrderExtend> pm = projectOrderService.selectScore(page,offset,projectOrderExtend);
        return pm;
    }

    /**
     * 分页显示预约记录，做资料下载、退选等操作
     * @author:PP
     * @param page
     * @param projectOrderExtend
     * @return
     */
    @RequestMapping(value = {"/queryorderrecordproject/page"}, method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody  PageModel<ProjectOrderExtend> queryOrderRecordProjectInfoByPage(
            HttpSession session,Integer page,ProjectOrderExtend projectOrderExtend) {
//        System.out.println("controller");
//        System.out.println(projectOrderExtend.toString());
        User user=(User)session.getAttribute("user");
        projectOrderExtend.setStuId(user.getUsername());
        System.out.println("学生学号："+projectOrderExtend.toString());
        PageModel<ProjectOrderExtend> pm = projectOrderService.selectByStuId(page,offset,projectOrderExtend);
        return pm;
    }


    /**
     * 预约按钮的实现
     * @author:PP
     * @param pro_id
     * @param session
     */
    @RequestMapping(value = {"/queryproject/orderbyid"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    void orderProjectById(@Param("pro_id") String pro_id,HttpSession session) {
//        System.out.println("controller-orderbyid--");
        User user=(User)session.getAttribute("user");
        projectOrderService.insert(pro_id,user.getUsername(),0.0f);
    }




    /**
     * 退选按钮的实现
     * @author:PP
     */
    @RequestMapping(value = {"/queryorderproject/deleteorderbyid"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String deleteOrderById(@Param("proId") String proId,HttpSession session) {
        User user=(User)session.getAttribute("user");
        return projectOrderService.delete(user.getUsername(),proId).toString();
    }



    /**
     * 更新密码
     * @author:PP
     * @param session
     * @param oldPwd
     * @param newPwd
     * @return
     */
    @RequestMapping(value = {"/updatePwd"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String updatePwd(HttpSession session,@Param("oldPwd") String oldPwd,@Param("newPwd") String newPwd){
        User user=(User)session.getAttribute("user");
        return userService.pp_updatePassword(user.getUsername(),oldPwd,newPwd).toString();
    }

    /**
     * 转到[查询已预约的实验]界面
     * @author:PP
     * @return
     */
    @RequestMapping("record")
    public ModelAndView record() {
        ModelAndView mav = new ModelAndView("student/search_project_order_record");
        return mav;
    }

    /**
     * 转到[查询成绩]界面
     * @author:PP
     * @return
     */
    @RequestMapping("score")
    public ModelAndView score() {
        ModelAndView mav = new ModelAndView("student/query_score");
        return mav;
    }

    /**
     * 转到[查看个人信息]界面
     * @author:PP
     * @return
     */
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
