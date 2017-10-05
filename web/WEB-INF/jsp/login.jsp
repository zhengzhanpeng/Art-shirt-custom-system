<%--
  Created by IntelliJ IDEA.
  User: ho
  Date: 2017/10/5
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href=" <%=basePath%>">
    <base src=" <%=basePath%>">
    <title>艺扬服饰商城登录</title>
    <link rel="stylesheet" href="/plugins/login/css/style.css">
</head>
<body>

<div class="login-container">
    <h1>ShareLink</h1>

    <div class="connect">
        <p>Link the world. Share to world.</p>
    </div>

    <form action="j_spring_security_check" method="post" id="loginForm">
        <div>
            <input type="text" name="username" class="username" placeholder="用户名" autocomplete="off"/>
        </div>
        <div>
            <input type="password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <button id="submit" type="submit">登 陆</button>
    </form>

    <a href="/register">
        <button type="button" class="register-tis">还有没有账号？</button>
    </a>
    <h2 align="center">${msg}sdfsdf</h2>
</div>

</body>
<script src="/js/jquery-1.12.3.min.js"></script>
<script src="/plugins/login/js/common.js"></script>
<!--背景图片自动更换-->
<script src="/plugins/login/js/supersized.3.2.7.min.js"></script>
<script src="/plugins/login/js/supersized-init.js"></script>
<!--表单验证-->
<script src="/plugins/login/js/jquery.validate.min.js?var1.14.0"></script>
</html>
