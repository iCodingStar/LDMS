package cn.cug.laboratory.service;

import cn.cug.laboratory.model.persistent.ProjectOrder;
import cn.cug.laboratory.utils.RetuValueClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by PP on 2016/5/23.
 */

public class ProjectOrderServiceImplTest extends AbstarctSpringTest{

    @Autowired
    private ProjectOrderService projectOrderService;

    @Test
    public void InsertTest(){
        String proId="P1605231";
        String stuId="2013100";
        Float score=0.0f;
        projectOrderService.insert(proId,stuId,score);

    }

    @Test
    public void SelectByStuIdTest(){
        String stuId="2013100";
        RetuValueClass<ProjectOrder> projectOrderRetuValueClass=projectOrderService.selectByStuId(stuId,1,2);
        for(ProjectOrder projectOrder: projectOrderRetuValueClass.getRetuList()){
            System.out.println(projectOrder.toString());
        }
        System.out.println(projectOrderRetuValueClass.getCount());
    }

    @Test
    public void DeleteTest(){
        String proOrderId="2013102";
        projectOrderService.delete(proOrderId);
    }

    @Test
    public void SelectScoreTest(){
        String stuId="2013100";
        RetuValueClass<ProjectOrder> projectOrderRetuValueClass=projectOrderService.selectScore(stuId,1,2);
        for(ProjectOrder projectOrder: projectOrderRetuValueClass.getRetuList()){
            System.out.println(projectOrder.toString());
        }
        System.out.println(projectOrderRetuValueClass.getCount());
    }

}
