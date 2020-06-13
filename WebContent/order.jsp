
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
			<h3 class="custom_blog_title">订单详情</h3>
			<div class="checkout-wrapp">
				<div class="shipping-address-form-wrapp">
					<div class="shipping-address-form  checkout-form">
						<ul class="list-product-order">

							<%
								List<Order> list = (List<Order>) request.getAttribute("list");
							for (Order o : list) {
							%>
							<li class="product-item-order">
								<p class="form-row form-row-first">
									<label class="text">名字 :</label> <span><%=o.getUid().getUname()%></span>
								</p> <span></span>
								<p class="form-row form-row-first">
									<label class="text">电子邮箱 :</label> <span><%=o.getUid().getUemail()%></span>
								</p>
								<p class="form-row form-row-last">
									<label class="text">地址 :</label> <span><%=o.getAid().getAdesc()%>
									</span>
								</p>
								<p class="form-row form-row-last">
									<label class="text">邮政编码 :</label> <span><%=o.getOdawk()%>
									</span>
								</p>
								<p class="form-row form-row-last">
									<label class="text">手机号 :</label> <span><%=o.getOphone()%>
									</span>
								</p>
								<div class="product-inner equal-element">
									<%
										double money = 0;
									double moneySum = 0;
									for (OrderGoods or : o.getOrderGoodses()) {
									%>
									<div style="float: left">
										<div class="product-thumb">
											<div class="thumb-inner">
												<img src="assets/images/<%=or.getGid().getGimg()%>-1.jpg"
													alt="img">
											</div>
										</div>
										<div class="product-info">
											<h5 class="product-name product_title">
												<span><%=or.getGid().getGname()%></span>
											</h5>
											<div class="price">
												<%
													money = or.getGid().getGprice();
												moneySum += money * or.getOgsum();
												%>
												<span> <font color="green">$<%=new DecimalFormat("#.00").format(money)%></font>
													X <font color="green"><%=or.getOgsum()%></font>
												</span>
											</div>
										</div>
									</div>
									<%
										}
									%>
									<div style="float: left; width: 100%; margin-top: 20px">
										<span> 总价：<font color="green" size="5">$<%=new DecimalFormat("#.00").format(moneySum)%></font></span>
									</div>
								</div>
							</li>
							<%
								}
							%>
						</ul>
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