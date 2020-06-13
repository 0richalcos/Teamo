<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.teamo.bean.GoodsShoppingCart,com.teamo.bean.Goods,java.util.List,java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Teamo - Shopping Cart</title>
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
	<div class="site-content">
		<main class="site-main  main-container no-sidebar">
			<div class="container">
				<div class="breadcrumb-trail breadcrumbs">
					<ul class="trail-items breadcrumb">
						<li class="trail-item trail-begin"><a href="index"> <span>
									主页 </span>
						</a></li>
						<li class="trail-item trail-end active"><span>
								Shopping Cart </span></li>
					</ul>
				</div>
				<div class="row">
					<div class="main-content-cart main-content col-sm-12">
						<h3 class="custom_blog_title">购物车</h3>
						<div class="page-main-content">
							<div class="shoppingcart-content">
								<form action="shoppingcart.html" class="cart-form">
									<table class="shop_table">
										<thead>
											<tr>
												<th class="product-remove"></th>
												<th class="product-thumbnail"></th>
												<th class="product-name"></th>
												<th class="product-price"></th>
												<th class="product-quantity"></th>
												<th class="product-subtotal"></th>
											</tr>
										</thead>
										<tbody>

											<%
												List<GoodsShoppingCart> list = (List<GoodsShoppingCart>) request.getAttribute("list");
											double moneySum = 0.0;
											double money = 0.0;
											for (GoodsShoppingCart goods : list) {
												if (goods != null) {
											%>
											<tr class="cart_item">
												<td class="product-remove"><a
													href="deleteFromCart?goodsID=<%=goods.getGid().getGid()%>"
													class="remove"></a></td>
												<td class="product-thumbnail"><a href="#"> <img
														src="assets/images/<%=goods.getGid().getGimg()%>-1.jpg"
														alt="img"
														class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image">
												</a></td>
												<td class="product-name" data-title="Product"><a
													href="#" class="title"><%=goods.getGid().getGname()%></a> <span
													class="attributes-select attributes-color"><%=goods.getGid().getGcolor()%></span>
													<span class="attributes-select attributes-size"><%=goods.getGid().getGsize()%></span></td>
												<td class="product-quantity" data-title="Quantity">
													<div class="quantity">
														<div class="control">
															<a class="btn-number" <%if (goods.getSgsum() > 1) {%>
																href="updateSum?flag=substarct&id=<%=goods.getSgid()%>"
																<%}%>>-</a> <input type="text" data-step="1"
																data-min="0" value="<%=goods.getSgsum()%>" title="Qty"
																class="input-qty qty" size="4" disabled> <a
																href="updateSum?flag=plus&id=<%=goods.getSgid()%>"
																class="btn-number">+</a>
														</div>
													</div>
												</td>
												<%
													money = goods.getSgsum() * goods.getGid().getGprice();
												moneySum += money;
												%>
												<td class="product-price" data-title="Price"><span
													class="woocommerce-Price-amount amount"> <span
														class="woocommerce-Price-currencySymbol"> $ </span> <%=new DecimalFormat("#.00").format(money)%>
												</span></td>
											</tr>
											<%
												}
											}
											%>

											<tr>
												<td class="actions">
													<div class="coupon">
														<label class="coupon_code">优惠卷代码:</label> <input
															type="text" class="input-text"
															placeholder="Promotion code here"> <a href="#"
															class="button"></a>
													</div>
													<div class="order-total">
														<span class="title"> 总价: </span> <span class="total-price">
															$<%=new DecimalFormat("#.00").format(moneySum)%>
														</span>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
								<div class="control-cart">
									<a class="button btn-continue-shopping" href="goodsPageServlet">继续购物</a>
									<%
										if (list.size() == 0) {
									%>


									<a class="button btn-cart-to-checkout">结账</a>
									<%
										} else {
									%>
									<a class="button btn-cart-to-checkout" href="CheckOut">结账</a>
									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
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