<%--
  Created by IntelliJ IDEA.
  User: moon
  Date: 2022-08-11
  Time: 오후 7:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            float: left;
        }


    </style>

</head>
<body>
<div class="container">
    <nav>
        <jsp:include page="inc/nav.jsp"/>
    </nav>
    <section>
        <jsp:include page="../view/Login/signUpForm.jsp"/>
        <%-- <jsp:include page="${mainUrl}"/>--%>
    </section>
    <footer>
        <jsp:include page="inc/footer.jsp"/>
    </footer>
</div>
</body>
</html>
