<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath }/">
	<meta charset="UTF-8">
	<title>Hibernate</title>
</head>
<body>
	<form:form action="user/insertNeed.htm" modelAttribute="need">
	${message }
    	<div>
    		<label>Username</label>
    		<form:input path="id"/>
    	</div>
    	<div>
    		<label>Password</label>
    		<form:input path="name"/>
    	</div>
    	<%-- <div>
    		<label>Fullname</label>
    		<form:input path="fullname"/>
    	</div> --%>
    	<div>
    		<button class="btn btn-default">Insert</button>
    	</div>
    </form:form>
</body>
</html>