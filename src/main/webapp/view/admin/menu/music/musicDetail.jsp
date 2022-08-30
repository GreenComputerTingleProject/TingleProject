<%--<%@ page import="model.MusicDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    img {
        width: 100px;
        height: 100px;
    }

</style>

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
        <td>음악파일</td>
        <td>
            ${musicData.file_path}
        </td>
    </tr>
    <tr>
        <td>커버이미지</td>
       &lt;%&ndash; <td><img src ="<c:url value="/img/"/>${musicData.cover_img }" alt=""></td>&ndash;%&gt;
        <td><c:choose>
            <c:when test="${musicData.cover_img != null}">
                <img src="<c:url value="/img/"/>${musicData.cover_img }" alt="" />
            </c:when>
            <c:otherwise>
                커버 이미지 없음
            </c:otherwise>
        </c:choose></td>
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

</Table>--%>

<%@ page import="model.MusicDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
     img { width: 100px; height: 100px; }
     option {text-align: center;}
    .input-group-prepend { width: 25%; }
    .input-group { width: 100%; margin: auto;}
    .input-group-text { justify-content: center; background:white ; color: black;}
    form { background-color: white;}
</style>
<form>
    <br>
    <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">음원상세보기</b></h1>
    <br>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">아이디</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%; ">${musicData.id}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">제목</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%; ">${musicData.title}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">가수</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${musicData.artist}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">앨범</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${musicData.album}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">장르</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${musicData.genre}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">분위기</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${musicData.mood}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">음악파일</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${musicData.file_path}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="height: 114px; background-color: mediumslateblue; color:honeydew;">커버이미지</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">
            <c:choose>
                <c:when test="${musicData.cover_img != null}">
                    <img src="<c:url value="/img/"/>${musicData.cover_img }" alt="" />
                </c:when>
                <c:otherwise>
                    커버 이미지 없음
                </c:otherwise>
             </c:choose>
        </span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">날짜</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${musicData.release_date}</span>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">스트리밍횟수</span>
        </div>
        <span class="input-group-text justify-content-start" style="width: 75%;">${musicData.cnt}</span>
    </div>
    <div class="input-group">
        <span class="input-group-text" style="width: 25%; background-color: mediumslateblue; color:honeydew;">가사</span>
        <textarea class="form-control justify-content-start" style="width: 75%;" value="${musicData.lyrics}"></textarea>
    </div>
    <div class="input-group">
        <a class="btn btn-dark col-md-4" href="AdminMusicModify?id=${musicData.id}" style="background-color: mediumpurple; border-color: mediumpurple;"><h5 style="line-height: inherit; font-size: 20px;">수정</h5></a>
        <a class="btn btn-dark col-md-4" href="AdminMusicDelete?id=${musicData.id}" style="background-color: rebeccapurple; border-color:rebeccapurple"><h5 style="line-height: inherit; font-size: 20px;">삭제</h5></a>
        <a class="btn btn-dark col-md-4" href="AdminMusicList" style="background-color: indigo; border-color: indigo;"><h5 style="line-height: inherit; font-size: 20px;">목록으로</h5></a>
    </div>
</form>

