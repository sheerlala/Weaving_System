
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String jname=request.getParameter("jname");
    String sname = request.getParameter("sname");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>下载链接</title>
    <script src="../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div>
<a href="#" onclick="javascript:download1()"  id="pluginurl"  style="color: #83AFE2;text-decoration:underline;">点击下载</a>
    </div>
<script type="text/javascript">
    function download1(){
        console.log('<%= jname%>');
        var url = "<%=request.getContextPath()%>/scheme/load_WenBan?jname="+'<%= jname%>' + "&sname=" + '<%=sname%>';
        $("#pluginurl").attr("href",url);
    }
</script>
</body>
</html>
