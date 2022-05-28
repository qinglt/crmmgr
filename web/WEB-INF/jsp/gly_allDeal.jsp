<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/21
  Time: 10:11
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

        function deal_day(dayTime){
            $("#deal_time").val(dayTime);
            $("#deal_time_query").submit();
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
            console.log("111111111111111111111");
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
        <a href="${pageContext.request.contextPath}/gly/index" class="btn btn-outline-secondary" style="float: left">首页</a>
        <span style="float: left;padding: 5px">欢迎你<%=session.getAttribute("username")%></span>

        <a href="${pageContext.request.contextPath}/goOut" class="btn btn-outline-secondary" style="float: right">注销登录</a>
    </div>
</div>

<div class="left_hand">
    <center>
        <div class="left_hand_son">
            <form id="yggl" action="${pageContext.request.contextPath}/gly/allWorker" method="post">
                <input type="hidden" name="workerMsg" value="">
                <input type="hidden" name="pageNum" value="1">
                <a href="javascript:;" onclick="javascript:$('#yggl').submit()"><h5>员工管理</h5></a>
            </form>
        </div>
        <div class="left_hand_son">
            <form id="ckkc" action="${pageContext.request.contextPath}/gly/allStock" method="post">
                <input type="hidden" name="stockMsg" value="">
                <input type="hidden" name="pageNum" value="1">
                <a href="javascript:;" onclick="javascript:$('#ckkc').submit()"><h5>库存管理</h5></a>
            </form>
        </div>
        <div class="left_hand_son">
            <form id="ddgl" action="${pageContext.request.contextPath}/gly/allDeal" method="post">
                <input type="hidden" name="dealTime" value="">
                <input type="hidden" name="pageNum" value="1">
                <a href="javascript:;" onclick="javascript:$('#ddgl').submit()"><h5>订单管理</h5></a>
            </form>
        </div>
        <div class="left_hand_son">
            <form id="tzgl" action="${pageContext.request.contextPath}/gly/allInform" method="post">
                <input type="hidden" name="informMsg" value="">
                <input type="hidden" name="pageNum" value="1">
                <a href="javascript:;" onclick="javascript:$('#tzgl').submit()"><h5>通知管理</h5></a>
            </form>
        </div>
        <div class="left_hand_son">
            <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="border: none">
                <h5 style="color: rgb(0,123,253)">报表统计</h5>
            </button>
            <div class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item" href="${pageContext.request.contextPath}/gly/allReport?pageNum=1">客户来源统计</a>
                <a class="dropdown-item" href="${pageContext.request.contextPath}/gly/allReport2?pageNum=1">员工业绩统计</a>
            </div>
        </div>
    </center>
</div>

<center>
    <div class="body_index">

        <div style="width: 1300px;height: auto">
            <div style="float: left">
                <button type="button" class="btn btn-primary" onclick="method5('gly_deal_table')">导出</button>
            </div>

            <div style="float: right">
                <%--查询信息--%>
                <form id="deal_time_query" class="form-inline" action="${pageContext.request.contextPath}/gly/allDeal" method="post">
                    <input id="deal_time" type="hidden" name="dealTime" value="">
                    <input type="hidden" name="pageNum" value="1">
                    <input type="submit" value="近7天" class="btn btn-primary" onclick="deal_day('近7天')">
                    <input type="submit" value="近30天" class="btn btn-primary" onclick="deal_day('近30天')">
                </form>
            </div>
        </div>

        <%--个人订单信息表--%>
        <table id="gly_deal_table" class="table table-hover table-striped">
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
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%--页面跳转--%>
        <div>
            <form id="pageJump" action="${pageContext.request.contextPath}/gly/allDeal" method="post">
                <input type="hidden" name="dealTime" value="${dealTime}">
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
