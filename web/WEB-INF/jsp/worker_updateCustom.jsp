<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/16
  Time: 16:20
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

        function backToCustom(msg,pageN){
            location.replace("${pageContext.request.contextPath}/worker/custom?customMsg="+msg+"&pageNum="+pageN)
        }

        function formSubmit(msg,pageN){
            $.post(
                "${pageContext.request.contextPath}/worker/updateCustom",
                $("#customForm").serializeArray(),
                function (data){
                    if (data.toString()==="ok"){
                        alert("ok");
                        backToCustom(msg,pageN);
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
                <small>修改客户信息</small>
            </h1>
        </div>

        <form id="customForm" onsubmit="return formSubmit('${customMsg}','${pageNum}')">
            <div class="form-group">
                <input type="hidden" name="customId" value="${custom.customId}" required>
            </div>
            <div class="form-group">
                <label>客户姓名：</label>
                <input type="text" name="customName" class="srk" value="${custom.customName}" required>
            </div>
            <div class="form-group">
                <label>客户来源：</label>
                <input type="text" name="customFrom" class="srk" value="${custom.customFrom}" required>
            </div>
            <div class="form-group">
                <label>工作行业：</label>
                <input type="text" name="customWork" class="srk" value="${custom.customWork}" required>
            </div>
            <div class="form-group">
                <label>客户等级：</label>
                <input type="text" name="customLevel" class="srk" value="${custom.customLevel}" required>
            </div>
            <div class="form-group">
                <label>联系方式：</label>
                <input type="text" name="customTel" class="srk" value="${custom.customTel}" required>
            </div>
            <div class="form-group">
                <label>固定电话：</label>
                <input type="text" name="customPhone" class="srk" value="${custom.customPhone}" required>
            </div>
            <div class="form-group">
                <label>客户编码：</label>
                <input type="text" name="customCode" class="srk" value="${custom.customCode}" required>
            </div>
            <div class="form-group">
                <label>家庭住址：</label>
                <input type="text" name="customAddress" class="srk" value="${custom.customAddress}" required>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-outline-success" value="添加">
                <input type="button" value="返回" class="btn btn-outline-success" onclick="backToCustom('${customMsg}','${pageNum}')">
            </div>
        </form>
    </div>
</center>

</body>
</html>
