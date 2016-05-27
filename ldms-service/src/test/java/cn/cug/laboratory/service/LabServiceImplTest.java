package cn.cug.laboratory.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by HXY on 2016/5/27.
 */
public class LabServiceImplTest extends AbstarctSpringTest {

    @Autowired
    private LabService labService;

    @Test
    public void testgetIdByName(){
        labService.getLabIdByName("12");
    }
}
