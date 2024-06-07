<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</html>