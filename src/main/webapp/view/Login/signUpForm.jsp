<%--
  Created by IntelliJ IDEA.
  User: moon
  Date: 2022-08-11
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>signUp</title>
    <script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
    <script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>
    <link href="<c:url value="/bootstrap/"/>css/bootstrap.min.css">
    <script src="<c:url value="/bootstrap/"/>js/bootstrap.bundle.min.js"></script>


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
            border: 1px solid gray;
        }

        input[type=text] {

            font-size: 16px;
            padding-right: 30px;
            border: 0;
            border-bottom: 1px solid #ebebeb;
            width: 70%;
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


    </style>

</head>

<body>
<header class="logo">
    <h4>Tingle</h4>
</header>


<div class="sign-container">
    <div class="logo">
        <h1>회원가입</h1>
    </div>
    <form action="UserSignupReg" method="post">
        <div class="form-id">
            <input type="text" id="login_id" name="login_id" tabindex="0" placeholder="아이디">
            <button type="button" class="btn-close"></button>
            <button type="button" id="idcheck" class="idcheck" >중복확인</button>
            <span id="checkresult"></span>
        </div>
        <div class="form-pw">
            <input type="text" id="login_pw" name="login_pw" placeholder="비밀번호">
        </div>
        <div class="form-pwcheck">
            <input type="text" id="pwcheck" name="pwcheck" placeholder="비밀번호 확인">
        </div>
        <div class="form-name">
            <input type="text" id="name" name="name" placeholder="이름">
        </div>
        <div class="form-phone_number">
            <input type="text" id="phone_number" name="phone_number" placeholder="휴대폰번호 (-제외)">
            <button type="button" id="phone_number_send">인증번호 전송</button>
            <input id="checknum" type="hidden" >
        </div>
        <div>
            <input type="submit" class="btn-complete" value="가입완료"/>
        </div>
    </form>

</div>
<script>
    var id = document.getElementById("login_id");
    var pw = document.getElementById("login_pw");
    var pwcheck = document.getElementById("pwcheck");
    var idcheck = document.getElementById("idcheck")

//중복확인
    $(function () {
        $('#idcheck').click(function () {

            if ($('#login_id').val() != '') {

                // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
                $.ajax({
                    type: 'GET',
                    url:'<c:url value="/user/UserSignupIdCheck"/>',
                    data: 'login_id=' + $('#login_id').val(),
                    async: false,
                    dataType: 'json',
                    success: function(result) {
                        console.log(result)
                        $('#checkresult').text(decodeURI(result.msg));
                    },
                    error: function(e) {
                        console.log(e);
                    }

                });

            } else {
                alert('아이디를 입력하세요.');
                $('#login_id').focus();
            }
        });

// 휴대폰 인증
        $('#phone_number_send').click(function () {
            var  phoneNumber = $('#phone_number').val();
            alert('인증번호 발송완료');
            $("#phone_number").attr("disabled",true);
            $("#checknum").attr("type","tel");
            $('#checknum').focus();
            $.ajax({
                type:'GET',
                url:'<c:url value="/user/UserPhoneCertification"/>',
                data: 'phone_number=' + $('#phone_number').val(),
                async: false,
                dataType: 'json',
                success: function(result) {
                    console.log(result)
         /*           $('#phone_number_result').text(decodeURI(result.msg));*/
                },
                error: function(e) {
                    console.log(e);
                }

            });
            })





    });











</script>
</body>
</html>
