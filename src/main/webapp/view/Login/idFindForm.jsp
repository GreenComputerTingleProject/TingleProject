<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>IdFind</title>
    <script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
    <script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/bootstrap/"/>css/bootstrap.min.css">

    <script type="text/javascript" src="<c:url value="/bootstrap/"/>js/bootstrap.bundle.min.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Carter+One&family=Noto+Sans+KR:wght@100&display=swap');
        header {
            font-size: 30px;
        }

        div {
            display: block;
        }

        .sign-container {
            padding: 60px 120px;
            width: 680px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            margin: 30px auto 0 auto;
            background-color: #fff;
            border: 1px solid #d9d9d9;
        }

        input[type=text], [type=password] {
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

        .btn-info {
            margin-top: 25px;
            margin-bottom: 25px;
            width: 100%;
            height: 50px;
            background:  #9147ff;
            color: white;
            border: 1px solid #fff;
            color: white;
        }

        .btn-info:hover{
            background: #6f42c1;
            color: white;
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
        .btn-secondary{
            font-size: 12px;
        }
        .btn-light {
            margin: 5px;
            float: left;
        }
    </style>
</head>
<body>

<header id="headLogo" class="logo">
    <h4>Tingle</h4>
</header>
<div class="sign-container">
    <div class="logo">
        <h1>아이디 찾기</h1>
    </div>
    <form action="<c:url value="/user/UserIdFindReg"/>" method="post">
        <div class="form-name">
            <input type="text" id="name" name="name" placeholder="이름">
            <button type="button" class="btn-close" onclick="btnClose('name')"></button>
        </div>
        <div class="form-tel">
            <input type="text" id="tel" name="tel" placeholder="휴대폰 번호 (-제외)">
            <button type="button" class="btn-close" onclick="btnClose('tel')"></button>
            <button type="button" id="phoneCheck" class="btn btn-secondary">인증 받기</button>
            <br>
            <span id="phoneResult"></span>
            <div id="certi" style="display: none">
                <input type="text" id="certification" placeholder="인증 번호">
                <button type="button" class="btn-close" onclick="btnClose('certification')"></button>
                <button type="button" id="certificationBtn" class="btn btn-secondary">인증 확인</button>
                <br>
                <span id="phoneResult2"></span>
            </div>
        </div>
        <div>
            <input type="submit" class="btn btn-info" value="아이디 찾기"/>
        </div>
        <a href="<c:url value="/user/UserLogIn"/>" class="btn btn-secondary">돌아가기</a>
    </form>

    <div id="modal1" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>아이디 찾기 실패</h4>
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
<script>
    let phoneCheck = false;

    function btnClose(element) {
        $('#'+element).val('');

        if(element == 'tel') {
            $('#tel').attr("readonly", false);
            $('#phoneResult').text("");
            phoneCheck = false;
        }
    }

    $(function () {
        $('#phoneCheck').click(function () {
            if ($('#tel').val() != '') {

                let telCheck = /^[0-9]+$/;

                if (!telCheck.test($('#tel').val().trim())) {
                    $('#phoneResult').text("전화번호를 다시 입력하여 주세요.");
                    $('#phoneResult').css("color", "red");
                    return;
                }

                $.ajax({
                    type: 'GET',
                    url: '<c:url value="/user/UserPhoneCertification"/>',
                    data: 'phone_number=' + $('#tel').val(),
                    async: false,
                    dataType: 'json',
                    success: function (result) {
                        console.log(result.checknum);

                        $('#tel').attr("readonly", true);
                        $('#phoneResult').text("인증번호가 전송되었습니다.");
                        $('#phoneResult').css("color", "green");
                        $('#certi').css("display", "block");

                        $('#certificationBtn').click(function () {
                            if($('#certification').val().trim() == result.checknum){
                                $('#phoneResult2').text("인증이 완료되었습니다.");
                                $('#phoneResult2').css("color", "green");

                                phoneCheck = true;
                            } else {
                                $('#phoneResult2').text("인증 번호를 다시 입력해주세요.");
                                $('#phoneResult2').css("color", "red");
                            }
                        })
                    },
                    error: function (e) {
                        console.log(e);
                        $('#phoneResult').text("인증번호가 전송에 실패하였습니다.");
                        $('#phoneResult').css("color", "red");
                    }
                });

            } else {
                $('.modal-body').text('휴대폰 번호를 입력해 주세요');
                $('#modal1').modal('toggle');
            }
        });

        // form submit 했을때 유효성검사
        $('form').submit(function () {
            if($('#name').val().trim() == '') {
                $('.modal-body').text('양식을 모두 작성하여 주세요');
                $('#modal1').modal('toggle');
                return false;
            }

            if (!phoneCheck) {
                $('.modal-body').text('휴대폰 인증을 먼저 진행하여 주세요');
                $('#modal1').modal('toggle');
                return false;
            }
        })
    })
</script>
</html>
