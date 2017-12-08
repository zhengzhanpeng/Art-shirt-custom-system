<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ho
  Date: 2017/8/11
  Time: 16:31
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
    <link rel="stylesheet" type="text/css" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/query.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.edittable.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
<div style="padding: 20px; line-height: 15px; background-color: #393D49; color: #fff; font-weight: 300;">
    <form class="add-user" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input id="name" type="text" name="title" value="" class="layui-input"
                placeholder="请输入姓名">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <input id="userName" type="text" name="title" value="" class="layui-input"
                placeholder="请输入用户名">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input id="password" type="text" name="title" value="123456" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">所属权限</label>
            <div class="layui-input-block">
                <select id="authority" name="modules" lay-verify="required" lay-search="">
                    <option value="ROLE_USER">ROLE_USER</option>
                    <option value="ROLE_ADMIN">ROLE_ADMIN</option>
                    <option value="ROLE_MAKER">ROLE_MAKER</option>
                    <option value="ROLE_SENDER">ROLE_SENDER</option>
                    <option value="ROLE_SUPER_ADMIN">ROLE_SUPER_ADMIN</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-block">
                <input id="phone" type="text" name="phone" value="" class="layui-input"
                placeholder="请输入联系方式">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电子邮箱</label>
            <div class="layui-input-block">
                <input id="email" type="text" name="email" value="" class="layui-input"
                       placeholder="请输入电子邮箱地址">
            </div>
        </div>
    </form>
</div>
</body>
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" charset="utf8" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
</html>
