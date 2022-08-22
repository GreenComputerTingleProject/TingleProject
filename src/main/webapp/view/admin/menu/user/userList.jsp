<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MusicDTO" %><%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-13
  Time: 오전 1:41
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    *{
        margin: 0px;
        padding: 0px;
    }

    #adminUrl {
        width: 100%;
        height: 85%;
        background: #f0f0f0;
    }

    td {
        align-items: center;
    }

</style>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script>
    var uSerch = document.getElementById("uSerch")
    $(function () {
        $("#uSerch").click(function (){
            if ($('#uname').val() != '') {
               var uname = $('#uname').val();
               location.href="AdminUnameSerch?uname="+uname;
            } else {
                alert("검색어를 입력해주세요")
            }
        })
    })
</script>


<div id = adminUrl>
    <h2>유저 페이지 입니다</h2>
    <table border="" width="100%">
        <tr>
            <td colspan="11">
                <input type="text" id = "uname"><input type="button" value="검색" id="uSerch"/>
            </td>
        </tr>

        <tr>
            <td>아이디</td>
            <td>로그인아이디</td>
            <td>로그인패스워드</td>
            <td>이름</td>
            <td>닉네임</td>
            <td>전화번호</td>
            <td>이메일</td>
            <td>프로필사진</td>
            <td>계정종류</td>
            <td>날짜</td>
            <td>멤버쉽</td>
            <td>성향</td>
        </tr>
        <c:forEach items="${userData }" var="dto" >
            <tr>
                <td><a href="AdminUserDetail?id=${dto.id}">${dto.id}</a></td>
                <td>${dto.login_id}</td>
                <td>${dto.login_pw}</td>
                <td>${dto.name}</td>n
                <td>${dto.nickname}</td>
                <td>${dto.phone_number}</td>
                <td>${dto.email_address}</td>
                <td>${dto.profile_image}</td>
                <td>${dto.join_type}</td>
                <td>${dto.join_date }</td>
                <td>${dto.membership }</td>
                <td>${dto.personal_type }</td>
            </tr>
        </c:forEach>
    </table>

</div>

