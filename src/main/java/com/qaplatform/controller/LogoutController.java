package com.qaplatform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LogoutController extends BaseController {

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        invalidateSession(request);
        return "redirect:/login";
    }
}