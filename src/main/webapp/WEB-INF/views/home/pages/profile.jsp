<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<base href="${ pageContext.servletContext.contextPath }/" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="./assets/css/profile.css" />
<link type="text/css" rel="stylesheet" href="./assets/css/profile.css" />
<title>User Profile</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<h2>User Profile</h2>
				<form action="./user/profile.htm" method="post">
					<div class="form-group">
						<label for="username">Username</label> <input type="text"
							class="form-control" id="username" name="username"
							value="${user.username}" readonly>
					</div>

					<div class="form-group">
						<label for="name">name</label> <input type="text"
							class="form-control" id="name" name="name" value="${user.name}">
					</div>
					<div class="form-group">
						<label for="email">Email address</label> <input type="email"
							class="form-control" id="email" name="email"
							value="${user.email}">
					</div>
					<div class="form-group">
						<label for="phone">Phone Number</label> <input type="text"
							class="form-control" id="phone" name="phone"
							value="${user.phone}">
					</div>
					<div class="form-group">
						<label for="address">Address</label> <input type="text"
							class="form-control" id="address" name="address"
							value="${user.address}">
					</div>
					<div class="form-group">
						<label for="cmnd">CMND</label> <input type="text"
							class="form-control" id="CMND" name="CMND" value="${user.CMND}">
					</div>

					<div class="form-group">
						<label for="dateOfBirth">Date of Birth</label> <input type="date"
							class="form-control" id="dateOfBirth" name="dateOfBirth"
							value="${user.dateOfBirth}">
					</div>
					<div class="update-value" style="color:red">
						<%
						String message = request.getParameter("message");
						if (message != null && message.equals("success")) {
						%>
						Cập nhật thành công
						<%
						} else if (message != null && message.equals("error")) {
						%>
						Cập nhật thất bại
						<%
						}
						%>
					</div>
					<div class="button-container">
						<button type="submit" class="btn btn-primary btn-lg">Update
							Profile</button>
						<a href="./brands.htm" class="btn btn-secondary btn-lg" style="margin-top:20px">Back
							to Home</a>
							<a href="./changePassword.htm" class="btn btn-secondary btn-lg" style="margin-top:20px">Change Password</a>
					</div>
				</form>
			</div>
			<div class="col-md-4">
				<h3>
					<a href="./showOrders.htm">Order History</a>
				</h3>
			</div>
		</div>
	</div>
</body>
</html>
