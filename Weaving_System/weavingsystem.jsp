<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/cr_page.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/cr.js" type="text/javascript" charset="utf-8"></script>
<title>主界面</title>
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
   <div class="container-fluid"style="margin-top:100px;padding:0;">
   <div class="col-md-8 col-xs-12 col-md-offset-2">
   <div class="row">
     <div class="col-md-3 col-xs-3 pic"style="padding:0;height:80%"><img src="images/zj18.jpg"/></div>
     <div class="col-md-3 col-xs-3 pic"style="padding:0"><img src="images/zj12.jpg"/></div>
	 <div class="col-md-3 col-xs-3 pic"style="padding:0"><img src="images/zj5.jpg"/></div>
	  <div class="col-md-3 col-xs-3 pic"style="padding:0"><img src="images/zj13.jpg"/></div>
	</div>
   <div class="col-md-12"style="margin-top: 15px;text-align:center">
   <p style="font-size: 1.5em;text-align:center;font-weight:bold">欢迎您！<span id="designername"></span></p>
   </div>
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
   .nav h4,.nav h4 a{
   color:white;
      line-height:45px;
   }
    *{
	   font-family:FangSong;  
   }
   .pic img{
	   width:100%;
   }
   @media screen and (max-width:999px) {
	    .pic img{
	   height:200px;
   }
    .nav h4,.nav h4 a{
   line-height:25px;
   }
   .navhead h2{
	   line-height:25px;
   }
   }
   @media screen and (max-width:1499px)and(min-width:1000px){
	    .pic img{
	   height:350px;
   }
   }
   @media screen and (min-width:1500px) {
	    .pic img{
	   height:500px;
   }
   }
   </style>
   <script>
       $(document).ready(function() {
            $.ajax({
                type: "get",
                url: "/job/get_info",
                success: function(data) {
                   document.getElementById("designername").innerHTML=data.username;
				} 
            });
        });
   </script>
</html>