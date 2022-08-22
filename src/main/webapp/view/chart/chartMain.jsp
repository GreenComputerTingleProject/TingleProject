<%--
  Created by IntelliJ IDEA.
  User: moon
  Date: 2022-08-13
  Time: 오후 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
       /* *{
            margin: 0;
            padding: 0;
        }*/
        .btn{
            height: 32px;
            padding: 0 15px;
            font-size: 14px;
            line-height: 32px;
            text-align: center;
            border-radius: 16px;
            border: 1px solid purple;
            vertical-align: top;
            display: inline-block;
            background: #fff;


        }

    </style>
</head>
<body>
<section>
   <header>
    <button class="genre btn" type="button">top100</button>
    <button class="genre btn" type="button">발라드</button>
    <button class="genre btn" type="button">락</button>
    <button class="genre btn" type="button">힙합</button>
    <button class="genre btn" type="button">댄스</button>
    <button class="genre btn" type="button">재즈</button>
    <button class="genre btn" type="button">클래식</button>
    <button class="genre btn" type="button">팝</button>
   </header>

</section>
<jsp:include page="chartTop100.jsp"/>

<section>


</section>

</body>
</html>
