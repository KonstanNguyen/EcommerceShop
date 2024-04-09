<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category</title>
</head>
<body>
<%-- 	<form:form action="category/index.htm" modelAttribute="category"> --%>
<!-- 		<div> -->
<%-- 			<form:label path="id" hidden="true"/> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<label>Name</label> -->
<%-- 			<form:label path="title"/> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<label>Task</label> -->
<%-- 			<form:select path="tasks.id" items="${ tasks }" itemValue="id" itemLabel="name"/> --%>
<!-- 		</div> -->
<!-- 		<div> -->
<!-- 			<button>Save</button> -->
<!-- 		</div> -->
<%-- 	</form:form> --%>
	<c:if test="${ category != null }">
		<td>${ category.id }</td>
		<td>${ category.title }</td>
	</c:if>
		
	<c:forEach var="category" items="${ categories }">
		<div>${ category.tasks }</div>
	</c:forEach>
	
	<c:forEach var="task" items="${ tasks }">
		<div>
		<span>${ task.id }</span> 
		<span>${ task.name }</span>
	</div>
	</c:forEach>
</body>
</html>