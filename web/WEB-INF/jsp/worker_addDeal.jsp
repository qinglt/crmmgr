<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/17
  Time: 16:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add</title>

    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <%--bootstrap--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

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

        function check_custom(){
            $.post(
                "${pageContext.request.contextPath}/worker/checkCustomId",
                {"dealCustom":$("#deal_custom").val()},
                function (data){
                    if (data.toString() === 'error'){
                        $("#tip_deal_custom").css("color", "red");
                        $("#tip_deal_custom").html("该客户信息不存在");
                    }else {
                        $("#tip_deal_custom").css("color", "");
                        $("#tip_deal_custom").html("");
                    }
                }
            )
        }

        function check_stock(){
            console.log("1111111111111111111");
            $.post(
                "${pageContext.request.contextPath}/worker/checkStockId",
                {"dealStock":$("#deal_stock").val()},
                function (data){
                    if (data.toString() === 'error'){
                        $("#tip_deal_stock").css("color", "red");
                        $("#tip_deal_stock").html("该货物信息不存在");
                    }else {
                        $("#tip_deal_stock").css("color", "");
                        $("#tip_deal_stock").html("");
                    }
                }
            )
        }

        function check_number(){
            $.post(
                "${pageContext.request.contextPath}/worker/checkStockNumber",
                {"dealStock":$("#deal_stock").val(),
                    "dealNumber":$("#deal_number").val()},
                function (data){
                    if (data.toString() === 'error'){
                        $("#tip_deal_stockNumber").css("color", "red");
                        $("#tip_deal_stockNumber").html("该货物存货不足");
                    }else {
                        $("#tip_deal_stockNumber").css("color", "");
                        $("#tip_deal_stockNumber").html("");
                    }
                }
            )
        }

        function backToDeal(){
            location.replace("${pageContext.request.contextPath}/worker/allDeal?pageNum=1")
        }

        function dealSub(){
            $.post(
                "${pageContext.request.contextPath}/worker/addDeal",
                $("#dealFrom").serializeArray(),
                function (data){
                    if (data.toString() === "ok"){
                        alert("添加成功");
                        location.reload();
                    }else {
                        alert("error");
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
                <small>添加订单</small>
            </h1>
        </div>

        <form id="dealFrom" onsubmit="return dealSub()">
            <div class="form-group">
                <%--<label>&emsp;订单编号：</label>--%>
                <input type="hidden" id="DId" name="dealId" class="srk" value="1" required>
                <%--<span id="tip_cId"></span>--%>
            </div>
            <div class="form-group">
                <label>&emsp;订单标题：</label>
                <input type="text" name="dealName" class="srk" required>
            </div>
            <div class="form-group">
                <label>&emsp;订单客户：</label>
                <input type="text" id="deal_custom" name="dealCustom" class="srk" onblur="check_custom()" required>
                <span id="tip_deal_custom"></span>
            </div>
            <div class="form-group">
                <label>&emsp;&emsp;收货人：</label>
                <input type="text" name="dealPeople" class="srk" required>
            </div>
            <div class="form-group">
                <label>&emsp;收货地址：</label>
                <input type="text" name="dealAddress" class="srk" required>
            </div>
            <div class="form-group">
                <label>收货人电话：</label>
                <input type="text" name="dealPhone" class="srk" required>
            </div>
            <div class="form-group">
                <input type="hidden" name="dealWorker" value="<%=session.getAttribute("username")%>" class="srk" required>
            </div>
            <div class="form-group">
                <label>&emsp;订购货物：</label>
                <input type="text" id="deal_stock" name="dealStock" onblur="check_stock()" class="srk" required>
                <span id="tip_deal_stock"></span>
            </div>
            <div class="form-group">
                <label>&emsp;订购数量：</label>
                <input type="text" id="deal_number" name="dealNumber" onblur="check_number()" class="srk" required>
                <span id="tip_deal_stockNumber"></span>
            </div>
            <div class="form-group">
                <label>&emsp;订单备注：</label>
                <input type="text" name="dealDetail" class="srk" required>
            </div>
            <div class="form-group">
                <%--<label>订单状态：</label>--%>
                <input type="hidden" name="dealState" value="未出库" required>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-outline-success" value="添加">
                <input type="button" value="返回" class="btn btn-outline-success" onclick="backToDeal()">
            </div>
        </form>
    </div>
</center>

</body>
</html>
