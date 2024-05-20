<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">


			<c:forEach varStatus="status" begin="1" end="3">
				<div class="col-md-4 col-xs-6">
					<div class="section-title">
						<h4 class="title">Top selling</h4>
						<div class="section-nav">
							<div id="slick-nav-${ status.index+2 }"
								class="products-slick-nav"></div>
						</div>
					</div>

					<div class="products-widget-slick"
						data-nav="#slick-nav-${ status.index+2 }">
						<c:forEach begin="0" end="${ cateTopSellings.size()/3 }" varStatus="status">
							<div>
								<c:forEach var="category" items="${ cateTopSellings }"
									begin="${ status.index*3 }" end="${ status.index*3+2 }">
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
							</div>
<!-- 							<div class="clearfix visible-sm visible-xs"></div> -->
						</c:forEach>
					</div>
				</div>

			</c:forEach>



			<!-- 						<div class="col-md-4 col-xs-6"> -->
			<!-- 							<div class="section-title"> -->
			<!-- 								<h4 class="title">Top selling</h4> -->
			<!-- 								<div class="section-nav"> -->
			<!-- 									<div id="slick-nav-3" class="products-slick-nav"></div> -->
			<!-- 								</div> -->
			<!-- 							</div> -->

			<!-- 							<div class="products-widget-slick" data-nav="#slick-nav-3"> -->
			<!-- 								<div> -->
			<!-- 									product widget -->
			<%-- 									<c:forEach var="category" items="${ cateTopSellings }" end="2"> --%>
			<!-- 										<div class="product-widget"> -->
			<!-- 											<div class="product-img"> -->
			<%-- 												<img src="${ category.image.url }" alt=""> --%>
			<!-- 											</div> -->
			<!-- 											<div class="product-body"> -->
			<%-- 												<p class="product-category">${ category.brandName }</p> --%>
			<!-- 												<h3 class="product-name"> -->
			<%-- 													<a href="./product.htm?id=${category.id}">${category.title}</a> --%>
			<!-- 												</h3> -->
			<!-- 												<h4 class="product-price"> -->
			<%-- 													${ category.price } --%>
			<%-- 													<del class="product-old-price">${ category.promotionPrice }</del> --%>
			<!-- 												</h4> -->
			<!-- 											</div> -->
			<!-- 										</div> -->
			<%-- 									</c:forEach> --%>
			<!-- 									/product widget -->
			<!-- 								</div> -->

			<!-- 								<div> -->
			<!-- 									product widget -->
			<%-- 									<c:forEach var="category" items="${ cateTopSellings }" end="2"> --%>
			<!-- 										<div class="product-widget"> -->
			<!-- 											<div class="product-img"> -->
			<%-- 												<img src="${ category.image.url }" alt=""> --%>
			<!-- 											</div> -->
			<!-- 											<div class="product-body"> -->
			<%-- 												<p class="product-category">${ category.brandName }</p> --%>
			<!-- 												<h3 class="product-name"> -->
			<%-- 													<a href="./product.htm?id=${category.id}">${category.title}</a> --%>
			<!-- 												</h3> -->
			<!-- 												<h4 class="product-price"> -->
			<%-- 													${ category.price } --%>
			<%-- 													<del class="product-old-price">${ category.promotionPrice }</del> --%>
			<!-- 												</h4> -->
			<!-- 											</div> -->
			<!-- 										</div> -->
			<%-- 									</c:forEach> --%>
			<!-- 									/product widget -->
			<!-- 								</div> -->
			<!-- 							</div> -->
			<!-- 						</div> -->

			<!-- 						<div class="col-md-4 col-xs-6"> -->
			<!-- 							<div class="section-title"> -->
			<!-- 								<h4 class="title">Top selling</h4> -->
			<!-- 								<div class="section-nav"> -->
			<!-- 									<div id="slick-nav-4" class="products-slick-nav"></div> -->
			<!-- 								</div> -->
			<!-- 							</div> -->

			<!-- 							<div class="products-widget-slick" data-nav="#slick-nav-4"> -->
			<!-- 								<div> -->
			<!-- 									product widget -->
			<%-- 									<c:forEach var="category" items="${ cateTopSellings }"> --%>
			<!-- 										<div class="product-widget"> -->
			<!-- 											<div class="product-img"> -->
			<%-- 												<img src="${ category.image.url }" alt=""> --%>
			<!-- 											</div> -->
			<!-- 											<div class="product-body"> -->
			<%-- 												<p class="product-category">${ category.brandName }</p> --%>
			<!-- 												<h3 class="product-name"> -->
			<%-- 													<a href="./product.htm?id=${category.id}">${category.title}</a> --%>
			<!-- 												</h3> -->
			<!-- 												<h4 class="product-price"> -->
			<%-- 													${ category.price } --%>
			<%-- 													<del class="product-old-price">${ category.promotionPrice }</del> --%>
			<!-- 												</h4> -->
			<!-- 											</div> -->
			<!-- 										</div> -->
			<%-- 									</c:forEach> --%>
			<!-- 									/product widget -->
			<!-- 								</div> -->

			<!-- 								<div> -->
			<!-- 									product widget -->
			<%-- 									<c:forEach var="category" items="${ cateTopSellings }"> --%>
			<!-- 										<div class="product-widget"> -->
			<!-- 											<div class="product-img"> -->
			<%-- 												<img src="${ category.image.url }" alt=""> --%>
			<!-- 											</div> -->
			<!-- 											<div class="product-body"> -->
			<%-- 												<p class="product-category">${ category.brandName }</p> --%>
			<!-- 												<h3 class="product-name"> -->
			<%-- 													<a href="./product.htm?id=${category.id}">${category.title}</a> --%>
			<!-- 												</h3> -->
			<!-- 												<h4 class="product-price"> -->
			<%-- 													${ category.price } --%>
			<%-- 													<del class="product-old-price">${ category.promotionPrice }</del> --%>
			<!-- 												</h4> -->
			<!-- 											</div> -->
			<!-- 										</div> -->
			<%-- 									</c:forEach> --%>
			<!-- 									/product widget -->
			<!-- 								</div> -->
			<!-- 								<div> -->
			<!-- 									product widget -->
			<%-- 									<c:forEach var="category" items="${ cateTopSellings }"> --%>
			<!-- 										<div class="product-widget"> -->
			<!-- 											<div class="product-img"> -->
			<%-- 												<img src="${ category.image.url }" alt=""> --%>
			<!-- 											</div> -->
			<!-- 											<div class="product-body"> -->
			<%-- 												<p class="product-category">${ category.brandName }</p> --%>
			<!-- 												<h3 class="product-name"> -->
			<%-- 													<a href="./product.htm?id=${category.id}">${category.title}</a> --%>
			<!-- 												</h3> -->
			<!-- 												<h4 class="product-price"> -->
			<%-- 													${ category.price } --%>
			<%-- 													<del class="product-old-price">${ category.promotionPrice }</del> --%>
			<!-- 												</h4> -->
			<!-- 											</div> -->
			<!-- 										</div> -->
			<%-- 									</c:forEach> --%>
			<!-- 									/product widget -->
			<!-- 								</div> -->
			<!-- 							</div> -->
			<!-- 						</div> -->

			<!-- 						<div class="clearfix visible-sm visible-xs"></div> -->

			<!-- 						<div class="col-md-4 col-xs-6"> -->
			<!-- 							<div class="section-title"> -->
			<!-- 								<h4 class="title">Top selling</h4> -->
			<!-- 								<div class="section-nav"> -->
			<!-- 									<div id="slick-nav-5" class="products-slick-nav"></div> -->
			<!-- 								</div> -->
			<!-- 							</div> -->

			<!-- 							<div class="products-widget-slick" data-nav="#slick-nav-5"> -->
			<!-- 								<div> -->
			<!-- 									product widget -->
			<%-- 									<c:forEach var="category" items="${ cateTopSellings }" end="2"> --%>
			<!-- 										<div class="product-widget"> -->
			<!-- 											<div class="product-img"> -->
			<%-- 												<img src="${ category.image.url }" alt=""> --%>
			<!-- 											</div> -->
			<!-- 											<div class="product-body"> -->
			<%-- 												<p class="product-category">${ category.brandName }</p> --%>
			<!-- 												<h3 class="product-name"> -->
			<%-- 													<a href="./product.htm?id=${category.id}">${category.title}</a> --%>
			<!-- 												</h3> -->
			<!-- 												<h4 class="product-price"> -->
			<%-- 													${ category.price } --%>
			<%-- 													<del class="product-old-price">${ category.promotionPrice }</del> --%>
			<!-- 												</h4> -->
			<!-- 											</div> -->
			<!-- 										</div> -->
			<%-- 									</c:forEach> --%>
			<!-- 									/product widget -->
			<!-- 								</div> -->

			<!-- 								<div> -->
			<!-- 									product widget -->
			<%-- 									<c:forEach var="category" items="${ cateTopSellings }" end="2"> --%>
			<!-- 										<div class="product-widget"> -->
			<!-- 											<div class="product-img"> -->
			<%-- 												<img src="${ category.image.url }" alt=""> --%>
			<!-- 											</div> -->
			<!-- 											<div class="product-body"> -->
			<%-- 												<p class="product-category">${ category.brandName }</p> --%>
			<!-- 												<h3 class="product-name"> -->
			<%-- 													<a href="./product.htm?id=${category.id}">${category.title}</a> --%>
			<!-- 												</h3> -->
			<!-- 												<h4 class="product-price"> -->
			<%-- 													${ category.price } --%>
			<%-- 													<del class="product-old-price">${ category.promotionPrice }</del> --%>
			<!-- 												</h4> -->
			<!-- 											</div> -->
			<!-- 										</div> -->
			<%-- 									</c:forEach> --%>
			<!-- 									/product widget -->
			<!-- 								</div> -->
			<!-- 							</div> -->
			<!-- 						</div> -->




		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->