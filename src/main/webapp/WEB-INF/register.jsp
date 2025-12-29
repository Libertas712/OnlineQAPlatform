<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>注册 - 在线问答平台</title>
    <meta charset="UTF-8">
    <style>
        body { font-family: Arial, sans-serif; margin: 50px; background: #f5f5f5; }
        .container { max-width: 400px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], input[type="password"], input[type="email"] { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        .captcha-container { display: flex; align-items: center; gap: 10px; }
        .captcha-img { border: 1px solid #ddd; border-radius: 4px; }
        .btn { background: #28a745; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        .btn:hover { background: #218838; }
        .error { color: red; margin-bottom: 15px; }
        .success { color: green; margin-bottom: 15px; }
    </style>
</head>
<body>
<div class="container">
    <h2>用户注册</h2>
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
        <div class="success">${success}</div>
    </c:if>

    <!-- 修改form action -->
    <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="form-group">
            <label>用户名:</label>
            <input type="text" name="username" required maxlength="20">
        </div>
        <div class="form-group">
            <label>密码:</label>
            <input type="password" name="password" required minlength="6">
        </div>
        <div class="form-group">
            <label>确认密码:</label>
            <input type="password" name="confirmPassword" required>
        </div>
        <div class="form-group">
            <label>邮箱:</label>
            <input type="email" name="email" required>
        </div>
        <div class="form-group">
            <label>验证码:</label>
            <div class="captcha-container">
                <input type="text" name="captcha" required maxlength="4">
                <img src="${pageContext.request.contextPath}/captcha" class="captcha-img"
                     onclick="this.src='${pageContext.request.contextPath}/captcha?t='+new Date().getTime()"
                     style="cursor: pointer;" title="点击刷新验证码">
            </div>
        </div>
        <button type="submit" class="btn">注册</button>
    </form>
    <p>已有账号？<a href="${pageContext.request.contextPath}/login">立即登录</a></p>
</div>
</body>
</html>