<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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

				<div class="col-md-7">
					<!-- Billing Details -->
					${ message }
					<form method="post" action="user/checkout.htm" class="billing-details">
						<div class="section-title">
							<h3 class="title">Billing address</h3>
						</div>
						<input name="id" value="${ ecoInvoice.id }" hidden="true" />
						<div class="form-group">
							<input name="taxCode" value="${ ecoInvoice.taxCode }" class="input" placeholder="TAX Code" />
						</div>
						<input name="date" value="${ ecoInvoice.date }" hidden="true"/>
						<div class="form-group">
							<input name="name" value="${ ecoInvoice.name }" class="input" placeholder="Name" />
						</div>
						<div class="form-group">
							<input name="email" value="${ ecoInvoice.email }" class="input" type="email"
								placeholder="Email" />
						</div>
						<div class="form-group">
							<input name="phone" value="${ ecoInvoice.phone }" class="input" type="tel"
								placeholder="Telephone" />
						</div>
						<div class="form-group">
							<input name="address" value="${ ecoInvoice.address }" class="input" placeholder="Address" />
						</div>
						<div>
							<button class="primary-btn order-submit">Insert</button>
						</div>
					</form>
					<!-- /Billing Details -->

					<!-- Shiping Details -->
					<div class="shiping-details">
						<div class="section-title">
							<h3 class="title">Shiping address</h3>
						</div>
						<div class="input-checkbox">
							<input type="checkbox" id="shiping-address"> <label
								for="shiping-address"> <span></span> Ship to a diffrent
								address?
							</label>
							<div class="caption">
								<div class="form-group">
									<input class="input" type="text" name="first-name"
										placeholder="First Name">
								</div>
								<div class="form-group">
									<input class="input" type="text" name="last-name"
										placeholder="Last Name">
								</div>
								<div class="form-group">
									<input class="input" type="email" name="email"
										placeholder="Email">
								</div>
								<div class="form-group">
									<input class="input" type="text" name="address"
										placeholder="Address">
								</div>
								<div class="form-group">
									<input class="input" type="text" name="city" placeholder="City">
								</div>
								<div class="form-group">
									<input class="input" type="text" name="country"
										placeholder="Country">
								</div>
								<div class="form-group">
									<input class="input" type="text" name="zip-code"
										placeholder="ZIP Code">
								</div>
								<div class="form-group">
									<input class="input" type="tel" name="tel"
										placeholder="Telephone">
								</div>
							</div>
						</div>
					</div>
					<!-- /Shiping Details -->

					<!-- Order notes -->
					<div class="order-notes">
						<textarea class="input" placeholder="Order Notes"></textarea>
					</div>
					<!-- /Order notes -->
				</div>

				<!-- Order Details -->
				<div class="col-md-5 order-details">
					<div class="section-title text-center">
						<h3 class="title">Your Order</h3>
					</div>
					<div class="order-summary">
						<div class="order-col">
							<div>
								<strong>PRODUCT</strong>
							</div>
							<div>
								<strong>TOTAL</strong>
							</div>
						</div>
						<div class="order-products">
							<div class="order-col">
								<div>1x Product Name Goes Here</div>
								<div>$980.00</div>
							</div>
							<div class="order-col">
								<div>2x Product Name Goes Here</div>
								<div>$980.00</div>
							</div>
						</div>
						<div class="order-col">
							<div>Shiping</div>
							<div>
								<strong>FREE</strong>
							</div>
						</div>
						<div class="order-col">
							<div>
								<strong>TOTAL</strong>
							</div>
							<div>
								<strong class="order-total">$2940.00</strong>
							</div>
						</div>
					</div>
					<div class="payment-method">
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-1"> <label
								for="payment-1"> <span></span> Direct Bank Transfer
							</label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua.</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-2"> <label
								for="payment-2"> <span></span> Cheque Payment
							</label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua.</p>
							</div>
						</div>
						<div class="input-radio">
							<input type="radio" name="payment" id="payment-3"> <label
								for="payment-3"> <span></span> Paypal System
							</label>
							<div class="caption">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua.</p>
							</div>
						</div>
					</div>
					<div class="input-checkbox">
						<input type="checkbox" id="terms"> <label for="terms">
							<span></span> I've read and accept the <a href="#">terms &
								conditions</a>
						</label>
					</div>
					<a href="#" class="primary-btn order-submit">Place order</a>
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
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<%@ include file="../../elements/jQuery-plugin.jsp"%>
</body>
</html>
