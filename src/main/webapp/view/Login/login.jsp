<%--
  Created by IntelliJ IDEA.
  User: moon
  Date: 2022-08-11
  Time: 오후 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="<c:url value="/bootstrap/"/>css/bootstrap.min.css">
    <script type="text/javascript" src="<c:url value="/bootstrap/"/>js/bootstrap.bundle.min.js"></script>
    <style>
        .login-form{
            width: 700px;
            height: 600px;
            border: 1px solid #aaa;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>
<body>
<form action="UserLoginCheckReg" method="post" class="login-form" >
    <input type="text" name="login_id" placeholder="아이디">
    <input type="password" name="login_pw" placeholder="비밀번호">
    <input type="submit" value="로그인">
    <a href="#">아이디 찾기</a>
    <a href="#">비밀번호 찾기</a>
</form>
</body>
</html>
