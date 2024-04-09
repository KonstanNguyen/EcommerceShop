<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Need</title>
</head>
<body>
	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
		</tr>
		<c:forEach var="task" items="${ tasks }">
			<tr>
				<td>${ task.id }</td>
				<td>${ task.name }</td>
			</tr>
		</c:forEach>
		<c:if test="${ task != null }">
			<td>${ task.id }</td>
			<td>${ task.name }</td>
		</c:if>
	</table>
</body>
</html>