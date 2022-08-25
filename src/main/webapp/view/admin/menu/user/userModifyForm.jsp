<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="AdminUserModifyReg" method="post" enctype="multipart/form-data">
<Table border="">
    <input type = "hidden" value="${userData.profile_image}" name = "filecheck">
    <tr>
        <td>아이디</td>
        <td><input type ="text" name = "id" value="${userData.id}"></td>
    </tr>
    <tr>
        <td>로그인아이디</td>
        <td><input type = "text" name ="login_id" value="${userData.login_id}"></td>
    </tr>
    <tr>
        <td>로그인패스워드</td>
        <td><input type = "text" name ="login_pw" value="${userData.login_pw}"></td>
    </tr>
    <tr>
        <td>이름</td>
        <td><input type = "text" name ="name" value="${userData.name}"></td>
    </tr>
    <tr>
        <td>닉네임</td>
        <td><input type = "text" name ="nickname" value="${userData.nickname}"></td>
    </tr>
    <tr>
        <td>전화번호</td>
        <td><input type = "text" name ="phone_number" value="${userData.phone_number}"></td>
    </tr>
    <tr>
        <td>이메일</td>
        <td><input type ="text" name = "email_address"  value=${userData.email_address}></td>
    </tr>
    <tr>
        <td>프로필사진</td>
        <td><input type ="file" name = "profile_image" value="프로필사진"></td>
    </tr>
    <tr>
        <td>계정종류</td>
        <td><input type = "text" name ="join_type" value="${userData.join_type}"></td>
    </tr>
    <tr>
        <td>가입일</td>
        <td><input type = "text" name ="join_date" value="${userData.join_date}"></td>
    </tr>
    <tr>
        <td>멤버쉽</td>
        <td><input type = "text" name ="membership" value="${userData.membership}"></td>
    </tr>
    <tr>
        <td>취향</td>
        <td><input type = "text" name ="personal_type" value="${userData.personal_type}"></td>
    </tr>
    <tr>
        <td colspan="2" align="right">
            <input type="submit" value="수정하기">
            <a href="AdminUserDetail?id=${userData.id}">뒤로</a>
        </td>
    </tr>

</Table>
</form>
