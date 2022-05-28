<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/17
  Time: 15:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>deal</title>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <style>
        .top_hand{
            padding: 8px;
            width: 1519px;
            height: 50px;
            position: absolute;
            top: 0px;
        }

        .left_hand{
            width: 200px;
            height: 600px;
            position: absolute;
            left: 0px;
            top: 60px;
            background-color: #e7dcdc;
            border-radius: 5px;
        }
        .body_index{
            width: 1300px;
            height: 650px;
            position: absolute;
            top: 60px;
            left: 210px;
        }
        .left_hand_son{
            margin: 5px;
            padding: 5px;
            width: 190px;
            height: 30px;
        }

    </style>

    <script>

        function pageJ(pageN){
            $("#pageNow").val(pageN);
            $("#pageJump").submit();
        }

        function dealOut(id,state){
            if (state !== '已出库'){
                $.post(
                    "${pageContext.request.contextPath}/worker/dealOut",
                    {"dealId":id},
                    function (data){
                        if (data.toString()==="ok"){
                            alert("出库成功");
                            location.reload();
                        }else {
                            alert("error");
                        }
                    }
                )
            }else {
                alert("已出库");
            }
        }

        function update_deal(id,pageN,msg,state){
            if (state !== '已出库'){
                location.replace("${pageContext.request.contextPath}/worker/toUpdateDeal/"+id+"/"+pageN+"/"+msg);
            }else {
                alert("已出库，不能修改");
            }
        }

        //打印表格
        var idTmr;

        function getExplorer() {
            var explorer = window.navigator.userAgent;
            //ie
            if(explorer.indexOf("MSIE") >= 0) {
            return 'ie';
        }
            //firefox
            else if(explorer.indexOf("Firefox") >= 0) {
            return 'Firefox';
        }
            //Chrome
            else if(explorer.indexOf("Chrome") >= 0) {
            return 'Chrome';
        }
            //Opera
            else if(explorer.indexOf("Opera") >= 0) {
            return 'Opera';
        }
            //Safari
            else if(explorer.indexOf("Safari") >= 0) {
            return 'Safari';
        }
        }

        function method5(tableid) {
            if(getExplorer() == 'ie') {
                var curTbl = document.getElementById(tableid);
                var oXL = new ActiveXObject("Excel.Application");
                var oWB = oXL.Workbooks.Add();
                var xlsheet = oWB.Worksheets(1);
                var sel = document.body.createTextRange();
                sel.moveToElementText(curTbl);
                sel.select();
                sel.execCommand("Copy");
                xlsheet.Paste();
                oXL.Visible = true;

                try {
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls",
                    "Excel Spreadsheets (*.xls), *.xls");
                } catch(e) {
                    print("Nested catch caught " + e);
                } finally {
                    oWB.SaveAs(fname);
                    oWB.Close(savechanges = false);
                    oXL.Quit();
                    oXL = null;
                    idTmr = window.setInterval("Cleanup();", 1);
                    }

            } else {
                tableToExcel(tableid)
            }
        }

        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }

        var tableToExcel = (function() {
            var uri = 'data:application/vnd.ms-excel;base64,',
            template = '<html><head><meta charset="UTF-8"></head><body><table  border="1">{table}</table></body></html>',
            base64 = function(s) {
                return window.btoa(unescape(encodeURIComponent(s)))
            },
            format = function(s, c) {
                return s.replace(/{(\w+)}/g,
                    function(m, p) {
                    return c[p];
                })
            }
            return function(table, name) {
                if(!table.nodeType)
                table = document.getElementById(table)
                var ctx = {
                    worksheet: name || 'Worksheet',
                    table: table.innerHTML
                }
                window.location.href = uri + base64(format(template, ctx))
            }
        })()
    </script>

</head>
<body>

<div class="top_hand">
    <%--导航--%>
    <div class="top_head">
        <a href="${pageContext.request.contextPath}/worker/index" class="btn btn-outline-secondary" style="float: left">首页</a>
        <span style="float: left;padding: 5px">欢迎你<%=session.getAttribute("username")%></span>

        <!-- Example single danger button -->
        <div class="btn-group" style="float: right">
            <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                <img src="${pageContext.request.contextPath}/upload/<%=session.getAttribute("workerHand")%>" height="30" width="30">
            </button>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/worker/toUpdateInfo">个人信息</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/goOut">注销登录</a>
            </div>
        </div>
    </div>
</div>

