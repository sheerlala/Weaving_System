<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css">
        .nav-tabs {
            border: none;
        }

        .nav-tabs li {
            width: 100%;
        }

        .nav-tabs a {
            color: #222;
            font-weight: 700;
        }

        .model {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #000;
            z-index: 10;
            opacity: 0.6;
            filter: alpha(opacity: 60);
        }

        div label {
            margin-top: 8px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <script src="js/jquery-1.11.3.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
<div class="container-fluid">
    <div class="row">
        <!--导航部分-->
        <div class="col-md-2 col-xs-3" id="leftNav" style="background:#3D6A79;overflow:auto;">
            <div class="row" style="border-bottom: 3px solid #222;">
                <h3 style="text-align: center;font-weight: 700;color: #000;font-size: 22px;">纺织管理系统</h3>
            </div>
            <div class="row">
                <ul id="allDrowmenu" class="nav nav-tabs" style="border: none;"></ul>
            </div>
        </div>
        <div style="width:70%;height:50px;position: absolute;top:20px;left: 0;z-index: 55;margin-left:30%;">
            <div style="float: right;margin-right: 2%;">
                <a onclick="alterPassword();" href="#" class="btn btn-sm btn-primary">修改密码</a>
                <a href="j_spring_security_logout" class="btn btn-sm btn-primary">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</a>
            </div>
        </div>
        <!--内容部分-->
        <div class="col-md-10 col-xs-9" id="contents" style="padding: 0;">
            <iframe id="c_iframe" frameborder="0" marginheight="0" src="welcome.html" name="content" style="width:100%;height:100%;"></iframe>
        </div>
    </div>
</div>
<!--修改密码-->
<div class="container-fluid" style="display: none;" id="alterPasswsord">
    <div style="background: #fff;position: absolute;top: 35%;left: 45%;z-index: 11;width: 450px;">
        <br />
        <div id="error"><p style="display:none;text-align: center;font-size: 20px;color:#760000;"></p></div>
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
    <div class="model" onclick="fadeIn(this)"></div>
</div>
<script type="text/javascript">
    $(function() {
        $("#allDrowmenu").html('');
        getHeight();
        //allList();
        getList();
    });
    window.onresize = function() {
        getHeight();
    };
    //获取浏览器宽高
    function getHeight() {
        var wHeight = $(window).height();
        $("#contents").height(wHeight - 3);
        $("#leftNav").css("height", wHeight + "px");
        $("#content").css("height", wHeight + "px");
    }

    function getList() {
        $.ajax({
            type: "get",
            url: "/SecurityTest/rescinfo",
            success: function(data) {
                var html = "";
                var jsonArr = data.resc;
                //添加大列表
                for (var i = 0; i < jsonArr.length; i++) {
                    html += "<li><a href='javascript:void(0);' data-flag='true'><span><img src='images/right.png' width='20'/></span> " + jsonArr[i].msg + "</a>" +
                            "	<ul class='nav nav-tabs' style='border: none;padding-left:20%;display: none;' id='v" +i+ "'></ul>" +
                            "</li>";
                }
                $("#allDrowmenu").html(html);
                html = "";
                var msg = [];
                var src = [];
                for (var i = 0; i < jsonArr.length; i++) {
                    msg = jsonArr[i].list.split(",");
                    src = jsonArr[i].src.split(",");
                    for (var j = 0; j < src.length; j++) {
                        html += "<li><a href='" + src[j] + "' target='content'>" + msg[j] + "</a></li>";
                    }
                    $("#v"+i).html(html);
                    html = "";
                };
                allList();
            }
        });
    };

    function allList() {
        //下拉框
        var ulDom = $("#allDrowmenu");
        var liDoms = ulDom.children();
        var len = liDoms.length;
        for (var i = 0; i < len; i++) {
            liDoms[i].children[0].onclick = function() {
                var $this = this;
                var liDom = this.parentNode;
                var lUlDom = liDom.children[1];
                var lUlFlag = this.getAttribute("data-flag");
                if (lUlFlag == "true") {
                    $(lUlDom).slideDown("fast");
                    $this.setAttribute("data-flag", false);
                    //							//改变图标样式
                    $this.children[0].children[0].src = "images/down.png";
                    //							$($this).parent().siblings().find("ul").slideUp("slow");
                    //							$($this).parent().siblings().children().attr("data-flag",true);
                    //							$($this).parent().siblings().find("img").attr("src","images/right.png");
                } else {
                    $(lUlDom).slideUp("fast");
                    $this.setAttribute("data-flag", true);
                    $this.children[0].children[0].src = "images/right.png";
                }
            };
        };
    };
    //修改密码
    function alterPassword() {
        $("#alterPasswsord").fadeIn();
    };
    //点击消失黑屏
    function fadeIn(dom) {
        $(dom).parent().fadeOut();
    };
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
            url:"updatePassword.do",
            data:{"oldPassword":oldPassword,"password":newPassword},
            success:function(data){
                if(data.msg=='passwordError'){
                    alert("旧密码不正确！");
                    return false;
                }
                alert("提交成功！");
                $("#oldPassword").val("");
                $("#newPassword").val("");
                $("#confirmPassword").val("");
                $("#error p").html("");
                $("#alterPasswsord").fadeOut();
            }
        });
    };

    function error(msg){
        $("#error p").html(msg).slideDown().delay(1000).slideUp();
    }
</script>
</body>

</html>