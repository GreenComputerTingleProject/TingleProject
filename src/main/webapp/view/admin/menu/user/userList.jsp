
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MusicDTO" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    #adminUrl { width: 100%; float: left; align-items: center;}
    th,td { text-align: center; justify-content: center; }
    td {border-bottom: 1px solid #dddddd; }
</style>

<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script>
    var uSerch = document.getElementById("uSerch")
    $(function () {
        $("#uSerch").click(function (){
            if ($('#serchName').val() != '') {
                var serchName = $('#serchName').val();
                location.href="AdminUnameSerch?serchName="+serchName;
            } else {
                alert("검색어를 입력해주세요")
            }
        })
    })
</script>

<div id = adminUrl>
    <form style=" background: white;">
        <br>
        <table style="border-collapse: collapse; width: 100%;">
            <h1 class="nav navbar-text justify-content-center"><b>User Page</b></h1>
            <br>
            <thead style="/*align-items: center*/; text-align: center;">
            <div class="input-group" style="width: 50%; margin: auto;">
                <input type="text" id="serchName" class="form-control" placeholder="Search..">
                <div class="input-group-append">
                    <button id="uSerch" class="btn btn-dark" type="button" style="color: honeydew;">검색</button>
                </div>
            </div>
            <br>
            <tr style="background: mediumslateblue; color: honeydew;">
                <th>아이디</th>
                <th>로그인아이디</th>
                <th>로그인패스워드</th>
                <th>이름</th>
                <th>닉네임</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>프로필사진</th>
                <th>계정종류</th>
                <th>날짜</th>
                <th>멤버쉽</th>
                <th>성향</th>
            </tr>
            </thead>
            <c:forEach items="${userData }" var="dto" >
                <tbody>
                <tr>
                    <td><a href="AdminUserDetail?id=${dto.id}&nowPage=${nowPage}&serchName=${serchName}">${dto.id}</a></td>
                    <td>${dto.login_id}</td>
                    <td>${dto.login_pw}</td>
                    <td>${dto.name}</td>
                    <td>${dto.nickname}</td>
                    <td>${dto.phone_number}</td>
                    <td>${dto.email_address}</td>
                    <td>${dto.profile_image}</td>
                    <td>${dto.join_date }</td>
                    <c:set var="membership" value="${dto.membership}"/>
                    <c:choose>
                        <c:when test="${membership == 1}">
                            <td>일반회원</td>
                        </c:when>
                        <c:when test="${membership == 2}">
                            <td>구독회원</td>
                        </c:when>
                        <c:when test="${membership == 3}">
                            <td>탈퇴회원</td>
                        </c:when>
                        <c:otherwise>
                            <td>조회불가능</td>
                        </c:otherwise>
                    </c:choose>
                    <td>${dto.personal_type }</td>
                </tr>
                </tbody>
            </c:forEach>
            <tr>
                <td colspan="10" align="center">
                    <c:if test="${firstPage>1 }">
                        <a href="?nowPage=${firstPage-1 }">이전</a>
                    </c:if>
                    <c:forEach begin="${firstPage }" end="${endPage }" var="i">
                        <c:choose>
                            <c:when test="${i==nowPage }">
                                [${i }]
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${serchName != null}">
                                        <a href="AdminUnameSerch?serchName=${serchName}&nowPage=${i }">${i }</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="?nowPage=${i }&serchName=${serchName}">${i }</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${endPage<totalPage }">
                        <a href="?nowPage=${endPage+1 }">다음</a>
                    </c:if>
                </td>
            </tr>
        </table>
    </form>
</div>