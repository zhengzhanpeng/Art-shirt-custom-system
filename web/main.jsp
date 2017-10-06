<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <base href=" <%=basePath%>">
    <base src=" <%=basePath%>">
    <title></title>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>

<body>
<div>
    <blockquote class="layui-elem-quote">
        <h2 style="font-size: 20px"><i class="layui-icon" style="font-size: 25px">&#xe609;</i>&nbsp;&nbsp;考拉超市库存管理系统</h2>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>操作介绍</legend>
        <div class="layui-field-box">
            <fieldset class="layui-elem-field layui-field-title">
                <legend><i class="layui-icon">&#xe600;</i> 添加商品</legend>
                <div class="layui-field-box">
                    <p>
                        点击进货录入中的添加商品按钮，即可在最上一行录入新的商品
                    </p>
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend><i class="layui-icon">&#xe600;</i> 销售订单录入</legend>
                <div class="layui-field-box">
                    <p>
                        点击订单录入按钮，添加相应订单。
                    </p>
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend><i class="layui-icon">&#xe600;</i> 添加用户</legend>
                <div class="layui-field-box">
                    <p>
                        此功能为超级管理员的权限，如有需要联系管理员
                    </p>
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend><i class="layui-icon">&#xe600;</i> 修改密码</legend>
                <div class="layui-field-box">
                    <p>
                        在最下方修改密码。
                    </p>
                </div>
            </fieldset>
        </div>
    </fieldset>

</div>
<script type="text/javascript" src="/js/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="/js/jquery.tabledit.min.js"></script>
<script type="text/javascript" src="/plugins/layui/layui.js"></script>
</body>

</html>