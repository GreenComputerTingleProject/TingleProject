<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="AdminMusicModifyReg" method="post" enctype="multipart/form-data">
<Table border="">
    <input type = "hidden" value="${musicData.file_path}" name = "filecheck1">
    <input type = "hidden" value="${musicData.cover_img}" name = "filecheck2">
    <tr>
        <td>id</td>
        <td><input type ="text" name = "id" value="${musicData.id}"></td>
    </tr>
    <tr>
        <td>제목</td>
        <td><input type = "text" name ="title" value="${musicData.title}"></td>
    </tr>
    <tr>
        <td>가수</td>
        <td><input type = "text" name ="arist" value="${musicData.artist}"></td>
    </tr>
    <tr>
        <td>앨범</td>
        <td><input type = "text" name ="album" value="${musicData.album}"></td>
    </tr>
    <tr>
        <td>장르</td>
        <td><input type = "text" name ="genre" value="${musicData.genre}"></td>
    </tr>
    <tr>
        <td>분위기</td>
        <td><input type = "text" name ="mood" value="${musicData.mood}"></td>
    </tr>
    <tr>
        <td>음악파일</td>
        <td><input type ="file" name = file_path value="${musicData.file_path}" ></td>
    </tr>
    <tr>
        <td>이미지파일</td>
        <td><input type ="file" name = cover_img value="${musicData.cover_img}"></td>
    </tr>
    <tr>
        <td>날짜</td>
        <td><input type = "text" name ="release_date" value="${musicData.release_date}"></td>
    </tr>
    <tr>
        <td>스트리밍횟수</td>
        <td><input type = "text" name ="cnt" value="${musicData.cnt}"></td>
    </tr>
    <tr>
        <td>가사</td>
        <td><input type = "text" name ="lyrics" value="${musicData.lyrics}"></td>
    </tr>
    <tr>
        <td colspan="2" align="right">
            <input type="submit" value="수정하기">
            <a href="AdminMusicDetail?id=${musicData.id}">뒤로</a>
        </td>
    </tr>


</Table>
</form>
