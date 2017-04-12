
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<img id="erweima"style="width:100px;height: 100px;"/>
</div>
<script>
    function confirm(){
        document.getElementById("erweima").src="../images/ceshi.png";
    }
</script>
</body>
</html>
