<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Brand</title>
</head>
<body>
	<table id="band">
			<tr>
				<th>ID</th>
				<th>Name</th>
			</tr>
			<c:forEach var="br" items="${ brands }">
				<tr class="table-row">
					<td>${ br.ID }</td>
					<td>${ br.name }</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>