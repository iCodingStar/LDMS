package cn.cug.laboratory.web;

import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpSession;

/**
 * Created by HXY on 2016/5/28.
 */
public interface Checkcontroller {

    @ModelAttribute
    public void checksesion(HttpSession session);
}
