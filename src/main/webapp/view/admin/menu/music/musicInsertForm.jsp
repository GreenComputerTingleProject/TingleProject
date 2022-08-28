<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<form action="AdminMusicInsertReg" method="post" enctype="multipart/form-data">
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

            '<option value="">--음악 성향을 선택해 주세요--</option>';
            html += '<option value="classic">클래식</option>';
            html += '<option value="rock">락</option>';
            html += '<option value="blues">블루스</option>';
            html += '<option value="ballad">발라드</option>';
            html += '<option value="rnb">R&B</option>';
            html += '<option value="pop">팝</option>';
            html += '<option value="hiphop">힙합</option>';
            html += '<option value="metal">메탈</option>';
            html += '<option value="jazz">재즈</option>';

            <td>장르</td>
            <td><input type = "text" name ="genre"></td>
        </tr>
        <tr>
            <td>분위기</td>
            <td><input type = "text" name ="mood"></td>
        </tr>
        <tr>
            <td>음악파일선택</td>
            <td colspan><input type ="file" name = file_path ></td>
        </tr>
        <tr>
            <td>이미지파일선택</td>
            <td colspan><input type ="file" name = cover_img></td>
        </tr>
        <tr>
            <td>가사</td>
            <td><input type = "text" name ="lyrics" value="${musicData.lyrics}"></td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <input type="submit" value="등록하기" id = "submit">
                <a href="AdminMusicList">목록으로</a>
            </td>
        </tr>

    </Table>
</form>
