<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    option {text-align: center;}
    .input-group-prepend { width: 25%; }
    .input-group { width: 100%; margin: auto;}
    .input-group-text { justify-content: center; background: mediumslateblue; color: honeydew;}
    form { background-color: white;}
</style>
<form action="AdminMusicModifyReg" method="post" enctype="multipart/form-data">
    <input type = "hidden" value="${musicData.file_path}" name = "filecheck1">
    <input type = "hidden" value="${musicData.cover_img}" name = "filecheck2">
    <input type="hidden" name="nowPage" value="${nowPage }"/>
    <input type="hidden" name="serchName" value="${serchName }"/>
    <br>
    <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">음원수정하기</b></h1>
    <br>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">id</span>
        </div>
        <input type="text" class="form-control" name="id" value="${musicData.id}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">제목</span>
        </div>
        <input type="text" class="form-control" name ="title" value="${musicData.title}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">가수</span>
        </div>
        <input type="text" class="form-control" name ="artist" value="${musicData.artist}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">가수번호</span>
        </div>
        <input type="text" class="form-control" name ="artist_no" value="${musicData.artist_no}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">앨범</span>
        </div>
        <input type="text" class="form-control" name="album" value="${musicData.album}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">장르</span>
        </div>
        <select name="genre" class="form-control" aria-label="성향을 선택해 주세요">
            <option value=${musicData.genre}>현재 곡 장르 : ${musicData.genre}</option>
            <option value="발라드">발라드</option>
            <option value="락">락</option>
            <option value="힙합">힙합</option>
            <option value="댄스">댄스</option>
            <option value="재즈">재즈</option>
            <option value="클래식">클래식</option>
            <option value="팝">팝</option>
        </select>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">음악파일</span>
        </div>
        <input type="file" class="form-control" name="file_path" value="${musicData.file_path}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">이미지파일</span>
        </div>
        <input type="file" class="form-control" name="cover_img" value="${musicData.cover_img}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">날짜</span>
        </div>
        <input type="text" class="form-control" name="release_date" value="${musicData.release_date}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">스트리밍횟수</span>
        </div>
        <input type="text" class="form-control" name="cnt" value="${musicData.cnt}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" style="height: 100%;">가사</span>
        </div>
        <textarea class="form-control" name ="lyrics"  style="width: 75%; height: 30vh;">${musicData.lyrics}</textarea>
    </div>
    <div class="input-group">
        <input type="submit" id="submit" value="수정하기" class="form-control btn col-lg-4" style="background:mediumpurple; color:honeydew; font-size: 20px;">
        <a class="btn btn-dark col-md-4" href="AdminMusicDetail?id=${musicData.id}&nowPage=${nowPage}&serchName=${serchName}" style="background-color: rebeccapurple; "><h5 style="line-height: inherit; font-size: 20px;">뒤로</h5></a>
    </div>
</form>
