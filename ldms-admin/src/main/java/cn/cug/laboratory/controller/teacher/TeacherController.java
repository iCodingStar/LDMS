package cn.cug.laboratory.controller.teacher;

import cn.cug.laboratory.model.persistent.*;
import cn.cug.laboratory.service.*;
import cn.cug.laboratory.utils.DateUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by HXY on 2016/5/22.
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {

    private Integer offset = 8;

    private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Autowired
    private LabService labService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private UserService userService;

    @Autowired
    private StudentService studentService;

    /**
     * 跳转到教师主页
     *
     * @param session
     * @return
     */
    @RequestMapping("/home")
    public ModelAndView home(HttpSession session) {
        User user = (User) session.getAttribute("user");
        Teacher teacher = teacherService.getTeacherByUsername(user.getUsername());
        session.setAttribute("teacher", teacher);
        ModelAndView mav = new ModelAndView("teacher/home");
        return mav;
    }

    /**
     * @param project
     * @return 申请实验第一步，提交信息，在controlller里面保存用户提交的信息，并不存入数据库
     * 要生成一个实验ID
     * 根据传过来的实验室名称查询lab_id
     * 将实验状态设置为0,标识为提交状态
     * 从当前session里面获取tea_id
     * 将上传文件保存到临时文件夹(在确认信息无误,确认申请以后放到upload文件夹)
     */
    @RequestMapping(value = "/saveprojectinfo", method = RequestMethod.POST)
    public
    @ResponseBody
    String saveprojectinfo(@RequestBody Project project, HttpSession session) {

        //生成实验编号
        project.setId(projectService.getNewId());
        //获取前台传过来的设备信息并分割'_'分割设备名称和设备型号，&后面表示的是申请的设备数量，##分割的是两个设备的信息
        String[] devices = project.getDevices().split("##");
        List<Device> devicelist = new ArrayList<Device>();
        List<String> num = new ArrayList<String>();
        for (String s : devices) {
            Device device = new Device();
            device.setName(s.substring(0, s.indexOf("_")));
            device.setModelId(s.substring(s.indexOf("_") + 1, s.indexOf("&")));
            num.add(s.substring(s.indexOf("&") + 1, s.length()));
            devicelist.add(device);
        }
        //在session里面添加两个,在下一个页面展示
        session.setAttribute("num", num);
        session.setAttribute("devicelist", devicelist);
        session.setAttribute("applyprojectinfo", project);
        return "success";
    }

    /**
     * @param filename
     * @param proid
     * @param request
     * @return 查询文件上传状态
     */
    @RequestMapping("/queryfileupstate")
    public
    @ResponseBody
    String queryfileupstate(@RequestParam("filename") String filename,
                            @RequestParam("proid") String proid, HttpServletRequest request) {
        File file = new File(request.getSession().getServletContext().getRealPath("/") + "upload/" + proid + "/"
                + filename);
        if (file.exists()) {
            return "success";
        }
        return "faild";
    }


    /**
     * 确认提交的页面传过来的值
     *
     * @param session
     * @return
     * @throws ParseException
     */
    @RequestMapping("confirmapply")
    public String confirmapply(HttpSession session) throws ParseException {
        Project project = (Project) session.getAttribute("applyprojectinfo");
        //从session获取教师id
        project.setTeaId(userService.getTeacherNameById(((User) session.getAttribute("user")).getUsername()));
        //拼接devices
        String devices = "";
        List<Device> devicelist = (List<Device>) session.getAttribute("devicelist");
        for (Device device : devicelist) {
            devices += device.getId();
            devices += "##";
        }
        project.setDevices(devices);
        //得到实验室id
        project.setLabId(labService.getLabIdByName(project.getLabId()));
        //插入申请时间
        project.setSubmitTime(new java.sql.Date((df.parse(DateUtils.format(new Date().toString()))).getTime()));
        //设置剩余容量
        project.setLeftCapacity(project.getCapacity());
        //格式化日期
        project.setEndTime(new java.sql.Date((df.parse(DateUtils.format(project.getEndTime().toString()))).getTime()));
        project.setStartTime(new java.sql.Date((df.parse(DateUtils.format(new Date().toString()))).getTime()));
        System.out.println(project.toString());
        projectService.insert(project);
        session.setAttribute("proforupfile",project.getId());
        return "redirect:/upfile_proid.jsp";
    }

    @RequestMapping("upfile")
    public ModelAndView upfile(HttpSession session) {
        checksession(session);
        ModelAndView mav = new ModelAndView("teacher/uploadfile");
        return mav;
    }


    @RequestMapping(value = "/upload")
    public
    @ResponseBody
    String upload(@RequestParam MultipartFile file,
                  HttpSession session,
                  HttpServletRequest request) throws IOException {
        String proid=(String)session.getAttribute("proforupfile");
        Project project=new Project();
        project.setId(proid);
        File dir=new File(request.getSession().getServletContext().getRealPath("/") + "upload/"+proid);
        if(!dir.exists()){
            dir.mkdir();
        }
        //获取当前路径并定位到资源模块路径
        //获取文件并写入
        String name = file.getOriginalFilename();
        project.setFiles(name);
        System.out.println(name);
        if (!file.isEmpty()) {
            try {
                // 文件保存路径
                String filePath = dir+"/" + name;
                // 转存文件
                file.transferTo(new File(filePath));
                projectService.setfilenameBYId(project);
                return "success";
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        session.removeAttribute("proforupfile");
        return "false";
    }

    @RequestMapping("showstudentdetail")
    public
    @ResponseBody
    String showstudentdetail() {
        return "success";
    }

    @RequestMapping("Studentdetail")
    public ModelAndView Studentdetail(@Param("id") String id) {
        ModelAndView mav = new ModelAndView("teacher/showProjectStudentdetail");
        id = "P1605002";
        mav.addObject("studentlist", studentService.getAllStudentByProId(id));
        mav.addObject("proname", projectService.getById(id).getName());
        return mav;
    }

    @RequestMapping("finishapply")
    public ModelAndView finishapply(HttpSession session) {
        ModelAndView mav = new ModelAndView("teacher/home");
        return mav;
    }

    @RequestMapping("/queryproject")
    public
    @ResponseBody
    PageModel<Project> queryproject(Integer page,
                                    Project project, HttpSession session) {
        project.setTeaId(((Teacher) session.getAttribute("teacher")).getId());
        PageModel<Project> pm = projectService.getProjectByMultipleinfo(page, offset, project);
        return pm;
    }

    @RequestMapping("/queryById")
    public
    @ResponseBody
    Project queryById(@Param("id") String id, HttpSession session) {
        Project project = projectService.getById(id);
        project.setTeaId(((Teacher) session.getAttribute("teacher")).getName());
        project.setLabId(labService.getLabNameByid(project.getLabId()));
        return project;
    }

    @RequestMapping("/showproject")
    public ModelAndView show() {
        ModelAndView mav = new ModelAndView("teacher/showProject");
        return mav;
    }

    @RequestMapping("/getproid")
    public
    @ResponseBody
    String getproid(@Param("id") String id, HttpSession session) {
        Project project = projectService.getById(id);
        session.setAttribute("applyprojectinfo", project);
        return "success";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/index.jsp";
    }

    public String checksession(HttpSession session) {
        if (null == (User) session.getAttribute("user")) {
            return "redirect:/index.jsp";
        } else {
            return "on";
        }
    }

}
