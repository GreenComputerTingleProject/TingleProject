<%--
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
    <div> <a href = "AdminMusicList">등록/삭제</a></div>
    <div><a href = "AdminBoard">게시판</a></div>
    <div> <a href = "AdminUserList">회원관리</a></div>
    <div> <a href = "AdminCalculate">정산</a></div>
</div>--%>
<%--원본 끝--%>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
    * { margin: 0; padding: 0; }
    a:visited { background: darkorchid; color: black;}
    .uu{ width: 100%; /*height:50px;*/ float: left; flex-direction: row; text-align: center; }
    body { background: #f0f0f0;  }
    a { width:100%;  height: 50px;  text-decoration: none; text-align: center; }
    h6 { font-size: 15px; height: 50px; line-height: 30px;}
</style>
<%--<form>
     <button class="btn btn-primary" onclick="">관리자추가</button>
 </form>--%>
<div class="list-group uu">
    <a class="list-group-item list-group-item-action" href="AdminMusicList"><h6>음원관리</h6></a></li>
    <a class="list-group-item list-group-item-action" href="AdminUserList"><h6>회원관리</h6></a></li>
    <a class="list-group-item list-group-item-action" href="AdminCenter?noticeKind=noticeList" ><h6>고객센터</h6></a></li>
    <a class="list-group-item list-group-item-action" href="AdminCalculate"><h6>정산</h6></a></li>
</div>


