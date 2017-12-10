<%--
  Created by IntelliJ IDEA.
  User: ho
  Date: 2017/10/8
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href=" <%=basePath%>">
    <base src=" <%=basePath%>">
    <title>信息</title>
    <link rel="stylesheet" type="text/css" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/query.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.edittable.css">
    <link  rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div style="margin: 15px">
    <blockquote class="layui-elem-quote">
        <h2 style="font-size: 20px" class="layui-inline">
            <i class="layui-icon" style="font-size: 30px">&#xe629;</i> 发送邮件</h2>
    </blockquote>


    <%--<button id="addRow" class="layui-btn">添加属性</button>--%>
    <%--<button id="batch-edit-btn" class="layui-btn">全部编辑</button>--%>
    <%--<button id="batch-save-btn" class="layui-btn">全部保存</button>--%>
    <hr>
    <div class="layui-form-item">
        <label class="layui-form-label">邮件标题</label>
        <div class="layui-input-block">
            <input type="text" id="object" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">邮件内容</label>
        <div class="layui-input-block">
            <textarea name="desc" id="email" placeholder="请输入内容" style="width: 875px; height: 305px;" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" id="submit" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" id="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
</div>
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="js/jquery-1.12.3.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" src="plugins/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['laydate', 'jquery', 'form'], function() {
        var $ = layui.jquery;
        $("#date").click(function() {
            layui.laydate({
                elem: this
            });
        });
    });
</script>

<script type="text/javascript">
    $(function(){
        $("#reset").click(function () {
            $("#email").val("");
        })
        $("#submit").click(function () {
            var index = layer.load(1);
            var content = $("#email").val();
            var object = $("#object").val();
            $.ajax({
                url: "admin/sendEmail"
                ,type: "post"
                ,data: {"content": content, "object": object}
                ,success: function (data) {
                    if (data == "1") {
                        layer.close(index);
                        layer.msg("发送成功", {icon: 6, time: 700});
                        setTimeout("location.reload(true)", 200);
                        return;
                    }
                    layer.msg(data, {icon: 5, anim: 0});
                }
                ,error: function () {
                    layer.msg("当前系统繁忙，请稍后再试！", {icon: 5, anim: 0});
                }
            });
        })
    });

</script>

</body>
</html>