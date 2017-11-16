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
    <title>商品管理</title>
    <link rel="stylesheet" type="text/css" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/query.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.edittable.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <style>
        .img-m{
            width: 65px;
            height: 65px;
        }
    </style>
</head>
<body>
<div style="margin: 15px">
    <blockquote class="layui-elem-quote">
        <h2 style="font-size: 20px" class="layui-inline">
            <i class="layui-icon" style="font-size: 30px">&#xe629;</i> 商品管理</h2>
    </blockquote>
    <button id="addRow" class="layui-btn">添加衣服</button>
    <fieldset class="layui-elem-field">
        <legend>数据列表</legend>
        <div class="layui-field-box">
            <table class="layui-table" id="layui-table">
                <colgroup>
                    <col>
                    <col width="150">
                    <col width="80">
                    <col width="15">
                    <col width="15">
                    <col width="15">
                    <col width="15">
                    <col>
                    <col>
                </colgroup>
            </table>
        </div>
    </fieldset>
</div>
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.15/css/jquery.dataTables.css">

<!-- jQuery -->
<script type="text/javascript" charset="utf8" src="/js/jquery-1.12.3.min.js"></script>

<!-- DataTables -->
<script type="text/javascript" charset="utf8" src="http://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="/js/layer.js"></script>
<link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css">
<script type="text/javascript" charset="utf8" src="/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/plugins/layui/layui.js"></script>

