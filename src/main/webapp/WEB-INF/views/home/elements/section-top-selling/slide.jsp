<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:forEach begin="0" end="${ cateTopSellings.size()/3 }"
	varStatus="status">
	<div>
		<c:forEach var="category" items="${ cateTopSellings }"
			begin="${ status.index*3 }" end="${ status.index*3+2 }">
			<div class="product-widget">
				<div class="product-img">
					<img src="${ category.image.url }" alt="">
				</div>
				<div class="product-body">
					<p class="product-category">${ category.brandName }</p>
					<h3 class="product-name textOverFlow">
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
</c:forEach>