<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>MusicList</title>
</head>
<body>
<h1>MusicList</h1>
<c:forEach items="${musicList}" var="music" varStatus="no">
    <br>
    <button class="musicBtn" value="<c:url value="/mp3/"/>${music.file_path}">${music.title}</button>
</c:forEach>
</body>
</html>
