package cn.cug.laboratory.controller.teacher;

import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.persistent.Device;
import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.model.persistent.Teacher;
import cn.cug.laboratory.model.persistent.User;
import cn.cug.laboratory.service.LabService;
import cn.cug.laboratory.service.ProjectService;
import cn.cug.laboratory.service.TeacherService;
import cn.cug.laboratory.service.UserService;
import cn.cug.laboratory.utils.DBUtils;
import cn.cug.laboratory.utils.DateUtils;
import cn.cug.laboratory.web.Checkcontroller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
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
public class TeacherController{

    private SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

    @Autowired
    private LabService labService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private UserService userService;

    @RequestMapping("/home")
    public ModelAndView home(HttpSession session) {
        User user=(User)session.getAttribute("user");
        Teacher teacher=teacherService.getTeacherByUsername(user.getUsername());
        session.setAttribute("teacher",teacher);
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
     * 得到设备列表
     */
    @RequestMapping(value = "/saveprojectinfo", method = RequestMethod.POST)
    public @ResponseBody String saveprojectinfo(@RequestBody Project project, HttpSession session) {

        //获取前台传过来的设备信息并分割'_'分割设备名称和设备型号，&后面表示的是申请的设备数量，##分割的是两个设备的信息
        String[] devices=project.getDevices().split("##");
        List<Device> devicelist=new ArrayList<Device>();
        List<String> num=new ArrayList<String>();
        for (String s:devices){
            Device device=new Device();
            device.setName(s.substring(0,s.indexOf("_")));
            device.setModelId(s.substring(s.indexOf("_")+1,s.indexOf("&")));
            num.add(s.substring(s.indexOf("&")+1,s.length()));
            devicelist.add(device);
        }
        //在session里面添加两个,在下一个页面展示
        session.setAttribute("num",num);
        session.setAttribute("devicelist",devicelist);
        session.setAttribute("applyprojectinfo", project);
        return "success";
    }


    @RequestMapping("confirmapply")
    public ModelAndView confirmapply(HttpSession session) throws ParseException {
        Project project=(Project)session.getAttribute("applyprojectinfo");
        //从session获取教师id
        project.setTeaId(userService.getTeacherNameById(((User)session.getAttribute("user")).getUsername()));
        //拼接devices
        String devices="";
        List<Device> devicelist=(List<Device>)session.getAttribute("devicelist");
        for (Device device:devicelist){
            devices+=device.getId();
            devices+="##";
        }
        project.setDevices(devices);
        //生成实验编号
        project.setId(projectService.getNewId());
        //得到实验室id
        project.setLabId(labService.getLabIdByName(project.getLabId()));
        //插入申请时间
        project.setSubmitTime(new java.sql.Date((df.parse(DateUtils.format(new Date().toString()))).getTime()));
        //设置剩余容量
        project.setLeftCapacity(project.getCapacity());
        //格式化日期
        project.setEndTime(new java.sql.Date((df.parse(DateUtils.format(project.getEndTime().toString()))).getTime()));
        project.setStartTime(new java.sql.Date((df.parse(DateUtils.format(project.getStartTime().toString()))).getTime()));
        System.out.println(project.toString());
        projectService.insert(project);
        ModelAndView mav=new ModelAndView("teacher/uploadfile");
        return mav;
    }

    @RequestMapping("upfile")
    public ModelAndView upfile(){
        ModelAndView mav=new ModelAndView("teacher/uploadfile");
        return mav;
    }
    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    public
    @ResponseBody
    String upload(@RequestParam("file") MultipartFile file) {
        //获取当前路径并定位到资源模块路径
        String rootpath=System.getProperty("user.dir");
        rootpath=rootpath.substring(0,rootpath.lastIndexOf("\\"));
        String modoulpath="\\ldms-cache\\upload\\";
        String dir=rootpath+modoulpath;
        File file1=new File(dir);
        if(!file1.exists())
            file1.mkdir();

        //获取文件并写入
        String name =file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                System.out.println(file.getOriginalFilename());
                try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(file1+name)))) {
                    stream.write(file.getBytes());
                }
                return "success";
            } catch (IOException e) {
                return "failed";
            }
        } else {
            return "file empty.";
        }
    }

}
