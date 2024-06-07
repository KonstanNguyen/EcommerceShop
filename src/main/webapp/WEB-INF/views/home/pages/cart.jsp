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
					<form method="post" action="/cart.htm?id=${order.id }">
						<input type="hidden" name="orderID" value="${order.id }">
						<div class="row border-top border-bottom">
							<div class="row main align-items-center">
								<div class="col-2">
									<img class="img-fluid" src="./assets/img/product01.png">
								</div>
								<div class="col">
									<div class="row text-muted">${order.categories.brand.name }</div>
									<div class="row">${order.categories.title}</div>
								</div>
								<div class="col">
									<span class="button-like decrement">-</span> <span
										class="border value">${order.quantity}</span> <span
										class="button-like increment">+</span>
								</div>
								<div class="col">
									<c:choose>
										<c:when test="${order.categories.promotionPrice != null}">
                                      ${order.categories.promotionPrice }</c:when>
										<c:otherwise>${order.categories.price }</c:otherwise>
									</c:choose>
									<button>
										<span class="close">Delete</span>
									</button>
								</div>
							</div>
						</div>
					</form>
				</c:forEach>
				<!-- 					<div class="row main align-items-center"> -->
				<!-- <div class="col-2">
							<img class="img-fluid" src="https://i.imgur.com/ba3tvGm.jpg">
						</div>
						<div class="col">
							<div class="row text-muted">Shirt</div>
							<div class="row">Cotton T-shirt</div>
						</div>
						<div class="col">
							<span class="button-like decrement">-</span> <span
								class="border value">1</span> <span
								class="button-like increment">+</span>
						</div>
						<div class="col">
							&euro; 44.00 <span class="close">Delete</span>
						</div>
					</div>
					<div class="row border-top border-bottom">
						<div class="row main align-items-center">
							<div class="col-2">
								<img class="img-fluid" src="https://i.imgur.com/pHQ3xT3.jpg">
							</div>
							<div class="col">
								<div class="row text-muted">Shirt</div>
								<div class="row">Cotton T-shirt</div>
							</div>
							<div class="col">
								<span class="button-like decrement">-</span> <span
									class="border value">1</span> <span
									class="button-like increment">+</span>
							</div>
							<div class="col">
								&euro; 44.00 <span class="close">Delete</span>
							</div>
						</div>
					</div> -->
				<div class="back-to-shop">
					<a href="./brands.htm">&leftarrow;</a><span class="text-muted">Back
						to shop</span>
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
					<button class="btn">CHECKOUT</button>
				</a>
			</div>
		</div>

	</div>

	<script>
	//Xử lý phần tăng giảm số lượng sản phẩm
	 document.addEventListener('DOMContentLoaded', (event) => {
         document.body.addEventListener('click', function(e) {
             if (e.target.classList.contains('decrement') || e.target.classList.contains('increment')) {
                 const valueElement = e.target.parentElement.querySelector('.value');
                 let value = parseInt(valueElement.textContent, 10);

                 if (e.target.classList.contains('decrement') && value > 1) {
                     value--;
                 } else if (e.target.classList.contains('increment')) {
                     value++;
                 }

                 valueElement.textContent = value;
             }
         });
     });
	 //Xử lý phần xóa sản phẩm
 	document.addEventListener('DOMContentLoaded', function () {
        // Tìm tất cả các nút "Delete"
        var deleteButtons = document.querySelectorAll('.close');

        deleteButtons.forEach(function (button) {
            button.addEventListener('click', function () {
                // Tìm phần tử .row.parent gần nhất để xóa
                var row = button.closest('.row');
                if (row) {
                    row.remove();
                }
            });
        });
    });
    </script>
</body>
</html>