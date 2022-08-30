<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
</form>--%>
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
        <input type="text" class="form-control" name ="arist" value="${musicData.artist}">
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
        <input type="text" class="form-control" name ="genre" value="${musicData.genre}">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">분위기</span>
        </div>
        <input type="text" class="form-control" name="mood" value="${musicData.mood}">
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
            <span class="input-group-text">스트리밍횟수</span>
        </div>
        <input type="text" class="form-control" name="cnt" value="${musicData.cnt}">
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
        <textarea class="form-control" name ="lyrics" value="${musicData.lyrics}"></textarea>
    </div>
    <div class="input-group">
        <input type="submit" id="submit" value="수정하기" class="form-control btn col-lg-4" style="background:mediumpurple; color:honeydew; font-size: 20px;">
        <a class="btn btn-dark col-md-4" href="AdminMusicDetail?id=${musicData.id}" style="background-color: rebeccapurple; "><h5 style="line-height: inherit; font-size: 20px;">뒤로</h5></a>
    </div>
</form>

