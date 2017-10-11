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
    <title>图标管理</title>
    <link rel="stylesheet" type="text/css" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/query.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.edittable.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <style>
        .img-m{
            width: 130px;
            height: 90px;
        }
    </style>
</head>
<body>
<div style="margin: 15px">
    <blockquote class="layui-elem-quote">
        <h2 style="font-size: 20px" class="layui-inline">
            <i class="layui-icon" style="font-size: 30px">&#xe629;</i> 图标管理</h2>
    </blockquote>
    <button id="addRow" class="layui-btn">添加图标</button>
    <fieldset class="layui-elem-field">
        <legend>数据列表</legend>
        <div class="layui-field-box">
            <table class="layui-table" id="layui-table">
                <colgroup>
                    <col>
                    <col>
                    <col>
                    <col>
                    <col width="100">
                    <col width="200">
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

<script type="text/javascript">
    layui.code
    layer.config({
        offset: '100px'
    });
    var table = $('#layui-table').DataTable({
        "ajax": {
            "url": "admin/getIcons",
            "dataSrc": "data",//默认为data
            "type": "post",
            "error": function () {
                layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});
            }
        },
        "aLengthMenu" : [5, 10, 25], //更改显示记录数选项
        "columns": [
            {"data": "id", "title": "编号", "defaultContent": ""},
            {"data": null, "title": "图标", "defaultContent": "<img class='img-m'>"},
            {"data": "name", "title": "名称", "defaultContent": ""},
            {"data": "desc1", "title": "介绍", "defaultContent": ""},
            {"data": null, "title": "是否推荐", "defaultContent": "<span class='reco' style='color:#5FB878'>是</span>"},
            {"data": null, "title": "分类", "defaultContent": "<span class='types' style='color: #01AAED;'></span>"},
            {
                "data": null,
                "title": "操作",
                "defaultContent": "<button class='edit-btn layui-btn layui-btn-normal' type='button'>编辑</button><button class='layui-btn layui-btn-warm' type='button'>删除</button>"
            }
        ],
        "fnInitComplete": function (oSettings, json) {
            changeTable();
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
    $("#layui-table").DataTable().on("page", function () {
        setTimeout("changeTable()", 100);
    });
    function changeTable() {
        $("tbody tr").each(function () {
            var rowData = table.row($(this)).data();
            $(this).find("img").attr("src", rowData.imgAddress);
            if(rowData.reco == false) {
                $(this).find(".reco").text("否").css("color", "#FFB800");
            }
            var typesStr = '';
            var arr = rowData.types;
            for(var i = 0; i < arr.length; i++) {
                if(i != 0) {
                    typesStr += '、';
                }
                typesStr += arr[i].name;
            }
            $(this).find(".types").text(typesStr);
        })
    }
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
                var put = $("<select id='authority' style='height: 30px' name='modules' lay-verify='required' lay-search=''><option value='ROLE_USER'>ROLE_USER</option><option value='ROLE_ADMIN'>ROLE_ADMIN</option><option value='ROLE_SUPER_ADMIN'>ROLE_SUPER_ADMIN</option></select>");
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
        var tr = $(this).parent().parent("tr");
        var rowData = table.row(tr).data();
        layer.open({
            type: 2
            , title: ['编辑图标'] //不显示标题栏
            , area: ['500px', '450px']
            , shade: 0.8
            , maxmin: true
            , id: 'LAY_layuipro' //设定一个id，防止重复弹出
            , btn: ['保存', '取消']
            , moveType: 1 //拖拽模式，0或者1
            , offset: 't'
            , content: ['admin/addIconModel']
            //,content:'<div  style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><form class="layui-form" action=""><select name="modules" lay-verify="required" lay-search=""><option value="">直接选择或搜索选择</option><option value="1">layer</option><option value="2">form</option><option value="3">layim</option><option value="4">element</option><option value="5">laytpl</option><option value="6">upload</option><option value="7">laydate</option><option value="8">laypage</option><option value="9">flow</option><option value="10">util</option><option value="11">code</option><option value="12">tree</option><option value="13">layedit</option><option value="14">nav</option><option value="15">tab</option><option value="16">table</option><option value="17">select</option><option value="18">checkbox</option><option value="19">switch</option><option value="20">radio</option></select></form></div>'
            , success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
                layer.getChildFrame("#name").val(rowData.name);
                layer.getChildFrame("#desc").val(rowData.desc1);
                layer.getChildFrame("#address").val(rowData.imgAddress);
                if(rowData.reco) {
                    var xx = layer.getChildFrame("#reco").attr("checked", true);
                    xx.next().attr("class", "layui-unselect layui-form-switch layui-form-onswitch");
                }
                var arr = rowData.types;
                for(var i = 0; i < arr.length; i++) {
                    var tx = layer.getChildFrame("input[value='" + arr[i].id +  "']").attr("checked", true);
                    tx.next().attr("class", "layui-unselect layui-form-checkbox layui-form-checked");
                }
            }, yes: function (index, layero) {
                var name = layer.getChildFrame("#name").val();
                var desc = layer.getChildFrame("#desc").val();
                var imgAddress = layer.getChildFrame("#address").val();
                var reco = layer.getChildFrame("#reco").attr("checked") == 'checked' ? true: false;
                var $input = layer.getChildFrame("input[name='type']");
                var typeArr = new Array();
                $input.each(function () {
                    var $type = $(this);
                    if($type.attr("checked") == 'checked') {
                        typeArr.push($type.val());
                    }
                });
                $.ajax({
                    "url": "admin/saveIcon",
                    "data": {
                        "id": rowData.id, "name": name, "desc1": desc, "imgAddress": imgAddress
                        , "reco": reco, "typeArr": typeArr
                    },
                    'dataType': "json",
                    "type": "post",
                    "error": function () {
                        layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});
                    },
                    "success": function (data1) {
                        if (data1 == "1") {
                            layer.close(index);
                            layer.msg('保存成功', {icon: 6, time: 700});
                            location.replace(location);
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

    //删除单行
    $("#layui-table tbody").on("click", ".layui-btn-warm", function () {
        var nRow = $(this).parents('tr')[0];
        var rowData = table.row(nRow).data();
        var id = rowData.id;
        var name = rowData.name;
        layer.confirm("确定删除图标   " + name + "   吗?", {icon: 3, title: '确认删除操作', anim: 6}, function (index) {
            layer.close(index);
            $.ajax({
                "url": "admin/deleteIcon",
                "data": {"iconId": id},
                "type": "post",
                "error": function () {
                    layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});
                },
                "success": function (response) {
                    if (response == "1") {
                        layer.msg('删除成功', {icon: 6, time: 700});
                        table.row(nRow).remove().draw(false);
                        changeTable();
                    } else {
                        layer.msg(response, {icon: 5, anim: 0});
                    }
                }
            });
        })
    });

    //添加图标
    $('#addRow').on('click', function () {

        layer.open({
            type: 2
            , title: ['添加图标'] //不显示标题栏
            , area: ['500px', '450px']
            , shade: 0.8
            , maxmin: true
            , id: 'LAY_layuipro' //设定一个id，防止重复弹出
            , btn: ['确定', '取消']
            , moveType: 1 //拖拽模式，0或者1
            , offset: 't'
            , content: ['admin/addIconModel']
            //,content:'<div  style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><form class="layui-form" action=""><select name="modules" lay-verify="required" lay-search=""><option value="">直接选择或搜索选择</option><option value="1">layer</option><option value="2">form</option><option value="3">layim</option><option value="4">element</option><option value="5">laytpl</option><option value="6">upload</option><option value="7">laydate</option><option value="8">laypage</option><option value="9">flow</option><option value="10">util</option><option value="11">code</option><option value="12">tree</option><option value="13">layedit</option><option value="14">nav</option><option value="15">tab</option><option value="16">table</option><option value="17">select</option><option value="18">checkbox</option><option value="19">switch</option><option value="20">radio</option></select></form></div>'
            , success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
            }, yes: function (index, layero) {
                var name = layer.getChildFrame("#name").val();
                var desc = layer.getChildFrame("#desc").val();
                var imgAddress = layer.getChildFrame("#address").val();
                var reco = layer.getChildFrame("#reco").attr("checked") == 'checked' ? true: false;
                var $input = layer.getChildFrame("input[name='type']");
                var typeArr = new Array();
                $input.each(function () {
                    var $type = $(this);
                    if($type.attr("checked") == 'checked') {
                        typeArr.push($type.val());
                    }
                });
                $.ajax({
                    "url": "admin/addIcon",
                    "data": {
                        "name": name, "desc1": desc, "imgAddress": imgAddress
                        , "reco": reco, "typeArr": typeArr
                    },
                    'dataType': "json",
                    "type": "post",
                    "error": function () {
                        layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});
                    },
                    "success": function (data1) {
                        if (data1 == "1") {
                            layer.close(index);
                            layer.msg('添加成功', {icon: 6, time: 700});
                            location.replace(location);
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