<script type="text/javascript">
    layer.config({
        offset: '100px',
    });
    var table = $('#layui-table').DataTable({
        "ajax": {
            "url": "admin/getGoods",
            "dataSrc": "data",//默认为data
            "type": "post",
            "error": function () {
                layer.msg("服务器繁忙，请稍后再试", {icon: 5, anim: 0});
            }
        },
//        "aLengthMenu" : [5, 10, 25], //更改显示记录数选项
        "columns": [
//            {"data": null, "title": "状态", "defaultContent": "<input type='checkbox' class='checkbix' data-text=''>"},
//            {"data": "id", "title": "编号", "defaultContent": ""},
            {"data": null, "title": "服装", "defaultContent": "<img class='img-m'>"},
            {"data": "name", "title": "名称", "defaultContent": ""},
            {"data": "type", "title": "类型", "defaultContent": ""},
            {"data": "price", "title": "原价", "defaultContent": ""},
            {"data": "realityPrice", "title": "现价", "defaultContent": ""},
//            {"data": "desc1", "title": "介绍", "defaultContent": ""},
            {"data": "recoStr", "title": "是否推荐", "defaultContent": ""},
            {"data": "finishedStr", "title": "是否成品", "defaultContent": ""},
            {"data": "state", "title": "供应状态", "defaultContent": ""},
            {
                "data": null,
                "title": "操作",
                "defaultContent": "<button class='message-btn layui-btn layui-btn-normal' type='button'>查看详情</button><button class='edit-btn layui-btn layui-btn-normal' type='button'>编辑</button><button class='layui-btn layui-btn-warm' type='button'>删除</button>"
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
    setTimeout("changeInput()", 1000);
    function changeInput() {
        $("input").change(function () {
            changeTable();
        });
        $("select").change(function () {
            changeTable();
        });
    }
    function changeTable() {
        $("tbody tr").each(function () {
            var rowData = table.row($(this)).data();
            $(this).find("img").attr("src", rowData.imgAddress);
            $(this).find("td").eq(0).click(function () {
                layer.open({
                    type: 1,
                    area: ['460px', '220px'],
                    shade: false,
                    title: false, //不显示标题
                    content: "<img style='display: inline-block; width: 220px; height: 220px;' src='" + rowData.imgAddress + "' alt='正面'>&nbsp;&nbsp;&nbsp;&nbsp; <img style='display: inline-block; width: 220px; height: 220px;' src='" + rowData.backImgAddress + "' alt='背面'>",
                    cancel: function(){

                    }
                });
            })
            if(rowData.reco == false) {
                $(this).children().eq(5).css("color", "#FFB800");
            } else {
                $(this).children().eq(5).css("color", "#5FB878");
            }
            if(rowData.finished == false) {
                $(this).children().eq(6).css("color", "#FFB800");
            } else {
                $(this).children().eq(6).css("color", "#5FB878");
            }
            if(rowData.state == '缺货') {
                $(this).children().eq(7).css("color", "#FF5722");
            } else {
                $(this).children().eq(7).css("color", "#01AAED");
            }
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
            , content: ['admin/addGoodsModel']
            //,content:'<div  style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><form class="layui-form" action=""><select name="modules" lay-verify="required" lay-search=""><option value="">直接选择或搜索选择</option><option value="1">layer</option><option value="2">form</option><option value="3">layim</option><option value="4">element</option><option value="5">laytpl</option><option value="6">upload</option><option value="7">laydate</option><option value="8">laypage</option><option value="9">flow</option><option value="10">util</option><option value="11">code</option><option value="12">tree</option><option value="13">layedit</option><option value="14">nav</option><option value="15">tab</option><option value="16">table</option><option value="17">select</option><option value="18">checkbox</option><option value="19">switch</option><option value="20">radio</option></select></form></div>'
            , success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
                layer.getChildFrame("#name").val(rowData.name);
                layer.getChildFrame("#type").val(rowData.type);
                layer.getChildFrame("#price").val(rowData.price);
                layer.getChildFrame("#realityPrice").val(rowData.realityPrice);
                layer.getChildFrame("#desc").val(rowData.desc1);
                layer.getChildFrame("#address").val(rowData.imgAddress);
                layer.getChildFrame("#backAddress").val(rowData.backImgAddress);
                layer.getChildFrame("#sizeNumber").text("添加数量");
                if(rowData.reco) {
                    var xx = layer.getChildFrame("#reco").attr("checked", true);
                    xx.next().attr("class", "layui-unselect layui-form-switch layui-form-onswitch");
                }
                if(rowData.finished) {
                    var xx = layer.getChildFrame("#finished").attr("checked", true);
                    xx.next().attr("class", "layui-unselect layui-form-switch layui-form-onswitch");
                }
            }, yes: function (index, layero) {
                var name = layer.getChildFrame("#name").val();
                var type = layer.getChildFrame("#type").val();
                var price = layer.getChildFrame("#price").val();
                var realityPrice = layer.getChildFrame("#realityPrice").val();
                var desc1 = layer.getChildFrame("#desc").val();
                var imgAddress = layer.getChildFrame("#address").val();
                var backImgAddress = layer.getChildFrame("#backAddress").val();
                var reco = layer.getChildFrame("#reco").attr("checked") == 'checked' ? true: false;
                var finished = layer.getChildFrame("#finished").attr("checked") == 'checked' ? true: false;
                var $input = layer.getChildFrame("input[name='num']");
                var sizeNumber = new Array();
                $input.each(function () {
                    var $type = $(this);
                    if($type.val() == '') {
                        sizeNumber.push(0);
                    } else {
                        sizeNumber.push($type.val());
                    }
                });
                $.ajax({
                    "url": "admin/saveGoods",
                    "data": {
                        "id": rowData.id, "name": name, "type": type, "price": price, "realityPrice": realityPrice,
                        "desc1": desc1, "imgAddress": imgAddress, "backImgAddress": backImgAddress
                        , "reco": reco, "finished": finished, "sizeNumberArr": sizeNumber
                    },
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
        layer.confirm("确定删除服装   " + name + "   吗?", {icon: 3, title: '确认删除操作', anim: 6}, function (index) {
            layer.close(index);
            $.ajax({
                "url": "admin/deleteClothes",
                "data": {"clothesId": id},
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

    //添加商品
    $('#addRow').on('click', function () {

        layer.open({
            type: 2
            , title: ['添加商品'] //不显示标题栏
            , area: ['500px', '450px']
            , shade: 0.8
            , maxmin: true
            , id: 'LAY_layuipro' //设定一个id，防止重复弹出
            , btn: ['确定', '取消']
            , moveType: 1 //拖拽模式，0或者1
            , offset: 't'
            , content: ['admin/addGoodsModel']
            //,content:'<div  style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><form class="layui-form" action=""><select name="modules" lay-verify="required" lay-search=""><option value="">直接选择或搜索选择</option><option value="1">layer</option><option value="2">form</option><option value="3">layim</option><option value="4">element</option><option value="5">laytpl</option><option value="6">upload</option><option value="7">laydate</option><option value="8">laypage</option><option value="9">flow</option><option value="10">util</option><option value="11">code</option><option value="12">tree</option><option value="13">layedit</option><option value="14">nav</option><option value="15">tab</option><option value="16">table</option><option value="17">select</option><option value="18">checkbox</option><option value="19">switch</option><option value="20">radio</option></select></form></div>'
            , success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
            }, yes: function (index, layero) {
                var name = layer.getChildFrame("#name").val();
                var type = layer.getChildFrame("#type").val();
                var price = layer.getChildFrame("#price").val();
                var realityPrice = layer.getChildFrame("#realityPrice").val();
                var desc1 = layer.getChildFrame("#desc").val();
                var imgAddress = layer.getChildFrame("#address").val();
                var backImgAddress = layer.getChildFrame("#backAddress").val();
                var reco = layer.getChildFrame("#reco").attr("checked") == 'checked' ? true: false;
                var finished = layer.getChildFrame("#finished").attr("checked") == 'checked' ? true: false;
                var $input = layer.getChildFrame("input[name='num']");
                var sizeNumber = new Array();
                $input.each(function () {
                    var $type = $(this);
                    if($type.val() == '') {
                        sizeNumber.push(0);
                    } else {
                        sizeNumber.push($type.val());
                    }
                });
                $.ajax({
                    "url": "admin/addGoods",
                    "data": {
                        "name": name, "type": type, "price": price, "realityPrice": realityPrice,
                        "desc1": desc1, "imgAddress": imgAddress, "backImgAddress": backImgAddress
                        , "reco": reco, "finished": finished, "sizeNumberArr": sizeNumber
                    },
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
    var sizeArr = ${sizeList};
    $("#layui-table tbody").on("click", ".message-btn", function () {
        var tr = $(this).parent().parent("tr");
        var rowData = table.row(tr).data();
        layer.open({
            type: 2
            , title: ['商品详情'] //不显示标题栏
            , area: ['500px', '310px']
            , shade: 0.8
            , id: 'LAY_layuipro' //设定一个id，防止重复弹出
            , btn: ['确定', '取消']
            , moveType: 1 //拖拽模式，0或者1
            , offset: '50px'
            , maxmin: true
            , anim: 1
            , content: ['/html/goods_message.html']
            , success: function (layero) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
                var goods = rowData.goods;
                layer.getChildFrame("#name").text(rowData.name);
                layer.getChildFrame("#desc").text(rowData.desc1);
                var td = layer.getChildFrame("td");
                for(var i = 0; i < goods.length; i++) {
                    if(sizeArr[i] >= goods[i].number) {
                        td.eq(i).html("<span style='color: #FF5722'>" + goods[i].number + "</span>");
                    } else {
                        td.eq(i).html("<span style='color: #01AAED'>" + goods[i].number + "</span>");
                    }
                }
            }
        });
    });

</script>
</body>
</html>
