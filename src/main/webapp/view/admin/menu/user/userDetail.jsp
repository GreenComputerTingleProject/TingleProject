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
    img { width: 100px; height: 100px; }
    option {text-align: center;}
    .input-group-prepend { width: 25%; }
    .input-group { width: 100%; margin: auto;}
    .input-group-text { justify-content: center; background:white ; color: black;}
    form { background-color: white;}
</style>
<form>
    <br>
    <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">유저정보상세보기</b></h1>
    <br>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">아이디</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%; ">${userData.id}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">로그인아이디</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%; ">${userData.login_id}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">로그인패스워드</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${userData.login_pw}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">이름</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${userData.name}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">닉네임</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${userData.nickname}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">전화번호</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${userData.phone_number}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">이메일</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${userData.email_address}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="height: 114px; background-color: mediumslateblue; color:honeydew;">프로필이미지</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">
           <c:choose>
               <c:when test="${userData.profile_image != null}">
                   <img src="<c:url value="/img/"/>${userData.profile_image }" alt="" />
               </c:when>
               <c:otherwise>
                   프로필 사진 없음
               </c:otherwise>
           </c:choose>
        </span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">가입일</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${userData.join_date}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">멤버쉽</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">
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
        </span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">성향</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${userData.personal_type}</span>
    </div>
    <div class="input-group">
        <a class="btn btn-dark col-md-4" href="AdminUserModify?id=${userData.id}&nowPage=${nowPage}&serchName=${serchName}" style="background-color: mediumpurple; border-color: mediumpurple;"><h5 style="line-height: inherit; font-size: 20px;">수정</h5></a>
        <a class="btn btn-dark col-md-4" href="AdminUserDelete?id=${userData.id}&nowPage=${nowPage}" style="background-color: rebeccapurple; border-color:rebeccapurple"><h5 style="line-height: inherit; font-size: 20px;">삭제</h5></a>
        <c:choose>
            <c:when test="${serchName != ''}">
                <a class="btn btn-dark col-md-4" href="AdminUnameSerch?serchName=${serchName}&nowPage=${nowPage}" style="background-color: indigo; border-color: indigo;"><h5 style="line-height: inherit; font-size: 20px;">검색목록으로</h5></a>
            </c:when>
            <c:otherwise>
                <a class="btn btn-dark col-md-4" href="AdminUserList?nowPage=${nowPage}" style="background-color: indigo; border-color: indigo;"><h5 style="line-height: inherit; font-size: 20px;">목록으로</h5></a>
            </c:otherwise>
        </c:choose>


    </div>
</form>