<div class="left_hand">
    <center>
        <div class="left_hand_son">
            <form id="khgl" action="${pageContext.request.contextPath}/worker/custom" method="post">
                <input type="hidden" name="customMag" value="">
                <input type="hidden" name="pageNum" value="1">
                <a href="javascript:;" onclick="javascript:$('#khgl').submit()"><h5>客户管理</h5></a>
            </form>
        </div>
        <div class="left_hand_son">
            <form id="ckkc" action="${pageContext.request.contextPath}/worker/allStock" method="post">
                <input type="hidden" name="stockMsg" value="">
                <input type="hidden" name="pageNum" value="1">
                <a href="javascript:;" onclick="javascript:$('#ckkc').submit()"><h5>查看库存</h5></a>
            </form>
        </div>
        <div class="left_hand_son">
            <form id="ddgl" action="${pageContext.request.contextPath}/worker/allDeal" method="post">
                <input type="hidden" name="dealMag" value="">
                <input type="hidden" name="pageNum" value="1">
                <a href="javascript:;" onclick="javascript:$('#ddgl').submit()"><h5>订单管理</h5></a>
            </form>
        </div>
        <div class="left_hand_son">
            <form id="tzgl" action="${pageContext.request.contextPath}/worker/allInform" method="post">
                <input type="hidden" name="informMsg" value="">
                <input type="hidden" name="pageNum" value="1">
                <a href="javascript:;" onclick="javascript:$('#tzgl').submit()"><h5>查看通知</h5></a>
            </form>
        </div>
        <div class="left_hand_son">
            <a href="${pageContext.request.contextPath}/worker/allMsg"><h5>员工交流</h5></a>
        </div>
    </center>
</div>

<center>
    <div class="body_index">

        <div style="width: 1300px;height: auto">
            <div style="float: left">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/worker/toAddDeal">新增信息</a>
                <button type="button" class="btn btn-primary" onclick="method5('deal_table')">导出</button>
            </div>

            <div style="float: right">
                <%--查询信息--%>
                <form class="form-inline" action="${pageContext.request.contextPath}/worker/allDeal" method="post" >
                    <input type="text" name="dealMsg" class="form-control" placeholder="订单的标题/客户/货物：">
                    <input type="hidden" name="pageNum" value="1">
                    <input type="submit" value="搜索" class="btn btn-primary">
                </form>
            </div>
        </div>

        <%--个人订单信息表--%>
        <table id="deal_table" class="table table-hover table-striped">
            <thead>
            <tr>
                <th>订单编号</th>
                <th>订单标题</th>
                <th>订单客户</th>
                <th>收货人</th>
                <th>收货地址</th>
                <th>收货人电话</th>
                <th>下单时间</th>
                <th>订购货物</th>
                <th>订购数量</th>
                <th>订单备注</th>
                <th>订单状态</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="deals" items="${dealPageInfo.list}">
                <tr>
                    <td>${deals.dealId}</td>
                    <td>${deals.dealName}</td>
                    <td>${deals.dealCustom}</td>
                    <td>${deals.dealPeople}</td>
                    <td>${deals.dealAddress}</td>
                    <td>${deals.dealPhone}</td>
                    <td>${deals.dealTime}</td>
                    <td>${deals.dealStock}</td>
                    <td>${deals.dealNumber}</td>
                    <td>${deals.dealDetail}</td>
                    <td>${deals.dealState}</td>
                    <td>
                        <a href="javascript:;" onclick="dealOut('${deals.dealId}','${deals.dealState}')">出库</a>
                        &nbsp; | &nbsp;
                        <%--<a href="${pageContext.request.contextPath}/deal/toUpdateDeal/${deals.dealId}/${dealPageInfo.pageNum}/${dealMsg}">修改</a>--%>
                        <a href="javascript:;" onclick="update_deal('${deals.dealId}','${dealPageInfo.pageNum}','${dealMsg}','${deals.dealState}')">修改</a>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%--页面跳转--%>
        <div>
            <form id="pageJump" action="${pageContext.request.contextPath}/worker/allDeal" method="post">
                <input type="hidden" name="dealMsg" value="${dealMsg}">
                <input id="pageNow" name="pageNum" type="hidden" value="1">
                <a href="javascript:;" onclick="pageJ(1)">首页</a>
                <a href="javascript:;" onclick="pageJ(${dealPageInfo.prePage})">上一页</a>
                <a href="javascript:;" onclick="pageJ(${dealPageInfo.nextPage})">下一页</a>
                <a href="javascript:;" onclick="pageJ(${dealPageInfo.pages})">尾页</a>
            </form>
        </div>

    </div>
</center>

</body>
</html>