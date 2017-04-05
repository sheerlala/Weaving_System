<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" http-equiv="Content-Type">

 <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
 <link href="css/stream-v1.css" rel="stylesheet" type="text/css">
  
    <script src="js/jquery-3.2.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
	 <script src="js/cr_page.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/cr.js" type="text/javascript" charset="utf-8"></script>
	  <script src="js/stream-v1.js"></script>
<title>newproject</title>
</head>
<body style="background-color:#f0f0f0">
    <div class="row"style="position:fixed;right:2px;top:0px;z-index:90;background-color:#f0f0f0;width:100%;height:40px;">
     <div style="margin-right:30px;margin-top:5px;text-align:right">
                <a href="../vip.jsp" target="show" class="btn btn-sm btn-primary">开通VIP</a>
                <a href="javascript:logout()" class="btn btn-sm btn-primary">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</a>
	 </div>
   </div>
   <div class="row" style="background-color:black;height:60px;width:100%;position:fixed;left:16px;top:40px;z-index:90">
    <div class="col-md-2 col-md-offset-1 col-xs-2"style="z-index:100;background-color:#e0e0e0;margin-top:-12px;height:140%;vertical-align:text-top;border-radius:3%;box-shadow:7px 7px 3px #444;">
	<h2 style="line-height:45px;text-align:center;font-family:FangSong;font-weight:bold">纺织云平台</h2></div>
      <div class="dropdown">   
		 <div class="col-md-2 col-md-offset-1 nav">
		 <h4 class="dropdown-toggle"data-toggle="dropdown">项目管理
		 <span class="caret"></span></h4>
                <ul class="dropdown-menu" role="menu">
                    <li role="presentation"><a href ="projects.jsp" target ="_self">已有项目</a>
                    </li>
                    <li role="presentation"><a href ="newproject.jsp" target ="_self">新建项目</a>
                    </li>
                </ul>
		  </div>
          <div class="col-md-2 nav"><h4 class="dropdown-toggle"data-toggle="dropdown">个人信息管理<span class="caret"></span></h4>
            <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a href ="change_info.jsp" target ="show">个人信息修改</a>
                </li>
                <li role="presentation">
                    <a href ="../updatepwd.jsp" target ="show">密码修改</a>
                </li>
            </ul>
          </div>
          <div class="col-md-2 nav"><h4> <a href ="account.jsp" target ="show">个人账户管理</a></h4>
		  </div>	  
       </div>
   </div>
   <div class="container"style="margin-top:100px;padding:0">
   <div class="col-md-10 col-md-offset-1">
   <div class="row"><img src="images/timgd.jpg" style="width:100%;height:400px;margin-top:-12px;"/></div>
   <div class="col-md-3"style="margin-top: 50px;">
   <h4>设计师基本信息</h4>
    <p style="font-size: 1.4em;text-align:center;"id="designername"></p>
	 <p style="font-size: 1.4em;text-align:center;"id="address"></p>
	  <p style="font-size: 1.4em;text-align:center;"id="email"></p>
   </div>
   <div class="col-md-9"style="margin-top: 50px;">
   <!-- ID: `i_select_file` (文件选择按钮的ID) -->
<div id="i_select_files" style="overflow: hidden;height:200px; position: relative;background-image:url(images/timg.jpg);">

</div>

