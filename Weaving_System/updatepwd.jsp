<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
   <div class="col-md-6 col-md-offset-4"style="text-align:center">
    <div style="width: 450px;text-align:center">
        <div id="error"><p style="display:none;text-align: center;font-size: 20px;color:red;"></p></div>
        <div class="row">
            <div class="col-md-3 col-xs-2">
                <label for="oldPassword">旧&nbsp;密&nbsp;码:</label>
            </div>
            <div class="col-md-6 col-xs-8">
                <input type="password" name="oldPassword" id="oldPassword" class="form-control" />
            </div>
        </div><br />
        <div class="row">
            <div class="col-md-3 col-xs-2 ">
                <label for="newPassword">新&nbsp;密&nbsp;码:</label>
            </div>
            <div class="col-md-6 col-xs-8">
                <input type="password" name="newPassword" id="newPassword" class="form-control" />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-3  col-xs-2">
                <label for="confirmPassword">确认密码:</label>
            </div>
            <div class="col-md-6 col-xs-8">
                <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-xs-2 col-xs-push-7">
                <input type="button" onclick="submitMsg();" class="btn btn-success" style="width: 80px;" value="提交">
            </div>
        </div>
        <br />
    </div>
</div></div>
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
   }
   *{
	   font-family:FangSong;
	   font-weight:bold;	  
   }
   label{
	   font-size:15px;
	   margin-top:5px;
   }
   </style>
<script type="text/javascript">
    //修改密码
    //提交数据
    function submitMsg(){
        var oldPassword = $("#oldPassword").val();
        var newPassword = $("#newPassword").val();
        var confirmPassword = $("#confirmPassword").val();
        if(oldPassword == null || oldPassword == ""){
            error("旧密码不能为空！");
            $("#oldPassword").focus();
            return false;
        };
        if(newPassword == null || newPassword == ""){
            error("新密码不能为空！");
            $("#newPassword").focus();
            return false;
        };
        if(newPassword == oldPassword){
            error("旧密码不能与新密码相同");
            $("#newPassword").focus();
            return false;
        };
        if(confirmPassword == null || confirmPassword == ""){
            error("确认密码不能为空！");
            $("#confirmPassword").focus();
            return false;
        };
        if(newPassword != confirmPassword){
            error("确认密码与新密码不相同！");
            $("#confirmPassword").focus();
            return false;
        };
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/admin/user/change?oldPassword="+oldPassword+"&password="+newPassword,
            success:function(data){
                if(data.msg=='passwordError'){
                    alert("旧密码不正确！");
                    return false;
                }
                alert("修改成功！");
                $("#oldPassword").val("");
                $("#newPassword").val("");
                $("#confirmPassword").val("");
                $("#error p").html("");
            }
        });
    };

    function error(msg){
        $("#error p").html(msg).slideDown().delay(1000).slideUp();
    }
</script>
</body>

</html>