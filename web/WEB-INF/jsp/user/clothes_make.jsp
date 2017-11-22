<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ho
  Date: 2017/11/13
  Time: 17:29
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
    <meta charset="UTF-8"/>
    <title>商品</title>

    <link rel="stylesheet" href="/css/minified.css">

    <script src="/js/jquery.min.js"></script>
    <script src="/js/modernizr.min.js"></script>
    <link rel="stylesheet" href="/css/jquery.nouislider.css">
    <link rel="stylesheet" href="/css/owl.carousel.css">
    <link rel="stylesheet" href="/css/owl.theme.css">
    <link rel="stylesheet" href="/css/innerpage.css">
    <link rel="stylesheet" href="/css/responsive.css">
    <link rel="stylesheet" href="/css/jquery.pagination.css">

    <link href="/css/demo1.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/css/jquery.flex-images.css">

    <script src="/js/jquery.easing.js" type="text/javascript"></script>

    <script src="/js/scroller.js" type="text/javascript"></script>

    <script src="/js/init.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/cloudzoom.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/cloudzoom.css">
    <link rel="stylesheet" type="text/css" href="/js/dist/css/demo.css">
    <link rel="stylesheet" type="text/css" href="/js/dist/css/dropify.min.css">
    <link rel="stylesheet" type="text/css" href="/css/imgHover.css">
    <style type="text/css">
        .girl-clothes {
            height: 260px;
        }

        .boy-clothes {
            height: 210px;
        }

        .adaption-m {
            background-size: cover !important;
        / / 只支持IE9 + -webkit-background-size: cover !important;
        / / webkit核心 -moz-background-size: cover !important;
        / / FF核心 -o-background-size: cover !important;
        / / 应该是Opera核心吧，反正不是IE的，就先不管它了
        }
    </style>
    <style>
        i {
            position: relative;
            top: 25%;
        }
        a:link { text-decoration: none;}
    　　 a:active { text-decoration:blink}
    　　 a:hover { text-decoration:underline;}
    　　 a:visited { text-decoration: none;}
    </style>
