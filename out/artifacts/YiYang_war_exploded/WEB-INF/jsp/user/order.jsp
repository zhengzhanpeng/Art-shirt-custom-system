<%--
  Created by IntelliJ IDEA.
  User: ho
  Date: 2017/10/23
  Time: 14:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.zzp.YiYang.pojo.Icon" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href=" <%=basePath%>">
    <base src=" <%=basePath%>">
    <meta charset="UTF-8"/>
    <title>艺扬服饰商城</title>

    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="icon" href="img/favicon/favicon.html" type="image/x-icon"/>
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="img/favicon/apple-touch-icon-144x144-precomposed.html">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/favicon/apple-touch-icon-72x72-precomposed.html">
    <link rel="apple-touch-icon-precomposed" href="img/favicon/apple-touch-icon-precomposed.html">

    <link rel="stylesheet" href="css/minified.css">
    <script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>');</script>
    <script src="js/modernizr.min.js"></script>
    <link rel="stylesheet" href="css/innerpage.css">
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/responsive.css">

    <link href="plugins/buy/css/public.css" type="text/css" rel="stylesheet"/>
    <%--<link rel="stylesheet" type="text/css" href="plugins/buy/css/base.css"/>--%>
    <script type="text/javascript" src="plugins/buy/js/jquery_cart.js"></script>
    <link rel="stylesheet" type="text/css" href="plugins/buy/css/checkOut.css"/>
    <style type="text/css">
        .girl-clothes {
            height: 260px;
        }

        .boy-clothes {
            height: 210px;
        }
        .xm-address-list .selected .edit-btn {
            display: inline-block !important;
        }
    </style>
</head>
<body>

