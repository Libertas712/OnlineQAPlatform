# OnlineQA Platform - 在线问答平台

一个基于 Spring Boot + JPA + MySQL 构建的在线问答留言交互平台，使用 Spring MVC 和 IOC 进行重构。

## 📋 项目简介

这是一个功能完整的在线问答平台，用户可以注册登录、发布讨论主题、回复互动。项目从原始的 Servlet+JSP 架构重构为现代化的 Spring Boot 架构。

### 🚀 技术栈

- **后端框架**: Spring Boot 2.7.18
- **MVC框架**: Spring MVC
- **IOC容器**: Spring IOC
- **数据持久层**: Spring Data JPA
- **数据库**: MySQL 8.0
- **前端视图**: JSP + JSTL + CSS
- **构建工具**: Maven
- **应用服务器**: Tomcat 9
- **Java版本**: JDK 1.8+

## ✨ 功能特性

### 用户管理
- ✅ 用户注册（带验证码验证）
- ✅ 用户登录/退出
- ✅ 密码确认与验证
- ✅ 用户信息管理

### 讨论功能
- ✅ 创建新讨论主题
- ✅ 查看讨论列表（按时间倒序）
- ✅ 查看讨论详情
- ✅ 发表回复
- ✅ 实时显示作者和时间

### 安全特性
- ✅ 验证码机制（防止机器人）
- ✅ 会话管理
- ✅ 登录状态验证
- ✅ 密码安全性校验

## 🏗️ 系统架构
OnlineQAPlatform/
├── src/main/java/com/qaplatform/
│ ├── controller/ # Spring MVC 控制器
│ │ ├── LoginController.java
│ │ ├── RegisterController.java
│ │ ├── ThreadController.java
│ │ ├── LogoutController.java
│ │ └── CaptchaController.java
│ ├── service/ # 业务逻辑层
│ │ ├── UserService.java
│ │ └── MessageService.java
│ ├── repository/ # 数据访问层
│ │ ├── UserRepository.java
│ │ └── MessageRepository.java
│ ├── model/ # 数据模型
│ │ ├── User.java
│ │ └── Message.java
│ ├── util/ # 工具类
│ │ └── CaptchaUtil.java
│ └── config/ # 配置类
│ └── DatabaseConfig.java
├── src/main/resources/
│ └── application.properties # 配置文件
├── src/main/webapp/WEB-INF/
│ ├── login.jsp
│ ├── register.jsp
│ ├── threadList.jsp
│ ├── threadDetail.jsp
│ └── createThread.jsp
└── pom.xml # Maven 依赖配置

text

## 📦 数据库设计

### 用户表 (user)
```sql
CREATE TABLE `user` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(50) UNIQUE NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100),
    `created_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
消息表 (message)
sql
CREATE TABLE `message` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(200),
    `content` TEXT NOT NULL,
    `author_id` INT NOT NULL,
    `author_name` VARCHAR(50) NOT NULL,
    `thread_id` INT,
    `create_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX `idx_thread_id` (`thread_id`),
    INDEX `idx_create_time` (`create_time`)
);
🚀 快速开始
环境要求
JDK 1.8+

MySQL 5.7+

Maven 3.6+

Tomcat 9.0+ (可选，Spring Boot内嵌Tomcat)

1. 克隆项目
bash
git clone https://github.com/Libertas712/OnlineQAPlatform.git
cd OnlineQAPlatform
2. 数据库配置
创建数据库:

sql
CREATE DATABASE secondhand CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
修改数据库连接配置 (src/main/resources/application.properties):

properties
spring.datasource.url=jdbc:mysql://localhost:3306/secondhand?useUnicode=true&characterEncoding=UTF-8
spring.datasource.username=your_username
spring.datasource.password=your_password
3. 运行项目
方式一：Spring Boot方式 (推荐)
bash
# 打包
mvn clean package

# 运行
java -jar target/OnlineQAPlatform-1.0-SNAPSHOT.jar
方式二：传统WAR包部署
bash
# 打包为WAR
mvn clean package

# 将 target/OnlineQAPlatform-1.0-SNAPSHOT.war 复制到 Tomcat 的 webapps 目录
4. 访问应用
打开浏览器访问: http://localhost:8080/login

默认测试账户:

用户名: admin

密码: 123456

🔧 配置说明
关键配置项
properties
# 服务器端口
server.port=8080

# JSP视图配置
spring.mvc.view.prefix=/WEB-INF/
spring.mvc.view.suffix=.jsp

# 数据库连接池
spring.datasource.hikari.maximum-pool-size=10
spring.datasource.hikari.minimum-idle=5

# JPA配置
spring.jpa.show-sql=true
spring.jpa.hibernate.ddl-auto=update
部署到远程服务器
修改数据库连接为远程服务器地址

打包为WAR文件: mvn clean package -Pprod

上传WAR文件到服务器Tomcat的webapps目录

重启Tomcat服务

📖 使用指南
用户注册
访问 /register 页面

填写用户名、密码、邮箱

输入验证码

点击注册，成功后自动跳转到登录页

创建讨论
登录后点击"新建讨论"

输入标题和内容

提交后自动跳转到讨论列表

参与讨论
在讨论列表中点击主题标题

查看详细内容和已有回复

在底部回复框中输入内容并提交
