<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/15
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>custom</title>
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
        /*function queryAllCustom(){
            $.post(
                "/worker/queryAll",
                {"pageNum":1},
                function (data){
                    console.log(data);
                    var html = "";
                    for (var i=0;i<data.length;i++){
                        html += "<tr>" +
                        "<td>" + data[i].customId + "</td>" +
                        "<td>" + data[i].customName + "</td>" +
                        "<td>" + data[i].customFrom + "</td>" +
                        "<td>" + data[i].customWork + "</td>" +
                        "<td>" + data[i].customLevel + "</td>" +
                        "<td>" + data[i].customTel + "</td>" +
                        "<td>" + data[i].customPhone + "</td>" +
                        "<td>" + data[i].customCode + "</td>" +
                        "<td>" + data[i].customAddress + "</td>" +
                        "</tr>"
                    }
                    $("#tbady_custom").html(html)
                }
            )
        }*/

        function deleteCustom(customId,pageN){
            $.post(
                "${pageContext.request.contextPath}/worker/deleteCustom",
                {"customId":customId},
                function (data){
                    alert("删除成功");
                    pageJ(pageN);
                }
            )
        }

        function pageJ(pageN){
            $("#pageNow").val(pageN);
            $("#pageJump").submit();
        }

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
                <input type="hidden" name="customMsg" value="">
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
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/worker/toAddCustom">新增信息</a>
            </div>

            <div style="float: right">
                <%--查询信息--%>
                <form class="form-inline" action="${pageContext.request.contextPath}/worker/custom" method="post" >
                    <input type="text" name="customMsg" class="form-control" placeholder="客户的姓名/电话/地址：">
                    <input type="hidden" name="pageNum" value="1">
                    <input type="submit" value="搜索" class="btn btn-primary">
                </form>
            </div>
        </div>

        <%--客户信息表--%>
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>客户编号</th>
                <th>客户姓名</th>
                <th>客户来源</th>
                <th>工作行业</th>
                <th>客户等级</th>
                <th>联系方式</th>
                <th>固定电话</th>
                <th>客户编码</th>
                <th>家庭住址</th>
            </tr>
            </thead>

            <tbody id="tbady_custom">
            <c:forEach var="custom" items="${customPageInfo.list}">
                <tr>
                    <td>${custom.customId}</td>
                    <td>${custom.customName}</td>
                    <td>${custom.customFrom}</td>
                    <td>${custom.customWork}</td>
                    <td>${custom.customLevel}</td>
                    <td>${custom.customTel}</td>
                    <td>${custom.customPhone}</td>
                    <td>${custom.customCode}</td>
                    <td>${custom.customAddress}</td>
                    <td>
                        <%--<a href="${pageContext.request.contextPath}/worker/toUpdateCustom?customId=${custom.customId}&customMsg=${customMsg}&pageNum=${customPageInfo.pageNum}">修改</a>--%>
                        <a href="${pageContext.request.contextPath}/worker/toUpdateCustom/${custom.customId}/${customMsg}/${customPageInfo.pageNum}">修改</a>
                            &nbsp; | &nbsp;
                        <%--<a href="${pageContext.request.contextPath}/worker/deleteCustom/${custom.customId}/${customPageInfo.pageNum}">删除</a>--%>
                        <a href="javascript:;" onclick="deleteCustom(${custom.customId},${customPageInfo.pageNum})">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%--页面跳转--%>
        <div>
            <form id="pageJump" action="${pageContext.request.contextPath}/worker/custom" method="post">
                <input type="hidden" name="customMsg" value="${customMsg}">
                <input id="pageNow" name="pageNum" type="hidden" value="1">
                <a href="javascript:;" onclick="pageJ(1)">首页</a>
                <a href="javascript:;" onclick="pageJ(${customPageInfo.prePage})">上一页</a>
                <a href="javascript:;" onclick="pageJ(${customPageInfo.nextPage})">下一页</a>
                <a href="javascript:;" onclick="pageJ(${customPageInfo.pages})">尾页</a>
            </form>

            <%--<a href="${pageContext.request.contextPath}/worker/custom/1">首页</a>
            <a href="${pageContext.request.contextPath}/worker/custom/${customPageInfo.prePage}">上一页</a>
            <a href="${pageContext.request.contextPath}/worker/custom/${customPageInfo.nextPage}">下一页</a>
            <a href="${pageContext.request.contextPath}/worker/custom/${customPageInfo.pages}">尾页</a>--%>
        </div>

    </div>
</center>

</body>
</html>
