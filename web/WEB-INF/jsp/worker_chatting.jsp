<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/20
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="refresh" content="60">
    <title>stock</title>
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
            width: 1200px;
            height: 550px;
            border: 1px solid grey;
            border-radius: 5px;
            position: absolute;
            top: 110px;
            left: 230px;
            overflow: auto;
        }
        .left_hand_son{
            margin: 5px;
            padding: 5px;
            width: 190px;
            height: 30px;
        }

    </style>

    <script>

        function worker_addMsg(){
            $.post(
                "${pageContext.request.contextPath}/worker/addMsg",
                $("#msg_form").serialize(),
                function (data){
                    if (data.toString() === 'ok'){
                        location.reload();
                    }else {
                        alert("error");
                    }
                }
            )
            return false
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

<form id="msg_form" onsubmit="return worker_addMsg()">
    <div class="input-group" style="width: 1200px;position: absolute;top: 63px;left: 230px">
        <input type="text" name="msgDetail" class="form-control" placeholder="聊天内容" aria-describedby="button-addon2" required>
        <div class="input-group-append">
            <button class="btn btn-outline-secondary" type="submit">发送</button>
        </div>
    </div>
</form>
<div class="body_index">
    <c:forEach var="msgList" items="${massageList}">
        <div style="width: 1100px;height: 30px;margin:10px;float: left">
            <span style="font-size: 5px">${msgList.msgTime}&emsp;|&emsp;</span>
            <span>${msgList.msgWorker}：</span>
            <span style="border: 1px solid black;border-radius: 5px">&emsp;${msgList.msgDetail}&emsp;</span>
        </div>
    </c:forEach>
</div>

</body>
</html>

