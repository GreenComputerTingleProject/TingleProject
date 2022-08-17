<%@ page import="model.MusicDTO" %><%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<Table border="">
    <tr>
        <td>아이디</td>
        <td>${musicData.id}</td>
    </tr>
    <tr>
        <td>제목</td>
        <td>${musicData.title}</td>
    </tr>
    <tr>
        <td>가수</td>
        <td>${musicData.artist}</td>
    </tr>
    <tr>
        <td>앨범</td>
        <td>${musicData.album}</td>
    </tr>
    <tr>
        <td>장르</td>
        <td>${musicData.genre}</td>
    </tr>
    <tr>
        <td>분위기</td>
        <td>${musicData.mood}</td>
    </tr>
    <tr>
        <td>파일</td>
        <td>
            ${musicData.file_path}
        </td>
    </tr>
    <tr>
        <td>이미지</td>
        <td>${musicData.cover_img}</td>
    </tr>
    <tr>
        <td>날짜</td>
        <td>${musicData.release_date}</td>
    </tr>
    <tr>
        <td>스트리밍횟수</td>
        <td>${musicData.cnt}</td>
    </tr>
    <tr>
        <td>가사</td>
        <td>${musicData.lyrics}</td>
    </tr>
    <tr>
        <td colspan="2" align="right">
            <a href = "AdminMusicModify?id=${musicData.id}">수정</a>
            <a href = "AdminMusicDelete?id=${musicData.id}">삭제</a>
            <a href = "AdminMusicList">목록으로</a>
        </td>
    </tr>

</Table>
