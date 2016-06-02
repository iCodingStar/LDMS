package cn.cug.laboratory.controller;

import cn.cug.laboratory.model.extend.DeviceExtend;
import cn.cug.laboratory.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by HXY on 2016/5/28.
 */
@Controller
@RequestMapping("/query")
public class QueryController {

    @Autowired
    private DeviceService deviceService;

    @RequestMapping(value = "querydeviceleft",method = RequestMethod.POST)
    public @ResponseBody String querydeviceleft(@RequestBody DeviceExtend device){
        return deviceService.getLeftAmountById(device.getId()).toString();
    }
}
