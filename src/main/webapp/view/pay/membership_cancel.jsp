<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
    <script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/bootstrap/"/>css/bootstrap.min.css">
    <script type="text/javascript" src="<c:url value="/bootstrap/"/>js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<div align="center" style="height: 100%; display: flex; align-items: center; justify-content: center;">
    <div class="card" style="width: 28rem; margin-bottom: 200px">
        <div class="card-body">
            <h5 class="card-title" style="font-size: 2em; font-weight: bold">멤버쉽 해지</h5>
            <br>
            <p class="card-text"><i class="fa-solid fa-check"></i>모든 곡 무제한 재생 가능</p>
            <p class="card-text"><i class="fa-solid fa-check"></i>1분 미리듣기 모드 제거</p>
            <p class="card-text"><i class="fa-solid fa-check"></i>게시판 이용 가능</p>
            <p class="card-text"><i class="fa-solid fa-check"></i>자작곡 업로드 가능</p>
            <p class="card-text" style="color: deeppink; font-size: 1.5em">위의 혜택들을 포기하시겠습니까?</p>
            <button class="btn btn-primary" onclick="requestCancel()">혜택 포기</button>
        </div>
        <a href="<c:url value="/"/>">돌아가기</a>
    </div>
</div>
</body>
<script !src="">
    s_UserData = JSON.parse('${sessionScope.userData}');

    function requestCancel() {
        location.href = "PayMembershipCancelReg";
    }
</script>
</html>
