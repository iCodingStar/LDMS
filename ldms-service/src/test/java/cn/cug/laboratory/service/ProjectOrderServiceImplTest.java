package cn.cug.laboratory.service;

import cn.cug.laboratory.model.persistent.ProjectOrder;
import cn.cug.laboratory.utils.RetuValueClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by PP on 2016/5/23.
 * 4个函数测试通过
 */

public class ProjectOrderServiceImplTest extends AbstractSpringTest {

    @Autowired
    private ProjectOrderService projectOrderService;

    @Test
    public void InsertTest(){
//        String proId="P1605001";
//        String stuId="20131000005";
//        Float score=Float.parseFloat("0.0");
//        projectOrderService.insert(proId,stuId,score);
    }

//    @Test
//    public void SelectByStuIdTest(){
//        String stuId="20131000002";
//        RetuValueClass<ProjectOrder> projectOrderRetuValueClass=projectOrderService.selectByStuId(stuId,1,2);
//        for(ProjectOrder projectOrder: projectOrderRetuValueClass.getRetuList()){
//            System.out.println(projectOrder.toString());
//        }
//        System.out.println(projectOrderRetuValueClass.getCount());
//    }
//
//    @Test
//    public void DeleteTest(){
////        String proOrderId="PO05005";
////        projectOrderService.delete(proOrderId);
//    }
//
//    @Test
//    public void SelectScoreTest(){
//        String stuId="20131000002";
//        RetuValueClass<ProjectOrder> projectOrderRetuValueClass=projectOrderService.selectScore(stuId,1,2);
//        for(ProjectOrder projectOrder: projectOrderRetuValueClass.getRetuList()){
//            System.out.println(projectOrder.toString());
//        }
//        System.out.println(projectOrderRetuValueClass.getCount());
//    }

}
