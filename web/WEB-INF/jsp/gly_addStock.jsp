<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/21
  Time: 9:21
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

        function backTo(){
            location.replace("${pageContext.request.contextPath}/gly/allStock?pageNum=1")
        }

        function formSubmit(){
            $.post(
                "${pageContext.request.contextPath}/gly/addStock",
                $("#formSub").serializeArray(),
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
                <small>添加货物</small>
            </h1>
        </div>

        <form id="formSub" onsubmit="return formSubmit()">
            <div class="form-group">
                <%--<label>库存编号：</label>--%>
                <input type="hidden" name="stockId" class="srk" value="1" required>
            </div>
            <div class="form-group">
                <label>计量单位：</label>
                <input type="text" name="stockUnit" class="srk" required>
            </div>
            <div class="form-group">
                <label>货物名称：</label>
                <input type="text" name="stockName" class="srk" required>
            </div>
            <div class="form-group">
                <label>货物价格：</label>
                <input type="text" name="stockPrice" class="srk" required>
            </div>
            <div class="form-group">
                <%--<label>已出货数量：</label>--%>
                <input type="hidden" name="stockOut" value="0" class="srk" required>
            </div>
            <div class="form-group">
                <label>库存余量：</label>
                <input type="text" name="stockLeft" class="srk" required>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-outline-success" value="添加">
                <input type="button" value="返回" class="btn btn-outline-success" onclick="backTo()">
            </div>
        </form>
    </div>
</center>

</body>
</html>
