<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String yasuo_address=(String) request.getAttribute("yasuo_address") ;
	String jname=(String) request.getAttribute("jname");
	String sname=(String) request.getAttribute("sname");
	String histourl=(String) request.getAttribute("histourl");
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
 <link rel="stylesheet" href="../css/jquery.cxcolor.css" />
    <script src="../js/jquery-3.2.0.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
	 <script src="../js/cr_page.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/cr.js" type="text/javascript" charset="utf-8"></script>
	<script src="../js/jquery.cxcolor.js" type="text/javascript" charset="utf-8"></script>
<title>newscheme</title>
</head>
<body style="background-color:#f0f0f0">
   <div class="row"style="position:fixed;right:2px;top:0px;z-index:90;background-color:#f0f0f0;width:100%;height:40px;">
     <div style="margin-right:30px;margin-top:5px;text-align:right">
                <a href="../vip.jsp" target="show" class="btn btn-sm btn-primary">开通VIP</a>
                <a href="/j_spring_security_logout" class="btn btn-sm btn-primary">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</a>
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
   <div class="col-md-3 col-xs-12"style="margin-top: 50px;">
   <h4 style="text-align:center">方案介绍</h4>
     <p id="sname1"style="text-align:center"></p>
    <img id="WB"src="<%=yasuo_address%>"style=";width: 200px;height: 200px;border-radius: 5%"/><br>
    <button class="btn "style="margin-top: 10px"onclick="preview()">预览</button>
   </div>
   <div class="col-md-9 col-xs-12"style="margin-top: 50px;padding:0;" >
   <button class="btn btn-primary" onclick="edit()"style="margin-left: 80px">修改方案</button>
    <form action="/scheme/revise_scheme" target="_self" method="post"  class="form-horizontal" >
	   
        <input id="jname" name="jname"type="hidden"class="form-control"style="width: 20%" type="text"/><br>
        <input id="sname" name="sname"type="hidden"class="form-control"style="width: 20%" type="text"/><br>
         <div class="col-md-3 col-md-offset-1 col-xs-4"style="padding:0"><p style="text-align:center;margin-top:20px;font-size:1.2em;font-weight:bold;font-family:fangsong">请点击右侧颜色条选择合适的经线纬线颜色，横线表示经线，竖线表示纬线。</p>
			</div>
<div class="col-md-6 col-xs-8"style="margin-top:-30px">
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
                        <input type="submit" class="btn btn-success" style="width: 80px;font-family:fangsong;" value="提交"/>
                    </div>
            </form>
		<div class="col-md-12"style="text-align: right;margin-top:10px">
         <button class="btn btn-primary" onclick="geturl()">获取下载链接</button>
		 <span id="downloadurl"></span>  
		 </div>

    </div>
   </div>
   </div>
   <style>
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
   </body>
</html>

