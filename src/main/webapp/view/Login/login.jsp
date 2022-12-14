<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
    <script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/bootstrap/"/>css/bootstrap.min.css">
    <script type="text/javascript" src="<c:url value="/bootstrap/"/>js/bootstrap.bundle.min.js"></script>
    <style>
        header {
            font-size: 30px;
        }

        div {
            display: block;
        }

        .login-container {
            margin-top: 100px;
            padding: 60px 120px;
            width: 680px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            margin: 70px auto 0 auto;
            background-color: #fff;
            border: 1px solid #d9d9d9;
        }

        input[type=text], [type=password] {
            font-size: 16px;
            padding-right: 30px;
            border: 0;
            border-bottom: 1px solid #ebebeb;
            width: 100%;
            height: 58px;
            font-size: 15px;
            color: #181818;
            border-radius: 0;
            background-color: transparent;
            -webkit-border-radius: 0;
            vertical-align: middle;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .btn-info {
            margin-top: 25px;
            margin-bottom: 25px;
            width: 100%;
            height: 50px;
            background: darkorchid;
            border: 1px solid #fff;
            color: white;
        }

        .btn-info:hover{
            background: #6f42c1;
            color: white;
        }

        .logo {
            width: 100%;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-primary {
            margin: 5px;
            float: right;
        }

        .btn-success {
            margin: 5px;
            float: left;
        }
    </style>
</head>
<body>
<header class="logo">
    <h4>Tingle</h4>
</header>
<div class="login-container">
    <div class="logo">
        <h1>?????????</h1>
    </div>
    <form action="<c:url value="/user/UserLoginReg"/>" method="post">
        <input type="text" id="login_id" name="login_id" tabindex="0" placeholder="?????????" value="${login_id}">
        <input type="password" id="login_pw" name="login_pw" placeholder="????????????">
        <input type="submit" class="btn btn-info" value="?????????"/>
        <a href="<c:url value="/"/>" class="btn btn-success">?????????</a>
        <a href="<c:url value="/user/UserSignUp"/>" class="btn btn-success">?????? ??????</a>
        <a href="<c:url value="/user/UserPwReset"/>" class="btn btn-primary">???????????? ?????????</a>
        <a href="<c:url value="/user/UserIdFind"/>" class="btn btn-primary">????????? ??????</a>
    </form>
    <div id="modal1" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>????????? ??????</h4>
                    <button class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
