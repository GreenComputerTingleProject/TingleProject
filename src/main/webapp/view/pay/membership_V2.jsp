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
            <h5 class="card-title" style="font-size: 2em; font-weight: bold">멤버쉽 가입</h5>
            <br>
            <p class="card-text"><i class="fa-solid fa-check"></i>모든 곡 무제한 재생 가능</p>
            <p class="card-text"><i class="fa-solid fa-check"></i>1분 미리듣기 모드 제거</p>
            <p class="card-text"><i class="fa-solid fa-check"></i>게시판 이용 가능</p>
            <p class="card-text"><i class="fa-solid fa-check"></i>자작곡 업로드 가능</p>
            <p class="card-text" style="color: deeppink; font-size: 1.5em">월 5,900원</p>
            <button class="btn btn-primary" onclick="requestPay()">혜택 받기</button>
        </div>
        <a href="<c:url value="/"/>">돌아가기</a>
    </div>
</div>
</body>
<script !src="">
    s_UserData = JSON.parse('${sessionScope.userData}');

    function requestPay() {
        const IMP = window.IMP; // 생략 가능
        IMP.init("imp40704735"); // Example: imp00000000

        let cuid = 'tingle_' + new Date().getTime();

        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "kakaopay",
            pay_method: "card",
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: "Tingle 정기결제",
            amount: 100,
            customer_uid : cuid, // 필수 입력.
            buyer_email: s_UserData.email_address,
            buyer_name: s_UserData.name,
            buyer_tel: s_UserData.phone_number,
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
        }, function (rsp) { // callback
            console.log(rsp);
            let msg = '결제가 완료되었습니다.';
            if (rsp.success) {
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;

                location.href = "PayMembershipReg_V2?imp_uid="+rsp.imp_uid+"&paid_amount="+rsp.paid_amount+"&customer_uid="+cuid+"&msg="+msg+"&merchant_uid="+rsp.merchant_uid;
            } else {
                msg = '결제에 실패하였습니다.\n';
                msg += '에러내용 : ' + rsp.error_msg;

                alert(msg);

                location.href = "<c:url value="/"/>";
            }
        });
    }
</script>
</html>
