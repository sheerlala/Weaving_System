<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String msg=(String) request.getAttribute("msg");
    String sname=(String) request.getParameter("sname");
    String jname = request.getParameter("jname");
    String url = request.getParameter("url");
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
<title>addscheme</title>
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
		 <div class="col-md-2 col-xs-2 col-md-offset-1 nav">
		 <h4 class="dropdown-toggle"data-toggle="dropdown">项目管理
		 <span class="caret"></span></h4>
                <ul class="dropdown-menu" role="menu">
                    <li role="presentation"><a href ="projects.jsp" target ="_self">已有项目</a>
                    </li>
                    <li role="presentation"><a href ="newproject.jsp" target ="_self">新建项目</a>
                    </li>
                </ul>
		  </div>
          <div class="col-md-2 col-xs-2 nav"><h4 class="dropdown-toggle"data-toggle="dropdown">个人信息管理<span class="caret"></span></h4>
            <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a href ="change_info.jsp" target ="show">个人信息修改</a>
                </li>
                <li role="presentation">
                    <a href ="../updatepwd.jsp" target ="show">密码修改</a>
                </li>
            </ul>
          </div>
          <div class="col-md-2 col-xs-2 nav"><h4> <a href ="account.jsp" target ="show">个人账户管理</a></h4>
		  </div>	  
       </div>
   </div>
   <div class="container"style="margin-top:100px;padding:0">
   <div class="col-md-10 col-md-offset-1">
   <div class="row"><img src="images/timgd.jpg" style="width:100%;height:400px;margin-top:-12px;"/></div>
   <div class="col-md-3 col-xs-2"style="margin-top: 50px;text-align:center">
   <h4 style="text-align:center;font-size: 1.4em;font-weight:bold";>方案介绍</h4>
     <p id="sname1"style="text-align:center;font-size: 1.2em"></p>
    <img id="WB"style=";width: 200px;height: 200px;border-radius: 5%"/><br>
    <button class="btn "style="margin-top: 10px"onclick="preview()">预览</button>
   </div>
   <div class="col-md-9 col-xs-10"style="margin-top: 50px;padding:0;" >
   <button class="btn btn-primary" onclick="edit()"style="margin-left: 80px">修改方案</button>
    <form action="UserUpdateServlet" target="_self" method="post" enctype="multipart/form-data" class="form-horizontal" >
	 <div class="col-md-12"style="text-align: right">
                        <input type="submit" class="btn btn-success" style="width: 80px;margin-right: 20px;" value="提交"/>
                    </div>
        <input id="jname" name="jname"type="hidden"class="form-control"style="width: 20%" type="text"/><br>
        <input id="sname" name="sname"type="hidden"class="form-control"style="width: 20%" type="text"/><br>
<div class="col-md-6">
<input  id="WarpColor"style="height:26px;width:300px;margin-left:50px;margin-top:70px;border:0;box-shadow:7px 7px 3px #444;"><br>
<input   id="WeftColor1"style="height:200px;width:26px;margin-left:100px;margin-top:-150px;border:0;box-shadow:7px 7px 3px #444;">
<input  id="WeftColor2"style="height:200px;width:26px;margin-left:20px;margin-top:-200px;border:0;box-shadow:7px 7px 3px #444;">
<input   id="WeftColor3"style="height:200px;width:26px;margin-left:20px;margin-top:-200px;border:0;box-shadow:7px 7px 3px #444;">
<input   id="WeftColor4"style="height:200px;width:26px;margin-left:20px;margin-top:-200px;border:0;box-shadow:7px 7px 3px #444;">
</div>
<div class="col-md-6">
                    <div class="form-group col-md-6 col-xs-3">
                        <div class="control-label col-md-4"><label for="MeiShu">枚&nbsp;&nbsp;数</label></div>
                        <div class="col-md-8"><input type="text" name="MeiShu" id="MeiShu" class="form-control"style="border-color:#888"value="16"/></div>
                    </div>
                    <div class="form-group col-md-6 col-xs-3">
                        <div class="control-label col-md-4"><label for="FeiShu">飞&nbsp;&nbsp;数</label></div>
                        <div class="col-md-8"><input type="text" name="FeiShu" id="FeiShu" class="form-control"style="border-color:#888"value="5"/></div>
                    </div>
                    
                    <div class="form-group col-md-6 col-xs-3 ">
                        <div class="control-label col-md-4"style="margin-top:-10px"><label for="WarpMiDu">经&nbsp;&nbsp;线密&nbsp;&nbsp;度</label></div>
                        <div class="col-md-8"><input type="text" name="WarpMiDu" id="WarpMiDu" class="form-control"style="border-color:#888"value="118"/></div>
                  
                    </div>
                    <div class="form-group col-md-6 col-xs-3">
                        <div class="control-label col-md-4"style="margin-top:-10px"><label for="WeftMiDu">纬&nbsp;&nbsp;线密&nbsp;&nbsp;度</label></div>
                        <div class="col-md-8"><input type="text" name="WeftMiDu" id="WeftMiDu" class="form-control"style="border-color:#888"value="23"/></div>
                    
                    </div>
                    <div class="form-group col-md-6 col-xs-3">
                        <div class="control-label col-md-4"style="margin-top:-10px"><label for="Squeeze">挤&nbsp;&nbsp;压程&nbsp;&nbsp;度</label></div>
                        <div class="col-md-8"><input type="text" name="Squeeze" id="Squeeze" class="form-control"style="border-color:#888"value="1"/></div>
                     
                    </div>
				 <div class="form-group col-md-6 col-xs-4">
                        <div class="control-label col-md-4"style="margin-top:-10px"><label for="WidthResolution">&nbsp;宽&nbsp;&nbsp;度分&nbsp;辨&nbsp;率</label></div>
                        <div class="col-md-8"><input type="text" name="WidthResolution" id="WidthResolution" class="form-control"style="border-color:#888"value="6000"/></div>     
                    </div>
			</div>
                   
         
            </form>
         <button class="btn btn-primary" onclick="geturl()"style="margin-left: 80px">获取下载链接</button>
