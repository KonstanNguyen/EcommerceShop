<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				${ message }
				<form:form action="./user/profile.htm" method="post" modelAttribute="user">
					<div class="form-group">
						<label for="username">Username</label>
						<form:input path="username" readonly="true"
							cssClass="form-control" />
						<form:errors path="username" cssClass="error" />
					</div>

					<div class="form-group">
						<label for="name">name</label>
						<form:input path="name" cssClass="form-control" />
						<form:errors path="name" cssClass="error" />
					</div>
					<div class="form-group">
						<label for="email">Email address</label>
						<form:input path="email" cssClass="form-control" />
						<form:errors path="email" cssClass="error" />
					</div>
					<div class="form-group">
						<label for="phone">Phone Number</label>
						<form:input path="phone" cssClass="form-control" />
						<form:errors path="phone" cssClass="error" />
					</div>
					<div class="form-group">
						<label for="address">Address</label>
						<form:input path="address" cssClass="form-control" />
						<form:errors path="address" cssClass="error" />
					</div>
					<div class="form-group">
						<label for="cmnd">CMND</label>
						<form:input path="CMND" cssClass="form-control" />
						<form:errors path="CMND" cssClass="error" />
					</div>

					<div class="form-group">
						<label for="dateOfBirth">Date of Birth</label>
						<form:input  path="dateOfBirth" cssClass="form-control" />
						<form:errors path="dateOfBirth" cssClass="error" />
					</div>

					<div class="button-container">
						<button type="submit" class="btn btn-primary btn-lg">Update
							Profile</button>
						<a href="./brands.htm" class="btn btn-secondary btn-lg"
							style="margin-top: 20px">Back to Home</a> <a
							href="./user/changePassword.htm" class="btn btn-secondary btn-lg"
							style="margin-top: 20px">Change Password</a>
					</div>
				</form:form>
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
