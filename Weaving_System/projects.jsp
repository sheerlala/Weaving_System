<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
    <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	 <script src="js/cr_page.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/cr.js" type="text/javascript" charset="utf-8"></script>
<title>projects</title>
</head>
<body style="background-color:#f0f0f0">
    <div class="row"style="position:fixed;right:2px;top:0px;z-index:90;background-color:#f0f0f0;width:100%;height:40px;">
     <div style="margin-right:30px;margin-top:5px;text-align:right">
                <a href="../vip.jsp" target="show" class="btn btn-sm btn-primary">开通VIP</a>
                <a href="../j_spring_security_logout" class="btn btn-sm btn-primary">注&nbsp;&nbsp;销</a>
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
   <div class="container"style="margin-top:100px;padding:0">
   <div class="col-md-10 col-md-offset-1 col-xs-12">
   <div class="col-md-3 col-xs-3"style="margin-top: 50px;">
   <h4 style="font-size: 1.4em;text-align:center;">设计师基本信息</h4>
    <p style="font-size: 1.4em;text-align:center;"id="designername"></p>
	 <p style="font-size: 1.4em;text-align:center;"id="address"></p>
	  <p style="font-size: 1.4em;text-align:center;"id="email"></p>
   </div>
   <div class="col-md-9 col-xs-9"style="margin-top: 50px;">
    <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <td style="width: 40%;text-align:center">项目原图</td>
				<td style="width: 40%;text-align:center">项目名称</td>
                <td style="width: 20%;text-align:center">相关操作</td>
            </tr>
            </thead>
            <tbody id="pmsg" ></tbody>
        </table>
		 <div class="container" style="width:187px;">
            <div class="btn-group" id="pageBtn">
                <button type="button" class="btn btn-default"><span style="display:inline-block;width:14px;height:14px;background: url(images/button.png) no-repeat -52px -8px;float:left;"></span></button>
				<button type="button" class="btn btn-default"><span style="display:inline-block;width:14px;height:14px;background: url(images/button.png) no-repeat -14px -8px;float:left;"></span></button>
				<button type="button" class="btn btn-default"><span style="display:inline-block;width:14px;height:14px;background: url(images/button.png) no-repeat -128px -8px;float:left;"></span></button>
				<button type="button" class="btn btn-default"><span style="display:inline-block;width:14px;height:14px;background: url(images/button.png) no-repeat -91px -8px;float:left;"></span></button>
            </div>
        </div>
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
   </style>
   <script>
    var page = 1;
    var nextPage = "";
    var prePage = "";
    var lastPage = "";
    var btnDoms = $("#pageBtn").children();
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
			 getjob();
        });
		
	//查看项目具体信息
	function checkMsg(dom){
        var tdDom = $(dom).parent().parent().children();
        console.log(tdDom);
        var jname = tdDom[1].innerHTML;
		console.log(jname);
       window.location.href='../schemes.jsp?jname='+jname;
       }
	   
	//删除项目
	function deleteProject(dom) {
        var flag = confirm("确认要删除么？");
        if (flag) {
			var tdDom = $(dom).parent().parent().children();
            var jname = tdDom[0].innerHTML;
               console.log(jname);
               $.ajax({
                   type: "get",
                   dataType: 'json',
                   url: "/job/delete_job?jname=" + jname,
                   success: function (data) {
                       if (data.msg == "success") {
                           //删除成功之后返回新的项目列表；
                           getjob();
                       } else if (data.msg == "error") {
                           alert("删除项目失败！");
                       }
                   }
               });
           }
       }

    //获取所有项目信息
     function getjob() {
           $.ajax({
               type: "get",
               url: "/job/all_job",
               success: function (data) {
                   var jsonArr = data.Alljobs;
                   var html = "";
                   for (var i = jsonArr.length - 1; i > -1; i--) {
                       var data = jsonArr[i];
                       html += "<tr>" +
					           "	<td style='text-align:center'> <img src="+data.originurl+ " style='width:120px;height:120px;border-radius: 50%'/> </td>" +
                               "	<td style='text-align:center;line-height:120px'>" + data.jname + "</td>" +
                               "	<td style='text-align:center;line-height:120px'><a href='javascript:void(0);' onclick='checkMsg(this);'> 查看详情 </a>/<a href='javascript:void(0);' onclick='deleteProject(this);'>删除</a></td>" +
                                "</tr>,";
                    }
                    cr_page($("#pmsg"), $("#pageBtn"), html, ",");
                    $("#pmsg").html(firstTen);
                }
            });
        }
   </script>
</html>