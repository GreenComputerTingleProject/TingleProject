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
        @import url('https://fonts.googleapis.com/css2?family=Carter+One&family=Noto+Sans+KR:wght@400&display=swap');

        div {
            display: block;
        }

        .login-container {
            padding: 50px 100px;
            width: 680px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            margin: 200px auto 0 auto;
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

        .btn-complete {
            margin-top: 25px;
            margin-bottom: 25px;
            width: 100%;
            height: 50px;
            color: white;
            background:  #9147ff;
            border: 1px solid #fff;
        }

        #headLogo {
            font-family: 'Carter One', cursive;
            color: #9147ff;
            font-size: 2.5em;
        }
        .logo{
            width: 100%;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;

        }

        .btn-light {
            margin: 5px;
            float: left;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div id="headLogo" class="logo ">
        <p>Tingle</p>
    </div>
    <form action="<c:url value="/user/UserLoginReg"/>" method="post">
        <input type="text" id="login_id" name="login_id" tabindex="0" placeholder="아이디" value="${login_id}">
        <input type="password" id="login_pw" name="login_pw" placeholder="비밀번호">
        <input type="submit" class="btn-complete" value="로그인"/>
        <a href="<c:url value="/"/>" class="btn btn-light">홈으로</a>
        <a href="<c:url value="/user/UserSignUp"/>" class="btn btn-light">회원 가입</a>
        <a href="<c:url value="/user/UserPwReset"/>" class="btn btn-light">비밀번호 재설정</a>
        <a href="<c:url value="/user/UserIdFind"/>" class="btn btn-light">아이디 찾기</a>
    </form>
    <div id="modal1" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>로그인 실패</h4>
                    <button class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
