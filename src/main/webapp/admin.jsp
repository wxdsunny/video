<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Insert title here</title>
		<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
		<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.min.js"></script>
		<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
		<style>
			.container-fluid{
				border: 0px solid black;
				margin-left: 20%;
				margin-right: 20%;
			}
		</style>
</head>
<body>
	<nav class="navbar navbar-inverse" style="margin-bottom: 0px;">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-9" aria-expanded="false"></button>
					<a class="navbar-brand" href="#">视频管理系统</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
					<ul class="nav navbar-nav">
						<li>
							<a target="pageBox" href="${pageContext.request.contextPath }/video/videoList.action">视频管理</a>
						</li>
						<li>
							<a target="pageBox" href="${pageContext.request.contextPath }/speaker/speakerList.action">主讲人管理</a>
						</li>
						<li>
							<a target="pageBox" href="${pageContext.request.contextPath }/course/courseList.action">课程管理</a>
						</li>
						<li>
							<a target="pageBox" href="${pageContext.request.contextPath }/statistic/statisticList.action">统计分析</a>
						</li>
					</ul>
					<ul class="nav navbar-nav nav navbar-right">
						<li>
							<a href="#">${user}</a>
						</li>
						<li>
							<a class="glyphicon glyphicon-log-in"></a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="embed-responsive embed-responsive-16by9">
			<iframe class="embed-responsive-item" src="${pageContext.request.contextPath }/video/videoList.action" name="pageBox"></iframe>
		</div>
</body>
</html>