<div id="downloadurl"style="margin-left: 80px">
</div>  

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
   function geturl(){
        $.ajax({
            type:"get",
            url:"../userinfo/account",
            datatype:"json",
            success:function(data){
                if(data.account_type=="common") {
                    var flag = confirm("确认花费5元下载该纹版图吗？");
                    if(flag){
                        console.log(data.balance);
                        if(5>eval(data.balance)){
                            alert("余额不足，请先充值！");
                        }else {
                            console.log("普通用户下载");
                            /*var url = "<%=request.getContextPath()%>/scheme/load_WenBan?jname=" + '<%= jname%>'+"&sname="+ '<%=sname%>';
                            $("#pluginurl").attr("href",url);*/
                            $("#downloadurl").load("../downloadurl.jsp",{jname:'<%= jname%>',sname:'<%=sname%>'});
                        }
                    }
                }
                else {
                    console.log("VIP用户下载");
                    $("#downloadurl").load("../downloadurl.jsp",{jname:'<%= jname%>',sname:'<%=sname%>'});
                }
            }
        })
    }

    $(document).ready(function() {
        document.getElementById("sname1").innerHTML='<%=sname%>';
        document.getElementById("jname").value='<%=jname%>';
        document.getElementById("sname").value='<%=sname%>';
        $.ajax({
            type: "get",
            url: "/scheme/test?sname="+ '<%=sname%>'+"&jname="+'<%=jname%>',
            success: function(data) {
                document.getElementById("WB").src=data.yasuo;
                console.log(data.yasuo);
                var imgurl=data.yasuo;
                window.imgurl=imgurl;
            }
        });
        $('input').attr('readonly', true);
        $.ajax({
            type: "get",
            url: "/scheme/read_XML?jname="+'<%=jname%>'+"&sname="+'<%=sname%>',
            success: function(data) {
                document.getElementById("MeiShu").value=data.MeiShu;
                document.getElementById("FeiShu").value=data.FeiShu;
                document.getElementById("WidthResolution").value=data.WidthResolution;
                document.getElementById("WarpMiDu").value=data.WarpMiDu;
                document.getElementById("WeftMiDu").value=data.WeftMiDu;
                document.getElementById("Squeeze").value=data.Squeeze;
                document.getElementById("jname").value=data.jname;
                document.getElementById("sname").value=data.sname;
                $('#WarpColor').cxColor({
                    color:data.WarpColor
                });
                $('#WeftColor1').cxColor({
                    color:data.WeftColor1
                });
                $('#WeftColor2').cxColor({
                    color:data.WeftColor2
                });
                $('#WeftColor3').cxColor({
                    color:data.WeftColor3
                });
                $('#WeftColor4').cxColor({
                    color:data.WeftColor4
                });
            }

        });
    });

    function preview(){
        console.log(imgurl);
        window.location.href='../preview.jsp?url='+imgurl;
    }
    function edit(){
        $('input').attr('readonly', false);
    }
   </script>
</html>