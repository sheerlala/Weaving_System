<%--
  Created by IntelliJ IDEA.
  User: 侠圣
  Date: 2016/7/4
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en"style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>设计师主页</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/kendo.common-material.min.css" />
    <link rel="stylesheet" href="../css/kendo.material.min.css" />
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/kendo.all.min.js"></script>
</head>
<body style="height: 100%;">
<div id="homepage" style="width: 100%;height: 100%;">
    <div style="background-color:maroon;height:100%;margin: -20px 0;width: 100%">
        <h3 style="text-align: center;padding-top: 30px">纺织云平台系统</h3>
        <hr style="color: lightgrey;height: 2px;width: 100%" />
        <ul id="menu" class="first" style="background-color: transparent;height: 400px;margin-left: 15px"  >
            <li  style="font-size: 1.3em">项目管理
                <ul>
                    <li style="font-size: 0.8em"><a href ="../projects.jsp" target ="show">已有项目</a>
                    </li>
                    <li style="font-size: 0.8em"><a href ="../upload1.jsp" target ="show">新建项目</a>
                    </li>
                </ul>
            <li style="font-size: 1.3em">个人信息管理
            <ul>
                <li style="font-size: 0.8em"><a href ="../change_info.jsp" target ="show">个人信息修改</a>
                </li>
                <li>
                    <a style="font-size: 0.8em"href ="../updatepwd.jsp" target ="show">密码修改</a>
                </li>
            </ul>
        </li>
            <li style="font-size: 1.3em"><a href ="../account.jsp" target ="show">个人账户管理</a></li>
        </ul>
        <div class="container" style="margin-top: 100px">
                <p style="font-size: 1.4em;text-align:center;color: lightgrey"id="designername"></p>
        </div>

    </div>
    <style>
        h3,li,a{
            color:lightgray;
        }

    </style>
    <script>
        $(document).ready(function() {
            $("#menu").kendoTreeView();
            $.ajax({
                type: "get",
                url: "/job/get_info",
                success: function(data) {
                   document.getElementById("designername").innerHTML=data.username;
                }
            });
        });


    </script>
</div>
</body>
</html>