
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	 <script src="js/cr_page.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/cr.js" type="text/javascript" charset="utf-8"></script>
<title>weavingsystem</title>
</head>
<body style="background-color:#f0f0f0">
    <div class="row"style="position:fixed;right:2px;top:0px;z-index:90;background-color:#f0f0f0;width:100%;height:40px;">
     <div style="margin-right:30px;margin-top:5px;text-align:right">
                <a href="../vip.jsp" target="show" class="btn btn-sm btn-primary">开通VIP</a>
                <a href="javascript:logout()" class="btn btn-sm btn-primary">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</a>
	 </div>
   </div>
   <div class="row" style="background-color:black;height:60px;width:100%;position:fixed;left:16px;top:40px;z-index:90">
    <div class="col-md-2 col-md-offset-1 col-xs-2"style="z-index:100;background-color:#e0e0e0;margin-top:-12px;height:140%;vertical-align:text-top;border-radius:3%;box-shadow:7px 7px 3px #444;">
	<h2 style="line-height:45px;text-align:center;font-family:FangSong;font-weight:bold">纺织云平台</h2></div>
      <div class="dropdown">   
		 <div class="col-md-2 col-md-offset-1 nav">
		 <h4 class="dropdown-toggle"data-toggle="dropdown">项目管理
		 <span class="caret"></span></h4>
                <ul class="dropdown-menu" role="menu">
                    <li role="presentation"><a href ="projects.jsp" target ="_self">已有项目</a>
                    </li>
                    <li role="presentation"><a href ="newproject.jsp" target ="_self">新建项目</a>
                    </li>
                </ul>
		  </div>
          <div class="col-md-2 nav"><h4 class="dropdown-toggle"data-toggle="dropdown">个人信息管理<span class="caret"></span></h4>
            <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a href ="change_info.jsp" target ="show">个人信息修改</a>
                </li>
                <li role="presentation">
                    <a href ="../updatepwd.jsp" target ="show">密码修改</a>
                </li>
            </ul>
          </div>
          <div class="col-md-2 nav"><h4> <a href ="account.jsp" target ="show">个人账户管理</a></h4>
		  </div>	  
       </div>
   </div>
   <div class="container"style="margin-top:100px;padding:0">
   <div class="col-md-10 col-md-offset-1">
   <div class="row">
     <div class="col-md-3"style="padding:0"><img src="images/zj18.jpg" style="width:100%;height:350px;"/></div>
     <div class="col-md-3"style="padding:0"><img src="images/zj12.jpg" style="width:100%;height:350px;"/></div>
	 <div class="col-md-3"style="padding:0"><img src="images/zj5.jpg" style="width:100%;height:350px;"/></div>
	  <div class="col-md-3"style="padding:0"><img src="images/zj13.jpg" style="width:100%;height:350px;"/></div>
	</div>
   <div class="col-md-12"style="margin-top: 10px;text-align:center">
   <p style="font-size: 1.4em;text-align:center;">欢迎您！<span id="designername"></span></p>
   </div>
   </div>
   </div>
   <style>
   .nav h4,.nav h4 a{
   line-height:45px;
   color:white;
   font-family:	FangSong;
   }
   </style>
   <script>
       $(document).ready(function() {
            $.ajax({
                type: "get",
                url: "/job/get_info",
                success: function(data) {
                   document.getElementById("designername").innerHTML=data.username;
				   document.getElementById("address").innerHTML=data.place;
				   document.getElementById("email").innerHTML=data.Email;
				} 
            });
        });
   </script>
</html>