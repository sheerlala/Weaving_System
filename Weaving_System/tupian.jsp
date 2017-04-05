<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%
  String sname=(String) request.getAttribute("sname");
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  

    <title>图片显示</title>
  </head>  
  <body>
      <img src="/demo/image/6543gfd20160727151217.png"/>

  </body>
</html>  