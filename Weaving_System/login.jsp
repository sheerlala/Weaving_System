<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html>
	<head>
		<!--声明当前页面的编码集：charset=gbk,gb2312(中文编码)，utf-8国际编码-->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<!--当前页面的三要素-->
		<title>登录框</title>
		<meta name="Keywords" content="关键词,关键词">
		<meta name="description" content="">

		<!--css,js-->
		<style type="text/css">
			*{margin:0;padding:0;}
			body{font-size:14px;font-family:"微软雅黑";-webkit-user-select:none;-moz-user-select:none;-o-user-select:none;user-select:none;}
			a{text-decoration:none;}
			li{list-style:none;}
			input{border:none;}
			.login{width:400px;height:210px;background:#CCFFFF;margin:100px auto;padding:30px;}
			.login form{position:relative;}
			.login span{display:block;width:70px;float:left;margin-top:10px;}
			.login input{display:block;width:300px;height:30px;line-height:30px;padding:5px;font-size:20px;font-family:"微软雅黑";border-radius:5px;}
			.login #_form .button_in{float:left;width:100px;background:#FFCC99;color:#fff;margin-left:35px;text-align:center;line-height:10px;font-size:15px;}
			.login #_form .button_in:hover{background:#66CCFF;}
			.error{width:500px;height:50px;margin:100px auto;margin-bottom:-100px;text-align:center;line-height:50px;font-size:30px;}

			/*验证框样式*/
			fieldset{
				padding: 20px;
				background: #666666;
				border-radius: 10px;
				margin-top: 20px;
			}
			.mycode{
				display:block;
				text-align:center;
				width: 80px;
				height: 45px;
				background:#fff;
				position:absolute;top:116px;left:298px;
			}
		</style>
		<script type="text/javascript" src="js/yanzhengma.js"></script>
	</head>
<body>
<div id="error" class="error">${error}</div>
<div class="login">
	<form id="_form" action="<c:url value='/j_spring_security_check' />" method="post" onsubmit="return saveUser(this);">
		<span>用户名:</span><input type="text" name="username" placeholder="用户名..."/><br />
		<span>密  码:</span><input type="password" name="password" placeholder="密码..."/><br />
		<span>验证码:</span><input id="inputCode" name="yanzhengma" type="text" style="width:150px;border-radius:5px;"/><p id="code" class="mycode"></p><br />
		<input class="button_in" type="submit" value="提交"/>
		<input class="button_in" style="margin-left:100px;" type="reset" value="重新输入"/>
		<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
	</form>
</div>

<script type="text/javascript">
	//获取iframe框外面的父级html，然后就可以操作，父级的元素了。
	//window.parent.document.getElementById("c_iframe");
	var divDom = document.getElementById("error");
	var flag = false;
	window.onload = function(){
		var formDom = $("_form");
		formDom.username.focus();
		yanzhengma();
		//操作父级页面的对象节点
	};
	
	function saveUser(Dom){
		var formDom = $("_form");
		//获取用户名
		var username = formDom.username.value;
		var password = formDom.password.value;
		var yanzhengma = formDom.yanzhengma.value;
		error("");
		if(username == ""){
			error("用户名不能为空...");
			formDom.username.focus();
			return false;
		};
		if(password == ""){
			error("密码不能为空...");
			formDom.password.focus();
			return false;
		};
		if(yanzhengma == ""){
			error("验证码不能为空...");
			formDom.yanzhengma.focus();
			return false;
		}else if(flag == false){
			error("验证码错误...");
			formDom.yanzhengma.focus();
			return false;
		};
		window.parent.document.getElementById("getMessage1").innerHTML = username +","+password;
		return true;
	};
	
	//验证码验证
	function yanzhengma(){
		var inp = document.getElementById('inputCode');
		var code = document.getElementById('code');
		var c = new KinerCode({
			len: 4,//需要产生的验证码长度
			chars: [
				1, 2, 3, 4, 5, 6, 7, 8, 9, 0,
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
			],//经典模式:指定产生验证码的词典，若不给或数组长度为0则试用默认字典
			question:false,//若给定词典为算数题，则此项必须选择true,程序将自动计算出结果进行校验【若选择此项，则可不配置len属性】,若选择经典模式，必须选择false
			copy: false,//是否允许复制产生的验证码
			bgColor:"",//背景颜色[与背景图任选其一设置]
			bgImg:"fangzhi.jpg",//若选择背景图片，则背景颜色失效
			randomBg : true,//若选true则采用随机背景颜色，此时设置的bgImg和bgColor将失效
			inputArea: inp,//输入验证码的input对象绑定【 HTMLInputElement 】
			codeArea: code,//验证码放置的区域【HTMLDivElement 】
			click2refresh:true,//是否点击验证码刷新验证码
			false2refresh:true,//在填错验证码后是否刷新验证码
			validateEven : "change",//触发验证的方法名，如click，blur等
			validateFn : function(result,code){//验证回调函数
				if(result){
					error("验证码验证成功...");
					flag = true;
					clearTime();
				}else{
					error("验证码验证失败...");
					clearTime();
					flag = false;
				}
				
			}
		});
	};
	//清楚定时器
	function clearTime(){
		var time = setInterval(function(){
			error("");
		},2000);
		if(divDom.innerHTML == ""){
			clearInterval("time");
		}
	};
	
	//错误信息
	function error(msg){
		$("error").innerHTML = msg;
	}

	function $(id){
		return document.getElementById(id);
	};
</script>
</body>
</html>