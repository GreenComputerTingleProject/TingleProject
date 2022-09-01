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


<style>
    option {text-align: center;}
    .input-group-prepend { width: 25%; }
    .input-group { width: 100%; margin: auto;}
    .input-group-text { justify-content: center; background: mediumslateblue; color: honeydew;}
    form { background-color: white;}
</style>

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
    <br>
    <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">음원등록</b></h1>
    <br>

    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">가수</span>
        </div>
        <input type="text" class="form-control" id="artist" name ="artist" style="width: 40%;"><button type="button" id="serchbtn" onclick="find()">조회하기</button>
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">제목</span>
        </div>
        <input type="text" class="form-control" name ="title">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">가수번호</span>
        </div>
        <input type="text" class="form-control" name ="artist_no">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">앨범</span>
        </div>
        <input type="text" class="form-control" name ="album">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">장르</span>
        </div>
        <select name="genre" class="form-control" aria-label="성향을 선택해 주세요">
            <option value="">-- 장르를 선택해주세요 --</option>
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
            <span class="input-group-text">앨범</span>
        </div>
        <input type="text" class="form-control" name ="album">
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text">날짜</span>
        </div>
        <input type="date" class="form-control" name ="release_date">
    </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <span class="input-group-text" style="height: 100%;">가사</span>
            </div>
            <textarea class="form-control" name ="lyrics" style="width: 75%; height: 30vh;"></textarea>
        </div>
        <div class="input-group">
            <input id="submit" type="submit" value="등록하기" class="form-control btn col-lg-4" style="background:mediumpurple; color:honeydew; font-size: 20px;">
            <a class="btn btn-dark col-md-4" href="AdminMusicList?nowPage=${nowPage}" style="background-color: rebeccapurple; "><h5 style="line-height: inherit; font-size: 20px;">목록으로</h5></a>
        </div>
</form>
