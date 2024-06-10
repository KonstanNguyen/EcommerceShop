<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="./assets/css/cart.css" />

</head>
<body>
	<form action="./cart.htm" method="POST">
		<div class="card">
			<div class="row">
				<div class="col-md-8 cart">
					<div class="title">
						<div class="row">
							<div class="col">
								<h4>
									<b>Shopping Cart</b>
								</h4>
							</div>
							<div class="col align-self-center text-right text-muted">${totalItem}
								items</div>
						</div>
					</div>
					<c:forEach items="${orders }" var="order">
						<input type="hidden" name="orderID" value="${order.id}">
						<div class="row border-top border-bottom py-2">
							<div class="row main align-items-center w-100">
								<div class="col-2">
									<!-- <img class="img-fluid" src="./assets/img/product01.png"> -->
									<img class="img-fluid" src="${order.categories.images[0].url }">
								</div>
								<div class="col-4">
									<div class="row text-muted">${order.categories.brand.name}</div>
									<div class="row">${order.categories.title}</div>
								</div>
								<div class="col-3 d-flex align-items-center">
									<button class="button-like decrement" type="button">-</button>
									<input type="number" min="0" max="99" name="quantity" value="${order.quantity}" style="width: 44px; margin-top:25px">
									<button class="button-like increment" type="button">+</button>
								</div>
								<div class="col-2 text-center">
									<c:choose>
										<c:when test="${order.categories.promotionPrice != null}">
                        ${order.categories.promotionPrice}
                    </c:when>
										<c:otherwise>
                        ${order.categories.price}
                    </c:otherwise>
									</c:choose>
								</div>
								<div
									class="col-1 text-center d-flex justify-content-center align-items-center">
									<a href="delete.htm?id=${order.id}"> <span class="close">Delete</span>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="back-to-shop">
						<a href="./brands.htm"><button class="btn-custom" type="button">
								<span class="text-muted">&leftarrow; Back to shop</span>
							</button></a>
					</div>
				</div>
				<div class="col-md-4 summary">
					<div>
						<h5>
							<b>Summary</b>
						</h5>
					</div>
					<hr>
					<div class="row"
						style="border-top: 1px solid rgba(0, 0, 0, .1); padding: 2vh 0;">
						<div class="col">TOTAL PRICE</div>
						<div class="col text-right">${total }</div>
					</div>
					<a href="./checkout.htm">
						<button id="checkoutButton" class="btn" type="submit">CHECKOUT</button>
					</a>
				</div>
			</div>

		</div>
	</form>
	<script>
	//Xử lý phần tăng giảm số lượng sản phẩm
document.querySelectorAll('.increment').forEach(button => {
        button.addEventListener('click', function() {
            // Lấy ô input số lượng tương ứng
            const quantityInput = this.parentElement.querySelector('input[type="number"]');
            // Tăng giá trị số lượng lên 1
            quantityInput.value = parseInt(quantityInput.value) + 1;
        });
    });

    // Thêm sự kiện cho nút Giảm
    document.querySelectorAll('.decrement').forEach(button => {
        button.addEventListener('click', function() {
            // Lấy ô input số lượng tương ứng
            const quantityInput = this.parentElement.querySelector('input[type="number"]');
            // Giảm giá trị số lượng đi 1, nhưng không thể nhỏ hơn 1
            quantityInput.value = Math.max(parseInt(quantityInput.value) - 1, 1);
        });
    });
	 //Xử lý phần xóa sản phẩm



    </script>

</body>
</html>