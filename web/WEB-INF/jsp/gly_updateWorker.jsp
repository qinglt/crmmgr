<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/21
  Time: 8:40
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
            location.replace("${pageContext.request.contextPath}/gly/allWorker?workerMsg="+msg+"&pageNum="+pageN)
        }

        function formSubmit(msg,pageN){
            $.post(
                "${pageContext.request.contextPath}/gly/updateWorker",
                $("#formSub").serializeArray(),
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
                <small>修改员工信息</small>
            </h1>
        </div>

        <form id="formSub" onsubmit="return formSubmit('${workerMsg}','${pageNum}')">
            <div class="form-group">
                <input type="hidden" name="customId" value="${worker.workerId}" required>
            </div>
            <div class="form-group">
                <label>员工姓名：</label>
                <input type="text" name="customName" class="srk" value="${worker.workerName}" required>
            </div>
            <div class="form-group">
                <label>员工密码：</label>
                <input type="text" name="customFrom" class="srk" value="${worker.workerPwd}" required>
            </div>
            <div class="form-group">
                <label>员工职位：</label>
                <input type="text" name="customWork" class="srk" value="${worker.workerPost}" required>
            </div>
            <div class="form-group">
                <label>员工电话：</label>
                <input type="text" name="customLevel" class="srk" value="${worker.workerPhone}" required>
            </div>
            <div class="form-group">
                <label>员工地址：</label>
                <input type="text" name="customTel" class="srk" value="${worker.workerAddress}" required>
            </div>
            <div class="form-group">
                <%--<label>员工头像：</label>--%>
                <input type="hidden" name="customPhone" class="srk" value="${worker.workerHand}" required>
            </div>

            <div class="form-group">
                <input type="submit" class="btn btn-outline-success" value="添加">
                <input type="button" value="返回" class="btn btn-outline-success" onclick="backToCustom('${workerMsg}','${pageNum}')">
            </div>
        </form>
    </div>
</center>

</body>
</html>
