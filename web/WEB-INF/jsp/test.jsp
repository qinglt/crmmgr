<%--
  Created by IntelliJ IDEA.
  User: 竹秋廿四
  Date: 2021/12/16
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
</head>
<body>

<form action="${pageContext.request.contextPath}/test02" method="post">
    用户名：<input type="text" name="username">
    <input type="submit" value="提交">
</form>

</body>
</html>
