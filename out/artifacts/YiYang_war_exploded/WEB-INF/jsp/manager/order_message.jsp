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
            <i class="layui-icon" style="font-size: 30px">&#xe629;</i> 发货管理</h2>
    </blockquote>



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
<script type="text/javascript" src="plugins/buy/js/address_all.js"></script>
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
                "url": "manager/getOrderMessage",
                "dataSrc": "data",//默认为data
                "type": "post",
                "error":function(){layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});}
            },
            "fnInitComplete": function (oSettings, json) {
                changeTable();
            },
            "columns": [
                { "data": "id", "title":"订单编号","defaultContent":""},
                { "data": "details", "title":"订单详情","defaultContent":""},
                { "data": "desc1", "title":"会员留言","defaultContent":""},
                { "data": "realityPrice", "title":"合计","defaultContent":""},
                { "data": "receiveName", "title":"姓名","defaultContent":""},
                { "data": "phone", "title":"联系电话","defaultContent":""},
                { "data": null, "title":"收货地址","defaultContent":"<div class='date'></div>"},
                { "data": "address", "title":"详细地址","defaultContent":""},
                { "data": "sendTypeStr", "title":"送货方式","defaultContent":""},
//                { "data": null, "title":"操作","defaultContent": "<button class='layui-btn layui-btn-warm' type='button'>确认发货</button>"}
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

        $("#layui-table").DataTable().on("page", function () {
            setTimeout("changeTable()", 100);
        });
        function changeTable() {
            $("tbody tr").each(function () {
                var data = table.row($(this)).data();
                var str = "";
                var obj = {"province": data.province, "city": data.city, "district": data.district};
                var msg = getMessage(obj);
                str += msg.province + " " + msg.city + " " + msg.district;
                $(this).find(".date").text(str);
            });
        }
        setTimeout("changeInput()", 1000);
    });

    function changeInput() {
        $("input").change(function () {
            changeTable();
        });
        $("select").change(function () {
            changeTable();
        });
    }

</script>

</body>
</html>