<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>编辑视频信息-视频管理</h2>
		</div>
		<form class="form-horizontal" action="${pageContext.request.contextPath }/admin/video/updatevideo.action" method="post">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">视频标题</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="videoTitle"
						id="inputEmail3" value="${video.videoTitle }">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPerson3" class="col-sm-2 control-label">主讲人</label>
				<div class="col-sm-10">
				
					<select class="form-control" name="speakerId">
					  <c:forEach items="${speaker }" var="speaker">
						<option value="${speaker.id }" ${speaker.id == video.speakerId  ? "selected":""}>${speaker.speakerName }</option>
					  </c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="inputObject3" class="col-sm-2 control-label" >所属课程</label>
				<div class="col-sm-10" >
					<select class="form-control" name="courseId">
					  <c:forEach items="${course }" var="course">
						<option value="${course.id }" ${course.id == video.courseId ? "selected":""}>${course.courseName }</option>
					  </c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="inputTime3" class="col-sm-2 control-label">视频时长</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="videoLength" id="inputTime3"
						value="${video.videoLength }">
				</div>
			</div>
			<div class="form-group">
				<label for="inputImage3" class="col-sm-2 control-label">封面图片</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="videoImageUrl" id="inputImage3" value="${video.videoImageUrl }">
				</div>
			</div>
			<div class="form-group">
				<label for="inputAddress" class="col-sm-2 control-label">视频播放地址</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="videoUrl" id="inputAddress"
						value="${video.videoUrl }">
				</div>
			</div>
			<div class="form-group">
				<label for="textarea3" class="col-sm-2 control-label">视频简介</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" name="videoDescr" id="textarea3"
						>${video.videoDescr }</textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
				    <input type="hidden" name="id" value="${video.id }">
					<button type="submit" class="btn btn-primary">修改</button>
					<a class="btn btn-default" href="javascript:history.go(-1)">返回列表</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>