</head>
<body class="product-single">

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
                                <li><a href="#">我的账户</a></li>
                                <li><a href="cart.html">购物车</a></li>
                                <li><a href="login">登录/注册</a></li>
                                <%--<li><a href="#">注册</a></li>--%>
                                <li><a href="/j_spring_security_logout ">退出</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="logo-wrapper">
                        <a href="index.html" class="logo">
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
                                <a href="/icons">图标</a>
                            </li>
                            <li class="active">
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

    <div class="breadcrumb-container">

    </div>

    <main id="main-content" role="main">

        <section class="section">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-4">

                        <div class="product-preview">
                            <div id="see" class="big-image">
                                <img id="to_see" class="cloudzoom"
                                     data-cloudzoom="zoomImage: 'images/women/skirt/103314-0735_1_o.jpg', animationTime: 200, zoomHeight: 300, zoomWidth: 300"
                                     src="">
                            </div>
                            <ul class="thumbs unstyled clearfix">
                                <li><a id="turn1" href=""><img
                                        src="" alt=""/></a></li>
                                <li><a id="turn2" href=""><img
                                        src="" alt=""/></a></li>
                            </ul>
                        </div>
                        <!--
                    作者：714586750@qq.com
                    时间：2017-09-15
                    描述：添加
                -->
                        <div class="scroller demo1" style="">

                            <div class="inside" id="clothes">
                                <c:forEach items="${clothesList}" var="c">
                                    <a href="#" onclick="changeMessage(${c.id})" data=${c.id} class="adaption-m"><img src="${c.imgAddress}" alt="${c.name}"/></a>
                                </c:forEach>
                            </div>

                        </div>
                        <!--
                            作者：714586750@qq.com
                            时间：2017-09-15
                            描述：添加
                        -->
                    </div>

                    <div class="space40 visible-xs"></div>
                    <div class="col-xs-12 col-sm-8">
                        <section class="product-details add-cart">
                            <header class="entry-header">
                                <h2 id="clothesName" class="entry-title uppercase"></h2>
                            </header>
                            <article class="entry-content">
                                <figure>
                                    <span class="entry-price inline-middle">
                                        <strong id="clothesPrice" class="price" hidden></strong>
                                        <s id="clothesPrice2" class="entry-discount" hidden></s>
                                        <strong id="clothesRealityPrice" class="accent-color price" hidden></strong>
                                    </span>
                                    <div class="rate-bar inline-middle">
                                        <input type="range" value="4.5" step="0.5" id="backing0"/>
                                        <div class="rateit" data-rateit-backingfld="#backing0"
                                             data-rateit-starwidth="12" data-rateit-starheight="12"
                                             data-rateit-resetable="false" data-rateit-ispreset="true"
                                             data-rateit-min="0" data-rateit-max="5"></div>
                                    </div>
                                    <%--<span class="entry-review-count inline-middle">( 2 条点评 )</span>--%>

                                    <ul class="entry-meta unstyled">
                                        <li>
                                            <span class="key">品牌:</span>
                                            <span id="clothesType" class="value"></span>
                                        </li>
                                        <li>
                                            <span class="key">供应状态:</span>
                                            <span id="clothesNumber" class="value"></span>
                                        </li>
                                        <%--<li>--%>
                                        <%--<span class="key">商品信息:</span>--%>
                                        <%--<span class="value">${clothesList.get(0).desc1}</span>--%>
                                        <%--</li>--%>
                                    </ul>

                                    <div class="clearfix"></div>

                                    <figcaption class="m-b-sm">
                                        <h5 class="subheader uppercase">商品介绍:</h5>
                                        <p id="clothesDesc1"></p>
                                    </figcaption>

                                    <div class="row">
                                        <%--<div class="col-xs-12 col-sm-6">--%>
                                        <%--<h5 class="subheader uppercase">颜色:</h5>--%>
                                        <%--<div class="inline-middle styled-dd">--%>
                                        <%--<select>--%>
                                        <%--<option>-- 请选择 --</option>--%>
                                        <%--<option value="Black">白色</option>--%>
                                        <%--<option value="Aubergine">藏青色</option>--%>
                                        <%--</select>--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                        <div class="space30 visible-xs"></div>
                                        <div class="col-xs-12 col-sm-6">
                                            <h5 class="subheader uppercase">尺码:</h5>
                                            <div class="inline-middle styled-dd">
                                                <select id="clothesSize" onchange="changeNumber()">
                                                    <option id="origin-m" value="请选择">-- 请选择 --</option>
                                                    <option id="S" value="S">S</option>
                                                    <option id="M" value="M">M</option>
                                                    <option id="L" value="L">L</option>
                                                    <option id="XL" value="XL">XL</option>
                                                    <option id="XXL" value="XXL">XXL</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <ul class="inline-li li-m-r-l m-t-lg">
                                        <li>
                                            <a href="#" class="btn btn-default btn-lg btn-round add-to-cart">添加到购物车</a>
                                        </li>
                                        <li>
                                            <a href="#">+ 添加到收藏</a>
                                        </li>
                                        <li>
                                            <a href="#">+ 加入比较</a>
                                        </li>
                                    </ul>

                                </figure>
                            </article>
                        </section>
                    </div>
                </div>
                <div id="canvas"></div>
                <div class="m-t-lg" style="margin: 0;">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#product-description" class="tab-m" data-toggle="tab">我的收藏</a></li>
                        <li><a href="#product-reviews" class="tab-m" data-toggle="tab">精心推荐</a></li>
                        <li><a href="#product-shipping" class="tab-m" data-toggle="tab">收藏最多</a></li>
                        <li><a href="#product-uploading" class="tab-m" data-toggle="tab">自主上传</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="product-description">
                            <div style="max-width:1200px;margin:auto;padding:0 10px 10px">
                                <div id="demo1" class="flex-images img-show-m">

                                </div>
                            </div>
                            <div id="page1" class="m-pagination"></div>
                        </div>
                        <div class="tab-pane fade in active" id="product-reviews">
                            <div style="max-width:1200px;margin:auto;padding:0 10px 10px">
                                <div id="demo2" class="flex-images img-show-m">

                                </div>
                            </div>
                            <div id="page2" class="m-pagination"></div>
                        </div>
                        <div class="tab-pane fade in active" id="product-shipping">
                            <div style="max-width:1200px;margin:auto;padding:0 10px 10px">
                                <div id="demo3" class="flex-images img-show-m">

                                </div>
                            </div>
                            <div id="page3" class="m-pagination"></div>
                        </div>
                        <div class="tab-pane fade in active" id="product-uploading">
                            <input type="file" id="input-file-now" data-height="320" data-max-file-size="50M"  data-allowed-file-extensions="jpg png jpeg" class="dropify" />
                            <button id="uploadingIcon" class="btn btn-primary">开始制作</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="section visible-items-4">
            <div class="container">
                <div class="row">
                    <header class="section-header clearfix col-sm-offset-3 col-sm-6">
                        <h3 class="section-title">你可能会感兴趣</h3>
                    </header>

                    <div class="clearfix"></div>

                    <div id="featured-products" class="add-cart" data-product=".product"
                         data-thumbnail=".entry-media .thumb" data-title=".entry-title > a" data-url=".entry-title > a"
                         data-price=".entry-price > .price">

                        <div class="owl-controls clickable top">
                            <div class="owl-buttons">
                                <div class="owl-prev"><i class="iconfont-angle-left"></i></div>
                                <div class="owl-next"><i class="iconfont-angle-right"></i></div>
                            </div>
                        </div>

                        <div class="owl-carousel owl-theme" data-visible-items="4" data-navigation="true"
                             data-lazyload="true">
                            <c:forEach items="${recommendClothesList}" var="c">
                                <div class="product" data-product-id="${c.id}">
                                    <div class="entry-media">
                                        <span class="span-img-center-m"></span>
                                        <img data-src="${c.imgAddress}" alt=""
                                             class="lazyOwl thumb boy-clothes img-center-m"/>
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <div class="circle ribbon ribbon-sale">HOT</div>
                                                </li>
                                                <li>
                                                    <a href="${c.imgAddress}" class="circle" data-toggle="lightbox"><i
                                                            class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i
                                                            class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="4.5" step="0.5" id="${c.id}"/>
                                                <div class="rateit" data-rateit-backingfld="#${c.id}"
                                                     data-rateit-starwidth="12" data-rateit-starheight="12"
                                                     data-rateit-resetable="false" data-rateit-ispreset="true"
                                                     data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="#">
                                                <c:if test="${c.name.length() >18}">${c.name}</c:if>
                                                <c:if test="${c.name.length() <=18}">${c.name}
                                                    <br>&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
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

