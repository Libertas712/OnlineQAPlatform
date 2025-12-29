<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>讨论列表 - 在线问答平台</title>
    <meta charset="UTF-8">
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; }
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .thread-list { background: white; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .thread-item { padding: 15px; border-bottom: 1px solid #eee; }
        .thread-item:last-child { border-bottom: none; }
        .thread-title { font-size: 18px; font-weight: bold; margin-bottom: 5px; }
        .thread-meta { color: #666; font-size: 14px; }
        .btn { background: #007bff; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px; display: inline-block; }
        .btn:hover { background: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>讨论列表</h1>
            <div>
                <a href="createThread.jsp" class="btn">新建讨论</a>
                <span style="margin: 0 10px;">欢迎, ${user.username}</span>
                <a href="logout" class="btn">退出</a>
            </div>
        </div>
        
        <div class="thread-list">
            <c:forEach var="thread" items="${threads}">
                <div class="thread-item">
                    <div class="thread-title">
                        <a href="threadDetail?id=${thread.id}">${thread.title}</a>
                    </div>
                    <div class="thread-meta">
                        作者: ${thread.authorName} | 时间: ${thread.createTime}
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty threads}">
                <div class="thread-item" style="text-align: center; color: #666;">
                    暂无讨论话题
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>