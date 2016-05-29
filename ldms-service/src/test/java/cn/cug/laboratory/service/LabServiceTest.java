package cn.cug.laboratory.service;

import org.junit.After;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by HXY on 2016/5/27.
 */
public class LabServiceTest extends AbstractSpringTest {


    @Autowired
    private LabService service;
    @Test
    public void test(){
        System.out.println("test");
    }

    @Test
    public void testGetAll(){
        service.getAll();
    }
}
