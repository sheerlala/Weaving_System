<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="height:100%">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
 <link rel="stylesheet" href="css/jquery.cxcolor.css" />
    <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	 <script src="js/cr_page.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/cr.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.cxcolor.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/yanzhengma.js" type="text/javascript" charset="utf-8"></script>
	<title>纺织设计云平台登录界面</title>
<body style="height:100%">
<div class="container-fluid"style="background: radial-gradient(white,gray,black);height:100%">
 <div class="col-md-8 col-md-offset-2"style="height:200px;margin-top:15%">
  <div class="col-md-3 col-xs-3"style="height:280px;text-align:right;padding-right:0;"><img src="images/jiangnan.jpg"style="box-shadow:3px 3px 10px #444"/></div>
  <div class="col-md-4 col-xs-4"style="background-image:url(images/suozi.jpg);box-shadow:3px 3px 10px #444;height:280px;"></div>
  <div class="col-md-5 col-xs-5"style="box-shadow:3px 3px 10px #444;background:radial-gradient(white,gray,#272727);height:280px">
	<h1 style="text-align:center;color:white;letter-spacing: 0.1em;font-family:fangsong;font-weight:bold">纺织设计云平台</h1>
	<div class="row">
		<div id="error" class="form-control" style="display: none;"></div>
	</div>
	<div class="row">
		<form id="_form" class="form" name="" action="<c:url value='/j_spring_security_check' />" method="post"  onsubmit="return saveUser(this);">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<c:if test="${not empty error}">
				<input type="hidden" id="errorMsg" value="${error}"/>
			</c:if>
			<div class="form-group">
				<div class="col-md-4 visible-md visible-lg"style="text-align:right">
					<label style="margin-top: 8px;color:white;font-size:1em" for="username">用户名:</label>
				</div>
				<div class="col-md-7">
					<input class="form-control" type="text" name="username" id="username" value="" placeholder="用户名"style="border-radius:0"/>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-4 visible-md visible-lg"style="margin-top:10px;text-align:right">
					<label style="margin-top: 8px;color:white;" for="password">密&nbsp;&nbsp;&nbsp;码:</label>
				</div>
				<div class="col-md-7"style="margin-top:10px">
					<input class="form-control" type="password" name="password" id="password" value="" placeholder="密码"style="border-radius:0"/>
				</div>
			</div>
			<div class="form-group" style="position: relative;">
				<div class="col-md-4 visible-md visible-lg"style="margin-top:10px;text-align:right">
					<label for="inputCode" style="margin-top: 8px;size:1em;color:white;">验证码:</label>
				</div>
				<div class="col-md-4"style="margin-top:10px">
					<input class="form-control" name="yanzhengma" id="inputCode" type="text" placeholder="验证码"style="border-radius:0"/>
				</div>
				<div class="col-md-4"style="margin-top:13px;height:30px">
					<span id="code" class="mycode"></span>
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-4 col-md-offset-2 col-xs-4"style="margin-top:30px">
				<a href="adduser.jsp" style="margin-top: 50px;font-size:1.2em">用户注册</a>
				</div>
				<div class="col-md-5 col-md-offset-1 col-xs-5"style="margin-top:10px">
					<input class="form-control btn btn-block" type="submit" value="登录"style="background-color:#E0E0E0;border-radius:50%;width:55px;height:55px"/>
				</div>
			</div>
		</form>
	</div>
</div>
</div>
</div>
<style type="text/css">
		.mycode{
			display: inline-block;
			width: 70px;
			height: 30px;
			vertical-align: middle;
			background:#eee;
		}
		#error{text-align: center;line-height: 20px;border-radius:0;width:200px;margin-left:100px;}
	</style>
<script type="text/javascript">
	var flag = false;
	function saveUser(Dom){
		//获取用户名
		var username = $("#username").val();
		var password = $("#password").val();
		var yanzhengma = $("#inputCode").val();
		if(username == ""){
			error("用户名不能为空...");
			$("#username").focus();
			return false;
		};
		if(password == ""){
			error("密码不能为空...");
			$("#password").focus();
			return false;
		};
		if(yanzhengma == ""){
			error("验证码不能为空...");
			$("#inputCode").focus();
			return false;
		};
		if(flag == false){
			error("验证码错误...");
			$("#inputCode").focus();
			return false;
		}
		return true;
	};

	$(document).ready(function(){
		var message = $('#errorMsg').val();
		if(message!=null && message!='')
			error(message);
	});

	//验证码部分
	(function(){
		var inp = document.getElementById('inputCode');
		var code = document.getElementById('code');
		var c = new KinerCode({
			len: 4,//需要产生的验证码长度
			//        chars: ["1+2","3+15","6*8","8/4","22-15"],//问题模式:指定产生验证码的词典，若不给或数组长度为0则试用默认字典
			chars: [
				2, 3, 4, 5, 6, 7, 8, 9,
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y'
			],//经典模式:指定产生验证码的词典，若不给或数组长度为0则试用默认字典
			question:false,//若给定词典为算数题，则此项必须选择true,程序将自动计算出结果进行校验【若选择此项，则可不配置len属性】,若选择经典模式，必须选择false
			copy: false,//是否允许复制产生的验证码
			bgColor:"#eee",//背景颜色[与背景图任选其一设置]
			bgImg:"",//若选择背景图片，则背景颜色失效
			randomBg : false,//若选true则采用随机背景颜色，此时设置的bgImg和bgColor将失效
			inputArea: inp,//输入验证码的input对象绑定【 HTMLInputElement 】
			codeArea: code,//验证码放置的区域【HTMLDivElement 】
			click2refresh:true,//是否点击验证码刷新验证码
			false2refresh:false,//在填错验证码后是否刷新验证码
			validateEven : "change",//触发验证的方法名，如click，blur等
			validateFn : function(result,code){//验证回调函数
				if(result){
					//error("验证成功...");
					flag = true;
				}else{
					$("#inputCode").focus();
					flag = false;
				}
			}
		});
	})(window);

	function error(msg){
		$("#error").html(msg);
		$("#error").fadeIn("slow").delay(1000).fadeOut("slow");
	}
</script>
</body>
</html>