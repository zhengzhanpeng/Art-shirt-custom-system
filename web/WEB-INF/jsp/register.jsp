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
    <h1>艺扬服饰商城</h1>

    <div class="connect">
        <p>在这里，订做属于你的个性服装.</p>
    </div>
    <h1 id="msg" hidden>${msg}</h1>
    <form action="registerSubmit" method="post" id="registerForm">
        <div>
            <input type="text" id="name" name="name" class="name" placeholder="请输入您的昵称" autocomplete="off" oncontextmenu="return false" onpaste="return false"/>
        </div>
        <div>
            <input type="text" id="username" name="userName" class="username" placeholder="请输入您的用户名" autocomplete="off" oncontextmenu="return false" onpaste="return false"/>
        </div>
        <div>
            <input type="password" id="password" name="password" class="password" placeholder="输入密码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="password" id="password2" name="confirm_password" class="confirm_password" placeholder="再次输入密码" oncontextmenu="return false" onpaste="return false" />
        </div>
        <div>
            <input type="email" id="email" name="email" class="email" placeholder="输入邮箱地址" oncontextmenu="return false" onpaste="return false" />
        </div>
        <button id="submit" type="submit">注 册</button>
    </form>
    <a href="login">
        <button type="button" class="register-tis">已经有账号？</button>
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
<script src="js/layer.js"></script>
<script>
    $("#name").focus(function(){
        layer.tips('建议使用中文嗷', '#name');
    });
    $("#username").focus(function(){
        layer.tips('请输入6至20位英文字符作为您的登录用户名', '#username');
    });
    $("#password").focus(function(){
        layer.tips('6-20位英文（区分大小写）、数字、字符的组合', '#password');
    });
    $("#password2").focus(function(){
        layer.tips('6-20位英文（区分大小写）、数字、字符的组合', '#password2');
    });
    $("#email").focus(function(){
        layer.tips('请输入正确格式的邮箱地址', '#email');
    });
    $(function () {
        var msg = $("#msg").text();
        if(msg != '') {
            layer.msg(msg, {anim: 6, offset: "10px"});
        }
    })
</script>
</html>
