<%--
  Created by IntelliJ IDEA.
  User: ho
  Date: 2017/10/31
  Time: 16:56
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
    <meta charset="UTF-8" />
    <title>服装商城</title>
    <link rel="stylesheet" href="css/minified.css">
    <script src="js/jquery.min.js"></script>
    <script src="js/modernizr.min.js"></script>
    <link rel="stylesheet" href="css/jquery.nouislider.css">
    <link rel="stylesheet" href="css/isotope.css">
    <link rel="stylesheet" href="css/innerpage.css">
    <link rel="stylesheet" href="css/responsive.css">
    <style>
        i {
            position: relative;
            top: 25%;
        }
    </style>
</head>
<body class="products-view" >

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
                                <li><a href="#">查看</a></li>
                                <li><a href="#">退出</a></li>
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
                            <li class="active">
                                <a href="icons">图标</a>
                            </li>
                            <li>
                                <a href="product.html">衬衫定制</a>
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
        <div class="container">
            <div class="relative">
                <ul class="bc push-up unstyled clearfix">
                    <li><a href="index.html">首页</a></li>
                    <li class="active">女装</li>
                </ul>
            </div>
        </div>
    </div>

    <main id="main-content" role="main">
        <div class="container">
            <div class="row">

                <div class="m-t-b clearfix">
                    <aside class="col-xs-12 col-sm-4 col-md-3">
                        <section class="sidebar push-up">

                            <section class="side-section bg-white">
                                <header class="side-section-header">
                                    <h3 class="side-section-title">类别</h3>
                                </header>
                                <div class="side-section-content">
                                    <ul id="category-list" class="vmenu unstyled">
                                        <li>
                                            <input type="checkbox" id="check-women" class="prettyCheckable" data-label="女装" data-labelPosition="right" value="women" />
                                            <ul>
                                                <li><input type="checkbox" id="check-women-accessories" class="prettyCheckable" data-label="饰品" data-labelPosition="right" value="women-accessories" /></li>
                                                <li><input type="checkbox" id="check-women-swimwear" class="prettyCheckable" data-label="游泳衣" data-labelPosition="right" value="women-swimwear" /></li>
                                                <li><input type="checkbox" id="check-women-basics" class="prettyCheckable" data-label="日常" data-labelPosition="right" value="women-basics" /></li>
                                                <li><input type="checkbox" id="check-women-dresses" class="prettyCheckable" data-label="连衣裙" data-labelPosition="right" value="women-dresses" /></li>
                                                <li><input type="checkbox" id="check-women-jeans" class="prettyCheckable" data-label="牛仔裤" data-labelPosition="right" value="women-jeans" /></li>
                                                <li><input type="checkbox" id="check-women-skirt" class="prettyCheckable" data-label="裙子" data-labelPosition="right" value="women-skirt" /></li>
                                                <li><input type="checkbox" id="check-women-legging" class="prettyCheckable" data-label="打底裤" data-labelPosition="right" value="women-legging" /></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="check-men" class="prettyCheckable" data-label="男装" data-labelPosition="right" value="men" />
                                            <ul>
                                                <li><input type="checkbox" id="check-men-accessories" class="prettyCheckable" data-label="饰品" data-labelPosition="right" value="men-accessories" /></li>
                                                <li><input type="checkbox" id="check-men-jacket" class="prettyCheckable" data-label="夹克" data-labelPosition="right" value="men-jacket" /></li>
                                                <li><input type="checkbox" id="check-men-jumper" class="prettyCheckable" data-label="短袖" data-labelPosition="right" value="men-jumper" /></li>
                                                <li><input type="checkbox" id="check-men-jean" class="prettyCheckable" data-label="牛仔裤" data-labelPosition="right" value="men-jean" /></li>
                                                <li><input type="checkbox" id="check-men-shoe" class="prettyCheckable" data-label="鞋" data-labelPosition="right" value="men-shoe" /></li>
                                                <li><input type="checkbox" id="check-men-tshirt" class="prettyCheckable" data-label=" T恤" data-labelPosition="right" value="men-tshirt" /></li>
                                                <li><input type="checkbox" id="check-men-blazers" class="prettyCheckable" data-label="西服" data-labelPosition="right" value="men-blazers" /></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <input type="checkbox" id="check-beauty" class="prettyCheckable" data-label="韩版潮流" data-labelPosition="right" value="makeup" />
                                        </li>
                                        <li>
                                            <input type="checkbox" id="check-best" class="prettyCheckable" data-label="最畅销" data-labelPosition="right" value="best" />
                                        </li>
                                        <li>
                                            <input type="checkbox" id="check-new" class="prettyCheckable" data-label="新到货" data-labelPosition="right" value="new" />
                                        </li>
                                    </ul>
                                </div>
                                <footer class="side-section-footer text-center hide">
                                    <button type="button" id="btn-filter-cat" class="btn btn-primary btn-round uppercase">清除筛选</button>
                                </footer>
                            </section>

                            <section class="side-section bg-white">
                                <header class="side-section-header">
                                    <h3 class="side-section-title">品牌</h3>
                                </header>
                                <div class="side-section-content">
                                    <ul id="brands-list" class="vmenu unstyled">
                                        <li>
                                            <input type="checkbox" id="check-brand1" class="prettyCheckable" data-label="太平鸟" data-labelPosition="right" value="brand1" />
                                        </li>
                                        <li>
                                            <input type="checkbox" id="check-brand2" class="prettyCheckable" data-label="真维斯" data-labelPosition="right" value="brand2" />
                                        </li>
                                        <li>
                                            <input type="checkbox" id="check-brand3" class="prettyCheckable" data-label="美特斯邦威" data-labelPosition="right" value="brand3" />
                                        </li>
                                        <li>
                                            <input type="checkbox" id="check-brand4" class="prettyCheckable" data-label="森马" data-labelPosition="right" value="brand4" />
                                        </li>
                                        <li>
                                            <input type="checkbox" id="check-brand5" class="prettyCheckable" data-label="红豆" data-labelPosition="right" value="brand5" />
                                        </li>
                                    </ul>
                                </div>
                                <footer class="side-section-footer text-center hide">
                                    <button type="button" id="btn-filter-brand" class="btn btn-primary btn-round uppercase">Clear Filters</button>
                                </footer>
                            </section>

                            <section class="side-section bg-white">
                                <header class="side-section-header">
                                    <h3 class="side-section-title">筛选</h3>
                                </header>

                                <div id="filter-by-price" class="side-section-content">
                                    <h4 class="side-section-subheader">按价格筛选</h4>
                                    <div class="range-slider-container">
                                        <div class="range-slider" data-min="0" data-max="2000" data-step="10" data-currency="￥"></div>
                                        <div class="range-slider-value clearfix">
                                            <span>价格: &ensp;</span>
                                            <span class="min"></span>
                                            <span class="max"></span>
                                        </div>
                                    </div>
                                </div>

                                <div id="filter-by-size" class="side-section-content">
                                    <h4 class="side-section-subheader">按尺寸筛选</h4>
                                    <ul class="inline-li li-m-lg text-center unstyled">
                                        <li>
                                            <a href="#" class="round-icon" data-toggle="tooltip" data-title="X-Small / UK 8"><small>XS</small></a>
                                            <input type="checkbox" class="filter-checkbox filter-size" value="XS" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon" data-toggle="tooltip" data-title="Small / UK 10"><small>S</small></a>
                                            <input type="checkbox" class="filter-checkbox filter-size" value="S" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon" data-toggle="tooltip" data-title="Medium / UK 12"><small>M</small></a>
                                            <input type="checkbox" class="filter-checkbox filter-size" value="M" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon" data-toggle="tooltip" data-title="Large / UK 14"><small>L</small></a>
                                            <input type="checkbox" class="filter-checkbox filter-size" value="L" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon" data-toggle="tooltip" data-title="X-Large / UK 16"><small>XL</small></a>
                                            <input type="checkbox" class="filter-checkbox filter-size" value="XL" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon" data-toggle="tooltip" data-title="XX-Large"><small>XXL</small></a>
                                            <input type="checkbox" class="filter-checkbox filter-size" value="XXL" />
                                        </li>
                                    </ul>
                                </div>

                                <div id="filter-by-color" class="side-section-content">
                                    <h4 class="side-section-subheader">按颜色筛选</h4>
                                    <ul class="inline-li li-m-sm text-center unstyled">
                                        <li>
                                            <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="黑色" style="background: #000;"></a>
                                            <input type="checkbox" class="filter-checkbox filter-color" value="black" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="白色" style="background: #fff; border-color: #acacac;"></a>
                                            <input type="checkbox" class="filter-checkbox filter-color" value="white" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="绿色" style="background: #60bd0d;"></a>
                                            <input type="checkbox" class="filter-checkbox filter-color" value="green" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="红色" style="background: #ff5757;"></a>
                                            <input type="checkbox" class="filter-checkbox filter-color" value="red" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="蓝色" style="background: #0d9abd;"></a>
                                            <input type="checkbox" class="filter-checkbox filter-color" value="blue" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="棕色" style="background: #c57313;"></a>
                                            <input type="checkbox" class="filter-checkbox filter-color" value="brown" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="紫色" style="background: #a613c5;"></a>
                                            <input type="checkbox" class="filter-checkbox filter-color" value="purple" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="银色" style="background: #e5e5e8;"></a>
                                            <input type="checkbox" class="filter-checkbox filter-color" value="silver" />
                                        </li>
                                        <li>
                                            <a href="#" class="round-icon color-box" data-toggle="tooltip" data-title="花格" style="background: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAYAAACp8Z5+AAAAHklEQVQIW2NkYGD4D8QgwAgjMASgCiAqwcqgACwAAIrDBAOqGrGNAAAAAElFTkSuQmCC');"></a>
                                            <input type="checkbox" class="filter-checkbox filter-color" value="patternie" />
                                        </li>
                                    </ul>
                                </div>
                            </section>

                            <section class="side-section bg-white">
                                <header class="side-section-header">
                                    <h3 class="side-section-title">最畅销</h3>
                                </header>
                                <div class="side-section-content">
                                    <ul class="product-medialist li-m-t unstyled clearfix">
                                        <li>
                                            <div class="item clearfix">
                                                <a href="images/women/basic/688086-0286_1.jpg" data-toggle="lightbox" class="entry-thumbnail">
                                                    <img src="images/women/basic/688086-0286_1_t.jpg" alt="Inceptos orci hac libero" />
                                                </a>
                                                <h5 class="entry-title"><a href="product.html">範M 衬衫女春装新款 </a></h5>
                                                <s class="entry-discount m-r-sm"><span class="text-sm">￥ 350.00</span></s>
                                                <span class="entry-price accent-color">￥ 250.00</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="item clearfix">
                                                <a href="images/women/basic/589550-0014_1.jpg" data-toggle="lightbox" class="entry-thumbnail">
                                                    <img src="images/women/basic/589550-0014_1_t.jpg" alt="Inceptos orci hac libero" />
                                                </a>
                                                <h5 class="entry-title"><a href="product.html">新款韩版时尚宽松衬衫</a></h5>
                                                <span class="entry-price">￥ 350.00</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </section>

                            <div class="promo inverse-background" style="background: url('images/demo/Barn-Dress-Girl_t.jpg') no-repeat; background-size: auto 100%;">
                                <div class="inner text-center np">
                                    <div class="ribbon">
                                        <h6 class="nmb">新到货</h6>
                                        <h5 class="text-semibold uppercase nmb">时尚皮衣 </h5>
                                        <div class="space10"></div>
                                        <a href="products.html" class="with-icon prepend-icon"><i class="iconfont-caret-right"></i><span>现在去购物</span></a>
                                    </div>
                                </div>
                            </div>

                        </section>
                    </aside>
                    <section class="col-xs-12 col-sm-8 col-md-9">

                        <section class="products-wrapper">
                            <header class="products-header">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-6 center-xs">
                                        <ul class="unstyled inline-li li-m-r-l-sm pull-left">
                                            <li><a class="round-icon active" href="#" data-toggle="tooltip" data-layout="grid" data-title="切换成网格布局"><i class="iconfont-th"></i></a></li>
                                            <li><a class="round-icon" href="#" data-toggle="tooltip" data-layout="list" data-title="切换成详细布局"><i class="iconfont-list"></i></a></li>
                                        </ul>

                                        <div class="pull-right m-l-lg">
                                            <span class="inline-middle m-r-sm text-xs">Show</span>
                                            <div class="inline-middle styled-dd">
                                                <select>
                                                    <option value="9">9</option>
                                                    <option value="12" selected>12</option>
                                                    <option value="24">24</option>
                                                    <option value="36">36</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="space30 visible-xs"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-6 center-xs">
                                        <ul class="paginator li-m-r-l pull-right">
                                            <li><a class="round-icon" href="#" data-toggle="tooltip" data-title="Previous Page"><i class="iconfont-angle-left"></i></a></li>
                                            <li><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">5</a></li>
                                            <li><a class="round-icon" href="#" data-toggle="tooltip" data-title="Next Page"><i class="iconfont-angle-right"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </header>

                            <div class="products-layout grid m-t-b add-cart" data-product=".product" data-thumbnail=".entry-media .thumb" data-title=".entry-title > a" data-url=".entry-title > a" data-price=".entry-price > .price">

                                <div class="product" data-product-id="1" data-category="women-jeans|women-skirt" data-brand="brand1" data-price="250" data-colors="red|blue|black|white" data-size="S|M|L">
                                    <div class="entry-media">
                                        <img data-src="images/women/skirt/430041-0014_1_t.jpg" alt="" class="lazyLoad thumb" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <div class="circle ribbon ribbon-sale">Sale</div>
                                                </li>
                                                <li>
                                                    <a href="images/women/skirt/430041-0014_1.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="4.5" step="0.5" id="backing1" />
                                                <div class="rateit" data-rateit-backingfld="#backing1" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="product.html">春装新款上衣亮片宽松韩版体恤白色长袖棉麻T恤 </a>
                                        </h5>
                                        <div class="entry-description visible-list">
                                            <p>我们对每一件衣服都精选面料，舒适抗皱。价格低质量好，款式大气做工精细。我们带给您的真正性价比，  如果不满意全额退款！</p>
                                        </div>
                                        <div class="entry-price">
                                            <s class="entry-discount">￥ 350.00</s>
                                            <strong class="accent-color price">￥ 250.00</strong>
                                            <a href="#" class="btn btn-round btn-default add-to-cart visible-list">加入到购物车</a>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="#" class="pull-left m-r">+ 添加到收藏</a>
                                            <a href="#" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="product" data-product-id="2" data-category="women|women-accessories|women-basics|women-legging|new|best" data-brand="brand2" data-price="450" data-colors="red|green|black|white|silver" data-size="XS|S|M">
                                    <div class="entry-media">
                                        <img data-src="images/women/accessories/582120-0029_1_t.jpg" alt="" class="lazyLoad thumb" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <a href="images/women/accessories/582120-0029_1.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="4" step="0.5" id="backing2" />
                                                <div class="rateit" data-rateit-backingfld="#backing2" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="product.html">韩版春秋遮阳防晒帽可折叠渔夫帽防紫外线大沿太阳帽 </a>
                                        </h5>
                                        <div class="entry-description visible-list">
                                            <p>我们对每一件衣服都精选面料，舒适抗皱。价格低质量好，款式大气做工精细。我们带给您的真正性价比，  如果不满意全额退款！</p>
                                        </div>
                                        <div class="entry-price">
                                            <strong class="price">￥ 350.00</strong>
                                            <a href="#" class="btn btn-round btn-default add-to-cart visible-list">加入到购物车</a>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="#" class="pull-left m-r">+ 添加到收藏</a>
                                            <a href="#" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="product" data-product-id="3" data-category="men|men-accessories|new" data-brand="brand2" data-price="450" data-colors="purple|brown|black|white|patternie" data-size="S|M|L|XL">
                                    <div class="entry-media">
                                        <img data-src="images/men/accessories/255615-0014_1_t.jpg" alt="" class="lazyLoad thumb" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <div class="circle ribbon ribbon-new">New</div>
                                                </li>
                                                <li>
                                                    <a href="images/men/accessories/255615-0014_1.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="3.5" step="0.5" id="backing3" />
                                                <div class="rateit" data-rateit-backingfld="#backing3" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="product.html">薄款包头帽子男韩版潮春夏天时尚头巾睡帽月子帽套头帽</a>
                                        </h5>
                                        <div class="entry-description visible-list">
                                            <p>我们对每一件衣服都精选面料，舒适抗皱。价格低质量好，款式大气做工精细。我们带给您的真正性价比，  如果不满意全额退款！</p>
                                        </div>
                                        <div class="entry-price">
                                            <strong class="price">￥ 450.00</strong>
                                            <a href="#" class="btn btn-round btn-default add-to-cart visible-list">加入到购物车</a>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="#" class="pull-left m-r">+ 添加到收藏</a>
                                            <a href="#" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="product" data-product-id="4" data-category="men|men-jacket|men-jeans|men-blazers" data-brand="brand3" data-price="350" data-colors="purple|brown|black|white|red" data-size="S|M|L|XL|XXL">
                                    <div class="entry-media">
                                        <img data-src="images/men/blazer/677326-0014_1_t.jpg" alt="" class="lazyLoad thumb" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <a href="images/men/blazer/677326-0014_1.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="5" step="0.5" id="backing4" />
                                                <div class="rateit" data-rateit-backingfld="#backing4" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="product.html">春季新款商务休闲西服男装外修身韩版青年单西上衣 </a>
                                        </h5>
                                        <div class="entry-description visible-list">
                                            <p>我们对每一件衣服都精选面料，舒适抗皱。价格低质量好，款式大气做工精细。我们带给您的真正性价比，  如果不满意全额退款！</p>
                                        </div>
                                        <div class="entry-price">
                                            <strong class="price">￥ 350.00</strong>
                                            <a href="#" class="btn btn-round btn-default add-to-cart visible-list">加入到购物车</a>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="#" class="pull-left m-r">+ 添加到收藏</a>
                                            <a href="#" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="product" data-product-id="5" data-category="men|men-shoe|new" data-brand="brand4" data-price="250" data-colors="brown|silver|black|green|red" data-size="L|XL|XXL">
                                    <div class="entry-media">
                                        <img data-src="images/men/shoes/000312-2259_1_t.jpg" alt="" class="lazyLoad thumb" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <div class="circle ribbon ribbon-sale">Sale</div>
                                                </li>
                                                <li>
                                                    <a href="images/men/shoes/000312-2259_1.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="4.5" step="0.5" id="backing5" />
                                                <div class="rateit" data-rateit-backingfld="#backing5" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="product.html">2017新款春季低帮学生帆布潮鞋男士布鞋韩版 </a>
                                        </h5>
                                        <div class="entry-description visible-list">
                                            <p>我们对每一件衣服都精选面料，舒适抗皱。价格低质量好，款式大气做工精细。我们带给您的真正性价比，  如果不满意全额退款！</p>
                                        </div>
                                        <div class="entry-price">
                                            <s class="entry-discount">￥ 350.00</s>
                                            <strong class="accent-color price">￥ 250.00</strong>
                                            <a href="#" class="btn btn-round btn-default add-to-cart visible-list">加入到购物车</a>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="#" class="pull-left m-r">+ 添加到收藏</a>
                                            <a href="#" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="product" data-product-id="6" data-category="women|women-legging|women-dresses|women-jeans|women-skirt" data-brand="brand5" data-price="350" data-colors="white|silver|green|red|blue" data-size="XS|S">
                                    <div class="entry-media">
                                        <img data-src="images/women/jeans/220008-0054_1_t.jpg" alt="" class="lazyLoad thumb" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <a href="images/women/jeans/220008-0054_1.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="4" step="0.5" id="backing6" />
                                                <div class="rateit" data-rateit-backingfld="#backing6" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="product.html">韩国新品高腰牛仔裤女春夏烟灰色九分裤 </a>
                                        </h5>
                                        <div class="entry-description visible-list">
                                            <p>我们对每一件衣服都精选面料，舒适抗皱。价格低质量好，款式大气做工精细。我们带给您的真正性价比，  如果不满意全额退款！</p>
                                        </div>
                                        <div class="entry-price">
                                            <strong class="price">￥ 350.00</strong>
                                            <a href="#" class="btn btn-round btn-default add-to-cart visible-list">加入到购物车</a>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="#" class="pull-left m-r">+ 添加到收藏</a>
                                            <a href="#" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="product" data-product-id="7" data-category="women|women-swimwear|best|new" data-brand="brand5" data-price="150" data-colors="white|black|patternie" data-size="XS|S">
                                    <div class="entry-media">
                                        <img data-src="images/women/swimwear/116796-0001_1_t.jpg" alt="" class="lazyLoad thumb" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <div class="circle ribbon ribbon-new">New</div>
                                                </li>
                                                <li>
                                                    <a href="images/women/swimwear/116796-0001_1.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="3.5" step="0.5" id="backing7" />
                                                <div class="rateit" data-rateit-backingfld="#backing7" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="product.html">英发泳衣女士保守连体平角温泉性感游泳衣 </a>
                                        </h5>
                                        <div class="entry-description visible-list">
                                            <p>我们对每一件衣服都精选面料，舒适抗皱。价格低质量好，款式大气做工精细。我们带给您的真正性价比，  如果不满意全额退款！</p>
                                        </div>
                                        <div class="entry-price">
                                            <strong class="price">￥ 150.00</strong>
                                            <a href="#" class="btn btn-round btn-default add-to-cart visible-list">加入到购物车</a>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="#" class="pull-left m-r">+ 添加到收藏</a>
                                            <a href="#" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="product" data-product-id="8" data-category="women|women-dresses|best" data-brand="brand4" data-price="350" data-colors="white|black" data-size="XS|S|L">
                                    <div class="entry-media">
                                        <img data-src="images/women/dress/278638-0083_1_t.jpg" alt="" class="lazyLoad thumb" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <a href="images/women/dress/278638-0083_1.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="5" step="0.5" id="backing8" />
                                                <div class="rateit" data-rateit-backingfld="#backing8" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="product.html">2017春装新款碎花衬衫女装长袖韩版甜美小清新</a>
                                        </h5>
                                        <div class="entry-description visible-list">
                                            <p>我们对每一件衣服都精选面料，舒适抗皱。价格低质量好，款式大气做工精细。我们带给您的真正性价比，  如果不满意全额退款！</p>
                                        </div>
                                        <div class="entry-price">
                                            <strong class="price">￥ 350.00</strong>
                                            <a href="#" class="btn btn-round btn-default add-to-cart visible-list">加入到购物车</a>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="#" class="pull-left m-r">+ 添加到收藏</a>
                                            <a href="#" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="product" data-product-id="9" data-category="men|best|new|men-tshirt|men-jumper" data-brand="brand5" data-price="850" data-colors="white|black" data-size="L|XL|XXL">
                                    <div class="entry-media">
                                        <img data-src="images/men/accessories/000095-0014_2_t.jpg" alt="" class="lazyLoad thumb" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <a href="images/men/accessories/000095-0014_2.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="5" step="0.5" id="backing9" />
                                                <div class="rateit" data-rateit-backingfld="#backing9" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="product.html">小胡子店2017小清新宽条纹精美男上衣条纹短袖</a>
                                        </h5>
                                        <div class="entry-description visible-list">
                                            <p>我们对每一件衣服都精选面料，舒适抗皱。价格低质量好，款式大气做工精细。我们带给您的真正性价比，  如果不满意全额退款！</p>
                                        </div>
                                        <div class="entry-price">
                                            <strong class="price">￥ 850.00</strong>
                                            <a href="#" class="btn btn-round btn-default add-to-cart visible-list">加入到购物车</a>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="#" class="pull-left m-r">+ 添加到收藏</a>
                                            <a href="#" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="product" data-product-id="10" data-category="women|women-basics|new" data-brand="brand1" data-price="550" data-colors="white|black|patternie" data-size="XS|S">
                                    <div class="entry-media">
                                        <img data-src="images/women/basic/848051-0014_1_t.jpg" alt="" class="lazyLoad thumb" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <a href="images/women/basic/848051-0014_1.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="3.5" step="0.5" id="backing10" />
                                                <div class="rateit" data-rateit-backingfld="#backing10" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="product.html">2017春装新款雪纺衫女长袖韩版荷叶边喇叭袖 </a>
                                        </h5>
                                        <div class="entry-description visible-list">
                                            <p>我们对每一件衣服都精选面料，舒适抗皱。价格低质量好，款式大气做工精细。我们带给您的真正性价比，  如果不满意全额退款！</p>
                                        </div>
                                        <div class="entry-price">
                                            <strong class="price">￥ 550.00</strong>
                                            <a href="#" class="btn btn-round btn-default add-to-cart visible-list">加入到购物车</a>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="#" class="pull-left m-r">+ 添加到收藏</a>
                                            <a href="#" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="product" data-product-id="11" data-category="women|women-basics|makeup" data-brand="brand3" data-price="700" data-colors="white|black|red|green|brown" data-size="XS|S">
                                    <div class="entry-media">
                                        <img data-src="images/women/basic/848099-0067_1_t.jpg" alt="" class="lazyLoad thumb" />
                                        <div class="hover">
                                            <a href="product.html" class="entry-url"></a>
                                            <ul class="icons unstyled">
                                                <li>
                                                    <a href="images/women/basic/848099-0067_1.jpg" class="circle" data-toggle="lightbox"><i class="iconfont-search"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="circle add-to-cart"><i class="iconfont-shopping-cart"></i></a>
                                                </li>
                                            </ul>
                                            <div class="rate-bar">
                                                <input type="range" value="2.5" step="0.5" id="backing11" />
                                                <div class="rateit" data-rateit-backingfld="#backing11" data-rateit-starwidth="12" data-rateit-starheight="12" data-rateit-resetable="false"  data-rateit-ispreset="true" data-rateit-min="0" data-rateit-max="5"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="entry-main">
                                        <h5 class="entry-title">
                                            <a href="product.html">2017春装新款韩版前短后长不规则下摆雪纺衫 </a>
                                        </h5>
                                        <div class="entry-description visible-list">
                                            <p>我们对每一件衣服都精选面料，舒适抗皱。价格低质量好，款式大气做工精细。我们带给您的真正性价比，  如果不满意全额退款！</p>
                                        </div>
                                        <div class="entry-price">
                                            <strong class="price">￥ 700.00</strong>
                                            <a href="#" class="btn btn-round btn-default add-to-cart visible-list">加入到购物车</a>
                                        </div>
                                        <div class="entry-links clearfix">
                                            <a href="#" class="pull-left m-r">+ 添加到收藏</a>
                                            <a href="#" class="pull-right">+ 加入比较</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </section>

                    </section>
                </div>

            </div>
        </div>
    </main>
    <!-- // SITE MAIN CONTENT -->

    <!-- SITE FOOTER -->
    <footer class="page-footer">

        <!-- WIDGET AREA -->
        <div class="widgets">

            <!-- FIRST ROW -->
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

<script src="js/minified.js"></script>

<script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','../../../www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-27646173-3', 'themina.net');
    ga('send', 'pageview');

</script>
<script src="js/jquery.nouislider.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<script src="js/products.js"></script>
</body>
</html>
