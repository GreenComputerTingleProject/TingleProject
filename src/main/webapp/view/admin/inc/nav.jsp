<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-13
  Time: 오전 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    *{
        margin: 0px;
        padding: 0px;
    }

    #nav {
    width: 100%;
        height: 15%;
    background: #f0f0f0;
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: space-around;
        border: 1px solid #1a1e21;
  }

    #nav > div {
        border: 1px solid #1a1e21;
        width: 20%;
        height: 100%;
        align-items: center;
    }

</style>

<div id = nav>
    <div><a href = "AdminPage">관리자페이지</a></div>
    <div> <a href = "AdminMusic">등록/삭제</a></div>
    <div><a href = "AdminBoard">게시판</a></div>
    <div> <a href = "AdminUser">회원관리</a></div>
    <div> <a href = "AdminCalculate">정산</a></div>
</div>