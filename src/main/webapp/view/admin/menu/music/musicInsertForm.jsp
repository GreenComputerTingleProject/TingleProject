<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form action="AdminMusicInsertReg" method="get">
    <Table border="">
        <tr>
            <td>제목</td>
            <td><input type = "text" name ="title"></td>
        </tr>
        <tr>
            <td>가수</td>
            <td><input type = "text" name ="artist"></td>
        </tr>
        <tr>
            <td>앨범</td>
            <td><input type = "text" name ="album"></td>
        </tr>
        <tr>
            <td>장르</td>
            <td><input type = "text" name ="genre"></td>
        </tr>
        <tr>
            <td>분위기</td>
            <td><input type = "text" name ="mood"></td>
        </tr>
        <tr>
            <td><input type ="file" value="음악파일선택"></td>
            <td><input type = "text" name ="file_path"></td>
        </tr>
        <tr>
            <td><input type ="file" value="이미지파일선택"></td>
            <td><input type = "text" name ="cover_img"></td>
        </tr>
        <tr>
            <td>가사</td>
            <td><input type = "text" name ="lyrics" value="${musicData.lyrics}"></td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <input type="submit" value="등록하기">
                <a href="AdminMusicList">목록으로</a>
            </td>
        </tr>

    </Table>
</form>
