package com.qaplatform.controller;

import com.qaplatform.model.User;
import com.qaplatform.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController extends BaseController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String loginPage(HttpServletRequest request, Model model) {
        // 检查session中是否有注册成功消息
        HttpSession session = request.getSession(false);
        if (session != null) {
            String success = (String) session.getAttribute("success");
            if (success != null) {
                model.addAttribute("success", success);
                session.removeAttribute("success");
            }
        }
        return "login";
    }

    @PostMapping("/login")
    public String login(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String captcha,
            HttpServletRequest request,
            Model model) {

        HttpSession session = request.getSession();
        String captchaCode = (String) session.getAttribute("captchaCode");

        // 验证验证码
        if (captchaCode == null || !captchaCode.equalsIgnoreCase(captcha)) {
            model.addAttribute("error", "验证码错误");
            return "login";
        }

        // 验证用户
        if (userService.validateUser(username, password)) {
            User user = userService.getUserByUsername(username);
            setSessionUser(request, user);
            session.removeAttribute("captchaCode"); // 清除验证码
            return "redirect:/threadList";
        } else {
            model.addAttribute("error", "用户名或密码错误");
            return "login";
        }
    }
}