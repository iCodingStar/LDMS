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

import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.service.ProjectService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @autor shixing
 * @since 1.0.0
 */

@Controller
@RequestMapping("admin/project")
public class AdminProjectController {
    private Integer offset = 8;

    @Autowired
    private ProjectService projectService;

    /**
     * @author: shixing
     * @function:进入项目查询
     * @since : 1.0.0
     */
    @RequestMapping("/queryProject")
    public ModelAndView queryProject() {
        return new ModelAndView("admin/project/queryProject");
    }

    /**
     * @author: shixing
     * @function:进入项目审核
     * @since : 1.0.0
     */
    @RequestMapping("/checkProject")
    public ModelAndView checkProject() {
        return new ModelAndView("admin/project/checkProject");
    }


    /**
     * @author: shixing
     * @fuction:进行分页查询
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/query"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    List<ProjectExtend> queryProjectInfo(@Param("page") Integer currentPage,
                                         ProjectExtend projectExtend) {
        List<ProjectExtend> projectExtendList = projectService.selectByMultipleInfo(currentPage, offset, projectExtend);
        System.out.println(projectExtendList);
        return projectExtendList;
    }


    /**
     * @author: shixing
     * @fuction:进行分页查询
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/query/page"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    PageModel<ProjectExtend> queryProjectInfoByPage(Integer page,
                                                    ProjectExtend projectExtend) {
        PageModel<ProjectExtend> pm = projectService.getProjectInfoByPage(page, offset, projectExtend);
        return pm;
    }

    /**
     * @author: shixing
     * @function:根据id查询项目详细信息
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/queryById"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    ProjectExtend queryProjectInfoById(Project project) {
        ProjectExtend projectExtend = projectService.selectMultipleInfoById(project.getId());
        System.out.println(projectExtend);
        return projectExtend;
    }

    /**
     * @author: shixing
     * @function:修改项目状态
     * @since : 1.0.0
     */
    @RequestMapping(value = {"/update/state"}, method = {RequestMethod.GET, RequestMethod.POST})
    public
    @ResponseBody
    Project updateProjectById(Project project) {
        projectService.updateProjectStateById(project);
        return project;
    }
}
