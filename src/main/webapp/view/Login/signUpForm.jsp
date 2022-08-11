<%--
  Created by IntelliJ IDEA.
  User: moon
  Date: 2022-08-11
  Time: 오후 2:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>signUp</title>
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css">
    <script src="../../bootstrap/js/bootstrap.bundle.min.js"></script>
    <style>
        header{
            font-size: 30px;
        }
        div{
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
        input[type=text]{

            font-size: 16px;
            padding-right: 30px;
            border: 0;
            border-bottom: 1px solid #ebebeb;
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
        .btn-complete{
            width: 100%;
            height: 50px;
            background: darkorchid;
            border: 1px solid #fff;
        }
        #pw-first, #pw-chk{
            width: 100%;
        }
        .form-birth{
            display: flex;
            justify-content: center;
        }
        .logo{
            width: 100%;
            height: 100px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .form-id{
            display: flex;
            align-items: center;
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

    <form action="UserSignup" method="post">
    <div class="form-id">
        <input type="text" id="emailId" name="emailId" tabindex="0" placeholder="아이디(이메일)">
        <button type="button" class="btn-close" aria-label="Close"></button>
        </input>
            <span>@</span>
        <select name="emailUrl" id="emailUrl">
            <option value=""> 선택 </option>
            <option value="naver">naver.com</option>
            <option value="hanmail.net"> hanmail.net </option>
            <option value="daum.net"> daum.net </option>
            <option value="nate.com"> nate.com </option>
            <option value="gmail.com"> gmail.com </option>
            <option value="hotmail.com"> hotmail.com </option>
            <option value="cyworld.com"> cyworld.com </option>
            <option value="yahoo.co.kr"> yahoo.co.kr </option>
            <option value="paran.com"> paran.com </option>
            <option value="dreamwiz.com"> dreamwiz.com </option>
            <option value="직접입력"> 직접입력 </option>
        </select>
    </div>
    <div class="form-pw">
        <input type="text" id="pw-first" name="pw-first" placeholder="비밀번호">
    </div>
    <div class="form-pw-chk">
        <input type="text" id="pw-second" name="pw-chk" placeholder="비밀번호 확인">
    </div>
    <div class="form-birth">
        <input type="text" id="birth-first" name="birth-first" placeholder="생년월일">
        <span>-</span>
        <input type="text" id="birth-second" name="birth-second" placeholder="******">
    </div>
    <div>
        <input type="submit" class="btn-complete" value="가입완료"/>
    </div>
    </form>

</div>

</body>
</html>
