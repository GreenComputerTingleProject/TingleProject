<%@ page import="model.MusicDTO" %><%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    img {
        width: 100px;
        height: 100px;
    }

</style>

<Table border="">
    <tr>
        <td>아이디</td>
        <td>${userData.id}</td>
    </tr>
    <tr>
        <td>로그인아이디</td>
        <td>${userData.login_id}</td>
    </tr>
    <tr>
        <td>로그인패스워드</td>
        <td>${userData.login_pw}</td>
    </tr>
    <tr>
        <td>이름</td>
        <td>${userData.name}</td>
    </tr>
    <tr>
        <td>닉네임</td>
        <td>${userData.nickname}</td>
    </tr>
    <tr>
        <td>전화번호</td>
        <td>${userData.phone_number}</td>
    </tr>
    <tr>
        <td>이메일</td>
        <td>
            ${userData.email_address}
        </td>
    </tr>
    <tr>
        <td>프로필이미지</td>
        <td><c:choose>
            <c:when test="${userData.profile_image != null}">
                <img src="<c:url value="/img/"/>${userData.profile_image }" alt="" />
            </c:when>
            <c:otherwise>
                프로필 사진 없음
            </c:otherwise>
        </c:choose></td>
    </tr>
    <tr>
        <td>가입일</td>
        <td>${userData.join_date}</td>
    </tr>
    <tr>
        <td>멤버쉽</td>
        <c:set var="membership" value="${userData.membership}"/>
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
    </tr>
    <tr>
        <td>성향</td>
        <td>${userData.personal_type}</td>
    </tr>
    <tr>
        <td colspan="2" align="right">
            <a href = "AdminUserModify?id=${userData.id}&nowPage=${nowPage}&serchName=${serchName}">수정</a>
            <a href = "AdminUserDelete?id=${userData.id}&nowPage=${nowPage}">삭제</a>
            <c:choose>
                <c:when test="${serchName != null}">
                    <a href = "AdminUnameSerch?serchName=${serchName}&nowPage=${nowPage}">검색목록으로</a>
                </c:when>
                <c:otherwise>
                    <a href = "AdminUserList?nowPage=${nowPage}">목록으로</a>
                </c:otherwise>
            </c:choose>
        </td>
    </tr>

</Table>
