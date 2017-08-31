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
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>编辑主讲人-主讲人管理</h2>
		</div>
		<form class="form-horizontal" action="${pageContext.request.contextPath }/speaker/addSpeaker.action" method="post">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">名字</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3"
						placeholder="名字" name="speakerName">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">职业</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputPassword3"
						placeholder="职业" name="speakerJob">
				</div>
			</div>
			<div class="form-group">
				<label for="inputImage3" class="col-sm-2 control-label">头像图片</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputImage3" name="speakerHeadUrl">
				</div>
			</div>
			<div class="form-group">
				<label for="textarea3" class="col-sm-2 control-label">简介</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3" id="textarea3"
						placeholder="简介" name="speakerDescr"></textarea>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">保存</button>
					<a class="btn btn-default" href="javascript:history.go(-1)">返回列表</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>