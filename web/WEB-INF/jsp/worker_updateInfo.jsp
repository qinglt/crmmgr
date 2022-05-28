<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/17
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>userInfo</title>

    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" >
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script><script src="${pageContext.request.contextPath}/statics/js/jquery-3.6.0.js"></script>

    <style>
        .litter_kuang{
            width: 400px;
            height: 666px;
            position: relative;
        }
    </style>

    <script>
        function userInfo_ajax(){
            var formData = new FormData();
            formData.append("file",$("#photo")[0].files[0]);
            $.ajax({
                url:'${pageContext.request.contextPath}/upLoad',
                type:'POST',
                data:formData,
                contentType:false,
                processData:false,
                success:function (data){
                    $("#show_photo").attr("src","${pageContext.request.contextPath}/upload/"+data.toString());
                }
            })
            return false;
        }

        function userInfo_ajax2(){
            $.post(
                "${pageContext.request.contextPath}/worker/updateWorkerAddress",
                {"address":$("#address").val()},
                function (data){
                    alert("添加成功");
                    location.reload();
                }
            )
            return false;
        }

        function update_password(){
            if (confirm_password()){
                $.post(
                    "${pageContext.request.contextPath}/worker/updateWorkerPwd",
                    {"previous_password":$("#previous_password").val(),
                        "new_password":$("#new_password").val()},
                    function (data){
                        if (data.toString() === '原密码错误'){
                            alert("原密码错误");
                        }else {
                            alert("修改成功");
                            location.replace("${pageContext.request.contextPath}/toLogin");
                        }
                    }
                )
            }else {
                alert("两次密码不一致");
            }

            return false;
        }

        function confirm_password(){
            var pwd1 = $("#new_password").val();
            var pwd2 = $("#new_password2").val();

            if (pwd1 === pwd2 && pwd1 !== ""){
                $("#confirm_password_tip").css("color","green");
                $("#confirm_password_tip").html("ok");
                return "true";
            }else {
                $("#confirm_password_tip").css("color","red");
                $("#confirm_password_tip").html("error");
                return "false";
            }
        }

        function index(){
            window.history.back();
        }
    </script>
</head>

<body>

<center>
    <div class="litter_kuang">

        <div class="page-header">
            <h1>
                <small>update information</small>
            </h1>
        </div>

        <form onsubmit="return userInfo_ajax()" style="position: absolute;left: 116px;top: 76px">
            <label>头像：</label>
            <img src="${pageContext.request.contextPath}/upload/<%=session.getAttribute("workerHand")%>" id="show_photo" width="60px" height="60px">

            <input type='button' class='btn btn-outline-success' value='修改' onclick="document.getElementById('photo').click()">
            <input type="file" id="photo" size="28" onchange="document.getElementById('photo_sub').click()" style="filter:alpha(opacity:0);opacity: 0;width:0px">

            <input type="submit" id="photo_sub" class="btn btn-outline-success">
        </form>


        <form onsubmit="return userInfo_ajax2()">
            <label style="position: absolute;left: 0px;top: 166px">地址：</label>
            <input type="text" class="form-control" id="address" maxlength="50" style="width: 300px; position: absolute;left: 40px;top: 160px" required>
            <input type="submit" class="btn btn-outline-success" value="提交" style="position: absolute;right: 0px;top: 160px">
        </form>

        <div>
            <button class="btn btn-outline-success collapsed" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"  style="position: absolute;left: 155px;top: 210px">
                修改密码
            </button>
            <!-- collapse折叠框 -->
            <div class="collapse" id="collapseExample" aria-expanded="false" style="height: 0px;position: absolute;top: 245px">
                <div class="well" style="width: 400px;height: 170px;position: relative">
                    <form onsubmit="return update_password()">
                        <label style="position: absolute;left: 65px;top: 15px">原密码：</label>
                        <input type="password" class="form-control" id="previous_password" minlength="8" maxlength="20" style="width: 200px; position: absolute;left: 123px;top: 10px" required>
                        <label style="position: absolute;left: 65px;top: 55px">新密码：</label>
                        <input type="password" class="form-control" id="new_password" minlength="8" maxlength="20" style="width: 200px; position: absolute;left: 123px;top: 50px" required>
                        <label style="position: absolute;left: 38px;top: 95px">确认新密码：</label>
                        <input type="password" class="form-control" id="new_password2" minlength="8" maxlength="50" onblur="confirm_password()" style="width: 200px; position: absolute;left: 123px;top: 90px" required>
                        <span id="confirm_password_tip" style="position: absolute;left: 328px;top: 96px"></span>
                        <input type="submit" class="btn btn-outline-success" value="提交" style="position: absolute;right: 175px;top: 130px">
                    </form>
                </div>
            </div>
        </div>

        <button type="button" class="btn btn-default" onclick="index()" style="position: absolute;top: 432px;left: 170px">返回</button>

    </div>
</center>

</body>
</html>
