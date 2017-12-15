<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ho
  Date: 2017/8/11
  Time: 11:04
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
    <title>用户信息</title>
    <link rel="stylesheet" type="text/css" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/query.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.edittable.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div style="margin: 15px">
    <blockquote class="layui-elem-quote">
        <h2 style="font-size: 20px" class="layui-inline">
            <i class="layui-icon" style="font-size: 30px">&#xe629;</i> 用户信息</h2>
    </blockquote>
    <button id="addRow" class="layui-btn">添加用户</button>
    <button class="layui-btn layui-btn-normal">添加图标</button>
    <button class="layui-btn layui-btn-normal">移除图标</button>
    <fieldset class="layui-elem-field">
        <legend>数据列表</legend>
        <div class="layui-field-box">
            <table class="layui-table" id="layui-table">
            </table>
        </div>
    </fieldset>
</div>
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="js/jquery-1.12.3.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" charset="utf8" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>

<script type="text/javascript">
    var table = $('#layui-table').DataTable({
        "ajax": {
            "url": "superAdmin/getUsers",
            "dataSrc": "data",//默认为data
            "type": "post",
            "error": function () {
                layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});
            }
        },
        "columns": [
            {"data": "name", "title": "姓名", "defaultContent": ""},
            {"data": "userName", "title": "用户名", "defaultContent": ""},
            {"data": "authority", "title": "权限", "defaultContent": ""},
            {"data": "phone", "title": "联系电话", "defaultContent": ""},
            {
                "data": null,
                "title": "操作",
                "defaultContent": "<button class='edit-btn layui-btn layui-btn-normal' type='button'>编辑</button><button class='resave-btn layui-btn layui-btn-normal' type='button'>重置密码</button>  <button class='layui-btn layui-btn-warm' type='button'>删除</button>"
            }
        ],
        "language": {
            "sProcessing": "处理中...",
            "sLengthMenu": "显示 _MENU_ 项结果",
            "sZeroRecords": "没有匹配结果",
            "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
            "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix": "",
            "sSearch": "搜索:",
            "sUrl": "",
            "sEmptyTable": "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上页",
                "sNext": "下页",
                "sLast": "末页"
            },
            "oAria": {
                "sSortAscending": ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        }


    });
    function editTds(tds, thisBtn) {
        <%--var str = "<select id='department' style='height: 30px' name='modules' lay-verify='required' lay-search=''>" +--%>
                <%--<c:forEach items="${list}" var="deprtment">--%>
                <%--"<option value='${deprtment.department}'>${deprtment.department}</option>" +--%>
                <%--</c:forEach>--%>
                <%--"</select>"--%>
        $.each(tds, function (i, val) {
            var jqob = $(val);
            if (i < 0 || jqob.has('button').length) {
                return true;
            }//跳过第1项 序号,按钮
//            if (i == 1) {
//                var txt = jqob.text();
//                var put = $(str);
//                jqob.html(put);
//                put.val(txt);
//                return true;
//            }
            if (i == 2) {
                var txt = jqob.text();
                var put = $("<select id='authority' style='height: 30px' name='modules' lay-verify='required' lay-search=''><option value='ROLE_USER'>ROLE_USER</option><option value='ROLE_ADMIN'>ROLE_ADMIN</option><option value='ROLE_MAKER'>ROLE_MAKER</option><option value='ROLE_SENDER'>ROLE_SENDER</option><option value='ROLE_SUPER_ADMIN'>ROLE_SUPER_ADMIN</option></select>");
                jqob.html(put);
                put.val(txt);
                return true;
            }
            var txt = jqob.text();
            var put = $("<input type='text'>");
            put.val(txt);
            jqob.html(put);
        });
        thisBtn.html("保存");
        thisBtn.toggleClass("edit-btn layui-btn layui-btn-normal");
        thisBtn.toggleClass("save-btn layui-btn ");
        $('#layui-table tbody input').addClass("form-control");
    }
    //编辑按钮
    $("#layui-table tbody").on("click", ".edit-btn", function () {
        var tds = $(this).parents("tr").children();
        editTds(tds, $(this));
    });

    //保存
    $("#layui-table tbody").on("click", ".save-btn", function () {
        var row = table.row($(this).parents("tr"));
        var thisObj = $(this);
        var tds = $(this).parents("tr").children();
        $.each(tds, function (i, val) {
            var jqob = $(val);
            //把input变为字符串
            if (!jqob.has('button').length) {
                var txt;
                if (i == 2) {
                    txt = jqob.children("select").val();
                } else {
                    txt = jqob.children("input").val();
                }
                table.cell(jqob).data(txt);//修改DataTables对象的数据
            }
        });
        var data = row.data();
        thisObj.html("编辑");
        thisObj.toggleClass("edit-btn layui-btn layui-btn-normal");
        thisObj.toggleClass("save-btn layui-btn ");
        $.ajax({
            "url": "superAdmin/setUser",
            "data": data,
            "type": "post",
            "error": function () {
                editTds(tds, thisObj);
                layer.msg("您的输入有误，请认真核对", {icon: 5, anim: 0});
            },
            "success": function (data1) {
                var arr = new Array();
                arr = data1.split("-");
                response = arr[0];
                var savedId = arr[1];
                if (response == "1") {
                    layer.msg('保存成功', {icon: 6, time: 700});
                }
                else {
                    editTds(tds, thisObj);
                    layer.msg(response, {icon: 5, anim: 0});
                }
            }
        });
    });
    //删除单行
    $("#layui-table tbody").on("click", ".layui-btn-warm", function () {
        var nRow = $(this).parents('tr')[0];
        var rowData = table.row(nRow).data();
        var itemName = rowData.userName;
        var name = rowData.name;
        layer.confirm("确定删除用户   " + name + "   吗?", {icon: 3, title: '确认删除操作', anim: 6}, function (index) {
            layer.close(index);
            $.ajax({
                "url": "superAdmin/deleteUser",
                "data": {"userName": itemName},
                "type": "post",
                "error": function () {
                    layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});
                },
                "success": function (response) {
                    if (response == "1") {
                        layer.msg('删除成功', {icon: 6, time: 700});
                        table.row(nRow).remove().draw(false);
                    } else {
                        layer.msg(response, {icon: 5, anim: 0});
                    }
                }
            });
        })
    });

    //修改密码
    $("#layui-table tbody").on("click", ".resave-btn", function () {
        var nRow = $(this).parents('tr')[0];
        var rowData = table.row(nRow).data();
        var itemName = rowData.userName;
        layer.open({
            type: 1
            ,
            offset: "t",
            title: ['重置密码', 'padding:none !important ;text-align:center'] //不显示标题栏
            ,
            closeBtn: false
            ,
            area: '500px;'
            ,
            shade: 0.8
            ,
            id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,
            btn: ['确定', '取消']
            ,
            moveType: 1 //拖拽模式，0或者1
            ,
            content: '<div  style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><form  class="add-user" action=""><div class="layui-form-item"><label class="layui-form-label">新密码</label><div class="layui-input-block"><input type="text" id="newPassword" name="title" value="123456"  class="layui-input"></div></div></form></div>'
            ,
            success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
            },
            yes: function (index, layero) {
                var newPassword = $("#newPassword").val();
                $.ajax({
                    "url": "superAdmin/setUserPassword",
                    "data": {"userName": itemName, "password": newPassword},
                    "type": "post",
                    "error": function () {
                        layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});
                    },
                    "success": function (response) {
                        if (response == "1") {
                            layer.msg('修改成功', {icon: 6, time: 700});
                            layer.close(index);
                        } else {
                            layer.msg(response, {icon: 5, anim: 0});
                        }

                    }
                });
            }
            ,
            btn2: function (index, layero) {
            }

        });
    });


    //添加用户
    $('#addRow').on('click', function () {

        layer.open({
            type: 2
            , title: ['添加用户', 'padding:none !important ;text-align:center'] //不显示标题栏
            , closeBtn: false
            , area: ['500px', '450px']
            , shade: 0.8
            , offset: "t"
            , id: 'LAY_layuipro' //设定一个id，防止重复弹出
            , btn: ['确定', '取消']
            , moveType: 1 //拖拽模式，0或者1
            , content: ['superAdmin/addUserModel', 'no']
            //,content:'<div  style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><form class="layui-form" action=""><select name="modules" lay-verify="required" lay-search=""><option value="">直接选择或搜索选择</option><option value="1">layer</option><option value="2">form</option><option value="3">layim</option><option value="4">element</option><option value="5">laytpl</option><option value="6">upload</option><option value="7">laydate</option><option value="8">laypage</option><option value="9">flow</option><option value="10">util</option><option value="11">code</option><option value="12">tree</option><option value="13">layedit</option><option value="14">nav</option><option value="15">tab</option><option value="16">table</option><option value="17">select</option><option value="18">checkbox</option><option value="19">switch</option><option value="20">radio</option></select></form></div>'
            , success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
            }, yes: function (index, layero) {
                var userName = layer.getChildFrame("#userName").val();
                var authority = layer.getChildFrame("#authority").val();
                var password = layer.getChildFrame("#password").val();
                var phone = layer.getChildFrame("#phone").val();
                var name = layer.getChildFrame("#name").val();
                var email = layer.getChildFrame("#email").val();
                $.ajax({
                    "url": "superAdmin/addUser",
                    "data": {
                        "userName": userName, "name": name, "password": password
                        , "phone": phone, "authority": authority, "email": email
                    },
                    "type": "post",
                    "error": function () {
                        layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});
                    },
                    "success": function (data1) {
                        if (data1 == "1") {
                            layer.close(index);
                            layer.msg('添加成功', {icon: 6, time: 700});
                            var temp = table.row.add({
                                "name": name,
                                "userName": userName,
                                "authority": authority,
                                "phone": phone
                            });
                            temp.draw();
                        } else {
                            layer.msg(data1, {icon: 5, anim: 0});
                        }

                    }
                });

            }
            , btn2: function (index, layero) {
            }
        });
    });
</script>


</body>
</html>
