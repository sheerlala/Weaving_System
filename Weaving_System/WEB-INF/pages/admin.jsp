<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true" contentType="text/html; charset=UTF-8"%>
<html>
<body>
<%@include file="/includes/header.jsp"%>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>
    <h1>User List : ${list}</h1>

	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>

	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h2>
			Welcome : ${pageContext.request.userPrincipal.name} | <a
				href="javascript:formSubmit()"> Logout</a>
		</h2>
	</c:if>

    <!--增加了帮助文档链接-->
	<div class="readme">
    <a href="/SecurityTest/readme">查看帮助文档</a>
    </div>
</body>
</html>