<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String sname=(String) request.getAttribute("sname");
    String jname = request.getParameter("jname");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
　
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>新建方案</title>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <!--link rel="stylesheet" href="../css/jquery.cxcolor.css" /-->
    <script src="../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <!--script src="../js/jquery.cxcolor.js" type="text/javascript" charset="utf-8"></script-->
    <!--script src="../js/jquery.js" type="text/javascript" charset="utf-8"></script-->

</head>
<body>
        <h1 style="text-align: center">新建方案</h1>
        <form id="addscheme" action="UserUpdateServlet" method="POST" enctype="multipart/form-data" class="form">
            <div style="margin-top: 20px;" >
                <input id="jname" name="jname"type="hidden"class="form-control"style="width: 20%" type="text"/><br>
                <div class="container"style="text-align: center">
                    <div class="col-md-2"style="text-align:right;"><label style="font-size: 1.5em">方案名称</label></div>
                    <div class="col-md-6"> <input id="sname" name="sname"class="form-control"style="width: 50%" type="text"/></div>
                </div>
                <div class="container" style="margin-top: 30px;text-align: center">
                    <div class="col-md-6">
                        <div class="form-group"style="text-align: left">
                            <div class="control-label col-md-6"><label>经线</label></div>
                            <div class="col-md-6"><input id="WarpColor" name="WarpColor"class="form-control"style="width: 60%" type="text"/></div>
                        </div>
                        <div class="form-group">
                            <div class="control-label col-md-6"> <label>纬线1</label></div>
                            <div class="col-md-6"><input id="WeftColor1"name="WeftColor1"class="form-control"style="width: 60%"/></div>
                        </div>
                        <div class="form-group">
                            <div class="control-label col-md-6"><label>纬线2</label></div>
                            <div class="col-md-6"><input id="WeftColor2"name="WeftColor2"class="form-control"style="width: 60%"/></div>
                        </div>
                        <div class="form-group">
                            <div class="control-label col-md-6"><label>纬线3</label></div>
                            <div class="col-md-6"><input id="WeftColor3"name="WeftColor3"class="form-control"style="width: 60%"/></div>
                        </div>
                        <div class="form-group ">
                            <div class="control-label col-md-6"> <label>纬线4</label></div>
                            <div class="col-md-6"><input id="WeftColor4"name="WeftColor4"class="form-control"style="width: 60%"/></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <div class="control-label col-md-4"><label for="MeiShu">枚数</label></div>
                            <div class="col-md-4"><input type="text" name="MeiShu" id="MeiShu" class="form-control"style="border-color:#888"/></div>
                            <p>(建议取值:16)</p>
                        </div>
                        <div class="form-group">
                            <div class="control-label col-md-4"><label for="FeiShu">飞数</label></div>
                            <div class="col-md-4"><input type="text" name="FeiShu" id="FeiShu" class="form-control"style="border-color:#888"/></div>
                            <p>(建议取值:5)</p>
                        </div>
                        <div class="form-group ">
                            <div class="control-label col-md-4"><label for="WidthResolution">宽度分辨率</label></div>
                            <div class="col-md-4"><input type="text" name="WidthResolution" id="WidthResolution" class="form-control"style="border-color:#888"/></div>
                            <p>(建议取值:6000)</p>
                        </div>
                        <div class="form-group ">
                            <div class="control-label col-md-4"><label for="WarpMiDu">经线密度</label></div>
                            <div class="col-md-4"><input type="text" name="WarpMiDu" id="WarpMiDu" class="form-control"style="border-color:#888"/></div>
                            <p>(建议取值:118)</p>
                        </div>
                        <div class="form-group">
                            <div class="control-label col-md-4"><label for="WeftMiDu">纬线密度</label></div>
                            <div class="col-md-4"><input type="text" name="WeftMiDu" id="WeftMiDu" class="form-control"style="border-color:#888"/></div>
                            <p>(建议取值:23)</p>
                        </div>
                        <div class="form-group">
                            <div class="control-label col-md-4"><label for="Squeeze">挤压程度</label></div>
                            <div class="col-md-4"><input type="text" name="Squeeze" id="Squeeze" class="form-control"style="border-color:#888"/></div>
                            <p>(建议取值:1)</p>
                        </div>
                        <input type="submit" class="btn btn-success" style="width: 80px;" value="提交" >
                    </div>
                </div>
                <button class="btn btn-success" onclick="getWB()"style="margin-left: 300px">生成纹板图</button>
                <img id="WB" style="margin-left:20px;border: solid 1px;width: 200px;height: 200px"/>
                <button class="btn" style="vertical-align: bottom">预览</button><br>
                <button class="btn btn-success" onclick="savescheme()"style="margin-left: 300px">保存方案</button>
            </div>
        </form>
<script>
    document.getElementById("jname").value='<%=jname%>';

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

    function getWB(){
        var sname=document.getElementById("sname").value;
        document.getElementById("WB").src="<%=basePath %>/scheme/show_WenBan?sname="+ '<%=sname%>';

    }
    function savescheme(){
        var flag = confirm("确认要保存该方案？");
        if (flag) {
            $("#newp").load("../static/schemes.html");
        }
    }

</script>
<style>
    .col-md-*{
        padding-left: 0px;
    }
</style>
</body>
</html>>