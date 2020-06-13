<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.teamo.bean.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Teamo - Details Fullwith</title>
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
<body class="details-page">
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
	<div class="main-content main-content-details single no-sidebar">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-trail breadcrumbs">
						<ul class="trail-items breadcrumb">
							<li class="trail-item trail-begin"><a href="index">主页</a></li>
							<li class="trail-item"><a href="#">Cacti</a></li>
							<li class="trail-item trail-end active">Areca palm</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div
					class="content-area content-details full-width col-lg-9 col-md-8 col-sm-12 col-xs-12">
					<div class="site-main">
						<div class="details-product">

							<%
								List<Goods> list = (List) request.getAttribute("list");
							for (Goods g : list) {
							%>
							<div class="details-thumd">
								<div
									class="image-preview-container image-thick-box image_preview_container">
									<img id="img_zoom" name="img"
										data-zoom-image="assets/images/<%=g.getGimg()%>-1.jpg"
										src="assets/images/<%=g.getGimg()%>-1.jpg" alt="img"> <a
										href="#" class="btn-zoom open_qv"><i class="fa fa-search"
										aria-hidden="true"></i></a>
								</div>
								<div class="product-preview image-small product_preview">
									<div id="thumbnails" class="thumbnails_carousel owl-carousel"
										data-nav="true" data-autoplay="false" data-dots="false"
										data-loop="false" data-margin="10"
										data-responsive='{"0":{"items":3},"480":{"items":3},"600":{"items":3},"1000":{"items":3}}'>
										<a href="#" data-image="assets/images/<%=g.getGimg()%>-1.jpg"
											data-zoom-image="assets/images/<%=g.getGimg()%>-1.jpg"
											class="active"> <img
											src="assets/images/<%=g.getGimg()%>-1.jpg"
											data-large-image="assets/images/<%=g.getGimg()%>-1.jpg"
											alt="img">
										</a> <a href="#"
											data-image="assets/images/<%=g.getGimg()%>-2.jpg"
											data-zoom-image="assets/images/<%=g.getGimg()%>-2.jpg">
											<img src="assets/images/<%=g.getGimg()%>-2.jpg"
											data-large-image="assets/images/<%=g.getGimg()%>-2.jpg"
											alt="img">
										</a> <a href="#"
											data-image="assets/images/<%=g.getGimg()%>-3.jpg"
											data-zoom-image="assets/images/<%=g.getGimg()%>-3.jpg">
											<img src="assets/images/<%=g.getGimg()%>-3.jpg"
											data-large-image="assets/images/<%=g.getGimg()%>-3.jpg"
											alt="img">
										</a> <a href="#"
											data-image="assets/images/<%=g.getGimg()%>-4.jpg"
											data-zoom-image="assets/images/<%=g.getGimg()%>-4.jpg">
											<img src="assets/images/<%=g.getGimg()%>-4.jpg"
											data-large-image="assets/images/<%=g.getGimg()%>-4.jpg"
											alt="img">
										</a>
									</div>
								</div>
							</div>
							<div class="details-infor">
								<h1 class="product-title"><%=g.getGname()%></h1>
								<div class="stars-rating">
									<div class="star-rating">
										<span class="star-5"></span>
									</div>
									<div class="count-star">(7)</div>
								</div>
								<div class="price">
									<span>$<%=g.getGprice()%></span>
								</div>
								<div class="product-details-description">
									<ul>
										<%
											List<GoodsLabel> ls = g.getGoodsLabels();
										for (GoodsLabel label : ls) {
										%>
										<li><%=label.getLid().getLname()%></li>
										<%
											}
										%>
									</ul>
								</div>
								<div class="variations">
									<div class="attribute attribute_color">
										<div class="color-text text-attribute">Color:</div>
										<select title="city" data-placeholder="London"
											class="chosen-select" tabindex="1" name="color">
											<option value="红色">红色</option>
											<option value="绿色">红色</option>
											<option value="黑色">黑色</option>
										</select>
									</div>
									<div class="attribute attribute_size">
										<div class="size-text text-attribute">Size:</div>
										<div class="list-size list-item">
											<span><%=g.getGsize() %></span>
										</div>
									</div>
								</div>
								<div class="group-button">
									<div class="size-chart-wrapp">
										<div class="btn-size-chart">
											<a id="size_chart" href="assets/images/size-chart.jpg"
												class="fancybox">View Size Chart</a>
										</div>
									</div>
									<form action="insert">
										<div class="quantity-add-to-cart">
											<div class="quantity">
												<div class="control">
													<a class="btn-number qtyminus quantity-minus" href="#">-</a>
													<input type="text" data-step="1" data-min="0" value="1"
														title="Qty" class="input-qty qty" name="input"> <input
														type="text" name="id" value="<%=g.getGid()%>"
														hidden="hidden" /> <a href="#"
														class="btn-number qtyplus quantity-plus">+</a>
												</div>
											</div>

										    <%if((request.getSession().getAttribute("user"))!=null){%>
										    	  <button class="single_add_to_cart_button button" type="submit">添加到购物车</button>
										    	<%}else{ %>
										    	 <button class="single_add_to_cart_button" > <a href="login.jsp">请登录后添加到购物车</a></button>
										    <% } %>
										</div>
										</div>

									</form>

								</div>
							</div>
						</div>
						<div class="tab-details-product">
							<ul class="tab-link">
								<li class="active"><a data-toggle="tab"
									aria-expanded="true" href="#product-descriptions">商品详情 </a></li>
								<li class=""><a data-toggle="tab" aria-expanded="true"
									href="#information">商品信息 </a></li>
							</ul>
							<div class="tab-container">
								<div id="product-descriptions" class="tab-panel active">
									<p><%=g.getGdesc()%></p>

								</div>
								<div id="information" class="tab-panel">
									<table class="table table-bordered">
										<tr>
											<td>Size</td>
											<td><%=g.getGsize()%></td>
										</tr>
										<tr>
											<td>Color</td>
											<td><%=g.getGcolor()%></td>
										</tr>
										<tr>
											<td>Properties</td>
											<td>Colorful Plant</td>
										</tr>
									</table>
								</div>
								<div id="reviews" class="tab-panel">
									<div class="reviews-tab">

										<div class="review_form_wrapper">
											<div class="review_form">
												<div class="comment-respond">
													<span class="comment-reply-title">Add a review </span>
													<form class="comment-form-review">
														<p class="comment-notes">
															<span class="email-notes">Your email address will
																not be published.</span> Required fields are marked <span
																class="required">*</span>
														</p>
														<div class="comment-form-rating">
															<label>Your rating</label>
															<p class="stars">
																<span> <a class="star-1" href="#"></a> <a
																	class="star-2" href="#"></a> <a class="star-3" href="#"></a>
																	<a class="star-4" href="#"></a> <a class="star-5"
																	href="#"></a>
																</span>
															</p>
														</div>
														<p class="comment-form-comment">
															<label> Your review <span class="required">*</span>
															</label>
															<textarea title="review" id="comment" name="comment"
																cols="45" rows="8"></textarea>
														</p>
														<p class="comment-form-author">
															<label> Name <span class="">*</span>
															</label> <input title="author" id="author" name="author"
																type="text" value="">
														</p>
														<p class="comment-form-email">
															<label> Email <span class="">*</span>
															</label> <input title="email" id="email" name="email"
																type="email" value="">
														</p>
														<p class="form-submit">
															<input name="submit" type="submit" id="submit"
																class="submit" value="Submit">
														</p>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
						</div>
						<div style="clear: left;"></div>
						<div class="related products product-grid">
							<h2 class="product-grid-title">You may also like</h2>
							<div class="owl-products owl-slick equal-container nav-center"
								data-slick='{"autoplay":false, "autoplaySpeed":1000, "arrows":true, "dots":false, "infinite":true, "speed":800, "rows":1}'
								data-responsive='[{"breakpoint":"2000","settings":{"slidesToShow":3}},{"breakpoint":"1200","settings":{"slidesToShow":2}},{"breakpoint":"992","settings":{"slidesToShow":2}},{"breakpoint":"480","settings":{"slidesToShow":1}}]'>
								<div class="product-item style-1">
									<div class="product-inner equal-element">
										<div class="product-top">
											<div class="flash">
												<span class="onnew"> <span class="text"> new </span>
												</span>
											</div>
										</div>
										<div class="product-thumb">
											<div class="thumb-inner">
												<a href="#"> <img src="assets/images/product-item-1.jpg"
													alt="img">
												</a>
												<div class="thumb-group">
													<div class="yith-wcwl-add-to-wishlist">
														<div class="yith-wcwl-add-button">
															<a href="#">Add to Wishlist</a>
														</div>
													</div>
													<a href="#" class="button quick-wiew-button">Quick View</a>
													<div class="loop-form-add-to-cart">
														<button class="single_add_to_cart_button button">Add
															to cart</button>
													</div>
												</div>
											</div>
										</div>
										<div class="product-info">
											<h5 class="product-name product_title">
												<a href="#">Aluminum Plant</a>
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
													<ins> $45 </ins>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="product-item style-1">
									<div class="product-inner equal-element">
										<div class="product-top">
											<div class="flash">
												<span class="onnew"> <span class="text"> new </span>
												</span>
											</div>
										</div>
										<div class="product-thumb">
											<div class="thumb-inner">
												<a href="#"> <img src="assets/images/product-item-2.jpg"
													alt="img">
												</a>
												<div class="thumb-group">
													<div class="yith-wcwl-add-to-wishlist">
														<div class="yith-wcwl-add-button">
															<a href="#">Add to Wishlist</a>
														</div>
													</div>
													<a href="#" class="button quick-wiew-button">Quick View</a>
													<div class="loop-form-add-to-cart">
														<button class="single_add_to_cart_button button">Add
															to cart</button>
													</div>
												</div>
											</div>
										</div>
										<div class="product-info">
											<h5 class="product-name product_title">
												<a href="#">Areca palm</a>
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
													<ins> $45 </ins>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="product-item style-1">
									<div class="product-inner equal-element">
										<div class="product-top">
											<div class="flash">
												<span class="onnew"> <span class="text"> new </span>
												</span>
											</div>
										</div>
										<div class="product-thumb">
											<div class="thumb-inner">
												<a href="#"> <img src="assets/images/product-item-3.jpg"
													alt="img">
												</a>
												<div class="thumb-group">
													<div class="yith-wcwl-add-to-wishlist">
														<div class="yith-wcwl-add-button">
															<a href="#">Add to Wishlist</a>
														</div>
													</div>
													<a href="#" class="button quick-wiew-button">Quick View</a>
													<div class="loop-form-add-to-cart">
														<button class="single_add_to_cart_button button">Add
															to cart</button>
													</div>
												</div>
											</div>
										</div>
										<div class="product-info">
											<h5 class="product-name product_title">
												<a href="#">Arrowhead</a>
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
													<ins> $45 </ins>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="product-item style-1">
									<div class="product-inner equal-element">
										<div class="product-top">
											<div class="flash">
												<span class="onnew"> <span class="text"> new </span>
												</span>
											</div>
										</div>
										<div class="product-thumb">
											<div class="thumb-inner">
												<a href="#"> <img src="assets/images/product-item-4.jpg"
													alt="img">
												</a>
												<div class="thumb-group">
													<div class="yith-wcwl-add-to-wishlist">
														<div class="yith-wcwl-add-button">
															<a href="#">Add to Wishlist</a>
														</div>
													</div>
													<a href="#" class="button quick-wiew-button">Quick View</a>
													<div class="loop-form-add-to-cart">
														<button class="single_add_to_cart_button button">Add
															to cart</button>
													</div>
												</div>
											</div>
										</div>
										<div class="product-info">
											<h5 class="product-name product_title">
												<a href="#">Bird’s Nest Fern</a>
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
													<ins> $45 </ins>
												</div>
											</div>
										</div>
									</div>
								</div>
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