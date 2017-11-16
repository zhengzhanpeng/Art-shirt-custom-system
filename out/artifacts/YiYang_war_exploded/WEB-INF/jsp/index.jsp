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
    <meta charset="UTF-8" />
    <title>艺扬服饰商城</title>
    <link rel="stylesheet" href="/css/minified.css">
    <script src="/js/jquery.min.js"></script>
    <script src="/js/modernizr.min.js"></script>
    <link rel="stylesheet" href="/css/owl.carousel.css">
    <link rel="stylesheet" href="/css/owl.theme.css">
    <link href="/css/flexslider.css" rel="stylesheet" />
    <link rel="stylesheet" href="/css/responsive.css">
    <style>
        i {
            position: relative;
            top: 25%;
        }
    </style>
</head>
<body class="home">

<div id="page-wrapper">

    <header id="site-header" role="banner">
        <div class="header-top">
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
                                            <input type="text" name="q" id="input-search" class="round-input full-width" required />
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
                                            <a href="cart.html" class="btn btn-default btn-round view-cart">View Cart</a>
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
                                <li><a href="#">我的账户</a></li>
                                <li><a href="cart.html">购物车</a></li>
                                <li><a href="login">登录/注册</a></li>
                                <%--<li><a href="#">注册</a></li>--%>
                                <li><a href="/j_spring_security_logout ">退出</a></li>
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
                            <li class="active">
                                <a href="index">首页</a>
                            </li>
                            <li>
                                <a href="/icons">图标</a>
                            </li>
                            <li>
                                <a href="/user/clothes_make">衬衫定制</a>
                            </li>
                            <li>
                                <a href="cart.html">购物车</a>
                            </li>
                            <li>
                                <a href="contact-us.html">联系我们</a>
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



    <div id="home-slider">
        <div class="flexslider">
            <ul class="slides">
                <li>
                    <img src="rev-slider/img/slides/Street-Fashion.jpg" alt="" />

                    <div class="flex-caption h6 text-bold gfc uppercase animated"
                         data-animation="fadeInLeftBig"
                         data-x="800"
                         data-y="110"
                         data-speed="600"
                         data-start="1200">2017秋季新品发布</div>

                    <div class="flex-caption herotext text-bold gfc animated"
                         data-animation="fadeInRightBig"
                         data-x="580"
                         data-y="140"
                         data-speed="900"
                         data-start="2000"><!-- 秋季时装 --></div>

                    <div class="flex-caption h6 text-bold gfc text-center animated"
                         data-animation="fadeInDown"
                         data-x="639"
                         data-y="260"
                         data-speed="1600"
                         data-start="2900">
                        <!-- 舒适的针织和温暖的夹克，这个秋天不会冷<br/> -->
                        <!-- <a href="products.html" class="btn btn-primary uppercase">现在购买</a> -->
                    </div>

                </li>

                <!-- THE SECOND SLIDE -->
                <li style="background: #fa6f57;">
                    <img src="img/transparent.png" alt="" />

                    <div class="flex-caption super-giant gfc animated uppercase"
                         data-animation="fadeInUp"
                         data-x="center"
                         data-y="60"
                         data-speed="500"
                         data-start="900">Sale</div>

                    <div id="caption-left-round" class="flex-caption round gfc animated uppercase"
                         data-animation="fadeInLeftBig"
                         data-x="140"
                         data-y="60"
                         data-speed="600"
                         data-start="1200"><div class="vmid"><span>中<br/>季</span></div></div>

                    <div class="flex-caption round gfc animated uppercase"
                         data-animation="fadeInRightBig"
                         data-x="925"
                         data-y="60"
                         data-speed="600"
                         data-start="1200"><div class="vmid"><span>高达<br/>70% 折扣</span></div></div>

                    <div class="flex-caption h3 gfc animated uppercase"
                         data-animation="fadeInDown"
                         data-x="center"
                         data-y="250"
                         data-speed="400"
                         data-start="1800"><strong class="text-bold">500强 </strong>新产品</div>
                </li>

                <li>
                    <img src="rev-slider/img/slides/3303349658_cfaebb811f_o.jpg" alt="" />

                    <div class="flex-caption herotext text-bold gfc bg-dark animated uppercase"
                         data-animation="fadeInUpBig"
                         data-x="760"
                         data-y="60"
                         data-speed="900"
                         data-start="100">免费 送货</div>

                    <div class="flex-caption h2 text-bold gfc bg-dark animated uppercase"
                         data-animation="fadeInUpBig"
                         data-x="797"
                         data-y="175"
                         data-speed="600"
                         data-start="900">超过￥ 200</div>

                </li>

            </ul>
        </div>

        <script>
            jQuery(function($) {
                var $slider = $('#home-slider > .flexslider');
                $slider.find('.flex-caption').each(function() {
                    var $this = $(this);
                    var configs = {
                        left: $this.data('x'),
                        top: $this.data('y'),
                        speed: $this.data('speed') + 'ms',
                        delay: $this.data('start') + 'ms'
                    };
                    if ( configs.left == 'center' && $this.width() !== 0 )
                    {
                        configs.left = ( $slider.width() - $this.width() ) / 2;
                    }
                    if ( configs.top == 'center' && $this.height() !== 0 )
                    {
                        configs.top = ( $slider.height() - $this.height() ) / 2;
                    }

                    $this.data('positions', configs);

                    $this.css({
                        'left': configs.left + 'px',
                        'top': configs.top + 'px',
                        'animation-duration': configs.speed,
                        'animation-delay': configs.delay,
                        'opacity': 0,
                        'animation-fill-mode': 'forwards'
                    });
                });

                $(window).on('resize', function() {
                    var wW = $(window).width(),
                            zoom = ( wW >= 1170 ) ? 1 : wW / 1349;
                    $('.flex-caption.gfc').css('zoom', zoom);
                });
                $(window).trigger('resize');



                $slider.imagesLoaded(function() {
                    $slider.flexslider({
                        animation: 'slide',
                        easing: 'easeInQuad',
                        slideshow: false,
                        nextText: '<i class="iconfont-angle-right" style="position: relative; top: 0px"></i>',
                        prevText: '<i class="iconfont-angle-left" style="position: relative; top: 0px"></i>',
                        start: function() {
                            flex_fix_pos(1);
                        },
                        before: function(slider) {
                            $slider.find('.slides li .animation-done').each(function() {
                                $(this).removeClass('animation-done');
                                var animation = $(this).attr('data-animation');
                                $(this).removeClass(animation);
                            });

                            flex_fix_pos(slider.animatingTo + 1);
                        },
                        after: function() {
                            $slider.find('.flex-active-slide .animated').each(function() {
                                var animation = $(this).attr('data-animation');
                                $(this).addClass('animation-done').addClass(animation);
                            });
                        }
                    });
                });


                function flex_fix_pos(i) {
                    $slider.find('.slides > li:eq(' + i + ') .gfc').each(function() {
                        var $this = $(this),
                                pos = $(this).data('positions');

                        if ( pos.left == 'center' )
                        {
                            pos.left = ( $slider.width() - $this.width() ) / 2;
                            $this.css('left', pos.left + 'px');
                            $this.data('positions', pos);
                        }
                        if ( pos.top == 'center' )
                        {
                            pos.top = ( $slider.height() - $this.height() ) / 2;
                            $this.css('left', pos.top + 'px');
                            $this.data('positions', pos);
                        }
                    });
                }
            });
        </script>
    </div>

    <main id="main-content" role="main">

        <section class="section promos">
            <div class="container">
                <div class="row">

                    <div class="col-md-4">
                        <div class="promo accent-background first-child first-row animated" data-animation="fadeInLeft">
                            <div class="inner text-center">
                                <h1 class="uppercase text-semibold">
                                    <a href="#">
                                        <span class="inverse-color">日销售量</span> 最 多 达23900<span class="inverse-color">件</span>
                                    </a>
                                </h1>
                                <h5 class="uppercase">2016年夏天统计</h5>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="promo inverse-background first-row animated" data-animation="fadeInDown" style="background: url('images/demo/P2200214.jpg') no-repeat; background-size: 100%;">
                            <div class="inner text-center np">
                                <div class="ribbon">
                                    <h6 class="nmb">最新款</h6>
                                    <h5 class="text-semibold uppercase nmb">时尚艺术衫</h5>
                                    <div class="space10"></div>
                                    <a href="products.html" class="with-icon prepend-icon"><i class="iconfont-caret-right"></i><span> Shop Now</span></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="promo inverse-background first-row animated" data-animation="fadeInRight">
                            <div class="inner text-center">
                                <h1 class="uppercase text-bold">
                                    <a href="#">
                                        免费 <span class="inverse-color">送货</span>
                                    </a>
                                </h1>
                                <h5 class="uppercase">超过 ￥200</h5>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <section class="section featured visible-items-4">
            <div class="container">
                <div class="row">
                    <header class="section-header clearfix col-sm-offset-3 col-sm-6">
                        <h3 class="section-title">精品图标</h3>
                        <!-- <p class="section-teaser">我们为您奉献最全，最潮流的服装</p> -->
                    </header>

                    <div class="clearfix"></div>

                    <!-- BEGIN CAROUSEL -->
                    <div id="featured-products" class="add-cart" data-product=".product" data-thumbnail=".entry-media .thumb" data-title=".entry-title > a" data-url=".entry-title > a" data-price=".entry-price > .price">

                        <div class="owl-controls clickable top">
                            <div class="owl-buttons">
                                <div class="owl-prev"><i class="iconfont-angle-left"></i></div>
                                <div class="owl-next"><i class="iconfont-angle-right"></i></div>
                            </div>
                        </div>

                        <div class="owl-carousel owl-theme" data-visible-items="4" data-navigation="true" data-lazyload="true">
                            <c:forEach items="${iconList}" var="icon">
                                <div class="product" data-product-id="${icon.id}">
                                    <div class="entry-media">
                                        <%--<span class="img-center-m">--%>
                                            <span class="span-img-center-m"></span>
                                            <img data-src="${icon.imgAddress}" alt="" class="lazyOwl thumb girl-clothes img-center-m" />
                                        <%--</span>--%>
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <c:if test="${icon.number < 50}">
                                                        <div class="circle ribbon ribbon-new">New</div>
                                                    </c:if>
                                                    <c:if test="${icon.number >= 100}">
                                                        <div class="circle ribbon ribbon-sale">HOT</div>
                                                    </c:if>
                                                </li>
                                                <li>
                                                    <a href="${icon.imgAddress}" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0)" class="circle add-to-collect"><i class="iconfont-star"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="4.5" step="0.5" id="backing${icon.id}" />
                                                <div class="rateit" data-rateit-backingfld="#backing${icon.id}" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="javascript:void(0)">${icon.name}</a>
                                        </h5>
                                        <div class="entry-price">
                                            <%--<s class="entry-discount">￥ 350.00</s>--%>
                                            <strong class="accent-color price">
                                                <c:if test="${icon.desc1.length() >13}">${icon.desc1}</c:if>
                                                <c:if test="${icon.desc1.length() <=13}">${icon.desc1}<br>&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
                                                 <%--${icon.desc1}--%>
                                            </strong>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="javascript:void(0)" class="pull-left m-r add-to-collect">+ 添加到收藏</a>
                                            <a href="javascript:void(0)" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </div>

                    </div>

                </div>
            </div>
        </section>

        <section class="section new-arrivals visible-items-5">
            <div class="container">
                <div class="row">
                    <header class="section-header clearfix col-sm-offset-3 col-sm-6">
                        <h3 class="section-title">服装推荐</h3>
                    </header>

                    <div class="clearfix"></div>

                    <div id="new-arrivals-products" class="add-cart" data-product=".product" data-thumbnail=".entry-media .thumb" data-title=".entry-title > a" data-url=".entry-title > a" data-price=".entry-price > .price">

                        <div class="owl-controls clickable outside">
                            <div class="owl-buttons">
                                <div class="owl-prev"><i class="iconfont-angle-left"></i></div>
                                <div class="owl-next"><i class="iconfont-angle-right"></i></div>
                            </div>
                        </div>

                        <div class="owl-carousel owl-theme" data-visible-items="4" data-navigation="true" data-lazyload="true">
                            <c:forEach items="${clothesList}" var="c">
                                <div class="product" data-product-id="${c.id}">
                                    <div class="entry-media">
                                        <span class="span-img-center-m"></span>
                                        <img data-src="${c.imgAddress}" alt="" class="lazyOwl thumb boy-clothes img-center-m" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <div class="circle ribbon ribbon-sale">HOT</div>
                                                </li>
                                                <li>
                                                    <a href="${c.imgAddress}" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="4.5" step="0.5" id="${c.id}" />
                                                <div class="rateit" data-rateit-backingfld="#${c.id}" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="#">
                                                <c:if test="${c.name.length() >18}">${c.name}</c:if>
                                                <c:if test="${c.name.length() <=18}">${c.name}<br>&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
                                            <%--${c.name}--%>
                                            </a>
                                        </h5>
                                        <div class="entry-price">
                                            <c:if test="${c.price == c.realityPrice}">
                                                <strong class="price">￥ ${c.realityPrice}</strong>
                                            </c:if>
                                            <c:if test="${c.price != c.realityPrice}">
                                                <s class="entry-discount">￥ ${c.price}</s>
                                                <strong class="accent-color price">￥ ${c.realityPrice}</strong>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>

                </div>
            </div>
        </section>

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
                                            <span class="list-icon"><i class="round-icon iconfont-map-marker"></i></span>
                                            <div class="list-content">中华人民共和国北京市东花市北里20号楼6单元501室</div>
                                        </li>
                                        <li>
                                            <span class="list-icon"><i class="round-icon iconfont-phone"></i></span>
                                            <div class="list-content">(+86)13171863532</div>
                                        </li>
                                        <li>
                                            <span class="list-icon"><i class="round-icon iconfont-envelope-alt"></i></span>
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
                                                <img src="images/demo/images-footer.jpg" alt="" />
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
                                            <input type="email" id="subscription-email" name="email" class="form-control" required />
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

<script src="/js/minified.js"></script>

<script>


</script>
<script src="/js/owl.carousel.js"></script>
<script src="/js/jquery.flexslider-min.js"></script>
<script src="/js/layer.js"></script>
<script>
    $(".add-to-collect").click(function () {
        var iconId = $(this).parents(".product").attr("data-product-id");
        $.ajax({
            url: "/user/addToCollect"
            ,type: "post"
            ,data: {"iconId": iconId}
            ,success: function (data) {
                if (data == "1") {
                    layer.msg('收藏成功', {icon: 6, time: 700, offset: '100px'});
                    return;
                }
                layer.msg(data, {icon: 5, anim: 0, offset: '100px'});
            }
            ,error: function () {
                layer.msg("当前系统繁忙，添加失败，请稍后再试！", {icon: 5, anim: 0, offset: '100px'});
            }
        });

    })
</script>
</body>
</html>
