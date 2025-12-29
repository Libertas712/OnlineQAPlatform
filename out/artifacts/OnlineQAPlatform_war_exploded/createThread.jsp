<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>新建讨论 - 在线问答平台</title>
    <meta charset="UTF-8">
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; }
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .form-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"] { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        textarea { width: 100%; height: 300px; padding: 10px; border: 1px solid #ddd; border-radius: 4px; resize: vertical; }
        .btn { background: #007bff; color: white; padding: 10px 20px; text-decoration: none; border: none; border-radius: 4px; cursor: pointer; }
        .btn:hover { background: #0056b3; }
        .btn-secondary { background: #6c757d; }
        .btn-secondary:hover { background: #545b62; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>新建讨论</h1>
            <div>
                <a href="threadList" class="btn btn-secondary">返回列表</a>
                <span style="margin: 0 10px;">欢迎, ${user.username}</span>
                <a href="logout" class="btn">退出</a>
            </div>
        </div>

        <div class="form-container">
            <form action="createThread" method="post">
                <div class="form-group">
                    <label>标题:</label>
                    <input type="text" name="title" placeholder="请输入讨论标题..." required maxlength="100">
                </div>
                <div class="form-group">
                    <label>内容:</label>
                    <textarea name="content" placeholder="请输入讨论内容..." required></textarea>
                </div>
                <div style="text-align: center;">
                    <button type="submit" class="btn">发布讨论</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>