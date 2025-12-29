<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>${thread.title} - 在线问答平台</title>
    <meta charset="UTF-8">
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; }
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .thread-container, .reply-container { background: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); margin-bottom: 20px; }
        .thread-header, .reply-header { background: #f8f9fa; padding: 15px; border-bottom: 1px solid #eee; }
        .thread-content, .reply-content { padding: 20px; }
        .thread-title { font-size: 24px; font-weight: bold; margin-bottom: 10px; }
        .thread-meta, .reply-meta { color: #666; font-size: 14px; }
        .thread-content { line-height: 1.6; white-space: pre-wrap; }
        .reply-form { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        textarea { width: 100%; height: 120px; padding: 10px; border: 1px solid #ddd; border-radius: 4px; resize: vertical; }
        .btn { background: #007bff; color: white; padding: 8px 16px; text-decoration: none; border: none; border-radius: 4px; cursor: pointer; display: inline-block; }
        .btn:hover { background: #0056b3; }
        .btn-success { background: #28a745; }
        .btn-success:hover { background: #218838; }
        .reply-item { border-bottom: 1px solid #eee; padding: 15px 0; }
        .reply-item:last-child { border-bottom: none; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>讨论详情</h1>
            <div>
                <a href="threadList" class="btn">返回列表</a>
                <span style="margin: 0 10px;">欢迎, ${user.username}</span>
                <a href="logout" class="btn">退出</a>
            </div>
        </div>

        <!-- 主题内容 -->
        <div class="thread-container">
            <div class="thread-header">
                <div class="thread-title">${thread.title}</div>
                <div class="thread-meta">
                    作者: ${thread.authorName} | 
                    时间: <fmt:formatDate value="${thread.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </div>
            </div>
            <div class="thread-content">${thread.content}</div>
        </div>

        <!-- 回复列表 -->
        <div class="reply-container">
            <div class="thread-header">
                <h3>回复 (${empty replies ? 0 : replies.size()})</h3>
            </div>
            <div class="thread-content">
                <c:forEach var="reply" items="${replies}">
                    <div class="reply-item">
                        <div class="reply-meta">
                            <strong>${reply.authorName}</strong> 回复于 
                            <fmt:formatDate value="${reply.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </div>
                        <div class="reply-content" style="white-space: pre-wrap; margin-top: 10px;">
                            ${reply.content}
                        </div>
                    </div>
                </c:forEach>
                
                <c:if test="${empty replies}">
                    <div style="text-align: center; color: #666; padding: 20px;">
                        暂无回复
                    </div>
                </c:if>
            </div>
        </div>

        <!-- 回复表单 -->
        <div class="reply-form">
            <h3>发表回复</h3>
            <form action="addReply" method="post">
                <input type="hidden" name="threadId" value="${thread.id}">
                <div style="margin-bottom: 15px;">
                    <textarea name="content" placeholder="请输入回复内容..." required></textarea>
                </div>
                <button type="submit" class="btn btn-success">提交回复</button>
            </form>
        </div>
    </div>
</body>
</html>