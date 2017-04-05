<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <%@include file="/includes/meta.jsp"%>
    <title>hello</title>
</head>
<body  content="text/html; charset=UTF-8">
<%--<%@include file="/includes/header.jsp"%>--%>
	<h1>Title : ${title}</h1>
	<h2>Message : ${message}</h2>
    <c:if test="${pageContext.request.userPrincipal.name == null}">
        <div class="rounded table">

            <div class="information rounded">
                <ol></ol>

                Security Test
                <br/>
                实现角色控制
                <br/>
                代码托管在： http://git@git.instanthq.com:zjucolourlife/ParkbackSecurity.git
                <br/>
                浙江大学彩生活研究中心
                <br/><br>

                <a href="<s:url value='/login'/>">立即登陆</a>
            </div>

        </div>
    </c:if>

	<!--sec:authorize access="hasRole('ROLE_USER')" -->
		<!-- For login user -->
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
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>
    <!--增加了帮助文档链接-->
    <div class="readme">
    <a href="/SecurityTest/readme">查看帮助文档</a>
    </div>

	<!--/sec:authorize-->
</body>
</html>