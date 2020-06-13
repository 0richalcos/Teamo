<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,com.teamo.bean.*,com.teamo.dao.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Teamo - InBlog Left Sidebar</title>
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
	<div class="main-content main-content-blog single left-sidebar">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-trail breadcrumbs">
						<ul class="trail-items breadcrumb">
							<li class="trail-item trail-begin"><a href="index">主页</a>
							</li>
							<li class="trail-item"><a href="BlogServlet">我们的博客</a></li>
							<li class="trail-item trail-end active">博客详情</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div
					class="content-area content-blog col-lg-9 col-md-8 col-sm-12 col-xs-12">
					<div class="site-main">
						<div class="post-item">
							<div class="post-format">
								<%
									Blog b = (Blog) request.getAttribute("current");
								%>
								<a href="#"> <img
									src="assets/images/<%=b.getBbigimg()%>.jpg" alt="img">
								</a>
							</div>
							<div class="post-infor">
								<div class="category-blog">
									<a href="#"></a>
								</div>
								<h3 class="post-title">
									<a href="#"><%=b.getBtitle()%></a>
								</h3>

								<div class="main-info-post">
									<p><%=b.getBlogdesc().getBdone()%></p>
									<p><%=b.getBlogdesc().getBdtwo()%></p>
								</div>
							</div>
						</div>
						<div class="blog-articles related-articles">

							<div class="blog-slider style-1 owl-slick"
								data-slick='{"variableWidth":true, "autoplay":false, "autoplaySpeed":1000, "arrows":true, "dots":false, "infinite":true, "speed":800, "rows":1}'
								data-responsive='[{"breakpoint":"1200","settings":{"slidesToShow":1,"variableWidth":false }}]'>


							</div>
						</div>
						<div class="tags tags-blog">
							<h3 class="widgettitle">Tags:</h3>
							<ul class="tagcloud">
								<%
									List<BlogLabelRelationships> list2 = (List<BlogLabelRelationships>) b.getBlogLabelRelationshipses();
								for (BlogLabelRelationships b2 : list2) {
								%>
								<li class="tag-cloud-link"><a href="#"><%=b2.getBlid().getBllabel()%></a></li>
								<%
									}
								%>
							</ul>
						</div>
						<div class="view-share">
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
							<div class="share">
								<h3 class="title">share</h3>
								<i class="icon fa fa-facebook-square" aria-hidden="true"></i> <i
									class="icon fa fa-linkedin" aria-hidden="true"></i> <i
									class="icon fa fa-twitter" aria-hidden="true"></i>
							</div>
						</div>
						<div class="comments-area">
							<h3 class="custom_blog_title">
								评论 <span class="count">(<%=b.getBlogdesc().getCommentes().size() %>)
								</span>
							</h3>
							<form class="comment-form"
								action="BlogComment?bdid=<%=b.getBlogdesc().getBdid()%>"
								method="post">
								<p class="comment-reply-content">
									<textarea rows="6" placeholder="写下你的评论" class="input-form"
										name="comment"></textarea>
								</p>
								<p class="form-submit">
									<span class="controll"> <i
										class="icon fa fa-file-image-o" aria-hidden="true"></i> <i
										class="icon fa fa-paperclip" aria-hidden="true"></i> <i
										class="icon fa fa-smile-o" aria-hidden="true"></i> <!-- <button class="submit button">发表评论</button> -->
										<% if(( request.getSession().getAttribute("user"))!=null){%>
										<button class="submit button">发表评论</button> <% }else{%> <a
										href="login.jsp"><button type="button">登录后发表评论</button> </a> <%} %>
									</span>
								</p>
							</form>
							<%
								for (Comment comment : b.getBlogdesc().getCommentes()) {
							%>
							<ul class="comment-list">
								<li class="comment">
									<div class="comment-item">
										<div class="author-view">
											<div class="author">
												<div class="avt">
													<img src="assets/images/avt-blog1.png" alt="img">
												</div>
												<h3 class="name"><%=comment.getCauthor()%></h3>
											</div>
											<div class="date-reply-comment">
												<span class="date-comment"><%=new SimpleDateFormat("yyyy-MM-dd  HH:mm:ss").format(comment.getCtime())%> </span>
											</div>
										</div>
										<div class="comment-body">
											<div class="comment-content">
												<p><%=comment.getCdesc()%></p>
											</div>
											<div class="comment-reply-link">
												<span class="Comment"> <i
													class="icon fa fa-commenting" aria-hidden="true"></i> 评论
												</span> <span class="like"> <i
													class="icon fa fa-thumbs-o-up" aria-hidden="true"></i> 1
												</span> <span class="dislike"> <i
													class="icon fa fa-thumbs-o-down" aria-hidden="true"></i>
												</span>
											</div>
										</div>
									</div>
								</li>
							</ul>
							<%
								}
							%>
						</div>
					</div>
				</div>
				<div
					class="sidebar sidebar-single-blog col-lg-3 col-md-4 col-sm-12 col-xs-12">
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
									for="cb1" class="label-text"> 踌躇 </label></li>
								<li><input type="checkbox" id="cb2"> <label
									for="cb2" class="label-text"> 感伤 </label></li>
								<li><input type="checkbox" id="cb3"> <label
									for="cb3" class="label-text"> 逃避 </label></li>
								<li><input type="checkbox" id="cb4"> <label
									for="cb4" class="label-text"> 冷漠 </label></li>
								<li><input type="checkbox" id="cb5"> <label
									for="cb5" class="label-text"> 文学 </label></li>
								<li><input type="checkbox" id="cb6"> <label
									for="cb6" class="label-text"> 证明 </label></li>
							</ul>
						</div>
						<div class="widget widget-post">
							<h3 class="widgettitle">热门文章</h3>
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
											<a href="#">我愿自己看起来仍像个孩童孩童只因玩具而流泪</span></a>
										</h5>
									</div>
								</li>
								<li class="widget-post-item">
									<div class="thumb-blog">
										<img src="assets/images/sidebar-post2.jpg" alt="img">
									</div>
									<div class="post-content">
										<div class="cat">
											<a href="#">随手感言</a>
										</div>
										<h5 class="post-title">
											<a href="#">一座不适合重逢的城市。每个不想睡去也不想醒来的夜晚。<span>[...]</span></a>
										</h5>
									</div>
								</li>
								<li class="widget-post-item">
									<div class="thumb-blog">
										<img src="assets/images/sidebar-post3.jpg" alt="img">
									</div>
									<div class="post-content">
										<div class="cat">
											<a href="#">风格习惯</a>
										</div>
										<h5 class="post-title">
											<a href="#">那些知道真相之后却依然热爱着的谎言，一道初见的目光和它静静燃烧的寂寞。</span></a>
										</h5>
									</div>
								</li>
							</ul>
						</div>
						<div class="widget widget-tags">
							<h3 class="widgettitle">热门标签</h3>
							<ul class="tagcloud">
								<li class="tag-cloud-link"><a href="#">逃避</a></li>
								<li class="tag-cloud-link"><a href="#">跨越</a></li>
								<li class="tag-cloud-link"><a href="#">证明</a></li>
								<li class="tag-cloud-link active"><a href="#">朦胧</a></li>
								<li class="tag-cloud-link"><a href="#">彷徨</a></li>
								<li class="tag-cloud-link"><a href="#">文学</a></li>
							</ul>
						</div>
						<div class="widget newsletter-widget">
							<div class="newsletter-form-wrap ">
								<h3 class="title">订阅最新活动信息</h3>
								<div class="subtitle">更多活动 & 促销</div>
								<input type="email" class="email"
									placeholder="Your email letter">
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
				<a href="index.html"> <span class="icon"> <i
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