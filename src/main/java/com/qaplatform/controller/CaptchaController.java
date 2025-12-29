package com.qaplatform.controller;

import com.qaplatform.util.CaptchaUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class CaptchaController {

    @GetMapping("/captcha")
    public void captcha(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("image/png");
        response.setHeader("Cache-Control", "no-cache");

        String captchaCode = CaptchaUtil.generateCaptchaCode();
        HttpSession session = request.getSession();
        session.setAttribute("captchaCode", captchaCode);

        CaptchaUtil.generateCaptchaImage(captchaCode, response.getOutputStream());
    }
}