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
    <script src="js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="plugins/buy/js/jquery_cart.js"></script>
    <link rel="stylesheet" type="text/css" href="plugins/buy/css/buyConfirm.css" />
    <script src="plugins/buy/js/unslider.min.js" type="text/javascript"></script>
    <script src="plugins/buy/js/index.js" type="text/javascript"></script>
    <script type="text/javascript">

        window.onload = function(){
            new tab('test4-input-input_tab1-input_tab2', '-');
        }
        function tab(o, s, cb, ev){ //tab换类
            var $ = function(o){return document.getElementById(o)};
            var css = o.split((s||'_'));
            if(css.length!=4)return;
            this.event = ev || 'onclick';
            o = $(o);
            if(o){
                this.ITEM = [];
                o.id = css[0];
                var item = o.getElementsByTagName(css[1]);
                var j=1;
                for(var i=0;i<item.length;i++){
                    if(item[i].className.indexOf(css[2])>=0 || item[i].className.indexOf(css[3])>=0){
                        if(item[i].className == css[2])o['cur'] = item[i];
                        item[i].callBack = cb||function(){};
                        item[i]['css'] = css;
                        item[i]['link'] = o;
                        this.ITEM[j] = item[i];
                        item[i]['Index'] = j++;
                        item[i][this.event] = this.ACTIVE;
                    }
                }
                return o;
            }
        }
        tab.prototype = {
            ACTIVE:function(){
                var $ = function(o){return document.getElementById(o)};
                this['link']['cur'].className = this['css'][3];
                this.className = this['css'][2];
                try{
                    $(this['link']['id']+'_'+this['link']['cur']['Index']).style.display = 'none';
                    $(this['link']['id']+'_'+this['Index']).style.display = 'block';
                }catch(e){}
                this.callBack.call(this);
                this['link']['cur'] = this;
            }
        }
    </script>
    <style type="text/css">
        .girl-clothes {
            height: 260px;
        }

        .boy-clothes {
            height: 210px;
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
                            <h1>艺扬 <small>服饰商城</small></h1>
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
                            <li class="active">
                                <a href="user/cart">购物车</a>
                            </li>
                            <li>
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

        <!--订单提交body部分开始-->


        <div class="border_top_cart">

            <div class="container payment-con">

                    <div class="order-info">
                        <div class="msg">
                            <h3>您已付款，我们将3天内发货</h3>
                            <p></p>

                            <p class="post-date">订单状态我们将以邮件的方式通知您，请您留意。</p>
                            <br><br><br><br><br><br><br>
                        </div>
                        <div class="icon-box">
                            <i class="iconfont"><img src="plugins/buy/images/yes_ok.png"></i>
                        </div>
                    </div>



            </div>
            <!-- 支付弹框 -->
            <div class="modal hide to-pay-tip" id="toPayTip">
                <div class="modal-header">
        <span class="close" id="toPayTipClose">
            <i class="iconfont">&#xe617;</i>
        </span>
                    <h3>正在支付...</h3>
                </div>
                <div class="modal-body">
                    <div class="pay-tip clearfix">
                        <div class="fail">
                            <h4>如果支付失败...</h4>
                            <p>额度问题，推荐<a href="#" id="alipayTrigger">支付宝快捷支付 &gt;</a></p>
                            <p>其他问题，查看<a href="#">支付常见问题 &gt;</a></p>
                        </div>
                        <div class="success">
                            <h4>支付成功了</h4>
                            <p>立即查看<a href="#" target="_blank">订单详情 &gt;</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 余额支付弹框 -->
            <div class="modal hide  balance-pay" id="balancePay">
                <div class="modal-body">
                    <h3>账户余额支付：<span class="num"><em id="useCashAccountPayLeft">0.00</em>元</span></h3>
                    <p id="checkCodeTip">短信验证码已下发至您的手机<span class="num"></span></p>
                    <input type="text" name="verifycode" id="verifycode" class="input" placeholder="请输入验证码"> <span class="send-again" id="sendAgain">重新发送<em></em></span>
                    <p><input type="button" value="确认支付" class="btn btn-primary" id="toPay">
                        <div class="select-other">
                    <p><span id="bankName"></span> <span class="num">49.00元</span></p>

                </div>
                <a href="javascript:;" id="chooseOther">选择其他方式支付&gt;</a>
            </div>

        </div>



        <script src="plugins/buy/js/base.min.js"></script>

        <script type="text/javascript" src="plugins/buy/js/buyConfirm.js"></script>




<!--订单提交body部分结束-->

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

<script src="js/minified.js"></script>

<script>

</script>
<script src="js/products.js"></script>
<script src="js/owl.carousel.js"></script>
<script src="js/layer.js"></script>
<script src="plugins/buy/js/address_all.js"></script>
<script>
    $(function () {
        var pStr = ${order.sendAddress.province};
        var cStr = ${order.sendAddress.city};
        var dStr = ${order.sendAddress.district};
        var id = ${order.id};
        var msgId = {"province": pStr, "city": cStr, "district": dStr}
        var msg = getMessage(msgId);
        $("#address").text(msg.province + "," + msg.city + "," + msg.district + " ");

        $("#payBtn").click(function () {
            var indexLoad = layer.load({time: 5 * 1000, offset: "50px"});
            $.ajax({
                url: "user/payFinished"
                ,type: "post"
                ,data: {"id": id}
                ,success: function (data) {
                    layer.close(indexLoad);
                    if (data == "1") {
                        layer.msg("付款成功！", {icon: 6, time: 700, offset: "10px"});
                        layer.close(index);
                        setTimeout("window.location.href='user/payFinished'", 500);
                        return;
                    }
                    layer.msg(data, {icon: 5, anim: 0, offset: "10px"});
                }
                ,error: function () {
                    layer.close(indexLoad);
                    layer.msg("当前系统繁忙，请稍后再试！", {icon: 5, anim: 0, offset: "10px"});
                }
            });
        })
    })
</script>
</body>
</html>
