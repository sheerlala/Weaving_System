<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>个人账户管理</title>
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
            <div class="col-xs-3 col-xs-push-1">
                <label for="balance">账户余额:</label>
            </div>
            <div class="col-xs-8">
                <input type="text" name="balance" id="balance" class="form-control" />
            </div>
        </div><br />

        <div class="row">
            <div class="col-xs-3 col-xs-push-1">
                <label for="recharge">充值金额:</label>
            </div>
            <div class="col-xs-8">
                <input type="text" name="recharge" id="recharge" class="form-control" />
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
        var recharge = $("#recharge").val();

        if(recharge == null){
            error("充值金额不能为零或空");
            $("#recharge").focus();
            return false;
        };
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/admin/user/recharge?recharge="+recharge,
            success:function(data){
                if(data.msg=='error'){
                    alert("充值失败");
                    return false;
                }
                alert("充值成功");
                $("#recharge").val("");
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