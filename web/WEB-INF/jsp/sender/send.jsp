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
            <i class="layui-icon" style="font-size: 30px">&#xe629;</i> 属性管理</h2>
    </blockquote>


    <button id="addRow" class="layui-btn">添加属性</button>
    <button id="batch-edit-btn" class="layui-btn">全部编辑</button>
    <button id="batch-save-btn" class="layui-btn">全部保存</button>
    <hr>
    <fieldset class="layui-elem-field">
        <legend>数据列表</legend>
        <div class="layui-field-box">
            <table class="layui-table" id="layui-table">
                <colgroup>
                    <col>
                    <col >
                    <col>
                </colgroup>
            </table>
        </div>
    </fieldset>
</div>
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="js/jquery-1.12.3.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" charset="utf8" src="js/bootstrap.min.js"></script>
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
        var table = $('#layui-table').DataTable({
            "ajax": {
                "url": "sender/getOrders",
                "dataSrc": "data",//默认为data
                "type": "post",
                "error":function(){layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});}
            },
            "columns": [
                { "data": "id", "title":"订单编号","defaultContent":""},
                { "data": "details", "title":"订单详情","defaultContent":""},
                { "data": "desc1", "title":"会员留言","defaultContent":""},
                { "data": "realityPrice", "title":"合计","defaultContent":""},
                { "data": "receiveName", "title":"姓名","defaultContent":""},
                { "data": "phone", "title":"联系电话","defaultContent":""},
                { "data": "pcd", "title":"收货地址","defaultContent":""},
                { "data": "address", "title":"详细地址","defaultContent":""},
                { "data": null, "title":"操作","defaultContent": "<button class='layui-btn layui-btn-warm' type='button'>确认发货</button>"}
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
    });

</script>

</body>
</html>