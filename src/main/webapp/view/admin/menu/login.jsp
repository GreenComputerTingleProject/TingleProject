<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-13
  Time: 오전 1:41
  To change this template use File | Settings | File Templates.
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    *{
        margin: 0px;
        padding: 0px;
    }

    #adminUrl {
        width: 100%;
        height: 100%;
        background: #f0f0f0;
    }

</style>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id = adminUrl>
    <h2>관리자 로그인 페이지입니다</h2>

    <form action="AdminLoginReg" method="post" >
    <div>아이디<input type = "text" name="login_id"></div>
        <div>패스워드<input type = "text" name="login_pw" ></div>
        <div><input type="submit" value="관리자 로그인"></div>

    </form>

</div>

