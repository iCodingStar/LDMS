package cn.cug.laboratory.controller.teacher;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by HXY on 2016/5/27.
 */
@Controller
@RequestMapping("/jump")
public class Utilcontroller {
    @RequestMapping(value ={"/applyproject1"})
    public String applyproject1(){
        return "teacher/apply_project_1";
    }
    @RequestMapping(value ={"/applyproject2"})
    public String applyproject2(){
        return "teacher/apply_project_2";
    }
    @RequestMapping(value ={"/applyproject3"})
    public String applyproject3(){
        return "teacher/apply_project_3";
    }
}
