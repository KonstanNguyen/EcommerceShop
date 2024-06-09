<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${ pageContext.servletContext.contextPath }/">
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
					<h3 class="breadcrumb-header">Checkout</h3>
					<ul class="breadcrumb-tree">
						<li><a href="#">Home</a></li>
						<li class="active">Checkout</li>
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

				<div class="col-md-4">
					<!-- Billing Details -->
					${ message }
					<form:form action="checkout.htm" cssClass="billing-details" modelAttribute="ecoInvoice">
						<div class="section-title">
							<h3 class="title">Billing address</h3>
						</div>
						<div class="form-group">
							<form:input path="name" cssClass="input" type="text" placeholder="Name" />
						</div>
						<div class="form-group">
							<form:input path="email" cssClass="input" type="email"
								placeholder="Email" />
						</div>
						<div class="form-group">
							<form:input path="phone" cssClass="input" type="tel"
								placeholder="Telephone" />
						</div>
						<div class="form-group">
							<form:input path="address" cssClass="input" placeholder="Address" />
						</div>
						<div class="form-group">
							<form:input path="taxCode" cssClass="input" placeholder="Tax Code"/>
						</div>
						<div>
							<button class="primary-btn order-submit">Place order</button>
						</div>
					</form:form>
					<!-- /Billing Details -->

					<!-- /Shiping Details -->

					<!-- Order notes -->
				
					<!-- /Order notes -->
				</div>

				<!-- Order Details -->
				<div class="col-md-8 order-details">
					<div class="section-title text-center">
						<h3 class="title">Your Order</h3>
					</div>
					<div class="row order-summary">
						<div class="row">
							<div class="col-md-8">
								<strong>PRODUCT</strong>
							</div>
							<div class="col-md-2">
								<strong>Promotion</strong>
							</div>
							<div class="col-md-2">
								<strong>TOTAL</strong>
							</div>
						</div>

						<div class="row">
							<c:forEach var="order" items="${cart.orders}">
								<div class="col-md-8">${order.quantity }x
									${order.category.title }</div>
								<div class="col-md-2">${ order.totalPromotion }%</div>
								<div class="col-md-2">${ order.quantity*order.category.promotionPrice *(100 - order.totalPromotion)/100 } </div>
							</c:forEach>
						</div>


						<div class="row">
							<div class="col-md-10">Shiping</div>
							<div class="col-md-2">
								<strong>FREE</strong>
							</div>
						</div>
						<div class="row">
							<div class="col-md-10">
								<strong>TOTAL</strong>
							</div>
							<div class="col-md-2">
								<strong class="order-total">${total }</strong>
							</div>
						</div>
					</div>
				</div>
				<!-- /Order Details -->
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
							<input class="input" type="email" placeholder="Enter Your Email" required>
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
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<%@ include file="../../elements/jQuery-plugin.jsp"%>
</body>
</html>
