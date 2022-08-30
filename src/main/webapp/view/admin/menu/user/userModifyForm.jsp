<%--

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
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    option {text-align: center;}
    .input-group-prepend { width: 25%; }
    .input-group { width: 100%; margin: auto;}
    .input-group-text { justify-content: center; background: mediumslateblue; color: honeydew;}
    form { background-color: white;}
</style>
<form action="AdminUserModifyReg" method="post" enctype="multipart/form-data">
    <input type = "hidden" value="${userData.profile_image}" name = "filecheck">
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
        <input type="file" class="form-control" name="profile_image" value="프로필사진">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">계정종류</span>
        </div>
        <input type="text" class="form-control" name="join_type" value="${userData.join_type}">
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
        <input type="text" class="form-control" name="membership" value="${userData.membership}">
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
