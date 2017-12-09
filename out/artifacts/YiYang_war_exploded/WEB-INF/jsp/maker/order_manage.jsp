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
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div style="margin: 15px">
    <blockquote class="layui-elem-quote">
        <h2 style="font-size: 20px" class="layui-inline">
            <i class="layui-icon" style="font-size: 30px">&#xe629;</i> 订单管理 (制作完成后记得确认嗷)</h2>

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
                    <col>
                    <col>
                    <col>
                    <col width="230px">
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
    layui.use(['laydate', 'jquery', 'form'], function () {
        var $ = layui.jquery;
        $("#date").click(function () {
            layui.laydate({
                elem: this
            });
        });
    });
</script>

<script type="text/javascript">
    $(function () {
        var table = $('#layui-table').DataTable({
            "ajax": {
                "url": "maker/getOrders",
                "dataSrc": "data",//默认为data
                "type": "post",
                "error": function () {
                    layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});
                }
            },
            "columns": [
                {"data": "id", "title": "订单编号", "defaultContent": ""},
                {"data": "details", "title": "订单详情", "defaultContent": ""},
                {"data": "desc1", "title": "会员留言", "defaultContent": ""},
                {"data": "realityPrice", "title": "合计", "defaultContent": ""},
                {"data": "receiveName", "title": "收货人", "defaultContent": ""},
                {"data": "phone", "title": "联系电话", "defaultContent": ""},
                {"data": "stateStr", "title": "状态", "defaultContent": ""},
                {
                    "data": null,
                    "title": "操作",
                    "defaultContent": "<button class='download-btn layui-btn layui-btn-normal' type='button'>下载图片</button>  <button class='set-price layui-btn layui-btn-warm' type='button'>修改价格</button>"
                }
            ],
            "fnInitComplete": function (oSettings, json) {
                $("tbody tr").dblclick(function () {
                    var data = table.row($(this)).data();
                    var rowD = $(this)[0]
                    layer.confirm(data.receiveName + '的订单已经做好了吗?', {icon: 6, anim: 6, title:'订单确认'}, function(index){
                        $.ajax({
                            url: "maker/finish"
                            ,type: "post"
                            ,data: {"id": data.id}
                            ,success: function (data) {
                                if (data == "1") {
                                    layer.msg("已提交", {icon: 6, time: 700});
                                    layer.close(index);
                                    table.row(rowD).remove().draw(false);
                                    return;
                                }
                                layer.msg(data, {icon: 5, anim: 0});
                            }
                            ,error: function () {
                                layer.msg("当前系统繁忙，请稍后再试！", {icon: 5, anim: 0});
                            }
                        });

                        layer.close(index);
                    });
                })
            },
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

        //修改价格按钮
        $("#layui-table tbody").on("click", ".set-price", function () {
            var tds = $(this).parents("tr").children();
            editTds(tds, $(this));
        });

        //保存
        $("#layui-table tbody").on("click", ".save-btn", function () {
            var row = table.row($(this).parents("tr"));
            var data = row.data();
            var thisObj = $(this);
            var tds = $(this).parents("tr").children();

            layer.prompt({
                formType: 2,
                title: '  您将要修改' + data.receiveName + "的订单价格，请简要叙述您的原因",
                area: ['400px', '80px']
            }, function(value, index, elem){
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

                thisObj.html("修改价格");
                thisObj.attr("class", "set-price layui-btn layui-btn-warm");

                $.ajax({
                    "url": "maker/setPrice",
                    "data": {"id": data.id, "price": data.realityPrice, "reason": value},
                    "type": "post",
                    "error": function () {
                        editTds(tds, thisObj);
                        layer.msg("您的输入有误，请认真核对", {icon: 5, anim: 0});
                    },
                    "success": function (data1) {

                        if (data1 == "1") {
                            layer.msg('保存成功', {icon: 6, time: 700});
                            return;
                        }
                        else {
                            editTds(tds, thisObj);
                            layer.msg(data1, {icon: 5, anim: 0});
                        }
                    }
                });
                layer.close(index);
            });

        });

        $("#layui-table tbody").on("click", ".download-btn", function () {
            var row = table.row($(this).parents("tr"));
            var data = row.data();
            var items = data.itemDTOs;
            var item;
            var fileName;
            for (var i = 0; i < items.length; i++) {
                item = items[i];
                fileName = data.receiveName + " " + item.name + "正面 " + item.size + " " + item.number + ".png";
                window.open("maker/downByPath?paths=" + item.imgAddress + "&fileName=" + fileName);
                fileName = data.receiveName + " " + item.name + "反面 " + item.size + " " + item.number + ".png";
                window.open("maker/downByPath?paths=" + item.backImgAddress + "&fileName=" + fileName);
            }
//            alert(items[0].name);
        })
    });
    function editTds(tds, thisBtn) {
        $.each(tds, function (i, val) {
            var jqob = $(val);

            if (i == 3) {
                var txt = jqob.text();
                var put = $("<input type='text'>");
                put.val(txt);
                jqob.html(put);
            }

        });
        thisBtn.html("保存");
        thisBtn.attr("class", "save-btn layui-btn layui-btn-success");
        $('#layui-table tbody input').addClass("form-control");
    }


</script>

</body>
</html>