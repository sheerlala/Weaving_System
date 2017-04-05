<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String jname = request.getParameter("jname");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
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
   <div class="row"><img src="images/timgd.jpg" style="width:100%;height:400px;margin-top:-12px;"/></div>
   <div class="col-md-3"style="margin-top: 50px;text-align:center">
   <h4 style="font-size: 1.4em;text-align:center">项目介绍</h4>
    <p style="font-size: 1.4em;text-align:center;"id="jname"></p>
     <img id="origin" style="width: 180px;border-radius: 3%">
	 <button class="btn "style="margin-top: 10px"onclick="preview()">预览</button>
	 <img id="histoimg"style="width: 150px;height: 150px;border-radius: 3%;margin-top:20px"/>
   </div>
   <div class="col-md-9"style="margin-top: 50px;" >
            <table class="table table-striped  table-bordered">
                <thead>
                <tr>
				    <td style="width: 40%" >纹板图</td>
                    <td style="width: 40%" >方案名称</td>
                    <td style="width: 20%">相关操作</td>
                </tr>
                </thead>
                <tbody id="smsg" ></tbody>
            </table>
            <div class="container" style="width:187px;">
                <div class="btn-group" id="pageBtn">
                    <button type="button" class="btn btn-default"><span style="display:inline-block;width:14px;height:14px;background: url(images/button.png) no-repeat -52px -8px;float:left;"></span></button>
				<button type="button" class="btn btn-default"><span style="display:inline-block;width:14px;height:14px;background: url(images/button.png) no-repeat -14px -8px;float:left;"></span></button>
				<button type="button" class="btn btn-default"><span style="display:inline-block;width:14px;height:14px;background: url(images/button.png) no-repeat -128px -8px;float:left;"></span></button>
				<button type="button" class="btn btn-default"><span style="display:inline-block;width:14px;height:14px;background: url(images/button.png) no-repeat -91px -8px;float:left;"></span></button>
                </div>
            </div>
            <button class="btn"onclick="addscheme()">新建方案</button>
    </div>
   </div>
   </div>
   <style>
   .nav h4,.nav h4 a{
   line-height:45px;
   color:white;
   font-family:	FangSong;
   }
   td{
	   text-align:center;
   }
   </style>
   <script>
       $(document).ready(function() {
           document.getElementById("jname").innerHTML='<%=jname%>';
		   getAproject();
           getschemes();
        });
		 //获取原图、直方图
  function getAproject(){
      $.ajax({
          type: "get",
          url: "/scheme/show_origin?jname="+ '<%=jname%>',
          success: function(data) {
              var originurl=data.originurl;
              var histourl=data.histourl;
              document.getElementById("origin").src=originurl;
              document.getElementById("histoimg").src=histourl;
              window.originurl=originurl;
              window.histourl=histourl;
          }
      });
  }

    //获取方案信息
    function getschemes(){
        $.ajax({
            type: "POST",
            url: "/scheme/all_scheme?job_name="+'<%=jname%>',
            dataType: 'json',
            success: function(data) {
                var jsonArr = data.Allschemes;
                console.log(jsonArr);
                var html = "";
                if (jsonArr.length!=0) {
                for (var i = jsonArr.length - 1; i > -1; i--) {
                    var data = jsonArr[i];
                    html += "<tr>" +
					        "<td> <img src="+data.yasuo_wenban+ " style='width:120px;height:120px;border-radius: 50%'/> </td>" +
                            "	<td style='line-height:120px'>" + data.sname + "</td>" +
                            "	<td style='line-height:120px'><a href='javascript:void(0);' onclick='checkMsg(this);'> 查看详情 </a>/<a href='javascript:void(0);' onclick='deleteUser(this)';>删除</a></td>" +
                            "</tr>,";
                }
            }else {
                    html = "";
                }
                cr_page($("#smsg"), $("#pageBtn"), html, ",");
                $("#smsg").html(firstTen);

            }
        });
    }
    function checkMsg(dom){
        var tdDom = $(dom).parent().parent().children();
        console.log(tdDom);
        var sname = tdDom[1].innerHTML;
        window.location.href='../Ascheme.jsp?sname='+sname+'&jname='+'<%=jname%>';
    }
    //删除方案
    function deleteUser(dom) {
        var flag = confirm("确认要删除么？");
        if (flag) {
            var tdDom = $(dom).parent().parent().children();
            var sname = tdDom[0].innerHTML;
            $.ajax({
                type: "POST",
                url: "<%=basePath%>/scheme/delete_scheme?sname="+sname+"&jname="+'<%=jname%>',
                dataType: 'json',
                success: function(data) {
                    if (data.msg == "success") {
                        //删除成功之后返回到方案列表；
                        getschemes();
                    } else if (data.msg == "error") {
                        alert("删除方案失败！");
                    }
                }
            });
        }
    };
    function addscheme(){
        console.log("进入addschme函数");
		console.log(histourl);
        window.location.href='/addscheme.jsp?jname='+'<%=jname%>'+'&histourl='+histourl+'&originurl='+originurl;
    }
    function preview(){
        window.location.href='../preview.jsp?url='+originurl;
    }

   </script>
</html>