/*
 firstTen -- 显示最新的十条记录
 tableDom --- 数据存放的dom对象
 pageDom --- Div所包含的按钮 <div id='pageDom'><button>1</button><button>2</button></div>
 msg --- 所有的信息
 separator1 --- 信息中的分割符号
 * */
/*
 html格式 --- 要引入bootstrap框架

 表格格式
 <table class="table table-bordered table-striped">
 <thead>
 <tr>
 <td>小区ID</td>
 <td>电表ID</td>
 <td>当前电表读数</td>
 <td>上月电表读数</td>
 <td>月用电量</td>
 <td>电费(元)</td>
 </tr>
 </thead>
 <tbody id="message"></tbody>
 </table>

 按钮格式
 <div class="btn-group" id="pageBtn">
 <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-backward"></span></button>
 <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-fast-backward"></span></button>
 <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-fast-forward"></span></button>
 <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-forward"></span></button>
 </div>
 * */
/*
 使用说明
 var msg = "";
 for (var i = 1; i <= 1001; i++) {
 msg += "<tr>" +
 "	<td>" + i + "</td>" +
 "	<td>" + i + "</td>" +
 "	<td>" + i + "</td>" +
 "	<td>" + i + "</td>" +
 "	<td>" + i + "</td>" +
 "	<td>" + i + "</td>" +
 "</tr>,";
 };
 cr_page(tableDom,btnDom,msg,",");
 tableDom.html(firstTen);
 * */

var firstTen = "";
function cr_page(tableDom, pageDom, msg, separator1) {
    var html = "";
    var arr = [];
    html = msg ;
    arr = html.split(""+separator1+"");
    arr.reverse();
    /*if((arr.length - 1) % 10 == 9){
     arr.unshift("0000");//这只是一个数据的占位符
     }*/
    var arr10 = [];
    html = "";
    for (var i = 1; i <= arr.length; i++) {
        html += arr[i];
        if (i != 0 && i % 10 == 0) {
            arr10.push(html);
            html = "";
        }
    };
    //按到截取剩下的数据
    if ((arr.length - 1) % 10 != 0) {
        arr10.push(html);
    }
    var pages = 0;
    var next = pageDom.children().eq(2);
    var pre = pageDom.children().eq(1);
    var nextAll = pageDom.children().eq(3);
    var preAll = pageDom.children().eq(0);
    next.on("click", function() {
        pages++;
        if (pages > arr10.length) {
            pages = arr10.length - 1;
        }
        html = arr10[pages];
        tableDom.html(html);
        stutas(pages, arr10, pre, preAll, next, nextAll);
    });
    pre.on("click", function() {
        pages--;
        if (pages <= 0) {
            pages = 0;
        };
        html = arr10[pages];
        tableDom.html(html);
        stutas(pages, arr10, pre, preAll, next, nextAll);
    });
    preAll.on("click", function() {
        html = arr10[0];
        tableDom.html(html);
        pages = 0;
        stutas(pages, arr10, pre, preAll, next, nextAll);
    });
    nextAll.on("click", function() {
        html = arr10[arr10.length - 1];
        tableDom.html(html);
        pages = arr10.length - 1;
        stutas(pages, arr10, pre, preAll, next, nextAll);
    });
    //判断按钮的状态
    stutas(pages, arr10, pre, preAll, next, nextAll);
    firstTen = arr10[0];
};
//判断按钮的状态
function stutas(pages, arr10, pre, preAll, next, nextAll) {
    if (pages == 0) {
        pre.attr("disabled", "disabled");
        preAll.attr("disabled", "disabled");
    } else {
        pre.removeAttr("disabled");
        preAll.removeAttr("disabled");
    };
    if (pages == (arr10.length - 1)) {
        next.attr("disabled", "disabled");
        nextAll.attr("disabled", "disabled");
    } else {
        next.removeAttr("disabled");
        nextAll.removeAttr("disabled");
    };
}/**
 * Created by asus on 2016/6/17.
 */
