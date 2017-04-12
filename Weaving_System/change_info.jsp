<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%    String show="2";
	request.setAttribute("show",show);

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>修改个人信息</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<style type="text/css">
	 *{
	   font-family:FangSong;
	   font-weight:bold;	  
   }
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
   input{
	   font-family:arial;
   }
		div label {
			margin-top: 8px;
			font-size:15px;
		}
		.star {
			color: red;
			font-size: 20px;
			line-height: 45px;
		}
		.file {
			position: relative;
			display: inline-block;
			background: #02578A;
			border: 1px solid #99D3F5;
			border-radius: 4px;
			padding: 4px 12px;
			overflow: hidden;
			color: #fff;
			text-decoration: none;
			text-indent: 0;
			line-height: 20px;
		}

		.file input {
			position: absolute;
			font-size: 100px;
			right: 0;
			top: 0;
			opacity: 0;
		}

		.file:hover {
			background: #143990;
			border-color: #78C3F3;
			color: #fff;
			text-decoration: none;
		}
		   .nav h4,.nav h4 a{
   line-height:45px;
   color:white;
   font-family:	FangSong;
   }
	</style>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
	<script src="../js/jquery-1.11.3.js" type="text/javascript" charset="utf-8"></script>
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
<div class="col-md-10 col-md-offset-1">
	<!--<h1 style="text-align: center;">添加用户</h1><br /><br />-->
	<p id="error" style="text-align: center;font-size: 20px;color:red;margin-left: -10%;display: none;"></p>
	<form action="/userinfo/update" method="post" target="_self" modelAttribute="user" class="form" onsubmit="return saveUser();">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-md-push-2">
					<div class="col-md-1 col-md-push-5 col-xs-1 col-xs-push-1">
						<span class="star">*</span>
					</div>
					<div class="col-md-6 col-md-push-4 hidden-sm hidden-xs">
						<label for="name">姓&nbsp;&nbsp;&nbsp;名:</label>
					</div>
				</div>
				<div class="col-md-3 col-xs-6 col-md-push-2 col-xs-push-1">
					<input type="text" readonly  name="name"  id="name" class="form-control" placeholder="姓名"  style="border-color:#888"/>
				</div>
			</div>
			<br />

			<div class="row">
				<div class="col-md-2 col-md-push-2">
					<div class="col-md-1 col-md-push-5 col-xs-1 col-xs-push-1">
						<span class="star">*</span>
					</div>
					<div class="col-md-9 col-md-push-4 hidden-sm hidden-xs">
						<label for="phonenumber">手机号码:</label>
					</div>
				</div>
				<div class="col-md-3 col-xs-6 col-md-push-2 col-xs-push-1">
					<input type="text" name="phonenumber"  id="phonenumber" class="form-control" placeholder="手机号码"  style="border-color:#888"/>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-2 col-md-push-2">
					<div class="col-md-1 col-md-push-5 col-xs-1 col-xs-push-1">
						<span class="star">*</span>
					</div>
					<div class="col-md-9 col-md-push-4 hidden-sm hidden-xs">
						<label for="Email">邮&nbsp;&nbsp;&nbsp;箱:</label>
					</div>
				</div>
				<div class="col-md-3 col-xs-6 col-md-push-2 col-xs-push-1">
					<input type="text" name="Email" id="Email" class="form-control" placeholder="邮箱"  style="border-color:#888"/>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-md-2 col-md-push-2">
					<div class="col-md-1 col-md-push-5 col-xs-1 col-xs-push-1">
					<span class="star">*</span>
					</div>
					<div class="col-md-9 col-md-push-4 hidden-sm hidden-xs">
						<label for="place">工作地点:</label>
					</div>
				</div>

				<div class="col-md-3 col-xs-6 col-md-push-2 col-xs-push-1">
					<input type="text"name="place" id="place" class="form-control" placeholder="工作地点"style="border-color:#888"/>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-2 col-md-push-2" >
					<div class="col-md-1 col-md-push-5 col-xs-1 col-xs-push-1">
					</div>
					<div class="col-md-9 col-md-push-4 hidden-sm hidden-xs">
						<label for="company">工作单位:</label>
					</div>
				</div>
				<div class="col-md-3 col-xs-6 col-md-push-2 col-xs-push-1">
					<input type="text" name="company"  id="company" class="form-control" placeholder="工作单位"  style="border-color:#888"/>
				</div>
			</div>
			<br />
			<div class="row">
				<div class="col-md-2 col-md-push-2">
					<div class="col-md-1 col-md-push-5 col-xs-1 col-xs-push-1">
					</div>
					<div class="col-md-9 col-md-push-4 hidden-sm hidden-xs">
						<label for="years">工作年限:</label>
					</div>
				</div>
				<div class="col-md-3 col-xs-6 col-md-push-2 col-xs-push-1">
					<input type="text" name="years"  id="years" class="form-control" placeholder="工作年限"  style="border-color:#888"/>
				</div>
			</div>
			<br />
			
			<div class="row">
				<div class="col-md-1 col-xs-2 col-md-push-6 col-xs-push-7">
					<input type="submit" class="btn btn-success" style="width: 80px;" value="提交">
				</div>
			</div>
		</div>
	</form>
</div></div>
<input type="hidden" value="" id="msg" />
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type: "get",
			url: "/job/get_info",
			success: function(data) {
				document.getElementById("name").value=data.name;
				document.getElementById("Email").value=data.Email;
				document.getElementById("phonenumber").value=data.phonenumber;
				document.getElementById("company").value=data.company;
				document.getElementById("years").value=data.years;
				document.getElementById("place").value=data.place;
			}
		});
	});
	function saveUser() {
		var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		var formDom = $("form");
		//获取用户名
		var name = $("#name").val();
		var phonenumber = $("#phonenumber").val();
		var Email = $("#Email").val();
		var company = $("#company").val();
		var years= $("#years").val();
		var place= $("#place").val();
		if (name == "") {
			error("姓名不能为空...");
			$("#name").focus();
			return false;
		};
		
		if (phonenumber == "") {
			error("号码不能为空...");
			$("#phonenumber").focus();
			return false;
		};
		if (Email == "") {
			error("邮箱不能为空...");
			$("#Email").focus();
			return false;
		}
		if (place == "") {
            error("工作地点不能为空...");
            $("#place").focus();
            return false;
        };
		return true;
	}
	$(function() {
		var msg = $('#msg').val();
		if (msg == "1") {
			error("更改成功");
		}else if (msg == "2") {
			error("用户名不存在");
		}else if (msg == "0") {
			error("更改失败");
		}
	});
	function error(msg) {
		$("#error").html(msg);
		$("#error").slideDown("slow").delay(1000).slideUp("slow");
	};
</script>
</body>

</html>