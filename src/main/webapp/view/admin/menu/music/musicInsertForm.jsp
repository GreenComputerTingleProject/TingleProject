<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>


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
</form>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    option {text-align: center;}
    .input-group-prepend { width: 25%; }
    .input-group { width: 100%; margin: auto;}
    .input-group-text { justify-content: center; background: mediumslateblue; color: honeydew;}
    form { background-color: white;}
</style>
<form action="AdminMusicInsertReg" method="post" enctype="multipart/form-data">
    <br><br><br>
    <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">음원등록</b></h1>
    <br>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">제목</span>
            </div>
            <input type="text" class="form-control" name ="title">
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">가수</span>
            </div>
            <input type="text" class="form-control" name ="artist">
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">앨범</span>
            </div>
            <input type="text" class="form-control" name ="album">
        </div>
        <select class="form-select" style="width: 100%; margin: auto; border-color: blue;">
            <option selected>-- 음악 성향을 선택해 주세요 --</option>
            <option value="1">클래식</option>
            <option value="2">락</option>
            <option value="3" >블루스</option>
            <option value="4">발라드</option>
            <option value="5">R&B</option>
            <option value="6">팝</option>
            <option value="7">힙합</option>
            <option value="8">메탈</option>
            <option value="9">재즈</option>
        </select>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">장르</span>
            </div>
            <input type="text" class="form-control" name="genre">
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">분위기</span>
            </div>
            <input type="text" class="form-control" name ="mood">
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">음악파일선택</span>
            </div>
            <input type="file" class="form-control" name="file_path">
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text">이미지파일선택</span>
            </div>
            <input type="file" class="form-control" name="cover_img">
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text" style="height: 100%;">가사</span>
            </div>
                <textarea class="form-control" name ="lyrics" value="${musicData.lyrics}"></textarea>
        </div>
        <div class="input-group">
            <input id="submit" type="submit" value="등록하기" class="form-control btn col-lg-4" style="background:mediumpurple; color:honeydew; font-size: 20px;">
            <a class="btn btn-dark col-md-4" href="AdminMusicList" style="background-color: rebeccapurple; "><h5 style="line-height: inherit; font-size: 20px;">목록으로</h5></a>
        </div>
</form>
