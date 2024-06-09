<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href="${ pageContext.servletContext.contextPath }/">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Upload file</title>
</head>
<style>
.form-group {
	margin: 10px;
}
</style>
<body>
	<h2>NỘP ĐƠN XIN VIỆC</h2>
	<form action="job/apply.htm" method="POST" enctype="multipart/form-data">
		<div class="form-group">
			<div>Họ và tên ứng viên</div>
			<input type="text" name="fullname">
		</div>
		<div class="form-group">
			<div>Hình ảnh</div>
			<input type="file" name="photo">
		</div>
		<div class="form-group">
			<div>Hồ sơ xin việc</div>
			<input type="file" name="cv">
		</div>
		<div class="form-group">
			<button type="su">Submit</button>
		</div>
	</form>
</body>
</html>