<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-13
  Time: 오전 1:41
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>

<style>
    *{
        margin: 0px;
        padding: 0px;
    }

    #adminUrl {
        width: 100%;
        height: 85%;
        background: #f0f0f0;
        justify-content: center;
    }

    #annual_revenue {
        width: 80%;
        height: 30vh;
        margin: auto;
        background: #f0f0f0;
        border: 1px #1a1e21 solid;
    }

    #monthly_revenue {
        width: 80%;
        height: 30vh;
        margin: auto;
        background: #f0f0f0;
        border: 1px #1a1e21 solid;
        display: flex;

    }

    .index {
        width: 40vh;
        height: 25vh;
        background: #0dcaf0;
    }



</style>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id = adminUrl>

    <div id="annual_revenue">
        <h2>2022년 수익 내역</h2>
        <table>
            <tr>
                <td>
                    <div class="index"><h2>총 판매금액</h2></div>

                </td>
                <td>
                    <div class="index"><h2>취소완료 금액</h2></div>

                </td>
                <td>
                    <div class="index"><h2>거래보류 금액</h2></div>

                </td>
                <td>
                    <div class="index"><h2>총 수익</h2></div>

                </td>
            </tr>
        </table>
    </div>


    <div id="monthly_revenue">
        <form action="AdminCalculateReg" method="post">
        <table border="">
            <tr >
                <td>조회기준</td>
                <td></td>
            </tr>

            <tr>
                <td>조회기간</td>
                <td><input type="date" name="startday" id="startday"/>
                <input type="date" name="endday" id="endday"/></td>
            </tr>
            <c:set var="period_income" value="${period_income}"/>
            <c:if test="${period_income != null}">
                <tr>
                <td>기간별 수익</td>
                    <td>${period_income}원</td>
                </tr>
            </c:if>

            <tr>
                <td colspan="2">
                <input type="submit" value="검색">
                <input type="button" value="초기화" id ="initialization">
                </td>
            </tr>

        </table>
    </form>
</div>
</div>



<script>
    $(function () {

        $('#initialization').click(function (){
            console.log("초기화버튼 눌렸어");
            $('#startday').val(null)
            $('#endday').val(null);
        })
    })



</script>

