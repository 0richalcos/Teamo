<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,com.teamo.dao.*,com.teamo.bean.Goods"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Teamo - Products Grid Left Sidebar</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/images/favicon.png" />
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,300i,400,400i,700,700i&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/jquery-ui.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/chosen.min.css">
<link rel="stylesheet" href="assets/css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="assets/css/magnific-popup.min.css">
<link rel="stylesheet" href="assets/css/lightbox.min.css">
<link rel="stylesheet"
	href="assets/js/fancybox/source/jquery.fancybox.css">
<link rel="stylesheet" href="assets/css/jquery.scrollbar.min.css">
<link rel="stylesheet" href="assets/css/mobile-menu.css">
<link rel="stylesheet" href="assets/fonts/flaticon/flaticon.css">
<link rel="stylesheet" href="assets/css/style.css">
</head>
<body class="productsgrid-page">
	<jsp:include page="header.jsp"></jsp:include>
	<div class="header-device-mobile">
		<div class="wapper">
			<div class="item mobile-logo">
				<div class="logo">
					<a href="#"> <img src="assets/images/logo.png" alt="img">
					</a>
				</div>
			</div>
			<div class="item item mobile-search-box has-sub">
				<a href="#"> <span class="icon"> <i class="fa fa-search"
						aria-hidden="true"></i>
				</span>
				</a>
				<div class="block-sub">
					<a href="#" class="close"> <i class="fa fa-times"
						aria-hidden="true"></i>
					</a>
					<div class="header-searchform-box">
						<form class="header-searchform">
							<div class="searchform-wrap">
								<input type="text" class="search-input"
									placeholder="Enter keywords to search..."> <input
									type="submit" class="submit button" value="Search">
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="item mobile-settings-box has-sub">
				<a href="#"> <span class="icon"> <i class="fa fa-cog"
						aria-hidden="true"></i>
				</span>
				</a>
				<div class="block-sub">
					<a href="#" class="close"> <i class="fa fa-times"
						aria-hidden="true"></i>
					</a>
					<div class="block-sub-item">
						<h5 class="block-item-title">Currency</h5>
						<form class="currency-form teamo-language">
							<ul class="teamo-language-wrap">
								<li class="active"><a href="#"> <span> English
											(USD) </span>
								</a></li>
								<li><a href="#"> <span> French (EUR) </span>
								</a></li>
								<li><a href="#"> <span> Japanese (JPY) </span>
								</a></li>
							</ul>
						</form>
					</div>
				</div>
			</div>
			<div class="item menu-bar">
				<a class=" mobile-navigation  menu-toggle" href="#"> <span></span>
					<span></span> <span></span>
				</a>
			</div>
		</div>
	</div>
	<div class="main-content main-content-product left-sidebar">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-trail breadcrumbs">
						<ul class="trail-items breadcrumb">
							<li class="trail-item trail-begin"><a href="index">主页</a>
							</li>
							<li class="trail-item trail-end active">商店</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div
					class="content-area shop-grid-content no-banner col-lg-9 col-md-9 col-sm-12 col-xs-12">
					<div class="site-main">
						<div class="shop-top-control">
							
							<div class="grid-view-mode">
								<div class="inner">
									<a href="gridproducts.html"
										class="modes-mode active"> <span></span> <span></span>
										<span></span> <span></span>
									</a>
								</div>
							</div>
						</div>
						<ul
							class="row list-products auto-clear equal-container product-grid">
							<%
								List<Goods> list = (List<Goods>) request.getAttribute("list");
							for (Goods g : list) {
							%>
							<li
								class="product-item  col-lg-4 col-md-6 col-sm-6 col-xs-6 col-ts-12 style-1">
								<div class="product-inner equal-element">
									<div class="product-top">
										<div class="flash">
											<span class="onnew"> <span class="text"> new </span>
											</span>
										</div>
									</div>
									<div class="product-thumb">
										<div class="thumb-inner">
											<a href="product?gid=<%=g.getGid()%>"> <img
												src="assets/images/<%=g.getGimg()%>-1.jpg" alt="img">
											</a>
										</div>
									</div>
									<div class="product-info">
										<h5 class="product-name product_title">
											<a href="product?gid=<%=g.getGid()%>"><%=g.getGname()%></a>
										</h5>
										<div class="group-info">
											<div class="stars-rating">
												<div class="star-rating">
													<span class="star-3"></span>
												</div>
												<div class="count-star">(3)</div>
											</div>
											<div class="price">
												<del> $65 </del>
												<ins>
													$<%=g.getGprice()%></ins>
											</div>
										</div>
									</div>
								</div>
							</li>
							<%
								}
							%>
						</ul>
						<div class="pagination clearfix style3">
							<div class="nav-link">
								<a href="goodsPageServlet?flag=false" class="page-numbers"> 
								<i class="icon fa fa-angle-left" aria-hidden="true"></i>
								</a>
								
								 <a href="goodsPageServlet?flag=1" class="page-numbers">1</a>
								 
								  <a href="goodsPageServlet?flag=2"
									class="page-numbers">2</a>
									
									 <a href="goodsPageServlet?flag=3"
									class="page-numbers">3</a>
									
									 <a href="goodsPageServlet?flag=true" class="page-numbers">
									<i class="icon fa fa-angle-right"
									aria-hidden="true"></i></a>
									
							</div>
						</div>
					</div>
				</div>
				<div class="sidebar col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="wrapper-sidebar shop-sidebar">
						<div class="widget woof_Widget">
							<form action="productClassify" method="post">
								<div class="widget widget-categories">
									<h3 class="widgettitle">种类</h3>
									<ul class="list-categories">
										<li><input type="checkbox" id="cb1" name="kind"
											value="悬挂植物"> <label for="cb1" class="label-text">
												悬挂植物 </label></li>
										<li><input type="checkbox" id="cb2" name="kind"
											value="多肉"> <label for="cb2" class="label-text">多肉</label></li>
										<li><input type="checkbox" id="cb3" name="kind"
											value="蕨类"> <label for="cb3" class="label-text">
												蕨类 </label></li>
										<li><input type="checkbox" id="cb4" name="kind"
											value="棕榈植物"> <label for="cb4" class="label-text">
												棕榈植物 </label></li>
										<li><input type="checkbox" id="cb5" name="kind"
											value="观叶植物"> <label for="cb5" class="label-text">
												观叶植物 </label></li>
										<li><input type="checkbox" id="cb6" name="kind"
											value="花盆"> <label for="cb6" class="label-text">
												花盆 </label></li>
									</ul>
								</div>
								<div class="widget widget_filter_price">
									<h4 class="widgettitle">价格</h4>
									<div class="price-slider-wrapper">
										<div data-label-reasult="Range:" data-min="0" data-max="50"
											data-unit="$" class="slider-range-price " data-value-min="0"
											data-value-max="1000"></div>
										<div class="price-slider-amount">
											<span class="from">$45</span> <span class="to">$215</span>
										</div>
									</div>
								</div>
								<div class="widget widget-brand">
									<h3 class="widgettitle">标签</h3>
									<ul class="list-brand">
										<li><input id="cb7" type="checkbox" name="kind"
											value="耐干旱"> <label for="cb7" class="label-text">耐干旱</label></li>
										<li><input id="cb8" type="checkbox" name="kind"
											value="耐寒"> <label for="cb8" class="label-text">耐寒</label></li>
										<li><input id="cb9" type="checkbox" name="kind"
											value="可悬挂"> <label for="cb9" class="label-text">可悬挂</label></li>
										<li><input id="cb10" type="checkbox" name="kind"
											value="桌面摆设"> <label for="cb10" class="label-text">桌面摆设</label></li>
										<li><input id="cb11" type="checkbox" name="kind"
											value="室内"> <label for="cb11" class="label-text">室内</label></li>
										<li><input id="cb12" type="checkbox" name="kind"
											value="易于打理"> <label for="cb12" class="label-text">易于打理</label></li>
										<li><input id="cb13" type="checkbox" name="kind"
											value="简约"> <label for="cb13" class="label-text">简约</label></li>
										<li><input id="cb14" type="checkbox" name="kind"
											value="华丽"> <label for="cb14" class="label-text">华丽</label></li>
										<li><input id="cb21" type="checkbox" name="kind"
											value="针状叶"> <label for="cb21" class="label-text">针状叶</label></li>
										<li><input id="cb22" type="checkbox" name="kind"
											value="大型"> <label for="cb22" class="label-text">大型</label></li>
										<li><input id="cb23" type="checkbox" name="kind"
											value="花盆2"> <label for="cb23" class="label-text">花盆</label></li>
										<li><input id="cb24" type="checkbox" name="kind"
											value="室外"> <label for="cb24" class="label-text">室外</label></li>
									</ul>
								</div>
								<div class="widget widget-brand">
									<h4 class="widgettitle">规格</h4>
									<ul class="list-brand">
										<li><input id="cb15" type="checkbox" name="kind"
											value="XS"> <label for="cb15" class="label-text">XS</label></li>
										<li><input id="cb16" type="checkbox" name="kind"
											value="XL"> <label for="cb16" class="label-text">XL</label></li>
										<li><input id="cb17" type="checkbox" name="kind"
											value="XLL"> <label for="cb17" class="label-text">XLL</label></li>
										<li><input id="cb18" type="checkbox" name="kind"
											value="S"> <label for="cb18" class="label-text">S</label></li>
										<li><input id="cb19" type="checkbox" name="kind"
											value="M"> <label for="cb19" class="label-text">M</label></li>
										<li><input id="cb20" type="checkbox" name="kind"
											value="L"> <label for="cb20" class="label-text">L</label></li>
									</ul>
								</div>
								<div class="widget newsletter-widget">
									<div class="newsletter-form-wrap ">
										<button type="submit" class="button submit-newsletter">提交</button>
									</div>
								</div>
							</form>
							<div class="widget widget-tags">
								<h3 class="widgettitle">热门标签</h3>
								<ul class="tagcloud">
									<li class="tag-cloud-link"><a href="#">室外</a></li>
									<li class="tag-cloud-link"><a href="#">花盆</a></li>
									<li class="tag-cloud-link"><a href="#">大型</a></li>
									<li class="tag-cloud-link active"><a href="#">针状叶</a></li>
									<li class="tag-cloud-link"><a href="#">华丽</a></li>
									<li class="tag-cloud-link"><a href="#">简约</a></li>
									<li class="tag-cloud-link"><a href="#">易于打理</a></li>
								</ul>
							</div>
						</div>
						<div class="widget newsletter-widget">
							<div class="newsletter-form-wrap ">
								<h3 class="title">订阅我们的网站</h3>
								<div class="subtitle">更多活动 & 促销</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<div class="footer-device-mobile">
		<div class="wapper">
			<div class="footer-device-mobile-item device-home">
				<a href="index"> <span class="icon"> <i
						class="fa fa-home" aria-hidden="true"></i>
				</span> 主页
				</a>
			</div>
			<div class="footer-device-mobile-item device-home device-wishlist">
				<a href="#"> <span class="icon"> <i class="fa fa-heart"
						aria-hidden="true"></i>
				</span> 愿望清单
				</a>
			</div>
			<div class="footer-device-mobile-item device-home device-cart">
				<a href="#"> <span class="icon"> <i
						class="fa fa-shopping-basket" aria-hidden="true"></i> <span
						class="count-icon"> 0 </span>
				</span> <span class="text">Cart</span>
				</a>
			</div>
			<div class="footer-device-mobile-item device-home device-user">
				<a href="#"> <span class="icon"> <i class="fa fa-user"
						aria-hidden="true"></i>
				</span> Account
				</a>
			</div>
		</div>
	</div>
	<a href="#" class="backtotop"> <i class="fa fa-angle-double-up"></i>
	</a>
	<script src="assets/js/jquery-1.12.4.min.js"></script>
	<script src="assets/js/jquery.plugin-countdown.min.js"></script>
	<script src="assets/js/jquery-countdown.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="assets/js/magnific-popup.min.js"></script>
	<script src="assets/js/isotope.min.js"></script>
	<script src="assets/js/jquery.scrollbar.min.js"></script>
	<script src="assets/js/jquery-ui.min.js"></script>
	<script src="assets/js/mobile-menu.js"></script>
	<script src="assets/js/chosen.min.js"></script>
	<script src="assets/js/slick.js"></script>
	<script src="assets/js/jquery.elevateZoom.min.js"></script>
	<script src="assets/js/jquery.actual.min.js"></script>
	<script src="assets/js/fancybox/source/jquery.fancybox.js"></script>
	<script src="assets/js/lightbox.min.js"></script>
	<script src="assets/js/owl.thumbs.min.js"></script>
	<script src="assets/js/jquery.scrollbar.min.js"></script>
	<script
		src='http://www.google.cn/maps/api/js?key=AIzaSyC3nDHy1dARR-Pa_2jjPCjvsOR4bcILYsM'></script>
	<script src="assets/js/frontend-plugin.js"></script>
</body>
</html>