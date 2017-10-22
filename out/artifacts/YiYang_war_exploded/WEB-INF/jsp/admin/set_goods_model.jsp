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
        .switch-m{
            display: inline-block;
        }
    </style>
</head>
<body>
<div>
    <br>
    <form class="add-user layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">衣服名称</label>
            <div class="layui-input-inline">
                <input type="text" id="name" name="name" required lay-verify="required" placeholder="请输入衣服名称" autocomplete="off"
                       class="layui-input input-length-m">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">衣服类型</label>
            <div class="layui-input-inline">
                <input type="text" id="type" name="type" required lay-verify="required" placeholder="请输入衣服类型" autocomplete="off"
                       class="layui-input input-length-m">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">原价</label>
            <div class="layui-input-inline">
                <input type="text" id="price" name="price" required lay-verify="required" placeholder="请输入衣服原价" autocomplete="off"
                       class="layui-input input-length-m">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">现价</label>
            <div class="layui-input-inline">
                <input type="text" id="realityPrice" name="realityPrice" required lay-verify="required" placeholder="请输入衣服现价" autocomplete="off"
                       class="layui-input input-length-m">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">简介</label>
            <div class="layui-input-inline">
                <input type="text" id="desc" name="desc" required lay-verify="required" placeholder="请输入衣服简介" autocomplete="off"
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
            <div class="layui-inline">
                <label class="layui-form-label">添加数量</label>
                <div class="layui-input-inline" style="width: 50px;">
                    <input type="text" name="num" placeholder="XS" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline" style="width: 50px;">
                    <input type="text" name="num" placeholder="S" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline" style="width: 50px;">
                    <input type="text" name="num" placeholder="M" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline" style="width: 50px;">
                    <input type="text" name="num" placeholder="L" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline" style="width: 50px;">
                    <input type="text" name="num" placeholder="XL" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-input-inline" style="width: 50px;">
                    <input type="text" name="num" placeholder="XXL" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item switch-m">
            <label class="layui-form-label">是否推荐</label>
            <div class="layui-input-block">
                <input type="checkbox" id="reco" name="reco" lay-skin="switch" lay-text="开启|关闭">
            </div>
        </div>
        <div class="layui-form-item switch-m">
            <label class="layui-form-label">是否成品</label>
            <div class="layui-input-block">
                <input type="checkbox" id="finished" name="finished" lay-skin="switch" lay-text="开启|关闭">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">图标上传</label>
            <div class="layui-input-block">
                <input type="file" name="file" class="layui-upload-file">
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
            url: 'admin/uploadGoods'
            , before: function (input) {
                layer.msg("图片上传中。", {icon: 6, anim: 0});
            }
            , success: function (res) {
                $("#address").val(res.address);
                layer.msg("上传成功", {icon: 6, anim: 0});
            }
        });
        $(".layui-unselect").click(function () {
            var $reco = $(this).prev();
            var result = $reco.attr("checked") == 'checked' ? true : false;
            if(result) {
                $reco.attr("checked", false);
            } else {
                $reco.attr("checked", true);
            }
        });
    });
</script>
</html>
