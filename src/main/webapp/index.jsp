<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/messages_zh.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#formId").validate({
			rules : {
				username : {
					required : true
				},
				password : {
					required : true
				}
			},
			messages : {
				username : {
					required : "用户名不能为空"
				},
				password : {
					required : "密码不能为空"
				}
			}
		})
	})
</script>
</head>
<body>
	<div
		style="align-content: center; height: 300px; width: 300px; top: 100px; margin: 200px auto;">
		<img src="${pageContext.request.contextPath }/img/logo.png" />
		<form action="${pageContext.request.contextPath }/login.action"
			method="post" id="formId">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="用户名"
					name="username" value="admin">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="登录密码"
					name="password" value="admin">
			</div>
			<div class="form-group">
				${st }
			</div>
			<button type="submit" class="form-control btn btn-success">登录</button>
		</form>
	</div>
</body>
</html>