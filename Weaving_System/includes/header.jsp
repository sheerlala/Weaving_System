<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="100%">
  <tr>
<c:if test="${param.action == 'list'}">
    <td><a href="admin/create">Create User</a></td>
</c:if>

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

<c:if test="${param.action != 'list'}">
    <td><a href="admin/all">Back</a></td>
</c:if>
    <td align="right">
      username: <sec:authentication property="name"/>
      |
      <a href="admin/preChangePassword">Change Password</a>
      |
      <a href="javascript:formSubmit()">Logout</a>
    </td>
  </tr>
</table>
<hr>