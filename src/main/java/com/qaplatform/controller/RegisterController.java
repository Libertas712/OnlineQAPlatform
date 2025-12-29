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
public class RegisterController extends BaseController {

    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String registerPage() {
        return "register";
    }

    @PostMapping("/register")
    public String register(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String confirmPassword,
            @RequestParam String email,
            @RequestParam String captcha,
            HttpServletRequest request,
            Model model) {

        HttpSession session = request.getSession();
        String captchaCode = (String) session.getAttribute("captchaCode");

        // 验证验证码
        if (captchaCode == null || !captchaCode.equalsIgnoreCase(captcha)) {
            model.addAttribute("error", "验证码错误");
            return "register";  // 直接返回视图名
        }

        // 验证密码确认
        if (!password.equals(confirmPassword)) {
            model.addAttribute("error", "两次输入的密码不一致");
            return "register";
        }

        // 创建用户
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);

        if (userService.registerUser(user)) {
            // 注册成功后，设置成功消息并重定向到登录页
            session.setAttribute("success", "注册成功，请登录");
            return "redirect:/login";  // 使用重定向
        } else {
            model.addAttribute("error", "用户名已存在");
            return "register";
        }
    }
}