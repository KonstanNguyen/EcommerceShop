<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<base href="${ pageContext.servletContext.contextPath }/" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Admin Dashboard - Orders</title>

<%@ include file="../admin/layout/link.jsp"%>


</head>

<body>
	<%@ include file="../admin/layout/preloader.jsp"%>

	<div id="main-wrapper">

		<%@ include file="../admin/layout/header.jsp"%>


		<%@ include file="../admin/layout/sidebar.jsp"%>
		<!--**********************************
            Content body start
        ***********************************-->

		<div class="content-body">
			<div class="container-fluid">

				<!-- row -->


				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Order List</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="example" class="display" style="min-width: 845px">
										<thead>
											<tr>
												<th>#</th>
												<th>Customer</th>
												<th>Total Amount</th>
												<th>Order Date</th>
												<th>Action</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="user" items="${users}">
												<c:forEach var="cart" items="${user.carts}">
													<tr>
														<td>${cart.id}</td>
														<td>${user.name}</td>
														<td>${cart.getFirstOrder().invoice.totalAmount}</td>
														<td>${cart.createTime}</td>
														<td><a style="color:green; font-size: 16px; font-weight: bold"
															href='./admin/orderDetails.htm?username=${user.username}&id=${cart.id}'>Details</a></td>
													</tr>
												</c:forEach>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		
		<!-- End Content -->

		<%@ include file="../admin/layout/footer.jsp"%>


	</div>


	<%@ include file="../admin/layout/script.jsp"%>

</body>

</html>