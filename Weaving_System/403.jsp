<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String jname=request.getSession().getAttribute("jjname").toString();
%>
<html>
<body>
	<h1>HTTP Status 403 - Access is denied</h1>

	<c:choose>
		<c:when test="${empty username}">
			<h2>You do not have permission to access this page!</h2>
		</c:when>
		<c:otherwise>
			<h2>Username : ${username} <br/>You do not have permission to access this page!Please regesit again!</h2>
		</c:otherwise>
	</c:choose>
	<script type="text/javascript" src="../js/jquery-1.11.3.js"></script>
	<script language="JavaScript">
		var jname= '<%=jname%>';
		console.log(jname+"tiaozhuan successful" );
	//	$("#newp").load("../schemes.jsp",{jname:jname});
		$("#newp").load("../designer1.jsp");
		console.log( "execute successful" );
	</script>
</body>

</html>