<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="Content-Style-Type" content="text/css" />
  <meta name="generator" content="pandoc" />
  <title></title>
  <style type="text/css">code{white-space: pre;}</style>
  <link rel="stylesheet" href="markdown.css" type="text/css" />
</head>
<body>
<h2 id="彩生活停车场管理系统身份认证后端使用实例">彩生活停车场管理系统身份认证后端使用实例</h2>
<h2 id="项目说明">项目说明</h2>
<ul>
<li>利用Spring Security实现用户身份认证,同时提供REST api给前端，以操作MySQL数据库</li>
<li>实际junit单元测试通过</li>
</ul>
<h3 id="rest-api使用说明">REST api使用说明</h3>
<ul>
<li>此应用运行于 <code>http://hostname:8080/SecurityTest</code>, 默认页面为接口文档.</li>
<li>登陆页面为 <code>/login</code>, 登陆名密码见用户表内容.</li>
<li>目前提供了管理员,座席,保安,车主的数据修改,查询接口</li>
<li>admin：目前提供了对用户进行创建,更新和查询,因为还没有车俩进出场数据,财务报表等等,等待后面再添加进去
<ul>
<li><code>/admin/user/all</code>: 显示当前所有用户，已经添加email跟phonenumber显示。</li>
<li><code>/admin/user/create?id=[id]&amp;username=[username]&amp;password=[password]&amp;enabled=[0/1]&amp;role=[ADMIN/CAROWNER/SEAT/GUARD]</code>: 根据用户名,密码,是否使能，以及用户角色来创建新用户</li>
<li><code>/admin/user/search?id=[id]&amp;username=[username]&amp;email=[email]&amp;phonenumber=[phonenumber]</code>: 混合搜索.根据id,用户名,email,电话号码等等搜索用户数据</li>
<li><code>/admin/user/update?id=[id]&amp;username=[username]&amp;email=[email]&amp;phonenumber=[phonenumber]</code>: 如果带有id关键字,那就是对当前id的用户进行更新;如果不带id,那就是对自己进行用户数据更新. 更新内容包括用户名,email,电话号码</li>
<li><code>/admin/user/delete?id=[id]&amp;username=[username]&amp;email=[email]&amp;phonenumber=[phonenumber]</code>: 根据id,用户名,email,电话号码删除相应用户</li>
<li><code>/admin/role/all</code>: 显示当前所有用户对应的角色类型</li>
<li><code>/admin/role/search?id=[id]&amp;username=[username]&amp;email=[email]&amp;phonenumber=[phonenumber]</code>: 根据id,用户名,email,电话号码查询用户角色</li>
</ul></li>
<li>seat：目前提供了座席对自身用户信息的更新,以及对用户的信息查询,后面加入停车场消息推送,车辆进出场记录查询,道闸状态查询等等
<ul>
<li><code>/seat/user/search?id=[id]&amp;username=[username]&amp;email=[email]&amp;phonenumber=[phonenumber]</code>: 混合搜索.根据id,用户名,email,电话号码等等搜索用户数据.(以后跟进,使座席只能搜索某部分用户的信息)</li>
<li><code>/seat/user/update?username=[username]&amp;email=[email]&amp;phonenumber=[phonenumber]</code>: 更新自己的相关信息,包括用户名,email,电话号码.(即使跟了关键字id,也只能更新自己的信息)</li>
</ul></li>
<li>guard：目前提供了保安对自身用户信息的更新,后面加入紧急放行接口
<ul>
<li><code>/guard/user/search?id=[id]&amp;username=[username]&amp;email=[email]&amp;phonenumber=[phonenumber]</code>: 混合搜索.根据id,用户名,email,电话号码等等搜索用户数据.(以后跟进,使保安只能搜索某部分用户的信息)</li>
<li><code>/guard/user/update?username=[username]&amp;email=[email]&amp;phonenumber=[phonenumber]</code>: 更新自己的用户信息,包括用户名,email,电话号码.(即使跟了关键字id,也只能更新自己的信息)</li>
</ul></li>
<li>carowner: 目前提供了车主对自身用户信息的更新, 后面加入对车辆的进出场记录信息查询接口
<ul>
<li><code>/carowner/user/search?id=[id]&amp;username=[username]&amp;email=[email]&amp;phonenumber=[phonenumber]</code>: 混合搜索.根据id,用户名,email,电话号码等等搜索用户数据.(以后跟进,使车主只能搜索某部分用户的信息)</li>
<li><code>/carowner/user/update?username=[username]&amp;email=[email]&amp;phonenumber=[phonenumber]</code>: 更新自己的用户信息,包括用户名,email,电话号码.(即使跟了关键字id,也只能更新自己的信息)</li>
</ul></li>
</ul>
<h3 id="数据库">数据库</h3>
<ul>
<li>数据库里通过mysql的GUI工具,建立并真正在使用的三张表,用户表,权限表,用户权限关联表</li>
<li><p>用户表内容:password通过md5加密,默认所有用户的密码都是<code>1</code>. 可以自己再重新创建或者删除用户或者更改用户信息.</p>
<table>
<thead>
<tr class="header">
<th align="left">id</th>
<th align="left">username</th>
<th align="left">password</th>
<th align="left">email</th>
<th align="left">phonenumber</th>
<th align="left">plate</th>
<th align="left">enabled</th>
<th align="left">descn</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1</td>
<td align="left">admin</td>
<td align="left">c4ca4238a0b923820dcc509a6f75849b</td>
<td align="left">NULL</td>
<td align="left">NULL</td>
<td align="left">NULL</td>
<td align="left">1</td>
<td align="left">管理员</td>
</tr>
<tr class="even">
<td align="left">2</td>
<td align="left">carowner</td>
<td align="left">c4ca4238a0b923820dcc509a6f75849b</td>
<td align="left">NULL</td>
<td align="left">NULL</td>
<td align="left">NULL</td>
<td align="left">1</td>
<td align="left">车主</td>
</tr>
<tr class="odd">
<td align="left">3</td>
<td align="left">seat</td>
<td align="left">c4ca4238a0b923820dcc509a6f75849b</td>
<td align="left">NULL</td>
<td align="left">NULL</td>
<td align="left">NULL</td>
<td align="left">1</td>
<td align="left">座席</td>
</tr>
<tr class="even">
<td align="left">4</td>
<td align="left">guard</td>
<td align="left">c4ca4238a0b923820dcc509a6f75849b</td>
<td align="left">NULL</td>
<td align="left">NULL</td>
<td align="left">NULL</td>
<td align="left">1</td>
<td align="left">保安</td>
</tr>
</tbody>
</table></li>
<li><p>权限表内容:目前只设置了4种权限,分别是管理员,车主,座席,保安.</p>
<table>
<thead>
<tr class="header">
<th align="left">id</th>
<th align="left">name</th>
<th align="left">descn</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1</td>
<td align="left">ADMIN</td>
<td align="left">管理员角色</td>
</tr>
<tr class="even">
<td align="left">2</td>
<td align="left">CAROWNER</td>
<td align="left">车主角色</td>
</tr>
<tr class="odd">
<td align="left">3</td>
<td align="left">SEAT</td>
<td align="left">座席角色</td>
</tr>
<tr class="even">
<td align="left">4</td>
<td align="left">GUARD</td>
<td align="left">保安角色</td>
</tr>
</tbody>
</table></li>
<li><p>用户权限关联表内容:每一个用户id跟权限id关联起来,比如管理员同时拥有4种权限,而车主只能拥有车主这个权限</p>
<table>
<thead>
<tr class="header">
<th align="left">user_id</th>
<th align="left">role_id</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1</td>
<td align="left">1</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">2</td>
</tr>
<tr class="odd">
<td align="left">2</td>
<td align="left">2</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">3</td>
</tr>
<tr class="odd">
<td align="left">3</td>
<td align="left">3</td>
</tr>
<tr class="even">
<td align="left">1</td>
<td align="left">4</td>
</tr>
<tr class="odd">
<td align="left">4</td>
<td align="left">4</td>
</tr>
</tbody>
</table></li>
</ul>
<h3 id="配置更改">配置更改</h3>
<p>打开<code>mvc-dispatcher-servlet.xml</code>, <code>spring-database.xml</code>, <code>spring-security.xml</code> 文件并且根据自己具体数据库,权限配置进行修改配置进行修改.</p>
</body>
</html>
