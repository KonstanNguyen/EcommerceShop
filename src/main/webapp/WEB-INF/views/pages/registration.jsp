<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<base href="${ pageContext.servletContext.contextPath }/">
<%@ include file="../elements/head.jsp"%>
</head>
<style>
</style>
<body>
	<div class="container">
		<div class="row">
			<h1 class="col-md-12 text-uppercase text-center">Register form</h1>
			<form:form action="./user/register.htm" modelAttribute="userRegister">
				<div data-mdb-input-init class="form-outline mb-4">
					<form:input path="name" class="form-control form-control-lg" />
					<label class="form-label">Tên</label>
					<form:errors path="name" cssClass="text-danger" />
				</div>
				<div data-mdb-input-init class="form-outline mb-4">
					<form:input path="email" class="form-control form-control-lg" />
					<label class="form-label">Email</label>
					<form:errors path="email" cssClass="text-danger" />
				</div>
				<div data-mdb-input-init class="form-outline mb-4">
					<form:input path="username" class="form-control form-control-lg" />
					<label class="form-label">Tên tài khoản</label>
					<form:errors path="username" cssClass="text-danger" />
				</div>
				<div data-mdb-input-init class="form-outline mb-4">
					<form:input path="password" class="form-control form-control-lg" />
					<label class="form-label">Mật khẩu</label>
					<form:errors path="password" cssClass="text-danger" />
				</div>
				<div data-mdb-input-init class="form-outline mb-4">
					<form:input path="confirmPassword"
						class="form-control form-control-lg" />
					<label class="form-label">Xác nhận mật khẩu</label>
					<form:errors path="confirmPassword" cssClass="text-danger" />
				</div>
				<div class="d-flex justify-content-center">
					<button type="submit" data-mdb-button-init data-mdb-ripple-init
						class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
<base href="${pageContext.servletContext.contextPath}/" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Register</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/favicon.png">
<link href="./assets/css/admin/style.css" rel="stylesheet">
</head>

<body class="h-100">
	<div class="authincation h-100">
		<div class="container-fluid h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-6">
					<div class="authincation-content">
						<div class="row no-gutters">
							<div class="col-xl-12">
								<div class="auth-form">
									<h4 class="text-center mb-4">Create your account</h4>
									<div>${ message }</div>
									<form action="./user/register.htm" method="post">
										<input type="hidden" name="action" value="register">
										<div class="form-group">
											<label><strong>Full Name</strong></label> <input type="text"
												class="form-control" name="name" required>
										</div>
										<div class="form-group">
											<label><strong>Email</strong></label> <input type="email"
												class="form-control" name="email" required>
										</div>
										<div class="form-group">
											<label><strong>Username</strong></label> <input type="text"
												class="form-control" name="username" required>
										</div>
										<div class="form-group">
											<label><strong>Password</strong></label> <input
												type="password" class="form-control" name="password"
												required>
										</div>
										<div class="form-group">
											<label><strong>Confirm Password</strong></label> <input
												type="password" class="form-control" name="confirmPassword"
												required>
										</div>
										<div class="text-center">
											<button type="submit" class="btn btn-primary btn-block">Sign
												Up</button>
										</div>
									</form>
									<div class="new-account mt-3">
										<p>
											Already have an account? <a class="text-primary"
												href="./user/login.htm">Sign in</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--**********************************
        Scripts
    ***********************************-->
	<!-- Required vendors -->
	<%@ include file="../elements/jQuery-plugin.jsp"%>

</body>

</html>
