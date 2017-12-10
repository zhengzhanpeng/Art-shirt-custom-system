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
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <style>
        #name{
            width: 290px;
            height: 40px;
        }
    </style>
</head>
<body>
<div style="padding: 20px; line-height: 15px; background-color: #393D49; color: #fff; font-weight: 300;">
    <form class="add-express-message" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">快递名称</label>
            <div class="layui-input-block">
                <select id="name" name="modules" lay-verify="required" lay-search="">
                    <option value="顺丰快递">顺丰快递</option>
                    <option value="韵达快递">韵达快递</option>
                    <option value="圆通快递">圆通快递</option>
                    <option value="中通快递">中通快递</option>
                    <option value="天天快递">天天快递</option>
                    <option value="汇通快递">汇通快递</option>
                    <option value="申通快递">申通快递</option>
                    <option value="EMS快递">EMS快递</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">快递编号</label>
            <div class="layui-input-block">
                <input id="number" type="text" name="title" value="" class="layui-input"
                       placeholder="请输入快递编号">
            </div>
        </div>
    </form>
</div>
</body>
<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="js/jquery-1.12.3.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" src="plugins/layui/layui.js"></script>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</html>
