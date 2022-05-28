<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/15
  Time: 14:36
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
        /*function cId(){
            $.post(
                "/worker/checkCId",
                {"customId": $("#CId").val()},
                function (data){
                    if (data.toString() === "error"){
                        $("#tip_cId").css("color", "red");
                        $("#tip_cId").html("该id已存在");
                    }else {
                        $("#tip_cId").css("color", "");
                        $("#tip_cId").html("");
                    }
                }
            )
        }*/

        function backToCustom(){
            location.replace("${pageContext.request.contextPath}/worker/custom?pageNum=1")
        }

        function customSub(){
            $.post(
                "${pageContext.request.contextPath}/worker/addCustom",
                $("#customFrom").serializeArray(),
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
                <small>添加客户</small>
            </h1>
        </div>

        <form id="customFrom" onsubmit="return customSub()">
            <div class="form-group">
                <%--<label>客户编号：</label>--%>
                <input type="hidden" id="CId" name="customId" class="srk" value="1" required>
                <%--<span id="tip_cId"></span>--%>
            </div>
            <div class="form-group">
                <label>客户姓名：</label>
                <input type="text" name="customName" class="srk" required>
            </div>
            <div class="form-group">
                <label>客户来源：</label>
                <input type="text" name="customFrom" class="srk" required>
            </div>
            <div class="form-group">
                <label>工作行业：</label>
                <input type="text" name="customWork" class="srk" required>
            </div>
            <div class="form-group">
                <label>客户等级：</label>
                <input type="text" name="customLevel" class="srk" required>
            </div>
            <div class="form-group">
                <label>联系方式：</label>
                <input type="text" name="customTel" class="srk" required>
            </div>
            <div class="form-group">
                <label>固定电话：</label>
                <input type="text" name="customPhone" class="srk" required>
            </div>
            <div class="form-group">
                <label>客户编码：</label>
                <input type="text" name="customCode" class="srk" required>
            </div>
            <div class="form-group">
                <label>家庭住址：</label>
                <input type="text" name="customAddress" class="srk" required>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-outline-success" value="添加">
                <input type="button" value="返回" class="btn btn-outline-success" onclick="backToCustom()">
            </div>
        </form>
    </div>
</center>

</body>
</html>
