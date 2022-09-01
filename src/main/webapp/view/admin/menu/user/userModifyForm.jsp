<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    option {text-align: center;}
    .input-group-prepend { width: 25%; }
    .input-group { width: 100%; margin: auto;}
    .input-group-text { justify-content: center; background: mediumslateblue; color: honeydew;}
    form { background-color: white;}
</style>

<form action="AdminUserModifyReg" method="post" enctype="multipart/form-data">
    <input type = "hidden" value="${userData.profile_image}" name = "filecheck">
    <input type="hidden" name="nowPage" value="${nowPage }"/>
    <input type="hidden" name="serchName" value="${serchName }"/>
    <br>
    <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">유저정보수정하기</b></h1>
    <br>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">아이디</span>
        </div>
        <input type="text" class="form-control" name="id" value="${userData.id}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">로그인아이디</span>
        </div>
        <input type="text" class="form-control" name ="login_id" value="${userData.login_id}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">로그인패스워드</span>
        </div>
        <input type="text" class="form-control" name ="login_pw" value="${userData.login_pw}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">이름</span>
        </div>
        <input type="text" class="form-control" name="album" value="${userData.name}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">닉네임</span>
        </div>
        <input type="text" class="form-control" name ="genre" value="${userData.nickname}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">전화번호</span>
        </div>
        <input type="text" class="form-control" name="phone_number" value="${userData.phone_number}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">이메일</span>
        </div>
        <input type="text" class="form-control" name="email_address" value="${userData.email_address}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">프로필사진</span>
        </div>
        <input type="file" class="form-control" name="profile_image" value="${userData.profile_image}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">가입일</span>
        </div>
        <input type="text" class="form-control" name="join_date" value="${userData.join_date}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">멤버쉽</span>
        </div>
        <select name="membership" class="form-control">
            <option value="${userData.membership}">현재 회원 상태 :
        <c:set var="membership" value="${userData.membership}"/>
        <c:choose>
            <c:when test="${membership == 1}">
                일반회원
            </c:when>
            <c:when test="${membership == 2}">
                구독회원
            </c:when>
            <c:when test="${membership == 3}">
                탈퇴회원
            </c:when>
            <c:otherwise>
                조회불가능
            </c:otherwise>
        </c:choose>
        </option>
            <option value= 1>일반회원</option>
        <option value= 2>구독회원</option>
        <option value= 3>탈퇴회원</option>
        </select>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">취향</span>
        </div>
        <input type="text" class="form-control" name="personal_type" value="${userData.personal_type}">
    </div>
    <div class="input-group">
        <input type="submit" id="submit" value="수정하기" class="form-control btn col-lg-4" style="background:mediumpurple; color:honeydew; font-size: 20px;">
        <a class="btn btn-dark col-md-4" href="AdminUserDetail?id=${userData.id}" style="background-color: rebeccapurple; "><h5 style="line-height: inherit; font-size: 20px;">뒤로</h5></a>
    </div>
</form>
