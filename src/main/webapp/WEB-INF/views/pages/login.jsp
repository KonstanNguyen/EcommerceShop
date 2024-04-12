<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<main>
		<div class="login__background-image"></div>
		<div class="container">
			<h1 class="login__title">ĐĂNG NHẬP</h1>
			<p class="login__describe">Chào mừng bạn đến với cửa hàng</p>

			<form action="<c:url value='j_spring_security_login' />"
				id="form-login" class="form-login" method="POST">
				<span class="username__text--error"></span>
				<div class="form-login__group">
					<div class="form-login__icon">
						<i class="bi bi-person"></i>
					</div>
					<input name="username" class="form-login__username" type="text"
						placeholder="Tài khoản" value="${username}">
				</div>

<%-- 				<span style="display: block" class="password__text--error">${message}</span> --%>
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
</html>