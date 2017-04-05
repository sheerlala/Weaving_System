
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>个人账户管理</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <script src="../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div style="text-align: center;margin: 100px 100px">
    <p>账户类型：<span id="accounttype"></span><span id="deadline"></span></p><a href="../vip.jsp" target="show" id="alink">开通/续VIP</a>
    <div id="vip"></div>
    <p>账户余额：<span id="balance"></span></p>
    <button class="btn btn-primary" onclick="recharge()">充值</button>
    <div id="rechargediv"style="margin-top: 60px;border: 0px"></div>
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $.ajax({
            type: "get",
            url: "../userinfo/account",
            datetype: "json",
            success: function (data) {
                console.log(data.account_type);
                if (data.account_type == "common") {
                    document.getElementById("accounttype").innerHTML = "普通用户";

                } else {
                    document.getElementById("accounttype").innerHTML = "vip用户";
                    document.getElementById("deadline").innerHTML = data.deadline;
                }
                document.getElementById("balance").innerHTML = data.balance;
            }
        })
    });
    function vipservice(){
        $("#vip").load("../vip.jsp");
    }
    function recharge(){
        $("#rechargediv").load("../recharge.jsp");
    }
</script>
<style>
    p{
        size: 2em;;
    }
</style>
</body>
</html>
