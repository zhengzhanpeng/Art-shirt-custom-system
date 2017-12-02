<%--
  Created by IntelliJ IDEA.
  User: ho
  Date: 2017/10/5
  Time: 10:34
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
    <title>注册</title>
    <link rel="stylesheet" href="plugins/login/css/style.css">
</head>
<body>

<div class="register-container">
    <h1>ShareLink</h1>

    <div class="connect">
        <p>${msg}</p>
    </div>
    <a href="login">
        <button type="button" class="register-tis">登录</button>
    </a>
</div>

</body>
<script src="js/jquery-1.12.3.min.js"></script>
<script src="plugins/login/js/common.js"></script>
<!--背景图片自动更换-->
<script src="plugins/login/js/supersized.3.2.7.min.js"></script>
<script src="plugins/login/js/supersized-init.js"></script>
<!--表单验证-->
<script src="plugins/login/js/jquery.validate.min.js?var1.14.0"></script>
</html>
