<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/11/11
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.js"></script>
    <%--<script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>

<script type="text/javascript">

    function getCode(){
        $("#CreateCheckCode").attr('src',"getCode?nocache=" + new Date().getTime());
    }

    function ajax1(){
        $.post(
            "${pageContext.request.contextPath}/login",
            {"password":$("#password").val(),
                "username":$("#username").val(),
                "userCode":$("#identify_code").val()},
            function (data){
                if (data.toString()==="workers"){
                    location.replace("${pageContext.request.contextPath}/worker/index")
                }else if (data.toString()==="gly"){
                    location.replace("${pageContext.request.contextPath}/gly/index")
                }else if (data.toString()==="errorCode"){
                    alert("验证码错误");
                    location.reload();
                }else if (data.toString()==="errorNum"){
                    alert("密码已经连续输错3次")
                } else {
                    alert("用户名或者密码错误");
                    location.reload();
                }
            }
        )
        return false;
    }

</script>

<body>

    <div style="height: 220px;width: auto"></div>

    <center>
        <div style="width: 365px;height: 200px;position: relative">
            <form onsubmit="return ajax1()">

                <input type="hidden" id="error_num" value="0">

                <div style="height: 60px;width: 365px;position: absolute;top: 0px">
                    <label for="username" style="float: left">Username</label>
                    <input type="text" class="form-control" id="username" required>
                    <small id="emailHelp" class="form-text text-muted" style="float: left">We'll never share your information with anyone else.</small>
                </div>
                <div style="height: 60px;width: 365px;position: absolute;top: 80px">
                    <label for="password" style="float: left">Password</label>
                    <input type="password" class="form-control" id="password" minlength="6" required>
                </div>
                <div style="height: 60px;width: 365px;position: absolute;top: 145px">
                    <label for="identify_code" style="float: left">Identify code</label>
                    <input type="text" class="form-control" id="identify_code" style="width: 260px;position: absolute;top: 22px;left: 0px" required>
                    <img src="${pageContext.request.contextPath}/getCode" id="CreateCheckCode" title="点击刷新验证码" onclick="getCode()" style="position: absolute;top: 24px;right: 0px">
                </div>
                <input type="submit" class="btn btn-primary" value="submit" style="position: absolute;top: 210px;left: 0px">
            </form>
            <%--<button type="button" class="btn btn-outline-success" onclick="a2()" style="position: absolute;top: 210px;right: 220px">register</button>--%>
        </div>
    </center>

</body>
</html>
