<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>SignUp</title>
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
        <h1>????????????</h1>
    </div>
    <form action="<c:url value="/user/UserSignupReg"/>" method="post">
        <div class="form-id">
            <input type="text" id="login_id" name="login_id" tabindex="0" placeholder="?????????">
            <button type="button" class="btn-close" onclick="btnClose('login_id')"></button>
            <button type="button" id="idCheck" class="btn btn-primary">?????? ??????</button>
            <br>
            <span id="checkResult"></span>
        </div>
        <div class="form-pw">
            <input type="password" id="login_pw" name="login_pw" placeholder="????????????">
            <button type="button" class="btn-close" onclick="btnClose('login_pw')"></button>
        </div>
        <div class="form-pwCheck">
            <input type="password" id="pwCheck" placeholder="???????????? ??????">
            <button type="button" class="btn-close" onclick="btnClose('pwCheck')"></button>
        </div>
        <div class="form-name">
            <input type="text" id="name" name="name" placeholder="??????">
            <button type="button" class="btn-close" onclick="btnClose('name')"></button>
        </div>
        <div class="form-nickName">
            <input type="text" id="nickName" name="nickName" placeholder="?????????">
            <button type="button" class="btn-close" onclick="btnClose('nickName')"></button>
        </div>
        <div class="form-tel">
            <input type="text" id="tel" name="tel" placeholder="????????? ?????? (-??????)">
            <button type="button" class="btn-close" onclick="btnClose('tel')"></button>
            <button type="button" id="phoneCheck" class="btn btn-primary">?????? ??????</button>
            <br>
            <span id="phoneResult"></span>
            <div id="certi" style="display: none">
                <input type="text" id="certification" placeholder="?????? ??????">
                <button type="button" class="btn-close" onclick="btnClose('certification')"></button>
                <button type="button" id="certificationBtn" class="btn btn-primary">?????? ??????</button>
                <br>
                <span id="phoneResult2"></span>
            </div>
        </div>
        <div>
            <input type="submit" class="btn btn-info" value="????????????"/>
        </div>
        <a href="<c:url value="/user/UserLogIn"/>" class="btn btn-success">????????????</a>
    </form>

    <div id="modal1" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>???????????? ??????</h4>
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
<script>
    let idCheck = false;
    let pwCheck = false;
    let phoneCheck = false;

    function btnClose(element) {
        $('#'+element).val('');

        if(element == 'login_id') {
            $('#login_id').attr("readonly", false);
            $('#checkResult').text("");
            idCheck = false;
        }

        if(element == 'tel') {
            $('#tel').attr("readonly", false);
            $('#phoneResult').text("");
            phoneCheck = false;
        }
    }

    $(function () {
        // ????????? ????????????
        $('#idCheck').click(function () {

            if ($('#login_id').val().trim() != '') {

                let idPattern = /^[a-zA-Z][0-9a-zA-Z]{4,14}$/;

                if (!idPattern.test($('#login_id').val().trim())) {
                    $('#checkResult').text("???????????? ???????????? ????????? ???????????? 5~15??? ???????????? ?????????.");
                    $('#checkResult').css("color", "red");
                    return;
                }

                $.ajax({
                    type: 'GET',
                    url: '<c:url value="/user/UserSignupIdCheck"/>',
                    data: 'login_id=' + $('#login_id').val().trim(),
                    async: false,
                    dataType: 'json',
                    success: function (result) {
                        $('#login_id').attr("readonly", true);

                        if (result.check == true) {
                            $('#checkResult').text("?????? ????????? ????????? ?????????.");
                            $('#checkResult').css("color", "green");
                            idCheck = true;
                        } else {
                            $('#checkResult').text("????????? ????????? ?????????.");
                            $('#checkResult').css("color", "red");
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });

            } else {
                $('.modal-body').text('???????????? ????????? ?????????.');
                $('#modal1').modal('toggle');
            }
        });

        // ??? ?????? ???????????? // ?????? SmsSend_v2??? ?????? ?????? PASS??? ????????????
        // SMSSend_V3 ????????????... ("????????????" ?????? ???????????? ???????????? ????????????)
        $('#phoneCheck').click(function () {
            if ($('#tel').val().trim() != '') {
                let telCheck = /^[0-9]+$/;

                if (!telCheck.test($('#tel').val().trim())) {
                    $('#phoneResult').text("??????????????? ?????? ???????????? ?????????.");
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
                        $('#phoneResult').text("??????????????? ?????????????????????.");
                        $('#phoneResult').css("color", "green");
                        $('#certi').css("display", "block");

                        $('#certificationBtn').click(function () {
                            if($('#certification').val().trim() == result.checknum){
                                $('#phoneResult2').text("????????? ?????????????????????.");
                                $('#phoneResult2').css("color", "green");

                                phoneCheck = true;
                            } else {
                                $('#phoneResult2').text("?????? ????????? ?????? ??????????????????.");
                                $('#phoneResult2').css("color", "red");
                            }
                        })
                    },
                    error: function (e) {
                        console.log(e);
                        $('#phoneResult').text("??????????????? ????????? ?????????????????????.");
                        $('#phoneResult').css("color", "red");
                    }
                });

            } else {
                $('.modal-body').text('????????? ????????? ????????? ?????????');
                $('#modal1').modal('toggle');
            }
        });

        // form submit ????????? ???????????????
        $('form').submit(function () {
            if ($('#login_pw').val().trim() != '' && $('#pwCheck').val().trim() != '') {

                if ($('#login_pw').val().trim() == $('#pwCheck').val().trim()) {
                    pwCheck = true;
                } else {
                    $('.modal-body').text('??????????????? ???????????? ????????????.');
                    $('#modal1').modal('toggle');
                    return false;
                }
            } else {
                $('.modal-body').text('??????????????? ?????? ??? ?????????');
                $('#modal1').modal('toggle');
                return false;
            }

            console.log("idCheck:" + idCheck);
            console.log("pwCheck:" + pwCheck);
            console.log("phoneCheck:" + phoneCheck);

            if (!(idCheck && pwCheck && phoneCheck)) {
                $('.modal-body').text('????????? ?????? ???????????? ?????????');
                $('#modal1').modal('toggle');
                return false;
            }
        })
    })
</script>
</html>
