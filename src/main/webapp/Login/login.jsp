<%--
  Created by IntelliJ IDEA.
  User: moon
  Date: 2022-08-11
  Time: 오후 1:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <script src="../bootstrap/css/bootstrap.min.css"></script>
    <script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
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


<form action="" method="post" class="login-form" >
    <div class="input-box">
        <input id="username" type="text" name="username" placeholder="아이디">
        <label for="username">아이디</label>
    </div>

    <div class="input-box">
        <input id="password" type="password" name="password" placeholder="비밀번호">
        <label for="password">비밀번호</label>
    </div>
    <div id="forgot">비밀번호 찾기</div>
    <input type="submit" value="로그인">

</form>


</body>
</html>
