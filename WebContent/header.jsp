<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.teamo.bean.*,java.util.List"%>
<header class="header style7">
	<div class="top-bar">
		<div class="container">
			<div class="top-bar-left">
				<div class="header-message">Welcome to our online store!</div>
			</div>
			<div class="top-bar-right">
				<div class="header-language">
					<div class="teamo-language teamo-dropdown">
						<span class="active" style="line-height: 47px"> <span>Welcome!
						</span>
						</span>
					</div>
				</div>
				<ul class="header-user-links">
					<%
						User user = (User) request.getSession().getAttribute("user");
					%>
					<%
						if (user == null) {
					%>
					<li><a href="login.jsp">登录</a>-<a href="register.jsp">注册</a></li>
					<%
						} else {
					%>
					<li><span style="line-height: 48px"><%=user.getUname()%></span></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="main-header">
			<div class="row">
				<div
					class="col-lg-3 col-sm-4 col-md-3 col-xs-7 col-ts-12 header-element">
					<div class="logo">
						<a href="index"> <img src="assets/images/logo.png" alt="img">
						</a>
					</div>
				</div>
				<div class="col-lg-7 col-sm-8 col-md-6 col-xs-5 col-ts-12">
					<div class="block-search-block">
						<form class="form-search form-search-width-category"
							action="SearchServlet">
							<div class="form-content">
								<div class="inner">
									<input type="text" class="input" name="search" value=""
										placeholder="Search here">
								</div>
								<button class="btn-search" type="submit">
									<span class="icon-search"></span>
								</button>
							</div>
						</form>
					</div>
				</div>
				<div class="col-lg-2 col-sm-12 col-md-3 col-xs-12 col-ts-12">
					<div class="header-control">
						<%
							if (user == null) {
						%>
						<div
							class="block-minicart teamo-mini-cart block-header teamo-dropdown">
							<a href="javascript:void(0);" class="shopcart-icon"
								data-teamo="teamo-dropdown"> Cart </a>
							<div class="no-product teamo-submenu">
								<p class="text">
									你还没有登录！快去<span><a href="login.jsp">登录</a></span>吧~
								</p>
							</div>
						</div>
						<%
							} else {
						%>
						<div
							class="block-minicart teamo-mini-cart block-header teamo-dropdown">
							<a href="shoppingcart" class="shopcart-icon"> Cart </a>
						</div>
						<%
							}
						%>
						<div class="block-account block-header teamo-dropdown">
							<a href="javascript:void(0);" data-teamo="teamo-dropdown"> <span
								class="flaticon-user"></span>
							</a>
							<div class="header-account teamo-submenu">
								<div class="header-user-form-tabs">
									<%
										if (user != null) {
									%>
									<ul class="tab-link">
										<li class="active"><a data-toggle="tab"
											aria-expanded="true" href="#header-tab-login">用户信息</a></li>
										<li><a data-toggle="tab" aria-expanded="true"
											href="#header-tab-rigister">添加地址</a></li>
									</ul>
									<div class="tab-container">
										<div id="header-tab-login" class="tab-panel active">
											<form method="post" class="login form-login">
												<p class="form-row form-row-wide">
													<font style="line-height: 40px">用户名</font> <input
														type="email" placeholder="<%=user.getUname()%>"
														class="input-text" disabled>
												</p>
												<p class="form-row form-row-wide">
													<font style="line-height: 40px">邮箱</font> <input
														type="email" placeholder="<%=user.getUemail()%>"
														class="input-text" disabled>
												</p>
												<p class="form-row">
													<a href="outlogin" class="button">注销</a>
												</p>
											</form>
										</div>
										<div id="header-tab-rigister" class="tab-panel">
											<form method="post" class="register form-register"
												action="addAddress">
												<p class="form-row form-row-wide">
													<input type="text" placeholder="地址" class="input-text"
														name="address">
												</p>
												<p class="form-row">
													<input type="submit" class="button" value="添加">
												</p>
											</form>
										</div>
									</div>

									<%
										} else {
									%>
									<ul class="tab-link">
										<li class="active"><font style="color: #7c8a86">你还没有登录！快去</font><a
											href="login.jsp">登录</a><font style="color: #7c8a86">吧~</font></li>
									</ul>
									<%
										}
									%>
								</div>
							</div>
						</div>
						<a class="menu-bar mobile-navigation menu-toggle" href="#"> <span></span>
							<span></span> <span></span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="header-nav-container rows-space-20">
		<div class="container">
			<div class="header-nav-wapper main-menu-wapper">
				<div class="vertical-wapper block-nav-categori">
					<div class="block-title">
						<span class="icon-bar"> <span></span> <span></span> <span></span>
						</span> <span class="text">所有种类</span>
					</div>
					<div class="block-content verticalmenu-content">
						<ul
							class="teamo-nav-vertical vertical-menu teamo-clone-mobile-menu">
							<li class="menu-item"><a href="#"
								class="teamo-menu-item-title" title="New Arrivals">悬挂植物</a></li>
							<li class="menu-item"><a title="Hot Sale" href="#"
								class="teamo-menu-item-title">多肉</a></li>
							<li class="menu-item"><a title="Accessories" href="#"
								class="teamo-menu-item-title">蕨类</a></li>
							<li class="menu-item"><a title="Cacti" href="#"
								class="teamo-menu-item-title">棕榈植物</a></li>
							<li class="menu-item"><a title="Palms" href="#"
								class="teamo-menu-item-title">观叶植物</a></li>
							<li class="menu-item"><a title="Ferns" href="#"
								class="teamo-menu-item-title">花盆</a></li>
						</ul>
					</div>
				</div>
				<div class="header-nav">
					<div class="container-wapper">
						<ul class="teamo-clone-mobile-menu teamo-nav main-menu "
							id="menu-main-menu">
							<li class="menu-item"><a href="index"
								class="teamo-menu-item-title" title="Home">主页</a></li>
							<li class="menu-item"><a href="goodsPageServlet"
								class="teamo-menu-item-title" title="Shop">商店</a></li>
							<%
								if (request.getSession().getAttribute("user") != null) {
							%>
							<li class="menu-item"><a href="order"
								class="teamo-menu-item-title" title="order">订单</a></li>
							<%
								} else {
							%>
							<li class="menu-item"><a class="teamo-menu-item-title"
								title="order">订单</a></li>
							<%
								}
							%>
							<li class="menu-item"><a href="BlogServlet"
								class="teamo-menu-item-title" title="Blogs">博客</a> <span
								class="toggle-submenu"></span></li>
							<li class="menu-item"><a href="about.jsp"
								class="teamo-menu-item-title" title="About">关于</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>