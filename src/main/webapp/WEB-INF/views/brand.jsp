<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Brand</title>
</head>
<body>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
		</tr>
		<c:forEach var="brand" items="${ brands }">
			<tr>
				<td>${ brand.ID }</td>
				<td>${ brand.name }</td>
			</tr>
		</c:forEach>
		<c:if test="${ brand != null }">
			<td>${ brand.ID }</td>
			<td>${ brand.name }</td>
		</c:if>
	</table>
</body>
</html>