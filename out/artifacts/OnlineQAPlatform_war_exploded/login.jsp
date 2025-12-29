<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>登录 - 在线问答平台</title>
    <meta charset="UTF-8">
    <style>
        body { font-family: Arial, sans-serif; margin: 50px; background: #f5f5f5; }
        .container { max-width: 400px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"], input[type="password"] { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        .captcha-container { display: flex; align-items: center; gap: 10px; }
        .captcha-img { border: 1px solid #ddd; border-radius: 4px; }
        .btn { background: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
        .btn:hover { background: #0056b3; }
        .error { color: red; margin-bottom: 15px; }
    </style>
</head>
<body>
    <div class="container">
        <h2>用户登录</h2>
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
        <form action="login" method="post">
            <div class="form-group">
                <label>用户名:</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>密码:</label>
                <input type="password" name="password" required>
            </div>
            <div class="form-group">
                <label>验证码:</label>
                <div class="captcha-container">
                    <input type="text" name="captcha" required maxlength="4">
                    <img src="captcha" class="captcha-img" onclick="this.src='captcha?t='+new Date().getTime()" 
                         style="cursor: pointer;" title="点击刷新验证码">
                </div>
            </div>
            <button type="submit" class="btn">登录</button>
        </form>
        <p>还没有账号？<a href="register.jsp">立即注册</a></p>
    </div>
</body>
</html>