<!-- ID为`i_stream_files_queue`，否则将要配置filesQueueId: "your_id" -->
<div id="i_stream_files_queue">
</div>
<!--<button onclick="_t.upload();">开始上传</button>|<button onclick="_t.stop();">停止上传</button>|<button onclick="_t.cancel();">取消</button>
|<button onclick="_t.disable();">禁用文件选择</button>|<button onclick="_t.enable();">启用文件选择</button>
|<button onclick="_t.hideBrowseBlock();">隐藏文件选择按钮</button>|<button onclick="_t.showBrowseBlock();">显示文件选择按钮</button>
|<button onclick="_t.destroy();_t=null;_t=new Stream(config);">销毁重新生成按钮</button>
<br>-->
<!-- （可选，不配置且不自定义响应函数将看不到一些信息）ID暂时必须为`i_stream_message_container` -->
<div id="i_stream_message_container">
</div>

    </div>

   </div>
   </div>
   <style>
   .nav h4,.nav h4 a{
   line-height:45px;
   color:white;
   font-family:	FangSong;
   }
   </style>
   <script type="text/javascript">
       $(document).ready(function() {
            $.ajax({
                type: "get",
                url: "/job/get_info",
                success: function(data) {
                   document.getElementById("designername").innerHTML=data.username;
				   document.getElementById("address").innerHTML=data.place;
				   document.getElementById("email").innerHTML=data.Email;
                }             
            });
        });
	/**
     * 配置文件（如果没有默认字样，说明默认值就是注释下的值）
     * 但是，on*（onSelect， onMaxSizeExceed...）等函数的默认行为
     * 是在ID为i_stream_message_container的页面元素中写日志
     */
    var config = {
        browseFileId : "i_select_files", /** 选择文件的ID, 默认: i_select_files */
        browseFileBtn : "<div>请点击选择文件</div>", /** 显示选择文件的样式, 默认: `<div>请选择文件</div>` */
        dragAndDropArea: "i_select_files", /** 拖拽上传区域，Id（字符类型"i_select_files"）或者DOM对象, 默认: `i_select_files` */
        dragAndDropTips: "<span>或把文件(文件夹)拖拽到这里</span>", /** 拖拽提示, 默认: `<span>把文件(文件夹)拖拽到这里</span>` */
        filesQueueId : "i_stream_files_queue", /** 文件上传容器的ID, 默认: i_stream_files_queue */
        filesQueueHeight :150, /** 文件上传容器的高度（px）, 默认: 450 */
        messagerId : "i_stream_message_container", /** 消息显示容器的ID, 默认: i_stream_message_container */
        multipleFiles: true, /** 多个文件一起上传, 默认: false */
        /**  maxSize: 10485760,单个文件的最大大小，默认:2G */
        tokenURL : "tk", /** 根据文件名、大小等信息获取Token的URI（用于生成断点续传、跨域的令牌） */
        frmUploadURL : "fd", /** Flash上传的URI */
        uploadURL : "upload", /** HTML5上传的URI */
        onRepeatedFile: function(f) {
            alert("文件："+f.name +" 大小："+f.size + " 已存在于上传队列中。");
            return false;
        }
//		autoUploading: false, /** 选择文件后是否自动上传, 默认: true */
//		autoRemoveCompleted : true, /** 是否自动删除容器中已上传完毕的文件, 默认: false */
//		maxSize: 104857600//, /** 单个文件的最大大小，默认:2G */
//		retryCount : 5, /** HTML5上传失败的重试次数 */
//		postVarsPerFile : { /** 上传文件时传入的参数，默认: {} */
//			param1: "val1",
//			param2: "val2"
//		},
//		swfURL : "/swf/FlashUploader.swf", /** SWF文件的位置 */
//		tokenURL : "/tk", /** 根据文件名、大小等信息获取Token的URI（用于生成断点续传、跨域的令牌） */
//		frmUploadURL : "/fd;", /** Flash上传的URI */
//		uploadURL : "/upload", /** HTML5上传的URI */
//		simLimit: 200, /** 单次最大上传文件个数 */
//		extFilters: [".txt", ".rpm", ".rmvb", ".gz", ".rar", ".zip", ".avi", ".mkv", ".mp3"], /** 允许的文件扩展名, 默认: [] */
//		onSelect: function(list) {alert('onSelect')}, /** 选择文件后的响应事件 */
//		onMaxSizeExceed: function(size, limited, name) {alert('onMaxSizeExceed')}, /** 文件大小超出的响应事件 */
//		onFileCountExceed: function(selected, limit) {alert('onFileCountExceed')}, /** 文件数量超出的响应事件 */
//		onExtNameMismatch: function(name, filters) {alert('onExtNameMismatch')}, /** 文件的扩展名不匹配的响应事件 */
//		onCancel : function(file) {alert('Canceled:  ' + file.name)}, /** 取消上传文件的响应事件 */
//		onComplete: function(file) {alert('onComplete')}, /** 单个文件上传完毕的响应事件 */
//		onQueueComplete: function() {alert('onQueueComplete')}, /** 所以文件上传完毕的响应事件 */
//		onUploadError: function(status, msg) {alert('onUploadError')} /** 文件上传出错的响应事件 */
//		onDestroy: function() {alert('onDestroy')} /** 文件上传出错的响应事件 */
    };
    var _t = new Stream(config);
   </script>
   </body>
</html>