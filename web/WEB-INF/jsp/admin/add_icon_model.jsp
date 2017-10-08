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
    <link rel="stylesheet" type="text/css" href="/plugins/layui/css/layui.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <style>
        .input-length-m {
            width: 340px;
        }
    </style>
</head>
<body>
<div>
    <br>
    <form class="add-user layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">图标名称</label>
            <div class="layui-input-inline">
                <input type="text" name="name" required lay-verify="required" placeholder="请输入图标名称" autocomplete="off"
                       class="layui-input input-length-m">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">简介</label>
            <div class="layui-input-inline">
                <input type="text" name="desc" required lay-verify="required" placeholder="请输入图标名称" autocomplete="off"
                       class="layui-input input-length-m">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图标地址</label>
            <div class="layui-input-inline">
                <input type="text" id="address" name="address" required lay-verify="required" placeholder="上传图标后自动获取"
                       disabled autocomplete="off" class="layui-input input-length-m">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图标上传</label>
            <div class="layui-input-block">
                <input type="file" name="file" class="layui-upload-file">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">是否推荐</label>
            <div class="layui-input-block">
                <input type="checkbox" name="reco" lay-skin="switch">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">类型</label>
            <div class="layui-input-block">
                <c:forEach items="${list}" var="pro">
                    <input type="checkbox" name="type" title="${pro.value}" value="${pro.id}">
                </c:forEach>
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript" src="/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/plugins/layui/layui.js"></script>
<script>
    //Demo
    layui.use(['form', 'upload'], function () {
        var form = layui.form;
        var upload = layui.upload;
        //执行实例
        layui.upload({
            url: 'admin/uploadIcon'
            , before: function (input) {
                layer.msg("图标上传中。", {icon: 6, anim: 0});
            }
            , success: function (res) {
                $("#address").val(res.address);
                layer.msg("上传成功", {icon: 6, anim: 0});
            }
        });
    });
</script>
</html>
