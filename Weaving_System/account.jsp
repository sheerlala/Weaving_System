
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>个人账户管理</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <script src="../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body style="background-color:#f0f0f0">
   <div class="row"style="position:fixed;right:2px;top:0px;z-index:90;background-color:#f0f0f0;width:100%;height:40px;">
     <div style="margin-right:30px;margin-top:5px;text-align:right">
                <a href="../vip.jsp" target="show" class="btn btn-sm btn-primary">开通VIP</a>
                <a href="/j_spring_security_logout" class="btn btn-sm btn-primary">注&nbsp;&nbsp;销</a>
	 </div>
   </div>
   <div class="row" style="background-color:black;height:60px;width:100%;position:fixed;left:16px;top:40px;z-index:90">
     <div class="col-md-2 col-md-offset-1 col-xs-3 navhead">
	<h2>纺织云平台</h2></div>
      <div class="dropdown">   
		 <div class="col-md-2 col-md-offset-1 col-xs-offset-1 col-xs-2 nav">
		 <h4 class="dropdown-toggle"data-toggle="dropdown">项目管理
		 <span class="caret"></span></h4>
                <ul class="dropdown-menu" role="menu">
                    <li role="presentation"><a href ="projects.jsp" target ="_self">已有项目</a>
                    </li>
                    <li role="presentation"><a href ="newproject.jsp" target ="_self">新建项目</a>
                    </li>
                </ul>
		  </div>
            <div class="col-md-2 col-xs-3 nav"><h4 class="dropdown-toggle"data-toggle="dropdown">个人信息管理<span class="caret"></span></h4>
            <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a href ="change_info.jsp" target ="_self">个人信息修改</a>
                </li>
                <li role="presentation">
                    <a href ="../updatepwd.jsp" target ="_self">密码修改</a>
                </li>
            </ul>
          </div>
          <div class="col-md-2 col-xs-3 nav"><h4> <a href ="account.jsp" target ="_self">个人账户管理</a></h4>
		  </div>	  
       </div>
   </div>
<div class="container"style="margin-top:150px;padding:0">
<div class="col-md-6 col-md-offset-3" id="account">
    <p>账户类型：<span id="accounttype"></span><span id="deadline"></span></p>
	<button class="btn btn-primary" onclick="vipservice()">开通/续VIP</button>
	<!--a href="../vip.jsp" target="_self" id="alink">开通/续VIP</a-->
    <div id="vip"></div>
    <p>账户余额：<span id="balance"></span></p>
    <button class="btn btn-primary" onclick="recharge()">充值</button>
    <div id="rechargediv"style="margin-top: 60px;border: 0px"></div>
</div>
</div>
  <style>
  .navhead{
	   z-index:100;
	   background-color:#e0e0e0;
	   margin-top:-12px;
	   height:140%;
	   vertical-align:text-top;
	   border-radius:3%;
	   box-shadow:7px 7px 3px #444;
   }
   .navhead h2{
	   line-height:45px;
	   text-align:center;
	   font-family:FangSong;
	   font-weight:bold;
   }
   @media screen and (max-width:999px) {
    .nav h4,.nav h4 a{
   line-height:25px;
   }
   .navhead h2{
	   line-height:25px;
   }
   }
   .nav h4,.nav h4 a{
   line-height:45px;
   color:white;
   font-family:	FangSong;
   }
   *{
	   font-family:FangSong;  
   }
    #account{
	   text-align:center;
   }
 #account p{
	   text-align:center;
	   font-size:18px;
   }
   </style>
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
