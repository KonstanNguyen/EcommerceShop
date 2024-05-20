<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
		<c:forEach begin="1" end="3">
		<div class="col-md-4 col-xs-6">
				<div class="section-title">
					<h4 class="title">Top selling</h4>
					<div class="section-nav">
						<div id="slick-nav-3" class="products-slick-nav"></div>
					</div>
				</div>

				<div class="products-widget-slick" data-nav="#slick-nav-3">
					<%-- 					<c:forEach var="category" items="${ categories }" status="status"> --%>

					<%-- 					</c:forEach> --%>
					<div>
						<!-- product widget -->
						<c:forEach var="category" items="${ cateTopSellings }" end="2">
							<div class="product-widget">
								<div class="product-img">
									<img src="${ category.image.url }" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${ category.brandName }</p>
									<h3 class="product-name">
										<a href="./product.htm?id=${category.id}"}">${category.title}</a>
									</h3>
									<h4 class="product-price">
										${ category.price }
										<del class="product-old-price">${ category.promotionPrice }</del>
									</h4>
								</div>
							</div>
						</c:forEach>
						<!-- /product widget -->
					</div>

					<div>
						<!-- product widget -->
						<c:forEach var="category" items="${ cateTopSellings }" end="2">
							<div class="product-widget">
								<div class="product-img">
									<img src="${ category.image.url }" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${ category.brandName }</p>
									<h3 class="product-name">
										<a href="./product.htm?id=${category.id}">${category.title}</a>
									</h3>
									<h4 class="product-price">
										${ category.price }
										<del class="product-old-price">${ category.promotionPrice }</del>
									</h4>
								</div>
							</div>
						</c:forEach>
						<!-- /product widget -->
					</div>
				</div>
			</div>
			
		</c:forEach>
			

			<div class="col-md-4 col-xs-6">
				<div class="section-title">
					<h4 class="title">Top selling</h4>
					<div class="section-nav">
						<div id="slick-nav-4" class="products-slick-nav"></div>
					</div>
				</div>

				<div class="products-widget-slick" data-nav="#slick-nav-4">
					<div>
						<!-- product widget -->
						<c:forEach var="category" items="${ cateTopSellings }" end="2">
							<div class="product-widget">
								<div class="product-img">
									<img src="${ category.image.url }" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${ category.brandName }</p>
									<h3 class="product-name">
										<a href="./product.htm?id=${category.id}">${category.title}</a>
									</h3>
									<h4 class="product-price">
										${ category.price }
										<del class="product-old-price">${ category.promotionPrice }</del>
									</h4>
								</div>
							</div>
						</c:forEach>
						<!-- /product widget -->
					</div>

					<div>
						<!-- product widget -->
						<c:forEach var="category" items="${ cateTopSellings }" end="2">
							<div class="product-widget">
								<div class="product-img">
									<img src="${ category.image.url }" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${ category.brandName }</p>
									<h3 class="product-name">
										<a href="./product.htm?id=${category.id}">${category.title}</a>
									</h3>
									<h4 class="product-price">
										${ category.price }
										<del class="product-old-price">${ category.promotionPrice }</del>
									</h4>
								</div>
							</div>
						</c:forEach>
						<!-- /product widget -->
					</div>
					<div>
						<!-- product widget -->
						<c:forEach var="category" items="${ cateTopSellings }" end="2">
							<div class="product-widget">
								<div class="product-img">
									<img src="${ category.image.url }" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${ category.brandName }</p>
									<h3 class="product-name">
										<a href="./product.htm?id=${category.id}">${category.title}</a>
									</h3>
									<h4 class="product-price">
										${ category.price }
										<del class="product-old-price">${ category.promotionPrice }</del>
									</h4>
								</div>
							</div>
						</c:forEach>
						<!-- /product widget -->
					</div>
				</div>
			</div>

			<div class="clearfix visible-sm visible-xs"></div>

			<div class="col-md-4 col-xs-6">
				<div class="section-title">
					<h4 class="title">Top selling</h4>
					<div class="section-nav">
						<div id="slick-nav-5" class="products-slick-nav"></div>
					</div>
				</div>

				<div class="products-widget-slick" data-nav="#slick-nav-5">
					<div>
						<!-- product widget -->
						<c:forEach var="category" items="${ cateTopSellings }" end="2">
							<div class="product-widget">
								<div class="product-img">
									<img src="${ category.image.url }" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${ category.brandName }</p>
									<h3 class="product-name">
										<a href="./product.htm?id=${category.id}">${category.title}</a>
									</h3>
									<h4 class="product-price">
										${ category.price }
										<del class="product-old-price">${ category.promotionPrice }</del>
									</h4>
								</div>
							</div>
						</c:forEach>
						<!-- /product widget -->
					</div>

					<div>
						<!-- product widget -->
						<c:forEach var="category" items="${ cateTopSellings }" end="2">
							<div class="product-widget">
								<div class="product-img">
									<img src="${ category.image.url }" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">${ category.brandName }</p>
									<h3 class="product-name">
										<a href="./product.htm?id=${category.id}">${category.title}</a>
									</h3>
									<h4 class="product-price">
										${ category.price }
										<del class="product-old-price">${ category.promotionPrice }</del>
									</h4>
								</div>
							</div>
						</c:forEach>
						<!-- /product widget -->	
					</div>
				</div>
			</div>

		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->