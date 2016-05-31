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
package cn.cug.laboratory.service;

import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.persistent.PageModel;
import cn.cug.laboratory.model.persistent.Project;
import cn.cug.laboratory.utils.RetuValueClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by PP on 2016/5/27.
 * 2个函数测试通过
 */

public class ProjectServiceTest extends AbstractSpringTest {

    @Autowired
    private ProjectService projectService;

    @Test
    public void testSelectByMultipleInfo(){
        ProjectExtend projectExtend = new ProjectExtend();
        List<ProjectExtend> list = projectService.selectByMultipleInfo(1,3,projectExtend);
        PageModel<ProjectExtend> pm = projectService.getProjectInfoByPage(1,5,projectExtend);
        System.out.println(list);
    }

    public void selectByTeaIdTest()throws Exception{
//        String tea_id="050003";
//        RetuValueClass<ProjectExtend> projectRetuValueClass=projectService.selectByTeaId(tea_id,1,2);
//        for(Project project: projectRetuValueClass.getRetuList()){
//            System.out.println(project.toString());
//        }
//        System.out.println(projectRetuValueClass.getCount());
    }

    @Test
    public void selectByNameTest()throws Exception{
//        String name="测绘实习";
//        RetuValueClass<ProjectExtend> projectRetuValueClass=projectService.selectByName(name,1,3);
//        for(Project project: projectRetuValueClass.getRetuList()){
//            System.out.println(project.toString());
//        }
//        System.out.println(projectRetuValueClass.getCount());
    }

    @Test
    public void testSelectMultipleInfoById(){
        ProjectExtend projectExtend  = projectService.selectMultipleInfoById("P1605001");
        projectService.selectByMultipleInfoCounts(projectExtend);
        System.out.println(projectExtend);
    }

}
