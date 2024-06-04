<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="${ pageContext.servletContext.contextPath }/">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Send mail</title>
</head>
<body>
	${ message }
	<form action="./user/send.htm" method="post">
		<p><input name="from" placeholder="From"/></p>
		<p><input name="to" placeholder="To"/></p>
		<p><input name="subject" placeholder="Subject"/></p>
		<p><textarea name="body" placeholder="Body" rows="3" cols="30"></textarea></p>
		<button>Send</button>
	</form>
</body>
</html>