<div id="page-wrapper">

    <header id="site-header" role="banner">
        <div class="header-top" style="background: #FFF">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-6 col-md-7">
                        <div class="contact-info">
                            <i class="iconfont-headphones round-icon"></i>
                            <strong>+400 (180) 1234</strong>
                            <span>(周一至周五: 09.00 - 21.00)</span>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-5">
                        <ul class="actions unstyled clearfix">
                            <li>
                                <div class="search-box">
                                    <form action="#" method="post">
                                        <div class="input-iconed prepend">
                                            <button class="input-icon"><i class="iconfont-search"></i></button>
                                            <label for="input-search" class="placeholder">在这里搜索…</label>
                                            <input type="text" name="q" id="input-search" class="round-input full-width"
                                                   required/>
                                        </div>
                                    </form>
                                </div>
                            </li>
                            <li data-toggle="sub-header" data-target="#sub-social">
                                <a href="javascript:void(0);" id="social-icons">
                                    <i class="iconfont-share round-icon"></i>
                                </a>

                                <div id="sub-social" class="sub-header">
                                    <ul class="social-list unstyled text-center">
                                        <li><a href="#"><i class="iconfont-facebook round-icon"></i></a></li>
                                        <li><a href="#"><i class="iconfont-twitter round-icon"></i></a></li>
                                        <li><a href="#"><i class="iconfont-google-plus round-icon"></i></a></li>
                                        <li><a href="#"><i class="iconfont-pinterest round-icon"></i></a></li>
                                        <li><a href="#"><i class="iconfont-rss round-icon"></i></a></li>
                                    </ul>
                                </div>
                            </li>
                            <li data-toggle="sub-header" data-target="#sub-cart">
                                <a href="javascript:void(0);" id="total-cart">
                                    <i class="iconfont-shopping-cart round-icon"></i>
                                </a>

                                <div id="sub-cart" class="sub-header">
                                    <div class="cart-header">
                                        <span>你的购物车目前是空的</span>
                                        <small><a href="cart.html">(查看所有)</a></small>
                                    </div>
                                    <ul class="cart-items product-medialist unstyled clearfix"></ul>
                                    <div class="cart-footer">
                                        <div class="cart-total clearfix">
                                            <span class="pull-left uppercase">Total</span>
                                            <span class="pull-right total">$ 0</span>
                                        </div>
                                        <div class="text-right">
                                            <a href="cart.html" class="btn btn-default btn-round view-cart">View
                                                Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="cart-notification">
                <ul class="unstyled"></ul>
            </div>
        </div>
        <div class="main-header-wrapper">
            <div class="container">
                <div class="main-header">
                    <div class="actions">
                        <div class="center-xs">

                        </div>
                        <div class="clearfix"></div>
                        <nav id="tiny-menu" class="clearfix">
                            <ul class="user-menu">
                                <li><a href="user/order">我的账户</a></li>
                                <li><a href="user/setPassword">修改密码</a></li>
                                <li><a href="login">登录/注册</a></li>
                                <%--<li><a href="#">注册</a></li>--%>
                                <li><a href="j_spring_security_logout ">退出</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="logo-wrapper">
                        <a href="index.html" class="logo" title="GFashion - Responsive e-commerce HTML Template">
                            <h1>艺扬
                                <small>服饰商城</small>
                            </h1>
                        </a>
                    </div>
                    <nav id="site-menu" role="navigation">
                        <ul class="main-menu hidden-sm hidden-xs">
                            <li>
                                <a href="index">首页</a>
                            </li>
                            <li>
                                <a href="icons">图标</a>
                            </li>
                            <li>
                                <a href="user/clothes_make">衬衫定制</a>
                            </li>
                            <li>
                                <a href="user/cart">购物车</a>
                            </li>
                            <li class="active">
                                <a href="user/order">我的订单</a>
                            </li>
                            <li>
                                <a href="new/index.html">即将上线</a>
                            </li>
                        </ul>

                        <div id="mobile-menu" class="dl-menuwrapper visible-xs visible-sm">
                            <button class="dl-trigger"><i class="iconfont-reorder round-icon"></i></button>
                            <ul class="dl-menu">
                                <li class="active">
                                    <a href="javsacript:void(0);">首页</a>
                                </li>
                                <li>
                                    <a href="javsacript:void(0);">服装</a>


                                </li>
                            </ul>
                        </div>

                    </nav>
                </div>
            </div>
        </div>
    </header>

    <div class="breadcrumb-container">
        <div class="container">
            <div class="relative">
                <%--<ul class="bc unstyled clearfix">--%>
                <%--<li><a href="#">首页</a></li>--%>
                <%--<li class="active">购物车</li>--%>
                <%--</ul>--%>
            </div>
        </div>
    </div>
    <main id="main-content" role="main">

        <div class="banner_red_top">


        </div>


        <!--收货地址body部分开始-->
        <div class="border_top_cart">
            <script type="text/javascript">
                var checkoutConfig = {
                    addressMatch: 'common',
                    addressMatchVarName: 'data',
                    hasPresales: false,
                    hasBigTv: false,
                    hasAir: false,
                    hasScales: false,
                    hasGiftcard: false,
                    totalPrice: 244.00,
                    postage: 10,//运费
                    postFree: true,//活动是否免邮了
                    bcPrice: 150,//计算界值
                    activityDiscountMoney: 0.00,//活动优惠
                    showCouponBox: 0,
                    sendType: {
                        NA: "0",
                        personal: "1",
                        company: "2",
                        electronic: "4"
                    }
                };
                var miniCartDisable = true;
            </script>
            <div class="container">
                <div class="checkout-box">
                    <form id="checkoutForm" action="user/toPay" method="post">
                        <div class="checkout-box-bd">
                            <!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->
                            <input type="hidden" name="Checkout[addressState]" id="addrState" value="1">
                            <input type="hidden" name="id" value="${orderDTO.id}">
                            <input type="hidden" name="sendAddressId" id="sendAddressId" value="">
                            <input type="hidden" name="sendType" id="sendType" value="1">
                            <!-- 收货地址 -->
                            <div class="xm-box">
                                <div class="box-hd ">
                                    <h3 class="title">收货地址</h3>
                                    <!---->
                                </div>
                                <div class="box-bd">
                                    <div class="clearfix xm-address-list" id="checkoutAddrList">
                                        <c:forEach items="${orderDTO.sendAddresses}" var="s">
                                            <dl class="item send-address-m <c:if test="${s.defaultAddress}">selected</c:if>"
                                                data="${s.id}">
                                                <dt>
                                                    <strong class="itemConsignee">${s.receiveName}</strong>
                                                    <span class="itemTag tag">${s.addressLabel}</span>
                                                </dt>
                                                <dd>
                                                    <p class="tel itemTel">${s.phone}</p>
                                                    <p class="itemRegion" pStr="${s.province}" cStr="${s.city}"
                                                       dStr="${s.district}"></p>
                                                    <p class="itemStreet">${s.address}(${s.postalCode})</p>
                                                    <span class="edit-btn J_editAddr">编辑</span>
                                                    <span class="edit-btn delete-address">删除</span>
                                                </dd>
                                                <dd style="display:none">
                                                    <input type="radio" name="Checkout[address]" class="addressId"
                                                           value="10140916720030323">
                                                </dd>
                                            </dl>
                                        </c:forEach>
                                        <div class="item use-new-addr" id="J_useNewAddr" data-state="off">
                                            <span class="iconfont icon-add"><img src="plugins/buy/images/add_cart.png"/></span>
                                            使用新地址
                                        </div>
                                    </div>
                                    <input type="hidden" name="newAddress[type]" id="newType" value="common">
                                    <input type="hidden" name="newAddress[consignee]" id="newConsignee">
                                    <input type="hidden" name="newAddress[province]" id="newProvince">
                                    <input type="hidden" name="newAddress[city]" id="newCity">
                                    <input type="hidden" name="newAddress[district]" id="newCounty">
                                    <input type="hidden" name="newAddress[address]" id="newStreet">
                                    <input type="hidden" name="newAddress[zipcode]" id="newZipcode">
                                    <input type="hidden" name="newAddress[tel]" id="newTel">
                                    <input type="hidden" name="newAddress[tag_name]" id="newTag">
                                    <!--点击弹出新增/收货地址界面start-->
                                    <div class="xm-edit-addr-box" id="J_editAddrBox">
                                        <div class="bd">
                                            <div class="item">
                                                <label>收货人姓名<span>*</span></label>
                                                <input type="text" name="userAddress[consignee]" id="Consignee"
                                                       style="margin: 0 10px 0 0;" class="input" placeholder="收货人姓名"
                                                       maxlength="15" autocomplete='off'>
                                                <p class="tip-msg tipMsg"></p>
                                            </div>
                                            <div class="item">
                                                <label>联系电话<span>*</span></label>
                                                <input type="text" name="userAddress[tel]" class="input" id="Telephone"
                                                       placeholder="11位手机号" autocomplete='off'>
                                                <p class="tel-modify-tip" id="telModifyTip"></p>
                                                <p class="tip-msg tipMsg"></p>
                                            </div>
                                            <div class="item">
                                                <label>地址<span>*</span></label>
                                                <select name="userAddress[province]" id="Provinces" class="select-1">
                                                    <option>省份/自治区</option>
                                                </select>
                                                <select name="userAddress[city]" id="Citys" class="select-2" disabled>
                                                    <option>城市/地区/自治州</option>
                                                </select>
                                                <select name="userAddress[county]" id="Countys" class="select-3"
                                                        style="width: 130px;" disabled>
                                                    <option>区/县</option>
                                                </select>
                                                <textarea name="userAddress[street]" class="input-area" id="Street"
                                                          placeholder="路名或街道地址，门牌号"></textarea>
                                                <p class="tip-msg tipMsg"></p>
                                            </div>
                                            <div class="item">
                                                <label>邮政编码<span>*</span></label>
                                                <input type="text" name="userAddress[zipcode]" id="Zipcode"
                                                       class="input" placeholder="邮政编码" autocomplete='off'>
                                                <p class="zipcode-tip" id="zipcodeTip"></p>
                                                <p class="tip-msg tipMsg"></p>
                                            </div>
                                            <div class="item">
                                                <label>地址标签<span>*</span></label>
                                                <input type="text" name="userAddress[tag]" id="Tag" class="input"
                                                       placeholder='地址标签：如"家"、"公司"。限5个字内'>
                                                <p class="tip-msg tipMsg"></p>
                                            </div>
                                        </div>
                                        <div class="ft clearfix">
                                            <button type="button" class="btn btn-lineDake btn-small "
                                                    style="width: 105px;" id="J_editAddrCancel">取消
                                            </button>
                                            <button type="button" class="btn btn-primary  btn-small "
                                                    style="width: 105px;" id="J_editAddrOk">保存
                                            </button>
                                        </div>
                                    </div>
                                    <!--点击弹出新增/收货地址界面end-->
                                    <div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop"></div>
                                </div>
                            </div>
                            <!-- 收货地址 END-->
                            <div id="checkoutPayment">
                                <!-- 支付方式 -->
                                <div class="xm-box">
                                    <div class="box-hd ">
                                        <h3 class="title">支付方式</h3>
                                    </div>
                                    <div class="box-bd">
                                        <ul id="checkoutPaymentList" class="checkout-option-list clearfix J_optionList">
                                            <li class="item selected">
                                                <input type="radio" name="Checkout[pay_id]" checked="checked" value="1">
                                                <p>
                                                    在线支付 <span></span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 支付方式 END-->
                                <div class="xm-box">
                                    <div class="box-hd ">
                                        <h3 class="title">配送方式</h3>
                                    </div>
                                    <div class="box-bd">
                                        <ul id="checkoutShipmentList"
                                            class="checkout-option-list clearfix J_optionList">
                                            <li class="item selected">
                                                <input type="radio" data-price="0" name="Checkout[shipment_id]"
                                                       checked="checked" value="1">
                                                <p>
                                                    快递配送（免运费） <span></span>
                                                </p>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- 配送方式 END-->                    <!-- 配送方式 END-->
                            </div>
                            <!-- 送货时间 -->
                            <div class="xm-box">
                                <div class="box-hd">
                                    <h3 class="title">送货时间</h3>
                                </div>
                                <div class="box-bd">
                                    <ul class="checkout-option-list clearfix J_optionList">
                                        <li class="item send-type selected" data="1"><input type="radio" checked="checked"
                                                                         name="Checkout[best_time]" value="1">
                                            <p>不限送货时间<span>周一至周日</span></p></li>
                                        <li class="item send-type" data="2"><input type="radio" name="Checkout[best_time]" value="2">
                                            <p>工作日送货<span>周一至周五</span></p></li>
                                        <li class="item send-type" data="3"><input type="radio" name="Checkout[best_time]" value="3">
                                            <p>双休日、假日送货<span>周六至周日</span></p></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- 送货时间 END-->
                            <%--<!-- 发票信息 -->--%>
                            <%--<div id="checkoutInvoice">--%>
                            <%--<div class="xm-box">--%>
                            <%--<div class="box-hd">--%>
                            <%--<h3 class="title">发票信息</h2>--%>
                            <%--</div>--%>
                            <%--<div class="box-bd">--%>
                            <%--<ul class="checkout-option-list checkout-option-sendType clearfix J_optionList J_optionInvoice">--%>
                            <%--<li class="hide">--%>
                            <%--电子个人发票4--%>
                            <%--</li>--%>
                            <%--<li class="item selected">--%>
                            <%--<!--<label><input type="radio"  class="needInvoice" value="0" name="Checkout[sendType]">不开发票</label>-->--%>
                            <%--<input type="radio"    checked="checked"  value="4" name="Checkout[sendType]">--%>
                            <%--<p>电子发票（非纸质）</p>--%>
                            <%--</li>--%>
                            <%--<li class="item ">--%>
                            <%--<input type="radio"   value="1" name="Checkout[sendType]">--%>
                            <%--<p>普通发票（纸质）</p>--%>
                            <%--</li>--%>
                            <%--</ul>--%>
                            <%--<p id="eInvoiceTip" class="e-sendType-tip ">--%>
                            <%--电子发票是税务局认可的有效凭证，可作为售后维权凭据，不随商品寄送。开票后不可更换纸质发票，如需报销请选择普通发票。<a href="http://bbs.xiaomi.cn/thread-9285999-1-1.html" target="_blank">什么是电子发票？</a>--%>
                            <%--</p>--%>
                            <%--<div class="sendType-info nvoice-info-1" id="checkoutInvoiceElectronic" style="display:none;">--%>

                            <%--<p class="tip">电子发票目前仅对个人用户开具，不可用于单位报销 ，不随商品寄送</p>--%>
                            <%--<p>发票内容：购买商品明细</p>--%>
                            <%--<p>发票抬头：个人</p>--%>
                            <%--<p>--%>
                            <%--<span class="hide"><input type="radio" value="4" name="Checkout[invoice_type]"   checked="checked"   id="electronicPersonal" class="invoiceType"></span>--%>
                            <%--<dl>--%>
                            <%--<dt>什么是电子发票?</dt>--%>
                            <%--<dd>&#903; 电子发票是纸质发票的映像，是税务局认可的有效凭证，与传统纸质发票具有同等法律效力，可作为售后维权凭据。</dd>--%>
                            <%--<dd>&#903; 开具电子服务于个人，开票后不可更换纸质发票，不可用于单位报销。</dd>--%>
                            <%--<dd>&#903; 您在订单详情的"发票信息"栏可查看、下载您的电子发票。<a href="http://bbs.xiaomi.cn/thread-9285999-1-1.html" target="_blank">什么是电子发票？</a></dd>--%>
                            <%--</dl>--%>
                            <%--</p>--%>
                            <%--</div>--%>
                            <%--<div class="sendType-info sendType-info-2" id="checkoutInvoiceDetail"  style="display:none;" >--%>
                            <%--<p>发票内容：购买商品明细</p>--%>
                            <%--<p>--%>
                            <%--发票抬头：请确认单位名称正确,以免因名称错误耽搁您的报销。注：合约机话费仅能开个人发票--%>
                            <%--</p>--%>
                            <%--<ul class="type clearfix J_invoiceType">--%>
                            <%--<li class="hide">--%>
                            <%--<input type="radio" value="0" name="Checkout[invoice_type]" id="noNeedInvoice" >--%>
                            <%--</li>--%>
                            <%--<li class="">--%>
                            <%--<input  class="invoiceType" type="radio" id="commonPersonal" name="Checkout[invoice_type]" value="1" >--%>
                            <%--个人--%>
                            <%--</li>--%>
                            <%--<li class="">--%>
                            <%--<input  class="invoiceType" type="radio" name="Checkout[invoice_type]" value="2" >--%>
                            <%--单位--%>
                            <%--</li>--%>
                            <%--</ul>--%>
                            <%--<div  id='CheckoutInvoiceTitle' class=" hide  sendType-title">--%>
                            <%--<label for="Checkout[invoice_title]">单位名称：</label>--%>
                            <%--<input name="Checkout[invoice_title]" type="text" maxlength="49" value="" class="input"> <span class="tip-msg J_tipMsg"></span>--%>
                            <%--</div>--%>

                            <%--</div>--%>

                            <%--</div>--%>
                            <%--</div>                </div>--%>
                            <%--<!-- 发票信息 END-->--%>
                        </div>
                        <div class="checkout-box-ft">
                            <!-- 商品清单 -->
                            <div id="checkoutGoodsList" class="checkout-goods-box">
                                <div class="xm-box">
                                    <div class="box-hd">
                                        <h3 class="title">确认订单信息</h3>
                                    </div>
                                    <div class="box-bd">
                                        <dl class="checkout-goods-list">
                                            <dt class="clearfix">
                                                <span class="col col-1">商品名称</span>
                                                <span class="col col-2">购买价格</span>
                                                <span class="col col-3">购买数量</span>
                                                <span class="col col-4">小计（元）</span>
                                            </dt>
                                            <c:forEach items="${orderDTO.itemDTOs}" var="i">
                                                <dd class="item clearfix">
                                                    <div class="item-row">
                                                        <div class="col col-1">
                                                            <div class="g-pic">
                                                                <img src="${i.imgAddress}" srcset="${i.imgAddress} 2x"
                                                                     width="40" height="40"/>
                                                                <img src="${i.backImgAddress}"
                                                                     srcset="${i.backImgAddress} 2x" width="40"
                                                                     height="40"/>
                                                            </div>
                                                            <div class="g-info">
                                                                <a href="#">
                                                                        ${i.name} ${i.size}                                            </a>
                                                            </div>
                                                        </div>

                                                        <div class="col col-2"><span
                                                                class="price">${i.realityPrice}</span>元
                                                        </div>
                                                        <div class="col col-3"><span class="number">${i.number}</span>
                                                        </div>
                                                        <div class="col col-4"><span class="all"></span>元</div>
                                                    </div>
                                                </dd>
                                            </c:forEach>
                                        </dl>
                                        <div class="checkout-count clearfix">
                                            <div class="checkout-count-extend xm-add-buy">
                                                <h3 class="title">会员留言</h3></br>
                                                <input type="text" name="desc1" id="desc1"/>

                                            </div>
                                            <!-- checkout-count-extend -->
                                            <div class="checkout-price">
                                                <ul>

                                                    <li>
                                                        订单总额：<span>${orderDTO.realityPrice}元</span>
                                                    </li>
                                                    <li>
                                                        活动优惠：<span>-0元</span>
                                                        <script type="text/javascript">
                                                            checkoutConfig.activityDiscountMoney = 0;
                                                            checkoutConfig.totalPrice = 244.00;
                                                        </script>
                                                    </li>
                                                    <li>
                                                        优惠券抵扣：<span id="couponDesc">-0元</span>
                                                    </li>
                                                    <li>
                                                        运费：<span id="postageDesc">0元</span>
                                                    </li>
                                                </ul>
                                                <p class="checkout-total">
                                                    应付总额：<span><strong>${orderDTO.realityPrice}</strong>元</span></p>
                                            </div>
                                            <!--  -->
                                        </div>
                                    </div>
                                </div>

                                <!--S 加价购 产品选择弹框 -->
                                <div class="modal hide modal-choose-pro" id="J_choosePro-664">
                                    <div class="modal-header">
                                        <span class="close" data-dismiss='modal'><i class="iconfont">&#xe617;</i></span>
                                        <h3>选择产品</h3>
                                        <div class="more">
                                            <div class="xm-recommend-page clearfix">
                                                <a class="page-btn-prev   J_carouselPrev iconfont"
                                                   href="javascript: void(0);">&#xe604;</a><a
                                                    class="page-btn-next  J_carouselNext iconfont"
                                                    href="javascript: void(0);">&#xe605;</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-body J_chooseProCarousel">
                                        <div class="J_carouselWrap modal-choose-pro-list-wrap">
                                            <ul class="clearfix J_carouselList">
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="#" class="btn btn-disabled J_chooseProBtn">加入购物车</a>
                                    </div>
                                </div>
                                <!--E 加价购 产品选择弹框 -->

                                <!--S 保障计划 产品选择弹框 -->


                            </div>
                            <!-- 商品清单 END -->
                            <input type="hidden" id="couponType" name="Checkout[couponsType]">
                            <input type="hidden" id="couponValue" name="Checkout[couponsValue]">
                            <div class="checkout-confirm">

                                <a href="user/cart" class="btn btn-lineDakeLight btn-back-cart">返回购物车</a>
                                <input type="submit" class="btn btn-primary" value="立即下单" id="checkoutToPay"/>
                            </div>
                        </div>
                </div>

                </form>

            </div>
            <!-- 禮品卡提示 S-->
            <div class="modal hide lipin-modal" id="lipinTip">
                <div class="modal-header">
                    <h2 class="title">温馨提示</h2>
                    <p> 为保障您的利益与安全，下单后礼品卡将会被使用，<br>
                        且订单信息将不可修改。请确认收货信息：</p>
                </div>
                <div class="modal-body">
                    <ul>
                        <li><strong>收&nbsp;&nbsp;货&nbsp;&nbsp;人：</strong><span id="lipin-uname"></span></li>
                        <li><strong>联系电话：</strong><span id="lipin-uphone"></span></li>
                        <li><strong>收货地址：</strong><span id="lipin-uaddr"></span></li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <span class="btn btn-primary" id="useGiftCard">确认下单</span><span class="btn btn-dakeLight"
                                                                                    id="closeGiftCard">返回修改</span>
                </div>
            </div>
            <!--  禮品卡提示 E-->
            <!-- 预售提示 S-->
            <div class="modal hide yushou-modal" id="yushouTip">
                <div class="modal-body">
                    <h2>请确认收货地址及发货时间</h2>
                    <ul class="list">
                        <li>
                            <strong>请确认配送地址，提交后不可变更：</strong>
                            <p id="yushouAddr"></p>
                            <span class="icon-common icon-1"></span>
                        </li>
                        <li>
                            <strong>支付后发货</strong>
                            <p>如您随预售商品一起购买的商品，将与预售商品一起发货</p>
                            <span class="icon-common icon-2"></span>
                        </li>
                        <li>
                            <strong>以支付价格为准</strong>
                            <p>如预售产品发生调价，已支付订单价格将不受影响。</p>
                            <span class="icon-common icon-3"></span>
                        </li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <p id="yushouOk" class="yushou-ok">
                        <span class="icon-checkbox"><i class="iconfont">&#xe626;</i></span>
                        我已确认收货地址正确，不再变更</p>
                    <span class="btn btn-lineDakeLight" data-dismiss="modal">返回修改地址</span>
                    <span class="btn btn-primary" id="yushouCheckout">继续下单</span>

                </div>
            </div>
            <!--  预售提示 E-->

            <script id="newAddrTemplate" type="text/x-dot-template">
                <dl class="item selected" data-isnew="true" data-consignee="{{=it.consignee}}" data-tel="{{=it.tel}}"
                    data-province="{{=it.province}}" data-provincename="{{=it.provinceName}}" data-city="{{=it.city}}"
                    data-cityname="{{=it.cityName}}" data-county="{{=it.county}}" data-countyname="{{=it.countyName}}"
                    data-zipcode="{{=it.zipcode}}" data-street="{{=it.street}}" data-tag="{{=it.tag}}">
                    <dt>
                        <strong class="itemConsignee">{{=it.consignee}}</strong>
                        {{? it.tag }}
                        <span class="itemTag tag">{{=it.tag}}</span>
                        {{?}}
                    </dt>
                    <dd>
                        <p class="tel itemTel">{{=it.tel}}</p>
                        <p class="itemRegion">{{=it.provinceName}} {{=it.cityName}} {{=it.countyName}}</p>
                        <p class="itemStreet">{{=it.street}} ({{=it.zipcode}})</p>
                        <span class="edit-btn J_editAddr">编辑</span>
                    </dd>
                </dl>
            </script>


            <!-- 保险弹窗 -->
            <!-- 保险弹窗 -->


            <script src="plugins/buy/js/base.min.js"></script>

            <script type="text/javascript" src="plugins/buy/js/address_all.js"></script>
            <script type="text/javascript" src="plugins/buy/js/checkout.min.js"></script>
        </div>

        <!--收货地址body部分结束-->


        <div class="fixed-buttons">
            <ul>
                <%--<li><a href="#" class="fixed-weixin"><img src="plugins/buy/images/fixed_weixin.png" /><div class="weixin-pic"><img src="images/weixin_big.jpg"></div></a></li>--%>
                <li><img id="imgBtn-to-top" src="plugins/buy/images/back_top.png"/></li>
            </ul>
        </div>


    </main>

    <footer class="page-footer">

        <div class="widgets">

            <div class="section">
                <div class="container">
                    <div class="row">

                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <section class="widget widget-text">
                                <h5 class="widget-title">我们的商店</h5>
                                <div class="widget-content">
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;我们产品全部来自正规的渠道，以最直接有效的方式送达最终端消费者手里，避免了中间过多的流通环节。并且本店一直是以薄利多销为原则，在有合理利润的基础下将尽最大可能让利给大家。</p>
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp;亲爱的各位顾客们， 购买前请仔细阅读本店购物相关条款，以避免造成您不必要的误会和不快！</p>
                                </div>
                            </section>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <section class="widget widget-text">
                                <h5 class="widget-title">营业时间</h5>
                                <div class="widget-content">
                                    <p>周一至周五：------------------------- 9.00至18.00</p>
                                    <p>星期六：-------------------------------- 10.00至16.00</p>
                                    <p>星期日：---------------------------------- 10.00至16.00</p>
                                    <br/>
                                    <p>网上店铺每月三十天全部在线，客服24小时为您服务。</p>
                                </div>
                            </section>
                        </div>

                        <div class="space40 visible-sm clearfix"></div>

                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <section class="widget widget-menu">
                                <h5 class="widget-title">信息</h5>
                                <div class="widget-content">
                                    <ul class="menu iconed-menu unstyled">
                                        <li><a href="#"><i class="iconfont-circle-blank menu-icon"></i>会员</a></li>
                                        <li><a href="#"><i class="iconfont-circle-blank menu-icon"></i>运输</a></li>
                                        <li><a href="#"><i class="iconfont-circle-blank menu-icon"></i>店铺支持</a></li>
                                        <li><a href="#"><i class="iconfont-circle-blank menu-icon"></i>客户服务</a></li>
                                        <li><a href="#"><i class="iconfont-circle-blank menu-icon"></i>付款和退货</a></li>
                                        <li><a href="#"><i class="iconfont-circle-blank menu-icon"></i>条款和条件</a></li>
                                    </ul>
                                </div>
                            </section>
                        </div>

                        <div class="col-xs-12 col-sm-6 col-md-3">
                            更多服务
                        </div>

                    </div>
                </div>
            </div>

            <div class="section">
                <div class="container">
                    <div class="row">

                        <div class="col-xs-12 col-sm-12 col-md-3">
                            <section class="widget widget-menu">
                                <h5 class="widget-title">联系方式</h5>
                                <div class="widget-content">
                                    <ul class="menu iconed-list unstyled">
                                        <li>
                                            <span class="list-icon"><i
                                                    class="round-icon iconfont-map-marker"></i></span>
                                            <div class="list-content">中华人民共和国北京市东花市北里20号楼6单元501室</div>
                                        </li>
                                        <li>
                                            <span class="list-icon"><i class="round-icon iconfont-phone"></i></span>
                                            <div class="list-content">(+86)13171863532</div>
                                        </li>
                                        <li>
                                            <span class="list-icon"><i
                                                    class="round-icon iconfont-envelope-alt"></i></span>
                                            <div class="list-content">676746837@qq.com</div>
                                        </li>
                                    </ul>
                                </div>
                            </section>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-6">
                            <section class="widget widget-ads">
                                <div class="widget-content">
                                    <div class="center-xs">
                                        <div class="ads">
                                            <a href="#">
                                                <img src="images/demo/images-footer.jpg" alt=""/>
                                            </a>
                                            <div class="ads-caption bottom-right">
                                                <a href="#" class="btn btn-default btn-round">
                                                    <i class="round-icon iconfont-angle-right"></i>
                                                    <span class="inline-middle">展示更多</span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>

                        <div class="col-xs-12 col-sm-12 col-md-3">
                            <section class="widget widget-subscription">
                                <h5 class="widget-title">最新动态</h5>
                                <div class="widget-content">
                                    <p>订阅成为第一时间了解销售，活动和独家优惠的人！</p>
                                    <form action="#" method="post">
                                        <div class="input-group">
                                            <label for="subscription-email" class="placeholder">输入您的电子邮箱</label>
                                            <input type="email" id="subscription-email" name="email"
                                                   class="form-control" required/>
											<span class="input-group-btn">
												<button class="btn btn-primary">订阅</button>
											</span>
                                        </div>
                                    </form>
                                </div>
                            </section>
                        </div>

                    </div>
                </div>
            </div>

        </div>

        <div class="footer-sub">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-6">
                        <div class="footer-links center-xs clearfix">
                            <ul class="unstyled">
                                <li><a href="#">网站地图</a></li>
                                <li><a href="#">常见问题</a></li>
                                <li><a href="#">加入我们</a></li>
                                <li><a href="#">联系我们</a></li>
                            </ul>
                        </div>
                        <div class="space10"></div>
                        <div class="copyright center-xs">
                            <p>© 2003-2017 flydm.cn 版权所有</p>
                        </div>
                    </div>

                    <div class="space40 visible-xs"></div>


                </div>
            </div>
        </div>

    </footer>

