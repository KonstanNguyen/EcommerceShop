<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Change Password</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
/* Custom styles */
.container {
	margin-top: 50px;
}

.form-group {
	margin-bottom: 20px;
}

.btn {
	width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<h2 class="text-center">Change Password</h2>
		<form id="changePasswordForm" method="POST"
			action="./user/changePassword.htm">
			<div class="form-group">
				<label for="currentPassword">Username:</label> <input
					type="text" class="form-control" id="username"
					name="username" disabled="disabled" value="${user.username}" readonly>
			</div>
			<div class="form-group">
				<label for="currentPassword">Current Password:</label> <input
					type="password" class="form-control" id="currentPassword"
					name="currentPassword" required>
			</div>
			<div class="form-group">
				<label for="newPassword">New Password:</label> <input
					type="password" class="form-control" id="newPassword"
					name="newPassword" required>
			</div>
			<div class="form-group">
				<label for="confirmPassword">Confirm New Password:</label> <input
					type="password" class="form-control" id="confirmPassword"
					name="confirmPassword" required>
			</div>
			<button type="submit" class="btn btn-primary">Change
				Password</button>
		</form>
	</div>
</body>
</html>