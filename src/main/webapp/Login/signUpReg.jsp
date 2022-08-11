<%--
  Created by IntelliJ IDEA.
  User: moon
  Date: 2022-08-11
  Time: 오후 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script src="">

</script>
<script>
    // a48e3ffa6c01902a7ded676d0e6d9af5
</script>
<%
    String id = request.getParameter("emailId");
    String pw = request.getParameter("pw-first");
    String pwchk = request.getParameter("pw-chk");
    String bf = request.getParameter("birth-first");
    String bs = request.getParameter("birth-second");
    out.println("아이디 : " + id + "<br>");
    out.println("비밀번호 : " + pw + "<br>");
    out.println("비밀번호 확인: " + pwchk + "<br>");
    out.println("주민번호: " + bf +" - "+ bs+"<br>");
%>
</body>
</html>