</div>
<script src="js/jquery-1.12.3.min.js"></script>
<script src="js/minified.js"></script>

<script>

</script>
<script src="js/products.js"></script>
<script src="js/owl.carousel.js"></script>
<script src="js/layer.js"></script>

<script src="plugins/buy/js/unslider.min.js" type="text/javascript"></script>
<script src="plugins/buy/js/index.js" type="text/javascript"></script>
<script>
    function addAddress() {  //若没有正确添加则返回0，否则返回1
        var receiveName = $("#Consignee").val();
        var phone = $("#Telephone").val();
        var province = $("#Provinces").val();
        var city = $("#Citys").val();
        var district = $("#Countys").val();
        var address = $("#Street").val();
        var postalCode = $("#Zipcode").val();
        var addressLabel = $("#Tag").val();
        var result = 0;
        $.ajax({
            url: "user/addSendAddress"
            , type: "post"
            , async: false
            , data: {
                "receiveName": receiveName
                , "phone": phone
                , "province": province
                , "city": city
                , "district": district
                , "address": address
                , "postalCode": postalCode
                , "addressLabel": addressLabel
            }
            , success: function (data) {
                if (!isNaN(data)) {
//                    layer.msg(, {icon: 6, time: 700});
//                    setTimeout("location.reload(true)", 500);
                    result = data;

                    return;
                }
                layer.msg(data, {icon: 5, anim: 0, offset: "10px"});
            }
            , error: function () {
                layer.msg("当前系统繁忙，请稍后再试！", {icon: 5, anim: 0, offset: "10px"});
            }
        });
        return result;
    }

    $(function () {
        $(".price").each(function () {
            var price = $(this).text();
            var number = $(this).parent().parent().find(".number").text();
            $(this).parent().parent().find(".all").text(price * number);
        });
        $(".itemRegion").each(function () {
            var pStr = $(this).attr("pStr");
            var cStr = $(this).attr("cStr");
            var dStr = $(this).attr("dStr");
            var msgId = {"province": pStr, "city": cStr, "district": dStr}
            var msg = getMessage(msgId);
            $(this).text(msg.province + " " + msg.city + " " + msg.district);
        });
        $(".delete-address").click(function () {
            var address = $(this).parent().find(".itemRegion").text();
            var id = $(this).parent().parent().attr("data");
            var addressDom = $(this).parent().parent();
            layer.confirm("您确定要删除 <span sytle='color: #FF5722;'>" + address + "</span> 吗？", {
                anim: 6
                , offset: '10px'
            }, function (index) {
                $.ajax({
                    url: "user/deleteAddress"
                    ,type: "post"
                    ,data: {"id": id}
                    ,success: function (data) {
                        if (data == "1") {
                            layer.msg("移除成功", {icon: 6, time: 700, offset: '10px'});
                            addressDom.remove();
                            layer.close(index);
                            return;
                        }
                        layer.msg(data, {icon: 5, anim: 0, offset: '10px'});
                    }
                    ,error: function () {
                        layer.msg("当前系统繁忙，请稍后再试！", {icon: 5, anim: 0, offset: '10px'});
                    }
                });
            });


        });
        $("#checkoutAddrList").children().show();
        $(".send-address-m").click(function () {
            $("#sendAddressId").val($(this).attr("data"));
        })
        $(".send-type").click(function () {
            $("#sendType").val($(this).attr("data"));
        })
        $("#checkoutToPay").click(function () {
//            var sendAddressId = $(".item .send-address-m .selected").attr("data");
//            var sendType = $(".item .send-type .selected").attr("data");
//            var desc1 = $("#desc1").val();
//            var id = $("#checkoutForm").attr("data");
//            $.ajax({
//                url: "user/toPay"
//                ,type: "post"
//                ,data: {}
//                ,success: function (data) {
//                    if (data == "1") {
//                        layer.msg(, {icon: 6, time: 700});
//                        layer.close(index);
//                        setTimeout("location.reload(true)", 500);
//                        return;
//                    }
//                    layer.msg(data, {icon: 5, anim: 0});
//                }
//                ,error: function () {
//                    layer.msg("当前系统繁忙，请稍后再试！", {icon: 5, anim: 0});
//                }
//            });
        })
    })
</script>
</body>
</html>
