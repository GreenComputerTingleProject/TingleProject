<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>

<script>
    function find(){

            var artist = $('#artist').val();
            if(artist != ''){
                $.ajax({
                    type: 'GET',
                    url: '<c:url value="/admin/AdminSerchArtist"/>',
                    data: "artist=" + artist,
                    async: false,
                    dataType: 'text',
                    success: function (results) {
                     let results_parse = JSON.parse(results);
                        $('input[name=artist_no]').attr('value',results_parse.artist_no);
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });
            } else {
                alert("가수명을 입력해주세요")
            }

    }
</script>


<form action="AdminMusicInsertReg" method="post" enctype="multipart/form-data">
    <Table border="" id="insert_form">
        <tr>
            <td>가수</td>
            <td><input type = "text" id="artist" name ="artist">
                <button type="button" id="serchbtn" onclick="find()">조회하기</button>
            </td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type = "text" name ="title"></td>
        </tr>
        <tr>
            <td>가수번호</td>
            <td><input type = "text" name ="artist_no"></td>
        </tr>
        <tr>
            <td>앨범</td>
            <td><input type = "text" name ="album"></td>
        </tr>
        <tr>
            <td>장르</td>
            <td><select name="genre" aria-label="성향을 선택해 주세요">
                <option value="">--음악 성향을 선택해 주세요--</option>
                <option value="발라드">발라드</option>
                <option value="락">락</option>
                <option value="힙합">힙합</option>
                <option value="댄스">댄스</option>
                <option value="재즈">재즈</option>
                <option value="클래식">클래식</option>
                <option value="팝">팝</option>
            </select>
            </td>
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
            <td>발매일</td>
            <td><input type = "date" name ="release_date"></td>
        </tr>
        <tr>
            <td>가사</td>
            <td><input type = "text" name ="lyrics"></td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <input type="submit" value="등록하기" id = "submit">
                <a href="AdminMusicList?nowPage=${nowPage}">목록으로</a>
            </td>
        </tr>

    </Table>
</form>