<script src="/js/minified.js"></script>

<script src="/js/jquery.nouislider.js"></script>
<script src="/js/owl.carousel.js"></script>
<script src="/js/products.js"></script>
<script src="/js/jquery.flex-images.js"></script>
<script src="/js/jquery.pagination-1.2.1.js"></script>
<script src="/js/layer.js"></script>
<script type="text/javascript" src="/js/html2canvas.js"></script>
<script type="text/javascript" src="/js/dist/js/dropify.min.js"></script>

<script>
    var clothesMap = new Map(); //构建clothes的Map对象，以用户ID为键
    <c:forEach items="${clothesList}" var="c">
    var map = new Map();
    map.set("name", '${c.name}');
    map.set("desc1", '${c.desc1}');
    map.set("type", "${c.type}");
    map.set("price", ${c.price});
    map.set("realityPrice", ${c.realityPrice});
    map.set("imgAddress", "${c.imgAddress}");
    map.set("backImgAddress", "${c.backImgAddress}");
    var goodsMap = new Map();
    goodsMap.set("${c.goods.get(0).size}", ${c.goods.get(0).number});
    goodsMap.set("${c.goods.get(1).size}", ${c.goods.get(1).number});
    goodsMap.set("${c.goods.get(2).size}", ${c.goods.get(2).number});
    goodsMap.set("${c.goods.get(3).size}", ${c.goods.get(3).number});
    goodsMap.set("${c.goods.get(4).size}", ${c.goods.get(4).number});
    goodsMap.set("${c.goods.get(5).size}", ${c.goods.get(5).number});
    map.set("goods", goodsMap);
    clothesMap.set(${c.id}, map);
    </c:forEach>

