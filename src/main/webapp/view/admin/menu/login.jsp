<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--<style>--%>
<%--    *{--%>
<%--        margin: 0px;--%>
<%--        padding: 0px;--%>
<%--    }--%>

<%--    #adminUrl {--%>
<%--        width: 100%;--%>
<%--        height: 100%;--%>
<%--        background: #f0f0f0;--%>
<%--    }--%>

<%--</style>--%>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<div id = adminUrl>--%>
<%--    <h2>관리자 로그인 페이지입니다</h2>--%>

<%--    <form action="AdminLoginReg" method="post" >--%>
<%--    <div>아이디<input type = "text" name="login_id"></div>--%>
<%--        <div>패스워드<input type = "text" name="login_pw" ></div>--%>
<%--        <div><input type="submit" value="관리자 로그인"></div>--%>

<%--    </form>--%>

<%--</div>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    * { margin: 0px;  padding: 0px;}
    .jumbotron  {
        width:300px; height: 250px; left:50%; top:50%; position:absolute; background: white;
        transform: translate(-50%, -50%);
    }

    h2 {text-align: center; font-size: medium; font-family: 'Play fair '}
    body { background: #f0f0f0;}
    form { width:100%; height:250px; background: white; }
    form>div { margin: 25px;}
    .btn {background-color: mediumslateblue; color: honeydew;}
    .btn:hover { background: indigo; border-color:indigo; color: honeydew;}
</style>
<%--<img class="img-responsive center-block" src="<c:url value="/img/"/>j_8.png" alt="" style="width: 50px; height: 50px;">
--%>
<div id=adminUrl class="jumbotron">
    <form action="AdminLoginReg" method="post">
        <h2 class="nav navbar-text justify-content-center" style="background: darkorchid; color: honeydew;">TINGLE MANAGER</h2>
        <div class="form-group">
            <input type="text" name="login_id" class="form-control" placeholder="USER NAME">
        </div>
        <div class="form-group">
            <input type="password" name="login_pw" class="form-control" placeholder="PASSWORD">
        </div>
        <div class="form-group" style="text-align: center;">
            <input type="submit" value="Login" class="btn btn-sm">
        </div>
    </form>
</div>
</div>


