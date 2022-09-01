

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</script>--%>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>


<style>
    .aa .bb .cc .dd { width: 100%; }
    th,td {  text-align: center; justify-content: center; }
    td {border-bottom: 1px solid #dddddd; }
    h5:hover { color: orchid;}
    .input-group-prepend { width: 25%; }
    .input-group { width: 100%; margin: auto;}
    .input-group-text { justify-content: center; background:white ; color: black;}
    #daily_revenue {  display: none; }
    #dAdjust_revenue { display: none; }
    #period_revenue {  display: none; }
    tr:hover { background-color: ghostwhite;}
    li {list-style: none;}
</style>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script>
    /* var mSerch = document.getElementById("mSerch")
     $(function () {
       $("#mSerch").click(function (){
         if ($('#mname').val() != '') {
           var mname = $('#mname').val();
           location.href="AdminMnameSerch?mname="+mname;
         } else {
           alert("검색어를 입력해주세요")
         }
       })
     })*/

</script>

<%--월간정산 시작--%>

<div id="adminUrl" style="background: white;">
    <br>
    <h1 class="nav navbar-text" style="display:block; text-align: center; margin-top: 5px; margin-bottom: 5px;"><b style="font-family: 'Play fair '; font-size: 41px;">정산</b></h1>
    <br>
    <div id="annual_revenue" class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: black; color:honeydew; font-size: 30px;">총 수익</span>
        </div>
        <span class="input-group-text justify-content-center" style="width: 75%; font-size: 30px; margin-bottom: 5px; background-color: ghostwhite;">${total_amount}원</span>
    </div>
    <br>
    <div class="btn-group" style="display: flex; margin:auto; margin-bottom: 5px; width: 60%;">
        <button id="monthly" class="btn" style="width: 10%; background: mediumpurple; color: honeydew; "><h5 style="line-height: inherit;">월간 정산</h5></button>
        <button id="dAdjust" class="btn" style="width: 10%; background: mediumslateblue; color: honeydew; "><h5 style="line-height: inherit;">일간 정산</h5></button>
        <button id="daily" class="btn" style="width: 10%; background: rebeccapurple; color: honeydew; "><h5 style="line-height: inherit;">일별 내역</h5></button>
        <button id="period" class="btn" style="width: 10%; background: indigo; color: honeydew; "><h5 style="line-height: inherit;">기간별 내역</h5></button>
    </div>
    <br>
    <div id="monthly_revenue" class="aa" style="display:flex;">
        <form style=" background: white; width: 100%;">
            <table style="border-collapse: collapse; width: 100%;" >
                <thead style="align-items: center; text-align: center;">
                <tr style="background: mediumslateblue; color: honeydew;">
                    <th>월별</th>
                    <th>매출액</th>
                </tr>
                </thead>
                <c:forEach items="${monthly_amount}" var="monthly_amount" varStatus="i">
                    <tbody>
                    <tr>
                        <td>${monthly_amount.key}월</td>
                        <td>${monthly_amount.value}원</td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>
        </form>
    </div>
    <%--월간정산 끝--%>


    <%--일간정산 시작--%>
    <div id="dAdjust_revenue" class="bb">
        <form action="AdminCalculateDAdjustReg" method="get" style=" background: white; width: 100%;">
            <br>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" style="color:honeydew; background: black;"><h5 style="height: 100%;">조회월</h5></span>
                </div>
                <input type="month" class="form-control" name ="month" id="dAdjustInput" style="text-align: center; font-size: 22px;">
            </div>
            <c:forEach items="${daily_adjust}" var="daily_adjust" varStatus="i">
                <div class="input-group" style="background: mediumslateblue; color: honeydew; align-items: center; text-align: center;">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew; font-size: 40px;">${daily_adjust.key}</span>
                    </div>
                    <span class="input-group-text justify-content-start" style="width: 75%; font-size: 40px;">${daily_adjust.value}원</span>
                </div>
                </tr>
            </c:forEach>
            <div class="btn-group" style="display: flex; margin:auto; width: 20%;">
                <button type="submit" class="btn form-control" style="width: 5%; background: deepskyblue; color: honeydew; "><h5 style="line-height: inherit;">검색</h5></button>
                <button type="button" id="dAdjust_init" class="btn form-control"  style="width: 5%; background: deepskyblue; color: honeydew; "><h5 style="line-height: inherit;">초기화</h5></button>
            </div>
        </form>
    </div>
    <%--일간정산 끝--%>

    <%--일별내역 시작--%>
    <div id="daily_revenue" class="cc">
        <form action="AdminCalculateDailyReg" method="get" style=" background: white; width: 100%;">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" style="color:honeydew; background: black;"><h5 style="height: 100%;">조회월</h5></span>
                </div>
                <input type="month" class="form-control" name ="month" id="month" style="text-align: center; font-size: 22px;">
            </div>
            <c:if test="${daily_amount != null}">
                <c:forEach items="${daily_amount}" var="daily_amount" varStatus="i">
                    <c:forEach items="${daily_amount.value}" var="value" varStatus="j">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew; height: 100%;">${daily_amount.key}일</span>
                            </div>
                            <span class="input-group-text justify-content-center" style="width: 75%; font-size: 17px;">
                                <ul>
                                    <li>유저번호 : <a href="AdminUserDetail?id=${value.user_id}">${value.user_id}</a></li>
                                    <li>주문번호 : ${value.imp_uid}</li>
                                    <li>결제금액 : ${value.paid_amount}원</li>
                                    <li>결제일자 : ${value.reg_date}</li>
                                </ul>
                            </span>
                        </div>
                    </c:forEach>
                </c:forEach>
            </c:if>
            <div class="btn-group" style="display: flex; margin:auto; width: 20%;">
                <button type="submit" class="btn form-control" style="width: 5%; background: deepskyblue; color: honeydew; "><h5 style="line-height: inherit;">검색</h5></button>
                <button type="button" id="daily_init" class="btn form-control"  style="width: 5%; background: deepskyblue; color: honeydew; "><h5 style="line-height: inherit;">초기화</h5></button>
            </div>
        </form>
    </div>

    <%--일별내역 끝--%>

    <%--기간별 내역 시작--%>
    <div id="period_revenue" class="dd">
        <form action="AdminCalculatePeriodReg" method="get" style=" background: white; width: 100%;">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" style="color:honeydew; background: black;"><h5 style="height: 100%;">조회기간</h5></span>
                </div>
                <input type="date" class="form-control" name="startday" id="startday" style="text-align: center; font-size: 22px; width: 37.5%;"/>
                <input type="date" name="endday" id="endday" style="text-align: center; font-size: 22px; width: 37.5%;"/>
            </div>
            <c:if test="${period_income != null}">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew; height: 100%;">검색기간</span>
                    </div>
                    <span class="input-group-text justify-content-center" style="width: 75%;">${sDay}부터 ${eDay}까지</span>
                </div>

                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">기간 수익</span>
                    </div>
                    <span class="input-group-text justify-content-center" style="width: 75%;">${period_income}원</span>
                </div>
                <c:forEach items="${calculate_pay}" var="calculate_pay" varStatus="i">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew; height: 100%;">${daily_amount.key}일</span>
                        </div>
                        <span class="input-group-text justify-content-center" style="width: 75%; font-size: 17px;">
                            <ul>
                                <li>유저번호 : <a href="AdminUserDetail?id=${calculate_pay.user_id}">${calculate_pay.user_id}</a></li>
                                <li>주문번호 : ${calculate_pay.imp_uid}</li>
                                <li>결제금액 : ${calculate_pay.paid_amount}원</li>
                                <li>결제일자 : ${calculate_pay.reg_date}</li>
                            </ul>
                        </span>
                    </div>
                </c:forEach>
            </c:if>

            <div class="btn-group" style="display: flex; margin:auto; width: 20%;">
                <button type="submit" class="btn form-control" style="width: 5%; background: deepskyblue; color: honeydew; "><h5 style="line-height: inherit;">검색</h5></button>
                <button type="button" id="period_init" class="btn form-control"  style="width: 5%; background: deepskyblue; color: honeydew; "><h5 style="line-height: inherit;">초기화</h5></button>
            </div>
        </form>
    </div>

    <%--기간별 내역 끝--%>
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



