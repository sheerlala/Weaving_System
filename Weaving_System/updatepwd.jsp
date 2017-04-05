<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <script src="../js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
<div class="container-fluid"  id="alterPasswsord">
    <div style="background: #fff;position: absolute;top: 25%;left: 25%;z-index: 11;width: 450px;">
        <br />
        <div id="error"><p style="display:none;text-align: center;font-size: 20px;color:red;"></p></div>
        <div class="row">
            <div class="col-xs-2 col-xs-push-1">
                <label for="oldPassword">旧&nbsp;&nbsp;密&nbsp;&nbsp;码:</label>
            </div>
            <div class="col-xs-8 col-xs-push-1">
                <input type="password" name="oldPassword" id="oldPassword" class="form-control" />
            </div>
        </div><br />
        <div class="row">
            <div class="col-xs-2 col-xs-push-1">
                <label for="newPassword">新&nbsp;&nbsp;密&nbsp;&nbsp;码:</label>
            </div>
            <div class="col-xs-8 col-xs-push-1">
                <input type="password" name="newPassword" id="newPassword" class="form-control" />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-xs-3 col-xs-push-1">
                <label for="confirmPassword">确认密码:</label>
            </div>
            <div class="col-xs-8">
                <input type="password" name="confirmPassword" id="confirmPassword" class="form-control" />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-xs-2 col-xs-push-7">
                <input type="button" onclick="submitMsg();" class="btn btn-success" style="width: 80px;" value="提交">
            </div>
        </div>
        <br />
    </div>
</div>
<script type="text/javascript">
    //修改密码
    //提交数据
    function submitMsg(){
        var oldPassword = $("#oldPassword").val();
        var newPassword = $("#newPassword").val();
        var confirmPassword = $("#confirmPassword").val();
        if(oldPassword == null || oldPassword == ""){
            error("旧密码不能为空！");
            $("#oldPassword").focus();
            return false;
        };
        if(newPassword == null || newPassword == ""){
            error("新密码不能为空！");
            $("#newPassword").focus();
            return false;
        };
        if(newPassword == oldPassword){
            error("旧密码不能与新密码相同");
            $("#newPassword").focus();
            return false;
        };
        if(confirmPassword == null || confirmPassword == ""){
            error("确认密码不能为空！");
            $("#confirmPassword").focus();
            return false;
        };
        if(newPassword != confirmPassword){
            error("确认密码与新密码不相同！");
            $("#confirmPassword").focus();
            return false;
        };
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/admin/user/change?oldPassword="+oldPassword+"&password="+newPassword,
            success:function(data){
                if(data.msg=='passwordError'){
                    alert("旧密码不正确！");
                    return false;
                }
                alert("修改成功！");
                $("#oldPassword").val("");
                $("#newPassword").val("");
                $("#confirmPassword").val("");
                $("#error p").html("");
            }
        });
    };

    function error(msg){
        $("#error p").html(msg).slideDown().delay(1000).slideUp();
    }
</script>
</body>

</html>