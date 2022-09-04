<%--<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MusicDTO" %>

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

</div>--%>

<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MusicDTO" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    #adminUrl { width: 100%; float: left; align-items: center;}
    th,td { text-align: center; justify-content: center; }
    /*tr { border-bottom: 1px solid #dddddd; }*/
    td {border-bottom: 1px solid #dddddd; }
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
    <form style=" background: white;">
        <br>
        <table style="border-collapse: collapse; width: 100%;">
            <h1 class="nav navbar-text justify-content-center"><b>User Page</b></h1>
            <br>
            <thead style="/*align-items: center*/; text-align: center;">
            <div class="input-group" style="width: 50%; margin: auto;">
                <input type="text" id="uname" class="form-control" placeholder="Search..">
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
                    <td><a style="color: red;" href="AdminUserDetail?id=${dto.id}">${dto.id}</a></td>
                    <td>${dto.login_id}</td>
                    <td>${dto.login_pw}</td>
                    <td>${dto.name}</td>
                    <td>${dto.nickname}</td>
                    <td>${dto.phone_number}</td>
                    <td>${dto.email_address}</td>
                    <td>${dto.profile_image}</td>
                    <td>${dto.join_type}</td>
                    <td>${dto.join_date }</td>
                    <td>${dto.membership }</td>
                    <td>${dto.personal_type }</td>
                </tr>
                </tbody>
            </c:forEach>
        </table>
    </form>
</div>