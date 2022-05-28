<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/20
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>worker</title>
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

        function deleteWorker(id,pageN){
            $.post(
                "${pageContext.request.contextPath}/gly/deleteWorker",
                {"workerId":id},
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
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/gly/toAddWorker">新增信息</a>
            </div>

            <div style="float: right">
                <%--查询信息--%>
                <form class="form-inline" action="${pageContext.request.contextPath}/gly/allWorker" method="post" >
                    <input type="text" name="workerMsg" class="form-control" placeholder="员工的姓名/电话/地址：">
                    <input type="hidden" name="pageNum" value="1">
                    <input type="submit" value="搜索" class="btn btn-primary">
                </form>
            </div>
        </div>

        <%--客户信息表--%>
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>员工编号</th>
                <th>员工姓名</th>
                <th>员工密码</th>
                <th>员工职位</th>
                <th>员工电话</th>
                <th>员工地址</th>
                <th>员工头像</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="worker" items="${workerPageInfo.list}">
                <tr>
                    <td>${worker.workerId}</td>
                    <td>${worker.workerName}</td>
                    <td>${worker.workerPwd}</td>
                    <td>${worker.workerPost}</td>
                    <td>${worker.workerPhone}</td>
                    <td>${worker.workerAddress}</td>
                    <td style="padding-left: 20px;padding-top: 5px">
                        <img src="${pageContext.request.contextPath}/upload/${worker.workerHand}" height="30" width="30">
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/gly/toUpdateWorker/${worker.workerId}/${workerMsg}/${workerPageInfo.pageNum}">修改</a>
                        &nbsp; | &nbsp;
                        <a href="javascript:;" onclick="deleteWorker('${worker.workerId}','${workerPageInfo.pageNum}')">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%--页面跳转--%>
        <div>
            <form id="pageJump" action="${pageContext.request.contextPath}/gly/allWorker" method="post">
                <input type="hidden" name="workerMsg" value="${workerMsg}">
                <input id="pageNow" name="pageNum" type="hidden" value="1">
                <a href="javascript:;" onclick="pageJ(1)">首页</a>
                <a href="javascript:;" onclick="pageJ(${workerPageInfo.prePage})">上一页</a>
                <a href="javascript:;" onclick="pageJ(${workerPageInfo.nextPage})">下一页</a>
                <a href="javascript:;" onclick="pageJ(${workerPageInfo.pages})">尾页</a>
            </form>
        </div>

    </div>
</center>

</body>
</html>
