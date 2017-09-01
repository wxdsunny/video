<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description"
	content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
<link rel="stylesheet" href="static/css/base.css">
<link rel="stylesheet" href="static/css/profile.css">
<title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
<script src="js/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="css/jquery-confirm.css">
<script src="js/jquery-confirm.js"></script>
<style type="text/css">
.btn-alert {
	width: 200px;
	height: 200px;
}
</style>
</head>

<body class="w100">
	<jsp:include page="uheader.jsp"></jsp:include>
	<main>
	<div class="container">
		<h2>我的资料</h2>
		<div id="profile_tab">
			<ul class="profile_tab_header f_left clearfix">
				<li><a href="front/user/profile.do">更改资料</a></li>
				<li class="profile_tab_line">|</li>
				<li><a href="front/user/avatar.do">更改头像</a></li>
				<li class="profile_tab_line">|</li>
				<li><a href="front/user/password.do">密码安全</a></li>
			</ul>
			<div class="proflle_tab_body">
				<div class="proflle_tab_workplace clearfix">
					<div class="profile_avatar_area">

						<c:if test="${empty user.headUrl}">
							<img id="avatar" src="static/img/avatar_lg.png" alt="">
						</c:if>

						<c:if test="${not empty user.headUrl}">
							<img id="avatar" width="200px" height="200px"
								src="/pic/${user.headUrl}" alt="">
						</c:if>

					</div>

					<div class="profile_ifo_area">

						<c:if test="${not empty message}">
							<div>
								<strong>${message}</strong>
							</div>
						</c:if>
						<form action="front/user/password.do" method="post" id="formId">
							<div class="form_group">
								<span class="dd">旧&#x3000;密&#x3000;码：</span> <input
									type="password" id="oldPassword" name="oldPassword"><span
									id="spanId"></span>
							</div>
							<div class="form_group">
								<span class="dd">新&#x3000;密&#x3000;码：</span> <input
									type="password" id="newPassword" name="newPassword">
							</div>
							<div class="form_group">
								<span class="dd">确认新密码：</span> <input type="password"
									id="newPassword02" name="newPasswordAgain">
							</div>
							<div class="form_submit dd">
								<input type="hidden" name="id" value="${user.id }" id="userId">
								<input type="submit" value="保&#x3000;存" id="submitId1">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
	<jsp:include page="ufooter.jsp"></jsp:include>
	<%@include file="../include/script.html"%>
	<script type="text/javascript">
		$("#formId").validate(
				{
					submitHandler : function(form) {
						$.confirm({
							title : '提醒!',
							content : '确定要修改吗',
							buttons : {
								确定修改 : function() {
									$.post("front/user/password.do", $(
											"#formId").serialize(), function(
											result) {
										if (result.success) {
											$.alert({
												title : '提示!',
												content : '请重新登录',
											});
											setTimeout("abc()", 3000);
										} else {
											$.alert({
												title : '提示!',
												content : '用户旧密码不正确',
											});
											setTimeout(function() {
												location.reload();
											}, 3000);
										}
									});
								},
								取消 : function() {
								}
							}
						});
					},
					rules : {
						newPassword : {
							required : true,
							minlength : 3
						},
						newPasswordAgain : {
							required : true,
							equalTo : $("[name=newPassword]")
						}
					},
					messages : {
						newPassword : {
							required : "密码不能为空",
							minlength : "密码不能小于三位"
						},
						newPasswordAgain : {
							required : "密码不能为空",
							equalTo : "两次密码 不一致"
						}
					}
				});
		$("#oldPassword").blur(function() {
			var oldPassword = $("#oldPassword").val();
			var userId = $("#userId").val();
			$.get('front/user/oldPassword.do', {
				"oldPassword" : oldPassword,
				"userId" : userId
			}, function(data) {
				if (data == "success") {
					$("#spanId").text("");
				} else {
					$("#spanId").text("输入的原密码不正确");
				}
				;
			});
		});
		function abc() {
			window.location.href = "front/index.action";
		};
		/* $("#submitId1").click(
				function() {
					var newPassword = $("#newPassword").val();
					var newPassword02 = $("#newPassword02").val();
					alert(newPassword == newPassword02);
					if (newPassword == newPassword02) {
						$.confirm({
							title : '提醒!',
							content : '确定要修改吗',
							buttons : {
								确定修改 : function() {
									$.post("front/user/password.do", $(
											"#formId").serialize(), function(
											result) {
										if (result.success) {
											$.alert({
												title : '提示!',
												content : '请重新登录',
											});
											setTimeout("abc()", 3000);
										} else {
											alert("为空");
											$.alert({
												title : '提示!',
												content : '用户旧密码不正确',
											});
											setTimeout(function() {
												location.reload();
											}, 3000);
										}
									});
								},
								取消 : function() {
								}
							}
						});
					} else {
						$.alert({
							title : '提示!',
							content : '两次密码不一致!',
						});
					}

				}); */
	</script>
</body>
</html>