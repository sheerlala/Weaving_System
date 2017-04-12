<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String msg=(String) request.getAttribute("msg");
    String sname=(String) request.getAttribute("sname");
    String jname = request.getParameter("jname");
    String histourl = request.getParameter("histourl");
	String originurl = request.getParameter("originurl");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
 <link rel="stylesheet" href="css/jquery.cxcolor.css" />
    <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	 <script src="js/cr_page.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/cr.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/jquery.cxcolor.js" type="text/javascript" charset="utf-8"></script>
<title>新建方案</title>
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
   <div class="container"style="margin-top:100px;padding:0">
   <div class="col-md-10 col-md-offset-1 col-xs-12">
   <div class="col-md-3 col-xs-12"style="margin-top: 50px;text-align:center">
   <h4 style="font-size: 1.4em;text-align:center">项目介绍</h4>
    <p style="font-size: 1.4em;text-align:center;"id="jname"></p>
     <img src='<%=originurl%>'style="width: 150px;border-radius: 3%"><br>
	 <img src='<%=histourl%>'style="width:150px;height:150px;border-radius:3%;margin-top:20px">
   </div>
   <div class="col-md-9 col-xs-12"style="margin-top: 20px;padding:0;" >
            <form action="../scheme/newscheme" target="_self" method="post"  class="form-horizontal">
                <input id="jname" value='<%=jname%>'name="jname"type="hidden"class="form-control"style="width: 20%" type="text"/><br>
                <div class="col-md-12 form-group">
                    <div class="control-label col-md-2 col-md-offset-1"><label style="font-size: 1.2em">方案名称</label></div>
                    <div class="col-md-6"style="margin-left:-20px"> <input id="sname" name="sname"class="form-control"style="width: 50%" type="text"/></div>
                </div>
			<div class="col-md-3 col-md-offset-1 col-xs-4"style="padding:0"><p style="text-align:center;margin-top:50px;font-size:1.2em;font-weight:bold;font-family:fangsong">请点击右侧颜色条选择合适的经线纬线颜色，横线表示经线，竖线表示纬线。</p>
			</div>
<div class="col-md-6 col-xs-8">
<input name="WarpColor" id="WarpColor"style="height:26px;width:300px;margin-left:50px;margin-top:70px;border:0;box-shadow:7px 7px 3px #444;"><br>
<input name="WeftColor1" id="WeftColor1"style="height:200px;width:26px;margin-left:100px;margin-top:-150px;border:0;box-shadow:7px 7px 3px #444;">
<input name="WeftColor2" id="WeftColor2"style="height:200px;width:26px;margin-left:20px;margin-top:-200px;border:0;box-shadow:7px 7px 3px #444;">
<input name="WeftColor3"  id="WeftColor3"style="height:200px;width:26px;margin-left:20px;margin-top:-200px;border:0;box-shadow:7px 7px 3px #444;">
<input name="WeftColor4" id="WeftColor4"style="height:200px;width:26px;margin-left:20px;margin-top:-200px;border:0;box-shadow:7px 7px 3px #444;">
</div>
                    <div class="form-group col-md-3 col-xs-3"style="margin-top:10px">
                        <div class="control-label col-md-4"><label for="MeiShu">枚&nbsp;&nbsp;数</label></div>
                        <div class="col-md-8"><input type="text" name="MeiShu" id="MeiShu" class="form-control"style="border-color:#888"value="16"/></div>
                    </div>
                   
                    
                    <div class="form-group col-md-4 col-xs-4"style="margin-top:10px">
                        <div class="control-label col-md-6"><label for="WarpMiDu">经线密度</label></div>
                        <div class="col-md-6"><input type="text" name="WarpMiDu" id="WarpMiDu" class="form-control"style="border-color:#888"value="118"/></div>               
                    </div>
					 <div class="form-group col-md-5 col-xs-5"style="margin-top:10px">
                        <div class="control-label col-md-5"><label for="Squeeze">挤压程度</label></div>
                        <div class="col-md-6"><input type="text" name="Squeeze" id="Squeeze" class="form-control"style="border-color:#888"value="1"/></div>
                     
                    </div>
                    
					 <div class="form-group col-md-3 col-xs-3">
                        <div class="control-label col-md-4"><label for="FeiShu">飞&nbsp;&nbsp;数</label></div>
                        <div class="col-md-8"><input type="text" name="FeiShu" id="FeiShu" class="form-control"style="border-color:#888"value="5"/></div>
                    </div>
                   <div class="form-group col-md-4 col-xs-4">
                        <div class="control-label col-md-6"><label for="WeftMiDu">纬线密度</label></div>
                        <div class="col-md-6"><input type="text" name="WeftMiDu" id="WeftMiDu" class="form-control"style="border-color:#888"value="23"/></div>
                    
                    </div>
				 <div class="form-group col-md-5 col-xs-5">
                        <div class="control-label col-md-5"><label for="WidthResolution">宽度分辨率</label></div>
                        <div class="col-md-6"><input type="text" name="WidthResolution" id="WidthResolution" class="form-control"style="border-color:#888"value="6000"/></div>     
                    </div>
                    <div class="col-md-12"style="text-align: right">
                        <input type="submit" class="btn btn-success" style="width: 80px;margin-right: 20px;" value="提交"/>
                    </div>
         
            </form>
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
	   font-family:fangsong;
	   font-weight:bold;
   }
   input{
	   font-family:Arial;
	   font-weight:normal;
   }
   </style>
   <script>
   document.getElementById("jname").innerHTML='<%=jname%>'
	 $('#WarpColor').cxColor({
        color:'#ffffff'
    });
    $('#WeftColor1').cxColor({
        color:'#ff0000'
    });
    $('#WeftColor2').cxColor({
        color:'#00ff00'
    });
    $('#WeftColor3').cxColor({
        color:'#0000ff'
    });
    $('#WeftColor4').cxColor({
        color:'#000000'
    });
    $(document).ready(function() {    
	   var msg="<%= msg%>";
        if (msg == "1")
            error("重复");
        });
    function error(msg) {
        $("#error").html(msg);
        $("#error").slideDown("slow").delay(1000).slideUp("slow");
    };
   </script>
</html>