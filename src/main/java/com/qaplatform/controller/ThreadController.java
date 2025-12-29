package com.qaplatform.controller;

import com.qaplatform.model.Message;
import com.qaplatform.model.User;
import com.qaplatform.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ThreadController extends BaseController {

    @Autowired
    private MessageService messageService;

    @GetMapping("/threadList")
    public String threadList(Model model) {
        List<Message> threads = messageService.getAllThreads();
        model.addAttribute("threads", threads);
        return "threadList";
    }

    @GetMapping("/threadDetail/{id}")
    public String threadDetail(@PathVariable Integer id, Model model) {
        Message thread = messageService.getThreadById(id);
        if (thread == null) {
            return "redirect:/threadList";
        }

        List<Message> replies = messageService.getRepliesByThreadId(id);
        model.addAttribute("thread", thread);
        model.addAttribute("replies", replies);
        return "threadDetail";
    }

    @GetMapping("/createThread")
    public String createThreadPage(HttpServletRequest request, Model model) {
        if (!isUserLoggedIn(request)) {
            return "redirect:/login";
        }
        return "createThread";
    }

    @PostMapping("/createThread")
    public String createThread(
            @RequestParam String title,
            @RequestParam String content,
            HttpServletRequest request) {

        User user = getCurrentUser(request);
        if (user == null) {
            return "redirect:/login";
        }

        Message message = new Message();
        message.setTitle(title);
        message.setContent(content);
        message.setAuthorId(user.getId());
        message.setAuthorName(user.getUsername());
        message.setThreadId(null);

        messageService.createThread(message);
        return "redirect:/threadList";
    }

    @PostMapping("/addReply")
    public String addReply(
            @RequestParam Integer threadId,
            @RequestParam String content,
            HttpServletRequest request) {

        User user = getCurrentUser(request);
        if (user == null) {
            return "redirect:/login";
        }

        Message reply = new Message();
        reply.setTitle("回复");
        reply.setContent(content);
        reply.setAuthorId(user.getId());
        reply.setAuthorName(user.getUsername());

        messageService.addReply(threadId, reply);
        return "redirect:/threadDetail/" + threadId;
    }
}