//    $(".adaption-m").hide();  //设置所有款式衣服图片初始隐藏，待下面加载完毕后显示

    function changeMessage(id) {  //点击衣服后切换对应属性
        var map = clothesMap.get(id);
        $("#clothesName").text(map.get("name"));
        $("#clothesType").text(map.get("type"));
        $("#clothesDesc1").text(map.get("desc1"));

        var goods = map.get("goods");
        $("#S").val(goods.get("S"));
        $("#M").val(goods.get("M"));
        $("#L").val(goods.get("L"));
        $("#XL").val(goods.get("XXL"));
        $("#XXL").val(goods.get("XXL"));

        changeNumber(); //修改供应状态

        var price = map.get("price");  //设置价格显示
        var realityPrice = map.get("realityPrice");
        if(price == realityPrice) {
            $("#clothesRealityPrice").hide();
            $("#clothesPrice2").hide();
            $("#clothesPrice").show().text("￥ " + price);
        } else {
            $("#clothesPrice").hide();
            $("#clothesPrice2").show().text("￥ " + price);
            $("#clothesRealityPrice").show().text("￥ " + realityPrice);
        }

        //修改衣服显示图片
        $("#turn1").attr("href", map.get("imgAddress")).children().eq(0).attr("src", map.get("imgAddress"));
        $("#turn2").attr("href", map.get("backImgAddress")).children().eq(0).attr("src", map.get("backImgAddress"));
        changeClothesImg($("#turn1"));
    }

    function changeClothesImg(data) {
        $("#to_see").remove();
        $("<img>", {
            id: "to_see",
            class: "cloudzoom",
            src: $(data).children().eq(0).attr("src")
        }).attr("data-cloudzoom", "zoomImage: '" + $(data).attr("href") + "', animationTime: 200").appendTo($("#see"));
        CloudZoom.quickStart();
    }

    function changeNumber() { //当选择尺码后，修改供应状态
        var num = $("#clothesSize").val();
        if(num == '请选择') {
            $("#clothesNumber").text("选择尺码后获取");
            return;
        }
        if(num >= 500) {
            $("#clothesNumber").text("充足");
        } else if (num >= 100) {
            $("#clothesNumber").text("正常");
        } else if(num > 0) {
            $("#clothesNumber").text("仅剩 " + num);
        } else {
            $("#clothesNumber").text("缺货");
        }
    }

    function editImg(data) {   //打开编辑图片窗口
        var nowClothes = $("#clothes > .active");
        var nowId = parseInt(nowClothes.attr("data"));
        var map = clothesMap.get(nowId);
        layer.open({
            type: 2
            ,content: "/html/img_edit.html"
            ,area: ['1120px', '565px']
            ,offset: '10px'
            ,closeBtn: 2
            ,title: false
            ,scrollbar: false
            ,btn: ['保存', '取消']
            ,btnAlign: 'c'
            ,yes: function(index, layero){
                var img = layer.getChildFrame("#img")[0];
                html2canvas(img, {   //截图img图片，保存数据
                    onrendered: function(canvas) {
                        var dataImgURL = canvas.toDataURL();
                        map.set("imgAddress", dataImgURL);
                        clothesMap.set(nowId, map);
                        setTimeout("changeMessage(" + nowId + ")", 200);
                    },
                });
                var backImg = layer.getChildFrame("#backImg")[0]
                html2canvas(backImg, {  //截图backImg图片，保存数据
                    onrendered: function(canvas) {
                        var dataImgURL = canvas.toDataURL();
                        map.set("backImgAddress", dataImgURL);
                        clothesMap.set(nowId, map);
//                        var str = clothesMap.get(nowId).get("imgAddress");
//                        alert(str);
                        setTimeout("changeMessage(" + nowId + ")", 200);
                    },
                });
                setTimeout("layer.close(" + index + ")", 200);
            }
            ,btn2: function(index, layero){
                //按钮【按钮二】的回调

                //return false 开启该代码可禁止点击该按钮关闭
            }
            ,success: function (layero, index) {
                var btn = layero.find('.layui-layer-btn');
                btn.css('text-align', 'center');
                var str1 = $("#turn1").attr("href");
                var str2 = $("#turn2").attr("href");
                if(str1.substring(0, 4) != 'data') {  //验证是否为截图后的数据，如果是则不能加 "/"
                    str1 = "/" + str1;
                    str2 = "/" + str2;
                }

//                layer.getChildFrame("#img").css("background", "url(" + str1 + ")").css("background-size", "480px 480px");
//                layer.getChildFrame("#backImg").css("background", "url(" + str2 + ")").css("background-size", "480px 480px");
                layer.getChildFrame("#imgOriginal").attr("src", str1);
                layer.getChildFrame("#backImgOriginal").attr("src", str2);
                layer.getChildFrame("#data").attr("src", "/" + $(data).find(".item-img-m").attr("src"))
            }
        })
    }

    function pageChange(result, idCss) {
        var data = result.data;
        var icon;
        $(idCss).children().remove();
        for (var i = 0; i < data.length; i++) {
            icon = data[i];
            var $div = $("<div class='item viwe' onclick='javascript: editImg(this);' style='data-w='300' data-h='200'></div>");
            var $img = $("<img class='item-img-m' src='" + icon.imgAddress + "'>");
            var divHover = $("<div class='hover-m'>");
            var h2 = $("<h2 class='h2-m'>").text(icon.name);
            var p = $("<p class='p-m'>").text(icon.desc1);
            divHover.append(h2).append(p);
            $div.append(divHover);
            $div.append($img);
            $(idCss).append($div);
        }
        $(idCss).flexImages({rowHeight: 200});
    }
    $(function () {
        $('.dropify').dropify({   //实例化上传组件
            messages: {
                default: '从电脑拖放一个图片到这里或者点击这里',
                replace: '拖放或者点击这里来替换当前图片'
//                error:   '对不起，该文件暂不允许上传，({{ error }}'
            }
        });

        $("#uploadingIcon").click(function () {
            var nowClothes = $("#clothes > .active");
            var nowId = parseInt(nowClothes.attr("data"));
            var map = clothesMap.get(nowId);
            layer.open({
                type: 2
                ,content: "/html/img_edit.html"
                ,area: ['1120px', '565px']
                ,offset: '10px'
                ,closeBtn: 2
                ,title: false
                ,scrollbar: false
                ,btn: ['保存', '取消']
                ,btnAlign: 'c'
                ,yes: function(index, layero){
                    var img = layer.getChildFrame("#img")[0];
                    html2canvas(img, {   //截图img图片，保存数据
                        onrendered: function(canvas) {
                            var dataImgURL = canvas.toDataURL();
                            map.set("imgAddress", dataImgURL);
                            clothesMap.set(nowId, map);
                            setTimeout("changeMessage(" + nowId + ")", 200);
                        },
                    });
                    var backImg = layer.getChildFrame("#backImg")[0]
                    html2canvas(backImg, {  //截图backImg图片，保存数据
                        onrendered: function(canvas) {
                            var dataImgURL = canvas.toDataURL();
                            map.set("backImgAddress", dataImgURL);
                            clothesMap.set(nowId, map);
//                        var str = clothesMap.get(nowId).get("imgAddress");
//                        alert(str);
                            setTimeout("changeMessage(" + nowId + ")", 200);
                        },
                    });
                    setTimeout("layer.close(" + index + ")", 200);
                }
                ,btn2: function(index, layero){
                    //按钮【按钮二】的回调

                    //return false 开启该代码可禁止点击该按钮关闭
                }
                ,success: function (layero, index) {
                    var btn = layero.find('.layui-layer-btn');
                    btn.css('text-align', 'center');
                    var str1 = $("#turn1").attr("href");
                    var str2 = $("#turn2").attr("href");
                    if(str1.substring(0, 4) != 'data') {  //验证是否为截图后的数据，如果是则不能加 "/"
                        str1 = "/" + str1;
                        str2 = "/" + str2;
                    }

//                layer.getChildFrame("#img").css("background", "url(" + str1 + ")").css("background-size", "480px 480px");
//                layer.getChildFrame("#backImg").css("background", "url(" + str2 + ")").css("background-size", "480px 480px");
                    layer.getChildFrame("#imgOriginal").attr("src", str1);
                    layer.getChildFrame("#backImgOriginal").attr("src", str2);
                    layer.getChildFrame("#data").attr("src", $(".dropify-render > img").attr("src"))
                }
            })
        });

        var length = $(".adaption-m").length / 2;
        $(".adaption-m").eq(Math.round(length) - 1).click();

        var disqus_shortname = 'gfashion';
        $('#turn1').click(function () {
            changeClothesImg(this);
        })
        $('#turn2').click(function () {
            changeClothesImg(this);
        })

        $("#page1").page({
            firstBtnText: '首页',
            lastBtnText: '尾页',
            prevBtnText: '上一页',
            nextBtnText: '下一页',
            showInfo: true,
            showJump: true,
            jumpBtnText: '跳转',
            showPageSizes: true,
            infoFormat: '{start} ~ {end}条，共{total}条',
            remote: {
                url: '/user/getCollectIcon',  //请求地址
                params: {},       //自定义请求参数
                callback: function (result, pageIndex) {
                    //回调函数
                    //result 为 请求返回的数据，呈现数据
                    pageChange(result, "#demo1");
                },
                pageIndexName: 'page',     //请求参数，当前页数，索引从0开始
                pageSizeName: 'num',       //请求参数，每页数量
                totalName: 'total'              //指定返回数据的总数据量的字段名
            }
        });
        $("#page2").page({
            firstBtnText: '首页',
            lastBtnText: '尾页',
            prevBtnText: '上一页',
            nextBtnText: '下一页',
            showInfo: true,
            showJump: true,
            jumpBtnText: '跳转',
            showPageSizes: true,
            infoFormat: '{start} ~ {end}条，共{total}条',
            remote: {
                url: '/user/getRecommendIcon',  //请求地址
                params: {},       //自定义请求参数
                callback: function (result, pageIndex) {
                    //回调函数
                    //result 为 请求返回的数据，呈现数据
                    pageChange(result, "#demo2");
                },
                pageIndexName: 'page',     //请求参数，当前页数，索引从0开始
                pageSizeName: 'num',       //请求参数，每页数量
                totalName: 'total'              //指定返回数据的总数据量的字段名
            }
        });

        $("#page3").page({
            firstBtnText: '首页',
            lastBtnText: '尾页',
            prevBtnText: '上一页',
            nextBtnText: '下一页',
            showInfo: true,
            showJump: true,
            jumpBtnText: '跳转',
            showPageSizes: true,
            infoFormat: '{start} ~ {end}条，共{total}条',
            remote: {
                url: '/user/getCollectMaxIcon',  //请求地址
                params: {},       //自定义请求参数
                callback: function (result, pageIndex) {
                    //回调函数
                    //result 为 请求返回的数据，呈现数据
                    pageChange(result, "#demo3");
                },
                pageIndexName: 'page',     //请求参数，当前页数，索引从0开始
                pageSizeName: 'num',       //请求参数，每页数量
                totalName: 'total'              //指定返回数据的总数据量的字段名
            }
        });

        $("#product-reviews").attr("class", "tab-pane fade in"); //设置精心推荐和收藏最多为未选中
        $("#product-shipping").attr("class", "tab-pane fade in");
        $("#product-uploading").attr("class", "tab-pane fade in");
    })
</script>

</body>
</html>