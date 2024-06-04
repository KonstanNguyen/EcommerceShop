<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<base href="${ pageContext.servletContext.contextPath }/">
</head>
<style>
*[id$= .errors] {
	color: red;
	font-style: italic;
}
</style>
${ message }
<body>
	<h1>Register form</h1>
	<form:form action="./user/register.htm" modelAttribute="userRegister">
		<form:errors path="*" element="ul" />
		<div>
			<label>Name</label>
			<form:input path="name" />
			<form:errors path="name" cssClass="text-danger" />
		</div>
		<div>
			<label>Email</label>
			<form:input path="email" />
			<form:errors path="email" cssClass="text-danger" />
		</div>
		<div>
			<label>Tên tài khoản</label>
			<form:input path="username" />
			<form:errors path="username" cssClass="text-danger" />
		</div>
		<div>
			<label>Mật khẩu</label>
			<form:input path="password" />
			<form:errors path="password" cssClass="text-danger" />
		</div>
		<div>
			<label>Xác nhận mật khẩu</label>
			<form:input path="confirmPassword" />
			<form:errors path="confirmPassword" cssClass="text-danger" />
		</div>
		<button>Submit</button>
	</form:form>
</body>
</html>