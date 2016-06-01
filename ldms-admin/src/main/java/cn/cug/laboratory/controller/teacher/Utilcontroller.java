package cn.cug.laboratory.controller.teacher;

import cn.cug.laboratory.model.persistent.Device;
import cn.cug.laboratory.service.DeviceService;
import cn.cug.laboratory.service.LabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by HXY on 2016/5/27.
 */
@Controller
@RequestMapping("/jump")
public class Utilcontroller {

    @Autowired
    private LabService labService;
    @Autowired
    private DeviceService deviceService;

    @RequestMapping(value ={"/applyproject1"})
    public String applyproject1(){
        return "teacher/apply_project_1";
    }
    @RequestMapping(value ={"/applyproject2"})
    public ModelAndView applyproject2(){
        ModelAndView mav=new ModelAndView("teacher/apply_project_2");
        mav.addObject("lablist",labService.getAll());
        mav.addObject("devicelist",deviceService.getAll());
        return mav;
    }
    @RequestMapping(value ={"/applyproject3"})
    public String applyproject3(){
        return "teacher/apply_project_3";
    }
}
