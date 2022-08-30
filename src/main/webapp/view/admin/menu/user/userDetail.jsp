<%--<%@ page import="model.MusicDTO" %>
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
        <td>계정종류</td>
        <td>${userData.join_type}</td>
    </tr>
    <tr>
        <td>가입일</td>
        <td>${userData.join_date}</td>
    </tr>
    <tr>
        <td>멤버쉽</td>
        <td>${userData.membership}</td>
    </tr>
    <tr>
        <td>성향</td>
        <td>${userData.personal_type}</td>
    </tr>
    <tr>
        <td colspan="2" align="right">
            <a href = "AdminUserModify?id=${userData.id}">수정</a>
            <a href = "AdminUserDelete?id=${userData.id}">삭제</a>
            <a href = "AdminUserList">목록으로</a>
        </td>
    </tr>

</Table>--%>

<%@ page import="model.MusicDTO" %>
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
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">계정종류</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${userData.join_type}</span>
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
        <span class="input-group-text justify-content-start" style="width: 75%;">${userData.membership}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">성향</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${userData.personal_type}</span>
    </div>
    <div class="input-group">
        <a class="btn btn-dark col-md-4" href="AdminUserModify?id=${userData.id}" style="background-color: mediumpurple; border-color: mediumpurple;"><h5 style="line-height: inherit; font-size: 20px;">수정</h5></a>
        <a class="btn btn-dark col-md-4" href="AdminUserDelete?id=${userData.id}" style="background-color: rebeccapurple; border-color:rebeccapurple"><h5 style="line-height: inherit; font-size: 20px;">삭제</h5></a>
        <a class="btn btn-dark col-md-4" href="AdminUserList" style="background-color: indigo; border-color: indigo;"><h5 style="line-height: inherit; font-size: 20px;">목록으로</h5></a>
    </div>
</form>

