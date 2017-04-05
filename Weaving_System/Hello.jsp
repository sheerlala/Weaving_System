<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html>
	<head>
		<!--声明当前页面的编码集：charset=gbk,gb2312(中文编码)，utf-8国际编码-->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!--当前页面的三要素-->
		<title>Hello!User</title>
		<meta name="Keywords" content="关键词,关键词">
		<meta name="description" content="">

		<!--css,js-->
		<style type="text/css">
			*{margin:0;padding:0;}
			body{-webkit-user-select:none;-moz-user-select:none;-o-user-select:none;user-select:none;}
			body {overflow: hidden;background:black;}
			.content{height:80px;position:absolute;top:45%;left:45%;}
			.content p{font-size:30px;width:350px;text-align:center;color:#fff;font-weight:800;}
		</style>
		<script type="text/javascript" src="js/cr_canvas.js"></script>
	</head>
<body>
<canvas id="canvas-club"></canvas>
<div class="content">
	<p>
		欢迎登陆！
	</p>
	<p>
		停车场管理系统0.2测试版
	</p>
</div>

<script type="text/javascript">
	cr_canvas.drawFireWork("canvas-club");
</script>
</body>
</html>