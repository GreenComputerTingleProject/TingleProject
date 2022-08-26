<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-13
  Time: 오전 1:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>
<style>
    * {
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

    #btnArea {
        width: 80%;
        margin: auto;
    }

    #monthly_revenue {
        width: 80%;
        margin: auto;
        background: #f0f0f0;
        border: 1px #1a1e21 solid;
        display: flex;
    }

    #dAdjust_revenue {
        width: 80%;
        margin: auto;
        background: #f0f0f0;
        border: 1px #1a1e21 solid;
        display: none;
    }

    #daily_revenue {
        width: 80%;
        margin: auto;
        background: #f0f0f0;
        border: 1px #1a1e21 solid;
        display: none;
    }

    #period_revenue {
        width: 80%;
        margin: auto;
        background: #f0f0f0;
        border: 1px #1a1e21 solid;
        /*display: flex;*/
        display: none;
    }

    .index {
        width: 35vh;
        height: 25vh;
        background: #0dcaf0;
    }

    ul {
        list-style: none;
        padding-left: 0px;
    }

    #btnArea > button {
        width: 200px;
        height: 100px;
        font-size: 1.5em;
    }
</style>
<div id=adminUrl>
    <div id="annual_revenue">
        <h2>정산</h2>
        <table>
            <tr>
                <td>
                    <div class="index">
                        <h2>총 수익</h2>
                        <span>${total_amount}원</span>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div id="btnArea">
        <button id="monthly">월간 정산</button>
        <button id="dAdjust">일간 정산</button>
        <button id="daily">일별 내역</button>
        <button id="period">기간별 내역</button>
    </div>
    <div id="monthly_revenue">
        <table border="">
            <tr>
                <td>월별</td>
                <td>매출액</td>
            </tr>
            <c:forEach items="${monthly_amount}" var="monthly_amount" varStatus="i">
                <tr>
                    <td>${monthly_amount.key}월</td>
                    <td>${monthly_amount.value}원</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div id="dAdjust_revenue">
        <form action="AdminCalculateDAdjustReg" method="get">
            <table border="">
                <tr>
                    <td>조회월</td>
                    <td>
                        <input type="month" name="month" id="dAdjustInput"/>
                    </td>
                </tr>
                <c:forEach items="${daily_adjust}" var="daily_adjust" varStatus="i">
                    <tr>
                        <td>${daily_adjust.key}</td>
                        <td>${daily_adjust.value}원</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="검색">
                        <input type="button" value="초기화" id="dAdjust_init">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="daily_revenue">
        <form action="AdminCalculateDailyReg" method="get">
            <table border="">
                <tr>
                    <td>조회월</td>
                    <td>
                        <input type="month" name="month" id="month"/>
                    </td>
                </tr>
                <c:if test="${daily_amount != null}">
                    <c:forEach items="${daily_amount}" var="daily_amount" varStatus="i">
                        <tr>
                            <td>${daily_amount.key}일</td>
                            <c:forEach items="${daily_amount.value}" var="value" varStatus="j">
                                <td scope="row">
                                    <ul>
                                        <li>유저번호 : <a href="AdminUserDetail?id=${value.user_id}">${value.user_id}</a></li>
                                        <li>주문번호 : ${value.imp_uid}</li>
                                        <li>결제금액 : ${value.paid_amount}원</li>
                                        <li>결제일자 : ${value.reg_date}</li>
                                    </ul>
                                </td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </c:if>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="검색">
                        <input type="button" value="초기화" id="daily_init">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div id="period_revenue">
        <form action="AdminCalculatePeriodReg" method="get">
            <table border="">
                <tr>
                    <td>조회기간</td>
                    <td>
                        <input type="date" name="startday" id="startday"/>
                        <input type="date" name="endday" id="endday"/>
                    </td>
                </tr>
                <c:if test="${period_income != null}">
                    <tr>
                        <td>검색 기간</td>
                        <td>${sDay}부터 ${eDay}까지</td>
                    </tr>
                    <tr>
                        <td>기간 수익</td>
                        <td>${period_income}원</td>
                    </tr>
                    <c:forEach items="${calculate_pay}" var="calculate_pay" varStatus="i">
                        <tr>
                            <td colspan="2">
                                <ul>
                                    <li>유저번호 : <a href="AdminUserDetail?id=${calculate_pay.user_id}">${calculate_pay.user_id}</a></li>
                                    <li>주문번호 : ${calculate_pay.imp_uid}</li>
                                    <li>결제금액 : ${calculate_pay.paid_amount}원</li>
                                    <li>결제일자 : ${calculate_pay.reg_date}</li>
                                </ul>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="검색">
                        <input type="button" value="초기화" id="period_init">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script>
    $(function () {

        if(${result == 1}) {
            $('#monthly_revenue').css('display', 'none');
            $('#dAdjust_revenue').css('display', 'none');
            $('#daily_revenue').css('display', 'flex');
            $('#period_revenue').css('display', 'none');
        } else if(${result == 2}){
            $('#monthly_revenue').css('display', 'none');
            $('#dAdjust_revenue').css('display', 'none');
            $('#daily_revenue').css('display', 'none');
            $('#period_revenue').css('display', 'flex');
        } else if(${result == 3}){
            $('#monthly_revenue').css('display', 'none');
            $('#dAdjust_revenue').css('display', 'flex');
            $('#daily_revenue').css('display', 'none');
            $('#period_revenue').css('display', 'none');
        }

        $('#period_init').click(function () {
            $('#startday').val(null);
            $('#endday').val(null);
        })

        $('#daily_init').click(function () {
            $('#month').val(null);
        })

        $('#dAdjust_init').click(function () {
            $('#dAdjustInput').val(null);
        })

        $('#monthly').click(function () {
            $('#monthly_revenue').css('display', 'flex');
            $('#dAdjust_revenue').css('display', 'none');
            $('#daily_revenue').css('display', 'none');
            $('#period_revenue').css('display', 'none');
        })

        $('#dAdjust').click(function () {
            $('#monthly_revenue').css('display', 'none');
            $('#dAdjust_revenue').css('display', 'flex');
            $('#daily_revenue').css('display', 'none');
            $('#period_revenue').css('display', 'none');
        })

        $('#daily').click(function () {
            $('#monthly_revenue').css('display', 'none');
            $('#dAdjust_revenue').css('display', 'none');
            $('#daily_revenue').css('display', 'flex');
            $('#period_revenue').css('display', 'none');
        })

        $('#period').click(function () {
            $('#monthly_revenue').css('display', 'none');
            $('#dAdjust_revenue').css('display', 'none');
            $('#daily_revenue').css('display', 'none');
            $('#period_revenue').css('display', 'flex');
        })
    })
</script>

