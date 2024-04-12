<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<base href="${ pageContext.servletContext.contextPath }/"/>
	<%@ include file="../elements/head.jsp" %>
</head>
<body>
	<%@ include file="../home/elements/header.jsp" %>
	<%@ include file="../home/elements/navigation.jsp" %>
	<%@ include file="../home/elements/section-new-product.jsp" %>
	<%@ include file="../home/elements/section-hot-product.jsp" %>
	<%@ include file="../home/elements/section-top-selling.jsp" %>
	<%@ include file="../elements/jQuery-plugin.jsp" %>
	<%@ include file="../elements/footer.jsp" %>
</body>
</html>