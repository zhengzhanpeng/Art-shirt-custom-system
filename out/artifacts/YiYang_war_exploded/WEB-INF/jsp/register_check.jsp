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
        <p>您距离注册完成仅需最后一步啦，快去邮箱完成认证吧</p>
    </div>
    <a href="checkEmail">
        <button type="button" class="register-tis">没有收到邮件？</button>
    </a>
    <a href="login">
        <button type="button" class="register-tis">验证成功</button>
    </a>

</div>

</body>
<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/layer.js"></script>
<script src="plugins/login/js/common.js"></script>
<!--背景图片自动更换-->
<script src="plugins/login/js/supersized.3.2.7.min.js"></script>
<script src="plugins/login/js/supersized-init.js"></script>
<!--表单验证-->
<script src="plugins/login/js/jquery.validate.min.js?var1.14.0"></script>
<script>
    <%--var name = "${name}";--%>
    <%--var userName = "${userName}";--%>
    <%--var email = "${email}";--%>
    <%--function again() {--%>
        <%--$.ajax({--%>
            <%--url: "/againSend"--%>
            <%--,type: "post"--%>
            <%--,data: {"name": name, "userName": userName, "email": email}--%>
            <%--,success: function (data) {--%>
                <%--if (data == "1") {--%>
                    <%--layer.msg("发送成功，请查收", {icon: 6, time: 700});--%>
                    <%--return;--%>
                <%--}--%>
                <%--layer.msg(data, {icon: 5, anim: 0});--%>
            <%--}--%>
            <%--,error: function () {--%>
                <%--layer.msg("当前系统繁忙，请稍后再试！", {icon: 5, anim: 0});--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>
</script>
</html>
