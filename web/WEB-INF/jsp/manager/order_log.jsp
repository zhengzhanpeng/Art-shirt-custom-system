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
    <title></title>
    <link rel="stylesheet" type="text/css" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/query.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.edittable.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div style="margin: 15px">
    <blockquote class="layui-elem-quote">
        <h2 style="font-size: 20px" class="layui-inline">
            <i class="layui-icon" style="font-size: 30px">&#xe629;</i> 订单日志</h2>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>数据列表</legend>
        <div class="layui-field-box">
            <table class="layui-table" id="layui-table">
                <colgroup>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col width="170px">
                </colgroup>
            </table>
        </div>
    </fieldset>
</div>
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="js/layer.js"></script>
<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
<script type="text/javascript" charset="utf8" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="plugins/layui/layui.js"></script>
<script type="text/javascript" src="js/moment.js"></script>

<script type="text/javascript">
    var table = $('#layui-table').DataTable({
        "ajax": {
            "url": "manager/getLogs",
            "dataSrc": "data",//默认为data
            "data": {"type":0},
            "type": "post",
            "error": function () {
                alert("服务器未正常响应，请重试")
            },
        },
        "fnInitComplete": function (oSettings, json) {
            changeTable();
        },
        "columns": [
            {"data": "id", "title": "编号", "defaultContent": ""},
            {"data": "content", "title": "详情", "defaultContent": ""},
            {"data": "name", "title": "负责人", "defaultContent": ""},
            {"data": "phone", "title": "联系电话", "defaultContent": ""},
            {"data": null, "title": "操作日期", "defaultContent": "<div class='date'></div>"}
        ],
        "order": [[ 4, "desc" ]],
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
            var rowData = table.row($(this)).data().logTime;
            moment.locale('zh-cn');
            var str = moment(rowData).add(1900, "years").subtract(1, "d").format("llll");
            $(this).find(".date").text(str);
        });
    }
    setTimeout("changeInput()", 1000);
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
