<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,com.teamo.bean.Blog,com.teamo.dao.*,com.teamo.bean.BlogLabelRelationships"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Teamo - Blog List</title>
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
<body class="inblog-page">
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
	<div class="main-content main-content-blog list right-sidebar">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-trail breadcrumbs">
						<ul class="trail-items breadcrumb">
							<li class="trail-item trail-begin"><a href="index">主页</a>
							</li>
							<li class="trail-item trail-end active">我们的博客</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div
					class="content-area content-blog col-lg-9 col-md-8 col-sm-12 col-xs-12">
					<div class="site-main">
						<h3 class="custom_blog_title">我们的博客</h3>
						<div class="blog-list list-style">
							<%
								List<Blog> list = (List<Blog>) request.getAttribute("show");
							for (Blog b : list) {
							%>
							<div class="blog-item">
								<div class="post-format">
									<a href="BlogDetailServlet?bid=<%=b.getBid()%>"> <img
										src="assets/images/<%=b.getBimg()%>.jpg" alt="img">
									</a>
								</div>
								<div class="post-info">
									<div class="category-blog">
										<%
											List<BlogLabelRelationships> list2 = (List<BlogLabelRelationships>) b.getBlogLabelRelationshipses();
										for (BlogLabelRelationships b2 : list2) {
										%>
										<a href="#"><%=b2.getBlid().getBllabel()%></a>
										<%
											}
										%>
									</div>
									<h3 class="post-title">
										<a href="#"><%=b.getBtitle()%><span>[...]</span></a>
									</h3>
									<div class="main-info-post">
										<p class="des"><%=b.getBintro()%></p>
									</div>
									<div class="author-view">
										<div class="author">
											<div class="avt">
												<img src="assets/images/avt-blog1.png" alt="img">
											</div>
											<h3 class="name"><%=b.getUid().getUname()%></h3>
										</div>
										<div class="review">
											<div class="view">
												<span class="icon-view"> <i class="fa fa-eye"
													aria-hidden="true"></i>
												</span> <span class="count"> 631 </span>
											</div>
											<div class="s-comments">
												<span class="icon-cmt"> <i class="fa fa-commenting"
													aria-hidden="true"></i>
												</span> <span class="count"> 82 </span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<div
					class="sidebar sidebar-blog col-lg-3 col-md-4 col-sm-12 col-xs-12">
					<div class="wrapper-sidebar">
						<div class="widget widget-socials">
							<h3 class="widgettitle">关注我们</h3>
							<div class="content-socials">
								<div class="social-list">
									<a href="#" target="_blank" class="social-item"> <i
										class="fa fa-facebook-square" aria-hidden="true"></i>
									</a> <a href="#" target="_blank" class="social-item"> <i
										class="fa fa-twitter" aria-hidden="true"></i>
									</a> <a href="#" target="_blank" class="social-item"> <i
										class="fa fa-instagram" aria-hidden="true"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="widget widget-categories">
							<h3 class="widgettitle">分类</h3>
							<ul class="list-categories">
								<li><input type="checkbox" id="cb1"> <label
									for="cb1" class="label-text"> 感伤 </label></li>
								<li><input type="checkbox" id="cb2"> <label
									for="cb2" class="label-text"> 踌躇 </label></li>
								<li><input type="checkbox" id="cb3"> <label
									for="cb3" class="label-text"> 朦胧 </label></li>
								<li><input type="checkbox" id="cb4"> <label
									for="cb4" class="label-text"> 跨越 </label></li>
								<li><input type="checkbox" id="cb5"> <label
									for="cb5" class="label-text"> 逃避 </label></li>
								<li><input type="checkbox" id="cb6"> <label
									for="cb6" class="label-text"> 证明 </label></li>
							</ul>
						</div>
						<div class="widget widget-post">
							<h3 class="widgettitle">您是不是要找</h3>
							<ul class="teamo-posts">
								<li class="widget-post-item">
									<div class="thumb-blog">
										<img src="assets/images/sidebar-post1.jpg" alt="img">
									</div>
									<div class="post-content">
										<div class="cat">
											<a href="#">生活方式</a>
										</div>
										<h5 class="post-title">
											<a href="#">这将会改变我们的生活 <span>[...]</span></a>
										</h5>
									</div>
								</li>
								<li class="widget-post-item">
									<div class="thumb-blog">
										<img src="assets/images/sidebar-post2.jpg" alt="img">
									</div>
									<div class="post-content">
										<div class="cat">
											<a href="#">看书</a>
										</div>
										<h5 class="post-title">
											<a href="#">盆栽环绕的悠然生活<span>[...]</span></a>
										</h5>
									</div>
								</li>
								<li class="widget-post-item">
									<div class="thumb-blog">
										<img src="assets/images/sidebar-post3.jpg" alt="img">
									</div>
									<div class="post-content">
										<div class="cat">
											<a href="#">一般年轻人的风格</a>
										</div>
										<h5 class="post-title">
											<a href="#">富有个性的生活习惯 <span>[...]</span></a>
										</h5>
									</div>
								</li>

							</ul>
						</div>
						<div class="widget widget-tags">
							<h3 class="widgettitle">通用型</h3>
							<ul class="tagcloud">
								<li class="tag-cloud-link"><a href="#">冷漠的</a></li>
								<li class="tag-cloud-link"><a href="#">感伤</a></li>
								<li class="tag-cloud-link"><a href="#">逃避</a></li>
								<li class="tag-cloud-link active"><a href="#">跨越</a></li>
								<li class="tag-cloud-link"><a href="#">证明</a></li>
								<li class="tag-cloud-link"><a href="#">温柔</a></li>
								<li class="tag-cloud-link"><a href="#">亲切</a></li>
							</ul>
						</div>
						<div class="widget newsletter-widget">
							<div class="newsletter-form-wrap ">
								<h3 class="title">订阅我们的通讯吧</h3>
								<div class="subtitle">更多的活动 & 促销</div>
								<input type="email" class="email" placeholder="你的电子邮件信">
								<button type="submit" class="button submit-newsletter">订阅</button>
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
				</span> Wishlist
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