<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!-- HOT DEAL SECTION -->
<div id="hot-deal" class="section">
<!-- 	style="background-image: url('./assets/img/hotdeal.png');"> -->
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<div class="hot-deal">
					<ul class="hot-deal-countdown">
						<li>
							<div>
								<h3 id="day"></h3>
								<span>Days</span>
							</div>
						</li>
						<li>
							<div>
								<h3 id="hour"></h3>
								<span>Hours</span>
							</div>
						</li>
						<li>
							<div>
								<h3 id="min"></h3>
								<span>Mins</span>
							</div>
						</li>
						<li>
							<div>
								<h3 id="sec"></h3>
								<span>Secs</span>
							</div>
						</li>
						
					</ul>
					<div id="EXPIRED"></div>
						<div hidden="true" data-value="${ countDownDate }" class="countDownDate"></div>
					<h2 class="text-uppercase">hot deal this week</h2>
					<p>New Collection Up to ${ promotion.dealPercent } OFF</p>
					<a class="primary-btn cta-btn" href="./brands/all/promotion/${ promotion.id }.htm">Shop now</a>
				</div>
				<script src="<c:url value='./assets/js/hot-deal-countdown.js'/>"></script>
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /HOT DEAL SECTION -->