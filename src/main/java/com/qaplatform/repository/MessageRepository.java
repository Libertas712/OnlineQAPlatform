package com.qaplatform.repository;

import com.qaplatform.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository<Message, Integer> {

    // 获取所有主题（thread_id为null的消息）
    @Query("SELECT m FROM Message m WHERE m.threadId IS NULL ORDER BY m.createTime DESC")
    List<Message> findAllThreads();

    // 获取特定主题的所有回复
    @Query("SELECT m FROM Message m WHERE m.threadId = :threadId ORDER BY m.createTime ASC")
    List<Message> findRepliesByThreadId(@Param("threadId") Integer threadId);

    // 获取特定主题
    @Query("SELECT m FROM Message m WHERE m.id = :id AND m.threadId IS NULL")
    Message findThreadById(@Param("id") Integer id);
}