package cn.cug.laboratory.mapper;

import cn.cug.laboratory.mapper.extend.ProjectExtendMapper;
import cn.cug.laboratory.model.extend.ProjectExtend;
import cn.cug.laboratory.model.persistent.Project;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by HXY on 2016/5/30.
 */
public class ProjectMapperTest extends AbstractSpringTest {
    @Autowired
    private ProjectExtendMapper projectMapper;

    @Test
    public void test(){
//        Project project = new Project();
//        project.setId("adsdhgf");
//        projectMapper.insertSelective(project);
    }

    @Test
    public void testCount(){
        Project project=new Project();
        project.setTeaId("050002");
        System.out.println(projectMapper.getCounts(project));
        System.out.println(projectMapper.getinfo(0,8,project));
    }

}
