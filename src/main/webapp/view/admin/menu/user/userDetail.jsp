<%@ page import="model.MusicDTO" %><%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <td>${userData.profile_image}</td>
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

</Table>
