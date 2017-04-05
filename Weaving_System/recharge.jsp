<%--
  Created by IntelliJ IDEA.
  User: 侠圣
  Date: 2016/7/25
  Time: 20:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>充值</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <script src="../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div class="form-control"style="border: 0px">
    <label class="control-label" for="recharge">充值金额</label>
    <input name="recharge" id="recharge"style="border-color:#888"/></div>
<button class="btn btn-primary" onclick="confirm()">确定</button>
<img id="erweima"/>
</div>
<script>
    function confirm(){
        document.getElementById("erweima").src="../images/ceshi.png";
    }
</script>
</body>
</html>
