<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-13
  Time: 오전 1:41
  To change this template use File | Settings | File Templates.
--%>
<style>
    *{
        margin: 0px;
        padding: 0px;
    }

    #adminUrl {
        width: 100%;
        height: 85%;
        background: #f0f0f0;
    }

</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id = adminUrl>
    <h2>음악 페이지입니다</h2>
    <table border="" width="100%">
        <tr>
            <td>아이디</td>
            <td>제목</td>
            <td>가수</td>
            <td>앨범</td>
            <td>장르</td>
            <td>분위기</td>
            <td>파일</td>
            <td>이미지</td>
            <td>날짜</td>
            <td>스트리밍횟수</td>
            <td>가사</td>
        </tr>
        <c:forEach items="${musicData }" var="dto" >
            <tr>
                <td>${musicData.id }</td>
                <td>${musicData.title}</td>
                <td>${musicData.artist}</td>
                <td>${musicData.album}</td>
                <td>${musicData.genre}</td>
                <td>${musicData.mood}</td>
                <td>${musicData.file_path}</td>
                <td>${musicData.cover_img}</td>
                <td>${musicData.release_date}</td>
                <td>${musicData.cnt}</td>
                <td>${musicDate.lyrics }</td>
            </tr>
        </c:forEach>
    </table>

</div>

