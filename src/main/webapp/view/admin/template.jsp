<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.Console" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<c:url value="/bootstrap/"/>css/bootstrap.min.css">
    <script type="text/javascript" src="<c:url value="/bootstrap/"/>js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <head>
        <title>Main</title>
        <style>
            *{
                margin: 0px;
                padding: 0px;
            }

            /* .container{
                   margin: 0 auto;
                   border: 1px solid black;
             }*/

        </style>
    </head>
<body>
<div>
    <c:if test="${logincheck}">

        <jsp:include page="inc/nav.jsp"/>

    </c:if>
</div>
<div>
    <jsp:include page="${adminUrl }"/>
</div>
</div>
</body>
</html>
