<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.Console" %><%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-13
  Time: 오전 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Main</title>
    <style>
       *{
           margin: 0px;
           padding: 0px;
       }

      .container{

      }

    </style>

</head>
<body>
<div class="container">


 <c:if test="${logincheck}">
    <nav>
        <jsp:include page="inc/nav.jsp"/>
    </nav>
 </c:if>
    <section>
        <jsp:include page="${adminUrl }"/>
    </section>

</div>
</body>
</html>
