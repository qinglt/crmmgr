<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/20
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>inform</title>
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

            <div style="float: right">
                <%--查询信息--%>
                <form class="form-inline" action="${pageContext.request.contextPath}/worker/allInform" method="post" >
                    <input type="text" name="informMsg" class="form-control" placeholder="通知的标题：">
                    <input type="hidden" name="pageNum" value="1">
                    <input type="submit" value="搜索" class="btn btn-primary">
                </form>
            </div>
        </div>

        <%--库存信息表--%>
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>通知编号</th>
                <th>通知标题</th>
                <th>通知内容</th>
                <th>发布通知的时间</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="inform" items="${informPageInfo.list}">
                <tr>
                    <td>${inform.informId}</td>
                    <td>${inform.informTitle}</td>
                    <td>${inform.informDetail}</td>
                    <td>${inform.informTime}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%--页面跳转--%>
        <div>
            <form id="pageJump" action="${pageContext.request.contextPath}/worker/allInform" method="post">
                <input type="hidden" name="informMsg" value="${informMsg}">
                <input id="pageNow" name="pageNum" type="hidden" value="1">
                <a href="javascript:;" onclick="pageJ(1)">首页</a>
                <a href="javascript:;" onclick="pageJ(${informPageInfo.prePage})">上一页</a>
                <a href="javascript:;" onclick="pageJ(${informPageInfo.nextPage})">下一页</a>
                <a href="javascript:;" onclick="pageJ(${informPageInfo.pages})">尾页</a>
            </form>
        </div>

    </div>
</center>

</body>
</html>
