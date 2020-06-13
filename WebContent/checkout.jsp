<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.teamo.bean.*,java.text.DecimalFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Teamo - Checkout</title>
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
	<div class="main-content main-content-checkout">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb-trail breadcrumbs">
						<ul class="trail-items breadcrumb">
							<li class="trail-item trail-begin"><a href="index">首页</a></li>
							<li class="trail-item trail-end active">结账</li>
						</ul>
					</div>
				</div>
			</div>
			<h3 class="custom_blog_title">结账</h3>
			<%
				User u = (User) request.getAttribute("user");
			%>
			<div class="checkout-wrapp">
				<form action="AddOrder">
					<div class="shipping-address-form-wrapp">
						<div class="shipping-address-form  checkout-form">
							<div class="row-col-1 row-col">
								<div class="shipping-address"
									onload="setOption('province',null)">
									<h3 class="title-form">收货地址</h3>
									<p class="form-row form-row-first">
										<label class="text">姓名</label> <input title="first"
											type="text" class="input-text" name="name"
											value="<%=u.getUname()%>">
									</p>
									<p class="form-row form-row-last">
										<label class="text">电话</label> <input title="last" type="text"
											class="input-text" name="phone" value="">
									</p>
									<p class="form-row form-row-first">
										<label class="text">邮政编码</label> <input title="zip"
											type="text" class="input-text" name="dawk">
									</p>
									<p class="form-row forn-row-col forn-row-col-1"
										style="line-height: 40px; margin-left: 15px">
										<label class="text">地址</label> <select name="address" title="address"
											data-placeholder="01" class="chosen-select" tabindex="1">
											<%
												for (UserAddress address : u.getUserAddresses()) {
											%>
											<option value="<%=address.getAid().getAid()%>"><%=address.getAid().getAdesc()%></option>
											<%
												}
											%>
										</select>
									</p>
								</div>
							</div>
							<div class="row-col-2 row-col">
								<div class="your-order">
									<h3 class="title-form">您的订单</h3>
									<ul class="list-product-order">
										<%
											List<GoodsShoppingCart> list = (List<GoodsShoppingCart>) request.getAttribute("cartList");
										double moneySum = 0.0;
										double money = 0.0;
										for (GoodsShoppingCart goods : list) {
											if (goods != null) {
										%>
										<li class="product-item-order">
											<div class="product-thumb">
												<a href="#"> <img
													src="assets/images/<%=goods.getGid().getGimg()%>-1.jpg"
													alt="img">
												</a>
											</div>
											<div class="product-order-inner">
												<h5 class="product-name">
													<a href="#"><%=goods.getGid().getGname()%></a>
												</h5>
												<span class="attributes-select attributes-color"><%=goods.getGid().getGcolor()%></span>
												<span class="attributes-select attributes-size"><%=goods.getGid().getGsize()%></span>
												<div class="price">
													$<%
														money = goods.getGid().getGprice();
													moneySum += money;
													%>
													<%=new DecimalFormat("#.00").format(money)%>
													<span class="count">x<%=goods.getSgsum()%></span>
												</div>
											</div>
										</li>
										<%
											}
										}
										%>
									</ul>
									<div class="order-total">
										<span class="title"> 总价: </span> <span class="total-price">
											<%=new DecimalFormat("#.00").format(moneySum)%>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button type="submit" class="button button-payment">提交</button>
				</form>
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