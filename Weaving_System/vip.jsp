<%--
  Created by IntelliJ IDEA.
  User: 侠圣
  Date: 2016/7/25
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <script src="../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div style="margin: 50px 100px;text-align: center">
    <p>尊敬的用户，您好！<br>开通VIP可享受无限次免费下载服务。<br>其中，月VIP 30元/月，可在一个月内无限次下载纹板图；<br>年VIP 200月/年，可在一年内无限次下载纹板图</p>
<button class="btn btn-primary" onclick="monthvip()">开通月VIP</button>
<button class="btn btn-primary" onclick="yearvip()">开通年VIP</button>
    <div style="margin-top: 30px">
        <img id="erweima" style="width: 100px;height: 100px;border: 0px"/></div></div>

<script>
    function monthvip(){
        document.getElementById("erweima").src="../images/ceshi.png";
    }
    function yearvip(){
        document.getElementById("erweima").src="../images/ceshi.png";
    }
</script>
</body>
</html>
