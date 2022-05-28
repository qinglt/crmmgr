<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/17
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update</title>

    <%--bootstrap--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>

    <style>
        .kuang{
            width: 666px;
        }
        .srk{
            width: 400px;
            border: 1px solid grey;
            border-radius: 5px;
            height: 30px;
        }
        input:focus{
            outline: none;
            border: 1px solid #03a9f4;
            box-shadow: 0 0 15px #03a9f4;
        }
    </style>

    <script>

        function backToDeal(msg,pageN){
            location.replace("${pageContext.request.contextPath}/worker/allDeal?dealMsg="+msg+"&pageNum="+pageN)
            /*window.history.back();*/
        }

        function formSubmit(msg,pageN){
            $.post(
                "${pageContext.request.contextPath}/worker/updateDeal",
                $("#dealForm").serializeArray(),
                function (data){
                    if (data.toString()==="ok"){
                        alert("ok");
                        backToDeal(msg, pageN);
                    }else {
                        alert("error")
                    }
                }
            )
            return false;
        }

    </script>
</head>
<body>

<center>
    <div class="kuang">
        <div class="page-header">
            <h1>
                <small>修改订单信息</small>
            </h1>
        </div>

        <form id="dealForm" onsubmit="return formSubmit('${dealMsg}','${pageNum}')">
            <div class="form-group">
                <input type="hidden" name="dealId" value="${deal.dealId}" required>
            </div>
            <div class="form-group">
                <label>订单标题：</label>
                <input type="text" name="dealName" class="srk" value="${deal.dealName}" required>
            </div>
            <div class="form-group">
                <%--<label>订单客户：</label>--%>
                <input type="hidden" name="dealCustom" class="srk" value="${deal.dealCustom}" required>
            </div>
            <div class="form-group">
                <label>收货人：</label>
                <input type="text" name="dealPeople" class="srk" value="${deal.dealPeople}" required>
            </div>
            <div class="form-group">
                <label>收货地址：</label>
                <input type="text" name="dealAddress" class="srk" value="${deal.dealAddress}" required>
            </div>
            <div class="form-group">
                <label>收货人电话：</label>
                <input type="text" name="dealPhone" class="srk" value="${deal.dealPhone}" required>
            </div>
            <div class="form-group">
                <%--<label>下单时间：</label>--%>
                <input type="hidden" name="dealTime" value="${deal.dealTime}" required>
                <%--处理订单的员工--%>
                <input type="hidden" name="dealWorker" value="<%=session.getAttribute("username")%>" required>
            </div>
            <div class="form-group">
                <%--<label>订购货物：</label>--%>
                <input type="hidden" name="dealStock" class="srk" value="${deal.dealStock}" required>
            </div>
            <div class="form-group">
                <%--<label>订购数量：</label>--%>
                <input type="hidden" name="dealNumber" class="srk" value="${deal.dealNumber}" required>
            </div>
            <div class="form-group">
                <label>订单备注：</label>
                <input type="text" name="dealDetail" class="srk" value="${deal.dealDetail}" required>
            </div>
            <div class="form-group">
                <label>订单状态：</label>
                <input type="text" name="dealState" class="srk" value="${deal.dealState}" required>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-outline-success" value="添加">
                <input type="button" value="返回" class="btn btn-outline-success" onclick="backToDeal('${dealMsg}','${pageNum}')">
            </div>
        </form>
    </div>
</center>

</body>
</html>
