<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>PwReset</title>
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

        .sign-container {
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

        .btn-complete {
            margin-top: 25px;
            margin-bottom: 25px;
            width: 100%;
            height: 50px;
            background: darkorchid;
            border: 1px solid #fff;
        }

        .logo {
            width: 100%;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
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
<div class="sign-container">
    <div class="logo">
        <h1>비밀번호 재설정</h1>
    </div>
    <form action="<c:url value="/user/UserPwResetReg"/>" method="post">
        <div class="form-id">
            <input type="text" id="login_id" name="login_id" placeholder="아이디">
        </div>
        <div class="form-pw">
            <input type="password" id="login_pw" name="login_pw" placeholder="새로운 비밀번호">
        </div>
        <div class="form-pwCheck">
            <input type="password" id="pwCheck" placeholder="비밀번호 확인">
        </div>
        <div>
            <input type="submit" class="btn-complete" value="비밀번호 재설정"/>
        </div>
        <a href="<c:url value="/user/UserLogIn"/>" class="btn btn-success">돌아가기</a>
    </form>
    <div id="modal1" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>비밀번호 재설정 실패</h4>
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
<script !src="">
    $('form').submit(function () {
        let pwCheck = false;

        if($('#login_id').val() == '') {
            $('.modal-body').text('아이디를 입력 해 주세요.');
            $('#modal1').modal('toggle');
            return false;
        }

        if ($('#login_pw').val() != '' && $('#pwCheck').val() != '') {

            if ($('#login_pw').val() == $('#pwCheck').val()) {
                pwCheck = true;
            } else {
                $('.modal-body').text('패스워드가 일치하지 않습니다.');
                $('#modal1').modal('toggle');
                return false;
            }
        } else {
            $('.modal-body').text('비밀번호를 입력 해 주세요');
            $('#modal1').modal('toggle');
            return false;
        }

        if(!pwCheck) {
            return false;
        }
    })
</script>
</html>
