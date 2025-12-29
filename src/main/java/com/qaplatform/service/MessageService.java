package com.qaplatform.service;

import com.qaplatform.model.Message;
import com.qaplatform.repository.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

    // 获取所有主题
    public List<Message> getAllThreads() {
        return messageRepository.findAllThreads();
    }

    // 获取主题详情
    public Message getThreadById(Integer id) {
        return messageRepository.findThreadById(id);
    }

    // 获取主题的回复
    public List<Message> getRepliesByThreadId(Integer threadId) {
        return messageRepository.findRepliesByThreadId(threadId);
    }

    // 创建主题
    public Message createThread(Message message) {
        message.setThreadId(null); // 主题的threadId为null
        message.setCreateTime(new Date());
        return messageRepository.save(message);
    }

    // 添加回复
    public Message addReply(Integer threadId, Message reply) {
        reply.setThreadId(threadId);
        reply.setCreateTime(new Date());
        return messageRepository.save(reply);
    }

    // 获取消息详情
    public Message getMessageById(Integer id) {
        return messageRepository.findById(id).orElse(null);
    }
}