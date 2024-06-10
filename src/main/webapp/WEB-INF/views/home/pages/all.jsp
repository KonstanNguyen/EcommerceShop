<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">

<head>
<base href="${ pageContext.servletContext.contextPath }/" />
<%@ include file="../../elements/head.jsp"%>
</head>

<body>
	<!-- HEADER -->
	<%@ include file="../elements/header.jsp"%>
	<!-- /HEADER -->

	<!-- NAVIGATION -->
	<%@ include file="../elements/navigation.jsp"%>
	<!-- /NAVIGATION -->

	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<ul class="breadcrumb-tree">
						<li><a href="#">Home</a></li>
						<li><a href="#">All Categories</a></li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- ASIDE -->
				<div id="aside" class="col-md-3">
					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Brand</h3>
						<div class="checkbox-filter">
							<%-- <c:forEach var="brand" items="${brands}">
								<div class="input-checkbox">
									<input type="checkbox" id="${brand.id}"> <label
										for="${brand.id}"> <span></span> ${brand.name}
									</label>
								</div>
							</c:forEach> --%>

							<form id="brandForm"
								action="./brands/all/filterProductsByBrand.htm" method="get">
								<c:forEach var="brand" items="${brands}">
									<div class="input-checkbox">
										<input type="checkbox" class="brand-checkbox"
											id="brand-${brand.id}" name="brandIds" value="${brand.id}"
											<c:if test="${not empty selectedBrandIds and fn:contains(selectedBrandIds, brand.id)}">checked</c:if>>
										<label for="brand-${brand.id}"> <span></span>
											${brand.name}
										</label>
									</div>
								</c:forEach>
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>

						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Categories</h3>
						<div class="checkbox-filter">

							<div class="input-checkbox">
								<input type="checkbox" id="category-1"> <label
									for="category-1"> <span></span> Laptops <small>(120)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-2"> <label
									for="category-2"> <span></span> Smartphones <small>(740)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-3"> <label
									for="category-3"> <span></span> Cameras <small>(1450)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-4"> <label
									for="category-4"> <span></span> Accessories <small>(578)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-5"> <label
									for="category-5"> <span></span> Laptops <small>(120)</small>
								</label>
							</div>

							<div class="input-checkbox">
								<input type="checkbox" id="category-6"> <label
									for="category-6"> <span></span> Smartphones <small>(740)</small>
								</label>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->

					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Price</h3>
						<div class="price-filter">
							<div id="price-slider"></div>
							<div class="input-number price-min">
								<input id="price-min" type="number"> <span
									class="qty-up">+</span> <span class="qty-down">-</span>
							</div>
							<span>-</span>
							<div class="input-number price-max">
								<input id="price-max" type="number"> <span
									class="qty-up">+</span> <span class="qty-down">-</span>
							</div>
						</div>
					</div>
					<!-- /aside Widget -->



					<!-- aside Widget -->
					<div class="aside">
						<h3 class="aside-title">Top selling</h3>

						<div class="products-widget-slick"
							data-nav="#slick-nav-${ status.index+2 }">
							<%@ include file="../elements/section-top-selling/slide.jsp"%>
						</div>
					</div>
					<!-- /aside Widget -->
				</div>
				<!-- /ASIDE -->

				<!-- STORE -->
				<div id="store" class="col-md-9">
					<!-- store top filter -->
					<div class="store-filter clearfix">
						<div class="store-sort">
							<label> Sort By: <select class="input-select">
									<option value="0">Popular</option>
									<option value="1">Position</option>
							</select>
							</label> <label> Show: <select class="input-select">
									<option value="0">20</option>
									<option value="1">50</option>
							</select>
							</label>
						</div>
						<ul class="store-grid">
							<li class="active"><i class="fa fa-th"></i></li>
							<li><a href="#"><i class="fa fa-th-list"></i></a></li>
						</ul>
					</div>
					<!-- /store top filter -->

					<!-- store products -->
					<div class="row">
						<!-- product -->
						<div class="col-md-12">
							<c:forEach var="category" items="${ categories }">
								<form method="post" action="./brands/all.htm">
									<div class="col-md-4 col-xs-6">
										<input type="hidden" name="categoryid" value="${category.id}">
										<div class="product">
											<div class="product-img" style="height:230px;">
												<img src="${category.images[0].url }" alt="" style="width:100%;">
												<div class="product-label">
													<span class="sale">-30%</span> <span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">${category.brand.name}</p>
												<h3 class="product-name textOverFlow"
													style="height: 30.78px;">
													<a href="./product.htm?id=${category.id}">${category.title}</a>
												</h3>
												<h4 class="product-price">${category.promotionPrice}
													<del class="product-old-price">${category.price}</del>
												</h4>
												<div class="product-rating">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist">
														<i class="fa fa-heart-o"></i><span class="tooltipp">add
															to wishlist</span>
													</button>
													<button class="add-to-compare">
														<i class="fa fa-exchange"></i><span class="tooltipp">add
															to compare</span>
													</button>
													<button class="quick-view">
														<i class="fa fa-eye"></i><span class="tooltipp">quick
															view</span>
													</button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn" type="submit">
													<i class="fa fa-shopping-cart"></i> add to cart
												</button>
											</div>
										</div>
									</div>
								</form>
							</c:forEach>
						</div>
						<!-- /product -->
					</div>
					<!-- /store products -->

					<!-- store bottom filter -->
					<div class="store-filter clearfix">
						<span class="store-qty">Showing 20-100 products</span>
						<ul class="store-pagination">
							<li class="active">1</li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
						</ul>
					</div>
					<!-- /store bottom filter -->
				</div>
				<!-- /STORE -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="newsletter">
						<p>
							Sign Up for the <strong>NEWSLETTER</strong>
						</p>
						<form>
							<input class="input" type="email" placeholder="Enter Your Email">
							<button class="newsletter-btn">
								<i class="fa fa-envelope"></i> Subscribe
							</button>
						</form>
						<ul class="newsletter-follow">
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /NEWSLETTER -->

	<!-- FOOTER -->
	<%@ include file="../../elements/footer.jsp"%>

	<!-- jQuery Plugins -->
	<%@ include file="../../elements/jQuery-plugin.jsp"%>

</body>
</html>