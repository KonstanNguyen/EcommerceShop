<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- HEADER -->
<header>
	<!-- TOP HEADER -->
	<div id="top-header">
		<div class="container">
			<ul class="header-links pull-left">
				<li><a href="#"><i class="fa fa-phone"></i>${ company.phone }</a></li>
				<li><a href="#"><i class="fa fa-envelope-o"></i> ${ company.email }</a></li>
				<li><a href="#"><i class="fa fa-map-marker"></i> ${ company.address }</a></li>
			</ul>
			<ul class="header-links pull-right">
				<li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
				<c:choose>
					<c:when test="${ sessionScope.user != null }">
						<li><a href="./user/profile.htm"><i class="fa fa-user-o"></i> ${ sessionScope.user.name }
						</a></li>
						<li><a href="./user/logout.htm"> Logout </a></li>
					</c:when>
					<c:otherwise>
						<li><a href="./user/login.htm"><i class="fa fa-user-o"></i>
								Login </a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
	<!-- /TOP HEADER -->

	<!-- MAIN HEADER -->
	<div id="header">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- LOGO -->
				<div class="col-md-3">
					<div class="header-logo">
						<a href="#" class="logo"> <img src="${ company.logo.url }"
							alt="">
						</a>
					</div>
				</div>
				<!-- /LOGO -->

				<!-- SEARCH BAR -->
				<div class="col-md-6">
					<div class="header-search">
						<form method="get" action="./brands/search.htm">
							<input class="input input-select" placeholder="Search here"
								name="search">
							<button class="search-btn">Search</button>
						</form>
					</div>
				</div>
				<!-- /SEARCH BAR -->

				<!-- ACCOUNT -->
				<div class="col-md-3 clearfix">
					<div class="header-ctn">
						<!-- Wishlist -->
						<div>
							<a href="#"> <i class="fa fa-heart-o"></i> <span>Your
									Wishlist</span>
								<div class="qty">0</div>
							</a>
						</div>
						<!-- /Wishlist -->

						<!-- Cart -->
						<div class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown"
								aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Your
									Cart</span> <c:if test="${ totalItem > 0}">
									<div class="qty">${totalItem}</div>
								</c:if>
							</a>
							<div class="cart-dropdown">
								<div class="cart-list">
									<c:if test="${ orders != null }">
										<c:forEach var="order" items="${ orders }">
											<div class="product-widget">
												<div class="product-img">
													<img
														src="${order.category.images[0].url }"
														alt="">
												</div>
												<div class="product-body">
													<h3 class="product-name">
														<a href="./product.htm?id=${order.getCategories().id}">${ order.getCategories().title }</a>
													</h3>
													<h4 class="product-price">
														<span class="qty">${order.quantity}x</span>${order.getCategories().promotionPrice}
													</h4>
												</div>
												<button formmethod="post"
													formaction="./delete.htm?id=${order.id }" class="delete">
													<i class="fa fa-close"></i>
												</button>
											</div>
										</c:forEach>
									</c:if>
								</div>
								<div class="cart-summary">
									<small>${orderCount} Item(s) selected</small>
									<h5>SUBTOTAL: ${ total }</h5>
								</div>
								<div class="cart-btns">
									<a href="./cart.htm">View Cart</a> <a href="#">Checkout <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
							<!-- /Cart -->

							<!-- Menu Toggle -->
							<div class="menu-toggle">
								<a href="#"> <i class="fa fa-bars"></i> <span>Menu</span>
								</a>
							</div>
							<!-- /Menu Toggle -->
						</div>
					</div>
					<!-- /ACCOUNT -->
				</div>
				<!-- row -->
			</div>
			<!-- container -->
		</div>
		<!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->
