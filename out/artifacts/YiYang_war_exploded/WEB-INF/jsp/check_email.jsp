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
    <title>邮箱验证</title>
    <link rel="stylesheet" href="plugins/login/css/style.css">
</head>
<body>

<div class="register-container">
    <h1>艺扬服饰商城</h1>

    <div class="connect">
        <p>在这里，订做属于你的个性服装.</p>
    </div>
    <form action="checkEmail" method="post" id="registerForm">
        <div>
            <input type="text" name="userName" class="username" placeholder="您的用户名" autocomplete="off"/>
        </div>
        <div>
            <input type="password" name="password" class="password" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <button id="submit" type="submit">开始验证</button>
    </form>
    <br>
    ${msg}

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
