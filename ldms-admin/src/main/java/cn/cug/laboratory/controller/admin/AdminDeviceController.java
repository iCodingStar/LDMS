/*
 * Copyright 2016-2016 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package cn.cug.laboratory.controller.admin;

import cn.cug.laboratory.model.extend.DeviceExtend;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.service.DeviceService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @autor shixing
 * @since 1.0.0
 */
@Controller
@RequestMapping(value = {"/admin/device"})
public class AdminDeviceController {
    private Integer offset = 5;

    @Autowired
    private DeviceService deviceService;

    @RequestMapping("")
    public ModelAndView home(){
        return new ModelAndView("admin/device/device");
    }

    /**
     * @author: shixing
     * @fuction:进行分页查询设备资料
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/query/page"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    PageModel<DeviceExtend> queryDeviceInfoByPage(Integer page,
                                                   DeviceExtend deviceExtend) {
        PageModel<DeviceExtend> pm = deviceService.getDevicePageInfoByIdOrName(page,offset,deviceExtend);
        return pm;
    }

    /**
     * @author: shixing
     * @function:修改设备状态
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/update/id"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String updateDeviceById(DeviceExtend deviceExtend) {
        deviceService.updateDeviceByPrimaryKey(deviceExtend.getId(),deviceExtend);
        return "success";
    }

    /**
     * @author: shixing
     * @function:
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/insert"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String insertDevice(DeviceExtend deviceExtend) {
        deviceService.insertDeviceByPrimaryKey(deviceExtend);
        return "success";
    }

    /**
     * @author: shixing
     * @function:修改设备状态
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/delete/id"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    String deleteDeviceById(DeviceExtend deviceExtend) {
        deviceService.deleteByPrimaryKey(deviceExtend.getId());
        System.out.println("232233");
        return "success";
    }
}
