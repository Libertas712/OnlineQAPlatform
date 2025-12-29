package com.qaplatform.dao;

import com.qaplatform.model.User;
import com.qaplatform.model.Message;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

public class DAO {
    // 使用内存存储模拟数据库
    private static final Map<Integer, User> users = new ConcurrentHashMap<>();
    private static final Map<Integer, Message> messages = new ConcurrentHashMap<>();
    private static final AtomicInteger userIdCounter = new AtomicInteger(1);
    private static final AtomicInteger messageIdCounter = new AtomicInteger(1);

    static {
        // 初始化一些测试数据
        User admin = new User(userIdCounter.getAndIncrement(), "admin", "123456", "admin@example.com");
        users.put(admin.getId(), admin);
    }

    // 用户相关方法
    public User getUserById(Integer id) {
        return users.get(id);
    }

    public User getUserByUsername(String username) {
        return users.values().stream()
                .filter(user -> user.getUsername().equals(username))
                .findFirst()
                .orElse(null);
    }

    public boolean addUser(User user) {
        if (getUserByUsername(user.getUsername()) != null) {
            return false; // 用户名已存在
        }
        user.setId(userIdCounter.getAndIncrement());
        users.put(user.getId(), user);
        return true;
    }

    public boolean validateUser(String username, String password) {
        User user = getUserByUsername(username);
        return user != null && user.getPassword().equals(password);
    }

    // 消息相关方法
    public List<Message> getAllThreads() {
        return messages.values().stream()
                .filter(msg -> msg.getThreadId() == null) // 主题消息的threadId为null
                .sorted((m1, m2) -> m2.getCreateTime().compareTo(m1.getCreateTime()))
                .collect(Collectors.toList()); // JDK 8兼容写法
    }

    public Message getMessageById(Integer id) {
        return messages.get(id);
    }

    public List<Message> getRepliesByThreadId(Integer threadId) {
        return messages.values().stream()
                .filter(msg -> threadId.equals(msg.getThreadId()))
                .sorted((m1, m2) -> m1.getCreateTime().compareTo(m2.getCreateTime()))
                .collect(Collectors.toList()); // JDK 8兼容写法
    }

    public Integer addMessage(Message message) {
        message.setId(messageIdCounter.getAndIncrement());
        message.setCreateTime(new Date());
        messages.put(message.getId(), message);
        return message.getId();
    }
}