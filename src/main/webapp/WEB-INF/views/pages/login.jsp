<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="vi">
<head>
	<base href="${ pageContext.servletContext.contextPath }/">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Đăng nhập</title>
	<link rel="stylesheet" type="text/css"
			href="<c:url value='./assets/css/login.css' />"/>
</head>
<body>
	<main>
		<div class="login__background-image"></div>
		<div class="container">
			<h1 class="login__title">ĐĂNG NHẬP</h1>
			<p class="login__describe">Chào mừng bạn đến với cửa hàng</p>

			<form action="./user/login.htm"
				id="form-login" class="form-login" method="POST">
				<span class="username__text--error"></span>
				<div class="form-login__group">
					<div class="form-login__icon">
						<i class="bi bi-person"></i>
					</div>
					<input name="username" class="form-login__username" type="text"
						placeholder="Tài khoản" value="${username}">
				</div>

				<span style="display: block" class="password__text--error">${message}</span>
				<span class="password__text--error"></span>
				<div class="form-login__group">
					<div class="form-login__icon">
						<i class="bi bi-shield-lock"></i>
					</div>
					<input name="password" class="form-login__password" type="password"
						placeholder="Mật khẩu">
				</div>

				<button class="btn_login" type="submit">Đăng nhập</button>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</div>
	</main>
	<script src="./assets/js/jquery.min.js"></script>
	<script
		src="./assets/js/jquery.validate.min.js"></script>
	<script
		src="<c:url value='./assets/js/validationLogin.js' />"></script>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en" class="h-100">

<head>
<base href="${ pageContext.servletContext.contextPath }/" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Login</title>
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
									<h4 class="text-center mb-4">Sign in your account</h4>
									<div>${ message }</div>
									<form action="./user/login.htm" method="post">
										<div class="form-group">
											<label><strong>Username</strong></label> <input type="text"
												class="form-control" name="username" required>
										</div>
										<div class="form-group">
											<label><strong>Password</strong></label> <input
												type="password" class="form-control" name="password"
												required>
										</div>
										<div class="form-row d-flex justify-content-between mt-4 mb-2">
											<div class="form-group">
												<div class="form-check ml-2">
													<input class="form-check-input" type="checkbox"
														id="basic_checkbox_1"> <label
														class="form-check-label" for="basic_checkbox_1">Remember
														me</label>
												</div>
											</div>
											<div class="form-group">
												<a href="page-forgot-password.html">Forgot Password?</a>
											</div>
										</div>
										<div class="text-center">
											<button type="submit" class="btn btn-primary btn-block">Sign
												me in</button>
										</div>
									</form>
									<div class="new-account mt-3">
										<p>
											Don't have an account? <a class="text-primary"
												href="./user/register.htm">Sign up</a>
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