package cn.cug.laboratory.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

/**
 * Created by HXY on 2016/5/27.
 */
public class DeviceServiceTest extends AbstractSpringTest {

    @Autowired
    private DeviceService service;

    @Test
    public void test(){
        System.out.println("test");
    }

    @Test
    public void testGetAll(){
        System.out.println(service.getAll());
    }

    @Test
    public void testgetAmountbyId(){
        service.getLeftAmountById("D001");
    }
}
