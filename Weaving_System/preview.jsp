<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String show=request.getParameter("show");
    String url=request.getParameter("url");

    String sname= request.getParameter("sname");

        String jname=request.getParameter("jname");

    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>图片预览界面</title>

</head>

<body>

<script type="text/javascript" src="js/jquery.min.js"></script>
<div style="width: 100%;height: 100%;margin: 0 100px">
<h1 style="padding-top:20px;letter-spacing:5px;color: grey;">图片预览界面</h1>
<div style="overflow: hidden;position:absolute; display:block;width: 800px;height:80%;border: solid 2px grey">
    <img border="0" id="preimage" style="left:0px;top:0px;position:absolute" onmousewheel="return bbimg(this)"onmousedown="return drag()"/>
</div>
</div>
<script type="text/javascript">
   /* if('<%=show%>'=="1")
    { document.getElementById("preimage").src="<%=basePath %>/scheme/show_WenBan?sname="+'<%=sname%>';}
    else
    { document.getElementById("preimage").src="<%=basePath %>/scheme/show_origin?jname="+'<%=jname%>';}*/
   document.getElementById("preimage").src='<%=url%>';
    function bbimg(o){
        var zoom=parseInt(o.style.zoom, 10)||100;
        zoom+=event.wheelDelta/12;
        if (zoom>0) o.style.zoom=zoom+'%';
        return false;
    }
    var isDrag = false;
    function isIE(){
        if(navigator.userAgent.indexOf("MSIE")>0){return true;}
        else{return false;}
    }
    function addListener(element,e,fn){
        if(isIE()){element.attachEvent("on" + e,fn);}
        else{element.addEventListener(e,fn,false);}
    }
    function drag(e){
        var e = e || window.event;
        var element = e.srcElement || e.target;
        if(e.preventDefault)e.preventDefault();
        else e.returnvalue=false;
        isDrag = true;
        var relLeft = e.clientX - parseInt(element.style.left);
        var relTop = e.clientY - parseInt(element.style.top);
        var i=0;
        element.onmouseup = function(){ isDrag = false; i=i+1;console.log(i)}
        document.onmousemove = function(e_move){
            var e_move = e_move || window.event;
            if(isDrag){
                element.style.left=e_move.clientX - relLeft + "px";
                element.style.top=e_move.clientY - relTop + "px";
                return false;
            }
        }
    }
    function bbimg(o){
        var zoom=parseInt(o.style.zoom, 10)||100;
        zoom+=event.wheelDelta/12;
        if (zoom>0) o.style.zoom=zoom+'%';
        return false;
    }
    var isDrag = false;
    function isIE(){
        if(navigator.userAgent.indexOf("MSIE")>0){return true;}
        else{return false;}
    }
    function addListener(element,e,fn){
        if(isIE()){element.attachEvent("on" + e,fn);}
        else{element.addEventListener(e,fn,false);}
    }
    function drag(e){
        var e = e || window.event;
        var element = e.srcElement || e.target;
        if(e.preventDefault)e.preventDefault();
        else e.returnvalue=false;
        isDrag = true;
        var relLeft = e.clientX - parseInt(element.style.left);
        var relTop = e.clientY - parseInt(element.style.top);
        var i=0;
        element.onmouseup = function(){ isDrag = false; i=i+1;console.log(i)}
        document.onmousemove = function(e_move){
            var e_move = e_move || window.event;
            if(isDrag){
                element.style.left=e_move.clientX - relLeft + "px";
                element.style.top=e_move.clientY - relTop + "px";
                return false;
            }
        }
    }
</script>

</body></html>