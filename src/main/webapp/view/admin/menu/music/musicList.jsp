<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MusicDTO" %><%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-13
  Time: 오전 1:41
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

    td {
        align-items: center;
    }

</style>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script>
    var mSerch = document.getElementById("mSerch")
    $(function () {
        $("#mSerch").click(function (){
            if ($('#mname').val() != '') {
               var mname = $('#mname').val();
               location.href="AdminMnameSerch?mname="+mname;
            } else {
                alert("검색어를 입력해주세요")
            }
        })
    })
</script>


<div id = adminUrl>
    <h2>음악 페이지입니다</h2>
    <table border="" width="100%">
        <tr>
            <td colspan="11">
                <input type="text" id = "mname"><input type="button" value="검색" id="mSerch"/>
            </td>
        </tr>

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
                <td><a href=AdminMusicDetail?id=${dto.id }">${dto.id }</a></td>
                <td>${dto.title}</td>
                <td>${dto.artist}</td>
                <td>${dto.album}</td>
                <td>${dto.genre}</td>n
                <td>${dto.mood}</td>
                <td>${dto.file_path}</td>
                <td>${dto.cover_img}</td>
                <td>${dto.release_date}</td>
                <td>${dto.cnt}</td>
                <td>${dto.lyrics }</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="11" align="right">
                <a href="AdminMusicInsert">음원등록</a>
            </td>
        </tr>
    </table>

</div>

