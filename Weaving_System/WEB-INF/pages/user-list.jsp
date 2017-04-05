<%@page contentType="text/html;charset=UTF-8"%>
<%@ include file="/includes/taglibs.jsp"%>
<html>
  <head>
    <%@ include file="/includes/meta.jsp"%>
    <title>list</title>
  </head>
  <body>
    <%@include file="/includes/header.jsp"%>
    <%@include file="/includes/message.jsp"%>
    <table border="1" width="100%">
      <tr>
        <th>Username</th>
        <th>Password</th>
        <th>Enabled</th>
        <th>Authorities</th>
        <th>Operation</th>
      </tr>
<c:forEach var="item" items="${list}">
      <tr>
        <td>${item.username}&nbsp;</td>
        <td>[PROTECTED]&nbsp;</td>
        <td>${item.enabled}&nbsp;</td>
        <td>${item.authority}&nbsp;</td>
        <td>
          <a href="admin/view&username=${item.username}">View</a>
          |
          <a href="admin/update&username=${item.username}">Update</a>
          |
          <a href="admin/remove&username=${item.username}">Remove</a>
        </td>
      </tr>
</c:forEach>
    </table>
  </body>
</html>