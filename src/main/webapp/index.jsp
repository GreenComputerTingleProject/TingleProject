<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tingle</title>
    <link rel="shortcut icon" href="#">
    <script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
    <script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/bootstrap/"/>css/bootstrap.min.css">
    <script type="text/javascript" src="<c:url value="/bootstrap/"/>js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #page-wrapper {
            padding-left: 250px;
        }

        #sidebar-wrapper {
            position: fixed;
            width: 250px;
            height: 100%;
            margin-left: -250px;
            background: black;
            overflow-x: hidden;
            overflow-y: auto;
        }

        #page-content-wrapper {
            width: 100%;
            padding: 20px;
            overflow-y: auto;
        }

        #main_contents {
            overflow-y: auto;
            margin-bottom: 100px;
        }

        #bottom-player-wrapper {
            width: 100%;
            height: 100px;
            background: darkmagenta;
            z-index: 2;
            position: fixed;
            left: 0;
            bottom: 0;
            display: flex;
            justify-content: center;
            align-content: center;
        }

        /* 사이드바 스타일 */
        .sidebar-nav {
            width: 250px;
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .sidebar-nav li {
            text-indent: 1.5em;
            line-height: 2.8em;
        }

        .sidebar-nav li a {
            display: block;
            text-decoration: none;
            color: #999;
        }

        .sidebar-nav li a:hover {
            color: #fff;
            background: rgba(255, 255, 255, 0.2);
        }

        .sidebar-nav > .sidebar-brand {
            font-size: 1.3em;
            line-height: 3em;
        }

        td {
            vertical-align: middle;
        }

        .artist_img {
            width: 150px;
            height: 150px;
            border-radius: 150px;
            overflow: hidden;
            border-radius: 150px;
            background-repeat: no-repeat;
            background-position: 50% 50%;
            background-size: 100% 100%;
            background: black;


        }

        .album_img {
            width: 150px;
            height: 150px;
            vertical-align: top;
            border-radius: 6px;
        }


        .findArtist_List {
            list-style: none;
            display: block;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        }

        .findArtist_li {
            display: inline-block;
            margin-right: 20px;
            text-align: -webkit-match-parent;
        }

        .b-wrap {
            border-top: 0;
            height: 80px;
            border-bottom: 1px solid gray;
        }

        .genreBtn {
            height: 32px;
            padding: 0 15px;
            font-size: 14px;
            line-height: 32px;
            text-align: center;
            border-radius: 16px;
            border: 1px solid purple;
            vertical-align: top;
            display: inline-block;
            background: #fff;


        }

        h1 {
            margin-bottom: 20px;
        }

        .aa {
            display: block;

        }

        /** 하단 플레이어 스타일 */

        .player-control {
            color: white;
        }

        .player-control:hover {
            color: gray;
            cursor: pointer;
        }

        #player-play, #player-pause {
            margin: 25px;
            font-size: 50px;
        }

        .fa-backward, .fa-forward, #player-volume, #player-volume-mute, #player-list {
            margin: 35px;
            font-size: 30px;
        }

        /** 메인 컨텐츠 스타일 */

        #main_contents {
            overflow-y: auto;
            margin-bottom: 100px;
        }

        i:hover {
            cursor: pointer;
        }

        img {
            width: 100px;
            height: 100px;
        }

        td {
            vertical-align: middle;
        }

        #playList {
            width: 500px;
            background: #262626;
            opacity: 90%;
            z-index: 10;
            position: fixed;
            right: 0;
            top: 0;
            bottom: 100px;
            overflow: hidden;
            padding: 40px;
        }

        #playList_title {
            color: white;
        }

        #btn-group {
            position: fixed;
            bottom: 150px;
            left: 50%;
            z-index: 20;
            transform: translate(-50%, 0%);
            border: none;
            display: none;
            width: 300px;
            height: 75px;
        }

        #playList_items {
            color: white;
        }

        #player-title {
            width: 300px;
            color: white;
            line-height: 50px;
            margin-left: 25px;
            margin-right: 25px;
        }

        .progress {
            width: 300px;
            height: 5px;
            margin-top: 50px;
        }

        .progress:hover {
            cursor: pointer;
        }

        #currentTime, #duration {
            line-height: 100px;
            margin: 0 5px 0 5px;
            color: gray;
        }

        #player-volume, #player-volume-mute {
            margin-right: 5px;
        }

        #player-volume-range {
            width: 100px;
            margin-top: 38px;
        }

        #control-zone {
            line-height: 50px;
            font-size: 20px;
        }

        .player-control2 {
            color: gray;
        }

        .player-control2:hover {
            color: darkgray;
            cursor: pointer;
        }

        .player-control2-change {
            color: white;
        }

        .player-control2-change:hover {
            color: darkgray;
            cursor: pointer;
        }

        #player-repeat-1 {
            width: 20px;
            padding-left: 5px;
        }

        input[type=text], [type=password] {
            font-size: 16px;
            padding-right: 30px;
            border: 0;
            border-bottom: 1px solid #ebebeb;
            width: 70%;
            height: 58px;
            font-size: 15px;
            color: #181818;
            border-radius: 0;
            background-color: transparent;
            -webkit-border-radius: 0;
            vertical-align: middle;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        input[type=file] {
            width: 70%;
            margin: 10px auto 0;
        }

        .form-select {
            width: 70%;
            margin: 10px auto 0;
        }

        #submitBtn {
            margin-top: 10px;
        }

        /** 현석 스타일*/

        #suggestion_album {
            width: 100%;
            height: 300px;
            background: #1a1e21;
            margin-bottom: 40px;
        }

        .suggestion_table {
            width: 100%;
            height: 20vh;
            padding-left: 10px;
            border-collapse: separate;
            border-spacing: 10px;
            margin-bottom: 100px;
        }

        .suggestion_detail {
            width: 100%;
            height: 300px;
            background: #ffffff;
            padding: 10px;
            border: 1px #1a1e21 solid;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        #suggestion_lylics {
            width: 100%;
            height: 600px;
            background: #ffffff;
            border: 1px #1a1e21 solid;
            padding: 10px;
        }

        .suggestion_detail > img {
            width: 20%;
            height: 30vh;
        }


        #detailInfo {
            width: 58%;
            height: 30vh;
            background: #ffffff;
        }

        #indexbtn {
            width: 18%;
            height: 30vh;
            background: #ffffff;
        }

        td {
            background: #0dcaf0;
        }

        td > button {
            width: 100%;
            height: 30vh;
        }

        td > button > img {
            width: 100%;
            height: 30vh;
        }

        #boardContainer {
            width: 100%;
            height: 10vh;
            background: #0dcaf0;
            margin-bottom: 10px;
        }

        .board_body{
            width: 100%;
            height: 90vh;
            background: #20c997;
        }

        .board_index {
            width: 100%;
            height: 5vh;
            background: #6f42c1;
        }

        .notice_index {
            cursor : pointer;
            background: #f0f0f0;
        }

        .notice_index:hover {
            background: #f0f0f0;
        }
        /*게시판 스타일*/

        fieldset {
            display: flex;
            align-items: center;
            margin-left: 20px;
            border-style: groove;

        }

        .find_fieldset {
            width: 200px;
            height: 40px;
            border: 1px solid #d2d2d2;
            border-radius: 20px;
            vertical-align: middle;
            padding-right: 20px;
            background: #1a1a1a;
        }

        #findEnter {
            height: 70%;
            width: 80%;
            font-size: 13px;
            border: 0;
            vertical-align: middle;
            padding: 0;
            box-sizing: border-box;
            background: #1a1a1a;
            color: white;

        }

        #ficon {
            color: #a0a0a0;;
            margin: 10px;
            text-indent: 0px;

        }

        /*.lyricsTd{*/
        /*    display: inline-block;*/
        /*    width: 200px;*/
        /*    white-space: nowrap;*/
        /*    overflow: hidden;*/
        /*    text-overflow: ellipsis;*/
        /*    */
        /*}*/
        .b-wrap {

            /*height: 117px;*/
            /*overflow: hidden;*/
            /*white-space: nowrap;*/
            /*text-overflow: ellipsis;*/

        }
        .select_icon> i{
            padding-right: 15px;
        }

    </style>
</head>
<body>
<div id="page-wrapper">
    <!-- 사이드바 -->
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <li class="sidebar-brand">
                <a class = "suggestion" href="#">Tingle</a>
            </li>
            <c:choose>
                <c:when test="${userData == null}">
                    <li><a href="<c:url value="/user/UserLogIn"/>">로그인</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="<c:url value="/user/UserLogOut"/>">로그아웃</a></li>
                </c:otherwise>
            </c:choose>

            <li>
                <fieldset class="find_fieldset">
                    <i id="ficon" class="fa-solid fa-magnifying-glass "></i>
                    <input id="findEnter" class=" find-input iptxt" type="text" placeholder="검색"
                    />
                </fieldset>
            </li>
            <li><a class="suggestion btncolor" href="#">추천</a></li>
            <li><a class="chart" id="chart" href="#">차트</a></li>
            <li><a id="library" href="#">보관함</a></li>
            <li><a id="board" href="#">고객센터</a></li>
            <li><a id="myPage" href="#">마이페이지</a></li>
            <li><a href="admin/AdminLogin">관리자</a></li>
        </ul>
    </div>
    <!-- /사이드바 -->

    <!-- 본문 -->
    <div id="page-content-wrapper">
        <div id="main_contents" class="container-fluid">

            <%-- 추천 --%>
            <div id="main_contents2">
                <div id="suggestion_body">

                </div>
            </div>

                <%--게시판--%>
                <div id ="boardContainer" style="display: none">
                <div><h1>팅글고객센터 입니다</h1></div>
                <div>
                    <input type="button" value="공지사항" id="notice_btn">
                    <input type="button" value="자주받는 질문" id="FAQ_btn">
                    <input type="button" value="1:1문의" id="inquiry_btn">
                </div>
                </div>

                <div class="board_body">

                </div>

                <%-- 상세보기 --%>

                <div id="detail" style="display:none">

                </div>



            <%--차트--%>
            <div class="chartContainer" style="display: none">
                <h1 id="chart_h1">TOP100</h1>
                <button id="top100" class="chart genreBtn" type="button">top100</button>
                <button id="ballad" class="genreBtn" type="button">발라드</button>
                <button id="rock" class="genreBtn" type="button">락</button>
                <button id="hiphop" class="genreBtn" type="button">힙합</button>
                <button id="dance" class="genreBtn" type="button">댄스</button>
                <button id="jazz" class="genreBtn" type="button">재즈</button>
                <button id="classic" class="genreBtn" type="button">클래식</button>
                <button id="pop" class="genreBtn" type="button">팝</button>
            </div>
            <table class="chartTable table table-hover" style="display: none">
                <thead class="table-dark">
                <tr>
                    <th scope="col" width="5%"><input type="checkbox" id="ChartTotalCheckbox"></th>
                    <th scope="col" width="5%">순위</th>
                    <th scope="col" width="5%">곡/앨범</th>
                    <th scope="col" width="20%"></th>
                    <th scope="col" width="15%">아티스트</th>
                    <th scope="col" width="5%">듣기</th>
                    <th scope="col" width="5%">재생목록</th>
                    <th scope="col" width="5%">내 리스트</th>
                    <th scope="col" width="5%">더보기</th>
                </tr>
                </thead>
                <tbody class="chartTbody">

                </tbody>
            </table>

            <%--검색--%>
            <div class="find_Container" style="display: none">
                <h1 id="find_h1">검색결과</h1>
                <div id="findTitle_Container" style="display: none">
                    <h1 id="findTitle_h1">곡 <i class="fa-solid fa-angle-right"></i></h1>
                    <table class="findTitle_table table table-hover">
                        <thead class="table-dark" id="findTitleHead">
                        <tr>
                            <th scope="col" width="5%"><input type="checkbox"></th>
                            <th scope="col" width="5%">곡/앨범</th>
                            <th scope="col" width="20%"></th>
                            <th scope="col" width="15%">아티스트</th>
                            <th scope="col" width="5%">듣기</th>
                            <th scope="col" width="5%">재생목록</th>
                            <th scope="col" width="5%">내 리스트</th>
                            <th scope="col" width="5%">더보기</th>
                        </tr>
                        </thead>
                        <tbody class="findTbody">

                        </tbody>
                    </table>
                </div>

                <div id="findArtist_Container" style="display: none">
                    <h1 id="findArtist_h1">가수 <i class="fa-solid fa-angle-right"></i></h1>
                    <div class="findArtist_Container">
                        <ul class="findArtist_List">

                        </ul>
                    </div>
                </div>
                <div id="findAlbum_Container" style="display: none">
                    <h1 id="findAlbum_h1">앨범 <i class="fa-solid fa-angle-right"></i></h1>
                    <div class="findAlbum_Container">
                        <ul class="findAlbum_List">

                        </ul>
                    </div>
                </div>

                <div id="findLyrics_Container" style="display: none">
                    <h1 id="findLyrics_h1">가사 <i class="fa-solid fa-angle-right"></i></h1>
                    <table class="findLyrics_table table table-hover">
                        <thead class="table-dark" id="findLyricsHead">
                        <tr>
                            <th scope="col" width="5%"><input type="checkbox"></th>
                            <th scope="col" width="5%">곡/가사</th>
                            <th scope="col" width="20%"></th>
                            <th scope="col" width="15%">아티스트</th>
                            <th scope="col" width="5%">앨범</th>
                        </tr>
                        </thead>
                        <tbody class="findLyricsTbody">

                        </tbody>
                    </table>

                </div>
            </div>

            <%-- 보관함--%>
            <table id="dynamicTable" class="table table-hover" style="display: none">
                <thead class="table-dark">
                <tr>
                    <th scope="col" width="5%"><input type="checkbox" id="totalCheckbox"></th>
                    <th scope="col" width="5%">곡/앨범</th>
                    <th scope="col" width="20%"></th>
                    <th scope="col" width="15%">아티스트</th>
                    <th scope="col" width="5%">듣기</th>
                    <th scope="col" width="5%">재생목록</th>
                    <%--                    <th scope="col" width="5%">내 리스트</th>--%>
                    <th scope="col" width="5%">더보기</th>
                </tr>
                </thead>
                <tbody id="dynamicTbody">

                </tbody>
            </table>

            <div id="myPageDiv" style="display: none">

            </div>

            <div id="playList" style="display: none">
                <h3 id="playList_title">재생목록</h3>
                <div id="playList_items">

                </div>
            </div>
        </div>
    </div>
    <!-- /본문 -->

    <!--플레이어-->
    <div id="bottom-player-wrapper">
        <audio id="audio"></audio>
        <img id="player-img" src="<c:url value="/img/"/>default_image.png" alt="">
        <div id="player-title"></div>
        <div id="control-zone">
            <i id="player-shuffle" class="player-control2 fa-solid fa-shuffle"></i>
            <br>
            <i id="player-repeat" class="player-control2 fa-solid fa-repeat"></i>
            <i id="player-repeat-1" class="player-control fa-solid fa-1" style="display: none"></i>
        </div>
        <i class="player-control fa-solid fa-backward"></i>
        <i id="player-play" class="player-control fa-solid fa-play"></i>
        <i id="player-pause" class="player-control fa-solid fa-pause" style="display: none"></i>
        <i class="player-control fa-solid fa-forward"></i>
        <span id="currentTime"></span>
        <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <span id="duration"></span>
        <i id="player-volume" class="player-control fa-solid fa-volume-high"></i>
        <i id="player-volume-mute" class="player-control fa-solid fa-volume-xmark" style="display: none"></i>
        <input id="player-volume-range" type="range" class="form-range" value="100">
        <i id="player-list" class="player-control fa-solid fa-list"></i>
    </div>
    <!--/플레이어-->

    <!--모달1-->
    <div id="modal1" class="modal" style="display: none">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>로그인 필요</h4>
                    <button class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div id="modal-body1" class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>

    <div id="modal2" class="modal" style="display: none">
        <div class="modal-dialog">
            <div class="modal-content">
                <div id="modal-body2" class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <!--/모달-->

    <!--보관함에서 쓰는 미니모달-->
    <div id="btn-group" class="btn-group">
        <button id="unCheck" class="btn btn-primary"><i class="fa-solid fa-x"></i></button>
        <button id="modal_play" class="btn btn-primary"><i class="selectPlay fa-solid fa-play"></i></button>
        <button id="modal_list" class="btn btn-primary"><i class="fa-solid fa-list"></i></button>
        <button id="modal_add" class="btn btn-primary"><i class="fa-solid fa-folder-plus"></i></button>

    </div>
    <!--/미니모달-->
</div>
</body>
<script>
    window.onload = function () {

        let s_UserData;
        let s_LibraryData;
        let isSessionLoaded = false;
        let audio = document.getElementById("audio");;
        let nowPlayList;
        let coverImgList = [];
        let loaded = 0;
        let audioIndex = 0;
        let nowVolume = 1;
        let isShuffle = false;
        let repeatMode = 0;
        let s_SuggestionList;
        let board_data;

        $.ajax({
            type: 'GET',
            url: '<c:url value="/music/MusicSuggestion"/>',
            async: false,
            dataType: 'text',
            success: function (result) {
                s_SuggestionList = JSON.parse(result);
            },
            error: function (e) {
                console.log(e);
            }
        });

        /**추천 초기 화면 등장띠*/
        suggestion();

        if (${userData != null}) {
            getLibrary();
        }

        function getLibrary() {
            $.ajax({
                type: 'GET',
                url: '<c:url value="/music/MusicList_V2"/>',
                async: false,
                dataType: 'text',
                success: function (result) {
                    init(JSON.parse(result));
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }

        function init(libraryData) {
            s_UserData = JSON.parse('${sessionScope.userData}');
            s_LibraryData = libraryData;


            isSessionLoaded = true;

            nowPlayList = [];

            for (const i in s_LibraryData) {
                nowPlayList[i] = "<c:url value="/mp3/"/>" + s_LibraryData[i].file_path;
                coverImgList[i] = "<c:url value="/img/"/>" + s_LibraryData[i].cover_img;
            }

            playListInit();

            // audio = document.getElementById("audio");

            for (const i in nowPlayList) {
                preloadAudio(nowPlayList[i]);
            }
        }

        function preloadAudio(url) {
            const preAudio = new Audio();
            // 파일 로드가 완료되면, loadedAudio()를 콜한다
            // 파일은 캐시로 유지됨
            preAudio.addEventListener('canplaythrough', loadedAudio, false);
            preAudio.src = url;
        }

        function loadedAudio() {
            // 오디오 파일이 로드되었을때마다 호출
            // 트랙 유지
            loaded++;
            if (loaded == nowPlayList.length) {
                // 모든 리스트가 로드되었다면
                loaded = 0;
                audioInit();
            }
        }

        function audioInit() {
            // 파일 완전히 로드된 후
            // 플레이가 온전히 끝나면 다음노래
            audio.onended = function () {
                audioIndex++;
                if (audioIndex >= nowPlayList.length) {
                    // 끝
                    $('#player-play').css('display', 'block');
                    $('#player-pause').css('display', 'none');
                    audioIndex = 0;
                    audio.src = nowPlayList[0];
                    return;
                }
                play(audioIndex);
                playListInit();
            };

            audio.ontimeupdate = function () {
                $('.progress-bar').css("width", (audio.currentTime / audio.duration) * 300);

                $('#currentTime').html(convertTime(Math.floor(audio.currentTime)));
                $('#duration').html(convertTime(Math.floor(audio.duration)));

                if(!isSessionLoaded){
                    if(audio.currentTime >= 60) {
                        audio.pause();
                        audio.currentTime = 0;

                        $('#player-play').css('display', 'block');
                        $('#player-pause').css('display', 'none');

                        $('#modal-body1').text('비회원은 1분 미리듣기만 제공됩니다');
                        $('#modal1').modal('toggle');
                    }
                } else if(s_UserData.membership == 1) {
                    if(audio.currentTime >= 60) {
                        audio.pause();
                        audio.currentTime = 0;

                        $('#player-play').css('display', 'block');
                        $('#player-pause').css('display', 'none');

                        $('#modal-body2').text('일반 회원은 1분 미리듣기만 제공됩니다');
                        $('#modal2').modal('toggle');
                    }
                }
            }

            // 첫곡은 장전시켜둔다.
            audio.src = nowPlayList[0];
        }

        function convertTime(time) {
            const minutes = Math.floor(time / 60);
            const seconds = time % 60;

            function padTo2Digits(num) {
                return num.toString().padStart(2, '0');
            }

            const result = padTo2Digits(minutes) + ':' + padTo2Digits(seconds);
            return result;
        }

        function play(index) {
            audio.src = nowPlayList[index];
            audio.play();
        }

        $('#player-play').click(function () {
            audio.play();
            $('#player-play').css('display', 'none');
            $('#player-pause').css('display', 'block');
        })

        $('#player-pause').click(function () {
            audio.pause();
            $('#player-play').css('display', 'block');
            $('#player-pause').css('display', 'none');
        })

        $('.fa-forward').click(function () {
            audio.pause();

            if (!isShuffle) {
                audioIndex++;

                if (audioIndex == nowPlayList.length) {
                    if (repeatMode == 0 || repeatMode == 2) {
                        audioIndex--;
                    } else if (repeatMode == 1) {
                        audioIndex = 0;
                    }
                }
            } else {
                audioIndex = Math.floor(Math.random() * nowPlayList.length);
            }

            if ($('#player-play').css('display') == 'none') {
                play(audioIndex);
            } else {
                audio.src = nowPlayList[audioIndex];
            }

            playListInit();
        })

        $('.fa-backward').click(function () {
            audio.pause();

            if (!isShuffle) {
                audioIndex--;

                if (audioIndex == -1) {

                    if (repeatMode == 0 || repeatMode == 2) {
                        audioIndex++;
                    } else if (repeatMode == 1) {
                        audioIndex = nowPlayList.length - 1;
                    }
                }
            } else {
                audioIndex = Math.floor(Math.random() * nowPlayList.length);
            }

            if ($('#player-play').css('display') == 'none') {
                play(audioIndex);
            } else {
                audio.src = nowPlayList[audioIndex];
            }

            playListInit();
        })

        $('#player-list').click(function () {
            if ($('#playList').css("display") == 'none') {
                $('#playList').css("display", "block");
            } else {
                $('#playList').css("display", "none");
            }
        })

        $('#library').click(function () {
            $('#modal_add').css("display","none")
            if (!isSessionLoaded) {
                $('#modal-body1').text('로그인 후에 이용할 수 있습니다');
                $('#modal1').modal('toggle');

                return;
            }

            $.ajax({
                type: 'GET',
                url: '<c:url value="/music/MusicList_V2"/>',
                async: false,
                dataType: 'text',
                success: function (result) {
                    s_LibraryData = JSON.parse(result);

                    coverImgList = [];

                    for (const i in s_LibraryData) {
                        coverImgList[i] = "<c:url value="/img/"/>" + s_LibraryData[i].cover_img;
                    }

                    allEmpty();
                    drawLibraryList();
                    detailClick(s_LibraryData);
                },
                error: function (e) {
                    console.log(e);
                }
            });
        })

        $("#myPage").click(function () {
            $('#modal_add').css("display","")
            if (!isSessionLoaded) {
                $('#modal-body1').text('로그인 후에 이용할 수 있습니다');
                $('#modal1').modal('toggle');
                return;
            }

            $.ajax({
                type: 'GET',
                url: '<c:url value="/pay/PayMyList"/>',
                async: false,
                dataType: 'text',
                success: function (result) {
                    allEmpty();
                    drawMyPageList(JSON.parse(result));
                },
                error: function (e) {
                    console.log(e);
                }
            });
        })

        function drawLibraryList() {
            $('#dynamicTable').css('display', 'block');
            $('#myPageDiv').css('display', 'none');

            let html = "";

            for (const i in s_LibraryData) {
                html += '<tr>';
                html += '<td scope="row">' + '<input class="check" type="checkbox" name="check">' + '</td>';
                html += '<td>' + '<img class="innerImg" src="" alt="">' + '</td>';
                html += '<td>' + s_LibraryData[i].title + '<br>' + s_LibraryData[i].album + '</td>';
                html += '<td>' + s_LibraryData[i].artist + '</td>';
                html += '<td>' + '<i class="selectPlay fa-solid fa-play"></i>' + '</td>';
                html += '<td>' + '<i class="selectList fa-solid fa-list"></i>' + '</td>';
                html += '<td>' + '<i class="fa-solid fa-ellipsis-vertical" data-bs-toggle="dropdown"></i>'
                    + '<ul class="dropdown-menu">'
                    + '<li><a class="dropMusicInfo dropdown-item" href="#">곡 정보</a></li>'
                    + '<li><a class="dropAlbumInfo dropdown-item" href="#">앨범 정보</a></li>'
                    + '<li><a class="dropArtistInfo dropdown-item" href="#">아티스트 정보</a></li>'
                    + '<li><a class="dropRemove dropdown-item" href="#">보관함에서 삭제</a></li>'
                    + '</ul>' + '</td>';
                html += '</tr>';
            }

            $("#dynamicTbody").empty();
            $("#dynamicTbody").append(html);

            let innerImg = document.getElementsByClassName("innerImg");
            let selectPlay = document.getElementsByClassName("selectPlay");
            let selectList = document.getElementsByClassName("selectList");
            let dropRemove = document.getElementsByClassName("dropRemove");
            let check = document.getElementsByClassName("check");
            let totalCheck = document.getElementById("totalCheckbox");
            let unCheck = document.getElementById("unCheck");

            for (let i = 0; i < innerImg.length; i++) {
                innerImg[i].src = coverImgList[i];

                selectPlay[i].addEventListener('click', function () {
                    $('#player-play').css('display', 'block');
                    $('#player-pause').css('display', 'none');
                    audio.pause();

                    nowPlayList = [];
                    nowPlayList.push("<c:url value="/mp3/"/>" + s_LibraryData[i].file_path);

                    for (const i in nowPlayList) {
                        preloadAudio(nowPlayList[i]);
                    }

                    audioIndex = 0;

                    playListInit();

                    setTimeout(() => {
                        $('#player-play').css('display', 'none');
                        $('#player-pause').css('display', 'block');
                        audio.play();
                    }, 300);
                })

                selectList[i].addEventListener('click', function () {
                    nowPlayList.push("<c:url value="/mp3/"/>" + s_LibraryData[i].file_path);

                    playListInit();
                })


                dropRemove[i].addEventListener('click', function () {
                    $.ajax({
                        type: 'GET',
                        url: '<c:url value="/music/MusicRemoveLibrary"/>',
                        data: 'music_id=' + s_LibraryData[i].id,
                        async: false,
                        success: function (result) {
                            getLibrary();
                            drawLibraryList();
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    });
                })

                check[i].addEventListener('change', function () {
                    checkBoxJudge(totalCheck, check);
                })
            }

            totalCheck.addEventListener('change', function () {
                totalChange(totalCheck, check);
            })

            unCheck.addEventListener('click', function () {
                totalCheck.checked = false;
                totalChange(totalCheck, check);
            })
        }

        function drawMyPageList(payList) {
            $('#dynamicTable').css('display', 'none');
            $('#myPageDiv').css('display', 'block');

            let html = "";

            html += '<h2>' + '마이페이지' + '</h2>';
            html += '<div class="card">';
            html += '<div class="card-body">';
            html += '<img src="" id="profile-img">';
            html += s_UserData.nickname + '님';
            if (s_UserData.membership == 1) {
                html += '<br>' + '일반 회원';
            } else {
                html += '<br>' + '구독 회원';
            }
            html += '<div style="float : right">';
            if (s_UserData.membership == 1) {
                html += '<a href="<c:url value="/pay/PayMembership"/>">멤버쉽 가입하기</a>';
            }
            html += '</div>';
            html += '</div>';
            html += '</div>' + '<br>';

            html += '<h4>정보 변경</h4>';
            html += '<div id="box2"><div class="card card-body">';
            html += '<form action="<c:url value="/user/UserInfoUpdate"/>" align=center method="post" enctype="multipart/form-data">';
            html += '<input type="hidden" id="session_id" name="id">';
            html += '<input type="text" id="nickname" name="nickname" placeholder="닉네임"><br>';
            html += '<input type="text" id="phone" name="phone" placeholder="전화번호"><br>';
            html += '<input type="text" id="email" name="email" placeholder="이메일"><br>';
            html += '<input class="form-control" type="file" id="image" name="image">';
            html += '<select class="form-select" name="personal_type" aria-label="성향을 선택해 주세요">';
            html += '<option value="">--음악 성향을 선택해 주세요--</option>';
            html += '<option value="classic">클래식</option>';
            html += '<option value="rock">락</option>';
            html += '<option value="blues">블루스</option>';
            html += '<option value="ballad">발라드</option>';
            html += '<option value="rnb">R&B</option>';
            html += '<option value="pop">팝</option>';
            html += '<option value="hiphop">힙합</option>';
            html += '<option value="metal">메탈</option>';
            html += '<option value="jazz">재즈</option>';
            html += '</select>';
            html += '<button type="submit" id="submitBtn" class="btn btn-primary">제출</button>';
            html += '</form>';
            html += '</div>';
            html += '</div><br>';

            html += '<h4>결제 내역</h4>';
            html += '<div id="box3"><div class="card card-body">';
            html += '<table class="table table-hover">';
            html += '<thead class="table-dark">';
            html += '<tr>';
            html += '<th scope="col">주문번호</th>'
            html += '<th scope="col">결제일자</th>'
            html += '<th scope="col">결제금액</th>'
            html += '</tr>';
            html += '</thead>';
            for (const i in payList) {
                html += '<tr>';
                html += '<td>'+payList[i].imp_uid+'</td>';
                html += '<td>'+payList[i].reg_date+'</td>';
                html += '<td>'+payList[i].paid_amount + '원' +'</td>';
                html += '</tr>';
            }
            html += '</table>';
            html += '</div>';

            $("#myPageDiv").empty();
            $("#myPageDiv").append(html);

            $('#session_id').val(s_UserData.id);
            $('#profile-img').attr('src', "<c:url value="/img/"></c:url>" + s_UserData.profile_image);
        }

        function totalChange(totalCheck, check) {
            for (let i = 0; i < check.length; i++) {
                check[i].checked = totalCheck.checked;
            }

            checkBoxJudge(totalCheck, check);
        }

        function checkBoxJudge(totalCheck, check) {
            let isChecked = false;
            let cnt = 0;

            for (const i in check) {
                if (check[i].checked) {
                    cnt++;
                    isChecked = true;
                }
            }

            if (cnt == check.length) {
                totalCheck.checked = true;
            } else {
                totalCheck.checked = false;
            }

            if (isChecked) {
                $('#btn-group').css('display', 'inline-flex');
            } else {
                totalCheck.checked = false;
                $('#btn-group').css('display', 'none');
            }
        }



        $('#modal_play').click(function () {
            let check = document.getElementsByClassName("check");
            let checkNum = [];

            $('#player-play').css('display', 'block');
            $('#player-pause').css('display', 'none');
            audio.pause();

            for (const i in check) {
                if (check[i].checked) {
                    checkNum.push(i);
                }
            }

            nowPlayList = [];

            for (const i in checkNum) {
                nowPlayList.push("<c:url value="/mp3/"/>" + s_LibraryData[checkNum[i]].file_path);
            }

            for (const i in nowPlayList) {
                preloadAudio(nowPlayList[i]);
            }

            audioIndex = 0;

            playListInit();

            setTimeout(() => {
                $('#player-play').css('display', 'none');
                $('#player-pause').css('display', 'block');
                audio.play();
            }, 300);
        })

        $('#modal_list').click(function () {
            let check = document.getElementsByClassName("check");
            let checkNum = [];

            for (const i in check) {
                if (check[i].checked) {
                    checkNum.push(i);
                }
            }

            for (const i in checkNum) {
                nowPlayList.push("<c:url value="/mp3/"/>" + s_LibraryData[checkNum[i]].file_path);
            }

            playListInit();
        })

        $('#modal_add').click(function () {

            let check = document.getElementsByClassName("check");
            let checkNum = [];
            let s_LibraryDatas = [];


            for (const i in check) {
                if (check[i].checked) {
                    checkNum.push(i);
                    s_LibraryDatas.push(s_LibraryData[i].id);
                    console.log(s_LibraryDatas);
                }
            }

            console.log("ss"+s_LibraryDatas);
                $.ajax({
                    type: 'GET',
                    url: '<c:url value="/music/MusicAddLibrary"/>',
                    data: 'music_id=' +s_LibraryDatas,
                    async: false,
                    success: function (result) {
                        getLibrary();

                    },
                    error: function (e) {
                        console.log(e);
                    }
                });


        })






        function playListInit() {
            let html = "";

            for (const i in nowPlayList) {
                let songName = nowPlayList[i].substring( ("<c:url value="/mp3/"/>").length ).split('.')[0];

                if (i == audioIndex) {
                    html += '<div style="color: red">' + songName + '</div>';
                } else {
                    html += '<div>' + songName + '</div>';
                }
            }

            $("#playList_items").empty();
            $("#playList_items").append(html);

            for (const i in s_LibraryData) {
                if (("<c:url value="/mp3/"/>" + s_LibraryData[i].file_path) == nowPlayList[audioIndex]) {
                    $("#player-img").attr('src', "<c:url value="/img/"/>" + s_LibraryData[i].cover_img);

                    let html = s_LibraryData[i].title + '<br>' + s_LibraryData[i].album
                    $("#player-title").empty();
                    $("#player-title").append(html);
                }
            }
        }

        $(".progress").click(function (e) {
            let x = e.pageX - $('.progress').offset().left;
            $('.progress-bar').css("width", x);

            audio.currentTime = audio.duration * ((x / 3) / 100);
        });

        $("#player-volume").click(function () {
            $("#player-volume").css("display", "none");
            $("#player-volume-mute").css("display", "block");

            audio.volume = 0;
            $("#player-volume-range").val(0);
        })

        $("#player-volume-mute").click(function () {
            $("#player-volume").css("display", "block");
            $("#player-volume-mute").css("display", "none");

            audio.volume = nowVolume;
            $("#player-volume-range").val(nowVolume * 100);
        })

        $("#player-volume-range").change(function () {
            $("#player-volume").css("display", "block");
            $("#player-volume-mute").css("display", "none");
            nowVolume = ($("#player-volume-range").val()) / 100;
            audio.volume = nowVolume;
        })

        $("#player-shuffle").click(function () {
            if (!isShuffle) {
                isShuffle = true;
                $("#player-shuffle").removeClass("player-control2");
                $("#player-shuffle").addClass("player-control2-change");

                audio.onended = function () {

                    if (repeatMode != 2) {
                        audioIndex = Math.floor(Math.random() * nowPlayList.length);

                        if (audioIndex >= nowPlayList.length) {
                            // 끝
                            $('#player-play').css('display', 'block');
                            $('#player-pause').css('display', 'none');
                            audioIndex = 0;
                            audio.src = nowPlayList[0];

                            if (repeatMode == 0) {
                                return;
                            }
                        }
                    }

                    play(audioIndex);
                    playListInit();
                };
            } else {
                isShuffle = false;
                $("#player-shuffle").removeClass("player-control2-change");
                $("#player-shuffle").addClass("player-control2");

                audio.onended = function () {

                    if (repeatMode != 2) {
                        audioIndex++;

                        if (audioIndex >= nowPlayList.length) {
                            // 끝
                            $('#player-play').css('display', 'block');
                            $('#player-pause').css('display', 'none');
                            audioIndex = 0;
                            audio.src = nowPlayList[0];

                            if (repeatMode == 0) {
                                return;
                            }
                        }
                    }

                    play(audioIndex);
                    playListInit();
                };
            }
        })

        $("#player-repeat").click(function () {
            if (repeatMode == 0) {
                repeatMode = 1;
                $("#player-repeat").removeClass("player-control2");
                $("#player-repeat").addClass("player-control2-change");

                audio.onended = function () {
                    if (isShuffle) {
                        audioIndex = Math.floor(Math.random() * nowPlayList.length);
                    } else {
                        audioIndex++;
                    }

                    if (audioIndex >= nowPlayList.length) {
                        // 끝
                        audioIndex = 0;
                        audio.src = nowPlayList[0];
                    }
                    play(audioIndex);
                    playListInit();
                };
            } else if (repeatMode == 1) {
                repeatMode = 2;
                $("#player-repeat").removeClass("player-control2-change");
                $("#player-repeat").addClass("player-control2");
                $("#player-repeat").css("display", "none");
                $("#player-repeat-1").css("display", "inline-block");

                audio.onended = function () {
                    play(audioIndex);
                    playListInit();
                };
            }
        })

        $("#player-repeat-1").click(function () {
            if (repeatMode == 2) {
                repeatMode = 0;
                $("#player-repeat").css("display", "inline-block");
                $("#player-repeat-1").css("display", "none");

                audio.onended = function () {
                    if (isShuffle) {
                        audioIndex = Math.floor(Math.random() * nowPlayList.length);
                    } else {
                        audioIndex++;
                    }

                    if (audioIndex >= nowPlayList.length) {
                        // 끝
                        $('#player-play').css('display', 'block');
                        $('#player-pause').css('display', 'none');
                        audioIndex = 0;
                        audio.src = nowPlayList[0];
                        return;
                    }
                    play(audioIndex);
                    playListInit();
                };
            }
        })

        /**현석 스크립트*/
        $('.btncolor').click(function () {

        })

        $('.suggestion').click(function () {
            allEmpty();
            $('#modal_add').css("display","")
            suggestion();
        })

         function suggestion() {

            let html = '';
            let data = new Array();
            allEmpty();
            $('#suggestion_body').css('display', 'block');
            html += '<div id ="suggestion_album"></div>';

            for (const i in s_SuggestionList) {
                let jArrays = s_SuggestionList[i];
                html += '<h2>' + jArrays[0].kind + '</h2>';
                html += '<table class = suggestion_table>';
                html += '<tr>';
                for (const i in jArrays) {
                    data.push(jArrays[i])
                    html += '<td width="20%">' + '<button type ="button" class = "viewDetail" >';
                    html += '<img src="img/' + jArrays[i].cover_img + '"/></button>';
                    html += jArrays[i].title;
                    html += '<div class="select_icon"><i class="selectPlay fa-solid fa-play"></i>';
                    html += '<i class="selectList fa-solid fa-list"></i>';
                    html += '<i class="s_selectAdd fa-solid fa-folder-plus"></i></div>';
                    html += '</td>';
                }
                html += '</tr>';
                html += '</table>';
            }

            $("#suggestion_body").empty();
            $("#suggestion_body").append(html);

            // 배열
            let viewDetail = document.getElementsByClassName('viewDetail');
            let selectPlay = document.getElementsByClassName("selectPlay");
            let selectList = document.getElementsByClassName("selectList");
            let s_selectAdd = document.getElementsByClassName("s_selectAdd");

            selects(data,selectPlay,selectList,s_selectAdd);


            // 추천 노래의 이미지를 눌렀을때
            for (let i = 0; i < viewDetail.length; i++) {
                viewDetail[i].addEventListener('click', function () {

                    // 오브젝트 배열
                    $("#suggestion_body").empty();
                    $('#suggestion_body').css('display', 'block');
                    let html = '';

                    html += '<div class="suggestion_detail"><img src="img/' + data[i].cover_img + '">';
                    html += '<div id="detailInfo"><div><h4 class="detail_album">' + data[i].album + '<h4></div>'
                    html += '<div><h3 class="detail_title">' + data[i].title + '</h3></div>';
                    html += '<div><h3 class="detail_artist">' + data[i].artist + '</h3></div>';
                    html += '<div><h2 >' + data[i].genre + '</h2></div>';
                    html += '<div><h2>' + data[i].release_date + '</h2></div>';
                    html += '<div class="select_icon"><i class="selectPlay fa-solid fa-play"></i>'
                    html += '<i class="selectList fa-solid fa-list" id = "selectList"></i>';
                    html += '<i class="selectAdd fa-solid fa-folder-plus"></i>' + '</div></div>';
                    html += '<div id="indexbtn"><button type="button" id="go_suggestion" ><h5>뒤로<h5></button></div>'
                    html += '</div>'
                    html += '<div id ="suggestion_lylics">'
                    html +=  data[i].lyrics + '</div>'
                    $("#suggestion_body").append(html);

                    let selectPlay = document.getElementsByClassName("selectPlay");
                    let selectList = document.getElementsByClassName("selectList");
                    let selectAdd = document.getElementsByClassName("selectAdd");

                    selectPlay[0].addEventListener('click', function () {
                        $('#player-play').css('display', 'block');
                        $('#player-pause').css('display', 'none');
                        audio.pause();

                        nowPlayList = [];
                        nowPlayList.push("<c:url value="/mp3/"/>" + data[i].file_path);

                        for (const i in nowPlayList) {
                            preloadAudio(nowPlayList[i]);
                        }

                        audioIndex = 0;

                        playListInit3(data[i]);

                        setTimeout(() => {
                            $('#player-play').css('display', 'none');
                            $('#player-pause').css('display', 'block');
                            audio.play();
                        }, 300);
                    })

                    selectList[0].addEventListener('click', function () {
                        nowPlayList.push("<c:url value="/mp3/"/>" + data[i].file_path);

                        playListInit3(data[i]);
                    })

                    selectAdd[0].addEventListener('click', function () {
                        if(isSessionLoaded) {
                            $.ajax({
                                type: 'GET',
                                url: '<c:url value="/music/MusicAddLibrary"/>',
                                data: 'music_id=' + data[i].id,
                                async: false,
                                success: function (result) {
                                    getLibrary();
                                    $('#modal-body2').text('보관함에 추가되었습니다');
                                    $('#modal2').modal('toggle');

                                },
                                error: function (e) {
                                    console.log(e);
                                }
                            });
                        }
                    })


                    document.getElementById('go_suggestion').addEventListener('click', function () {
                        // suggestion();
                    })

                })
            }
        }

        function selects(data, selectPlay, selectList, s_selectAdd){
            for (let i = 0; i < selectList.length; i++) {

                selectPlay[i].addEventListener('click', function () {
                    $('#player-play').css('display', 'block');
                    $('#player-pause').css('display', 'none');
                    audio.pause();

                    nowPlayList = [];
                    nowPlayList.push("<c:url value="/mp3/"/>" + data[i].file_path);

                    for (const i in nowPlayList) {
                        preloadAudio(nowPlayList[i]);
                    }

                    audioIndex = 0;

                    playListInit2(data);

                    setTimeout(() => {
                        $('#player-play').css('display', 'none');
                        $('#player-pause').css('display', 'block');
                        audio.play();
                    }, 300);
                })
            }

            for (let i = 0; i < selectList.length; i++) {
                selectList[i].addEventListener('click', function () {
                    nowPlayList.push("<c:url value="/mp3/"/>" + data[i].file_path);

                    playListInit2(data);
                })
            }

            // 여기가 추천에서 add 누른거
            for (let i = 0; i < s_selectAdd.length ; i++) {
                s_selectAdd[i].addEventListener('click', function () {
                    if(isSessionLoaded){
                        console.log("보내보내내");
                        $.ajax({
                            type: 'GET',
                            url: '<c:url value="/music/MusicAddLibrary"/>',
                            data: 'music_id=' + data[i].id,
                            async: false,
                            success: function (result) {
                                getLibrary();
                                $('#modal-body2').text('보관함에 추가되었습니다');
                                $('#modal2').modal('toggle');

                            },
                            error: function (e) {
                                console.log(e);
                            }
                        });
                    }
                })
            }
        }



        function playListInit2(data) {
            let html = "";

            for (const i in nowPlayList) {
                let songName = nowPlayList[i].substring( ("<c:url value="/mp3/"/>").length ).split('.')[0];

                if (i == audioIndex) {
                    html += '<div style="color: red">' + songName + '</div>';
                } else {
                    html += '<div>' + songName + '</div>';
                }
            }

            $("#playList_items").empty();
            $("#playList_items").append(html);

            for (const i in data) {
                if (("<c:url value="/mp3/"/>" + data[i].file_path) == nowPlayList[audioIndex]) {
                    $("#player-img").attr('src', "<c:url value="/img/"/>" + data[i].cover_img);

                    let html = data[i].title + '<br>' + data[i].album;
                    $("#player-title").empty();
                    $("#player-title").append(html);
                    console.log("플레이어 인잇2 성공");
                }
            }
        }

        function playListInit3(data) {
            let html = "";

            for (const i in nowPlayList) {
                let songName = nowPlayList[i].substring( ("<c:url value="/mp3/"/>").length ).split('.')[0];

                if (i == audioIndex) {
                    html += '<div style="color: red">' + songName + '</div>';
                } else {
                    html += '<div>' + songName + '</div>';
                }
            }

            $("#playList_items").empty();
            $("#playList_items").append(html);

            for (const i in data) {
                if (("<c:url value="/mp3/"/>" + data.file_path) == nowPlayList[audioIndex]) {
                    $("#player-img").attr('src', "<c:url value="/img/"/>" + data.cover_img);

                    let html = data.title + '<br>' + data.album;
                    $("#player-title").empty();
                    $("#player-title").append(html);
                    console.log("플레이어 인잇2 성공");
                }
            }
        }

        function allEmpty() {
            let dt = document.getElementById("dynamicTable");
            dt.style.display = "none";
            $("#myPageDiv").empty();
            $("#dynamicTbody").empty();
            $("#suggestion_body").empty();
            $(".board_body").css("display", "none");
            $(".chartContainer").attr("style", "display:none");
            $(".chartTable").attr("style", "display:none")
            $(".chartTbody").empty();
            $('#btn-group').css('display', 'none');
            $('#totalCheckbox').prop("checked", false);
            $('#ChartTotalCheckbox').prop("checked", false);

            $(".find_Container").css("display", "none");
            $('#findTitle_Container').css("display", "none");
            $('#findAlbum_Container').css("display", "none");
            $('#findArtist_Container').css("display", "none");
            $('#findLyrics_Container').css("display", "none");
            $("#boardContainer").attr("style", "display:none");
            $(".findTbody").empty();
            $(".findArtist_List").empty();
            $(".findAlbum_List").empty();
            $(".findLyricsTbody").empty();
        }
        // 게시판 클릭시 - 현석
        document.getElementById("notice_btn").addEventListener('click', function (){
            board_notice();
        })

        document.getElementById("FAQ_btn").addEventListener('click', function (){
            board_FAQ();
        })

        document.getElementById("inquiry_btn").addEventListener('click', function (){
            board_inquriry();
        })

        $('#board').click(function () {
            board_notice();
            $('#modal_add').css("display", "")

        })

        // 공지사항 클릭
        function board_notice(){

            $.ajax({
                type: 'GET',
                url: '<c:url value="/board/BoardNotice"/>',
                async: false,
                dataType: 'text',
                success: function (results) {
                    board_data = JSON.parse(results);
                    console.log(board_data);
                },
                error: function (e) {
                    console.log(e);
                }
            });

            let html = '';

            allEmpty();
            $('#boardContainer').css('display', 'block');
            $('.board_body').css('display', '');
            html += '게시판 바디입니다';
            html += '<div class="board_index"><table width="100%"><tr>';
            html += '<td width="25%">번호</td>';
            html += '<td>분류</td>';
            html += '<td>제목</td>';
            html += '<td>날짜</td>';
            html += '</tr></table></div>';
            for (const i in board_data) {
                html += '<div class="notice_index" ><table width="100%"><tr class="noticeDetail">';
                html += '<td width="25%">' + board_data[i].id + '</td>';
                html += '<td>'+ board_data[i].kind +'</td>';
                html += '<td>'+ board_data[i].title +'</td>';
                html += '<td>'+ board_data[i].reg_date +'</td>';
                html += '</tr></table></div>';
            }
            $('.board_body').empty();
            $('.board_body').append(html);

            let noticeDetail = document.getElementsByClassName('noticeDetail');

            for (let i = 0; i < noticeDetail.length ; i++) {

                noticeDetail[i].onclick = function (){
                    notice_Detail(board_data[i]);
                }
            }


        }

        function notice_Detail(data){
            allEmpty();
            $('#boardContainer').css('display', 'block');
            $('.board_body').css('display', '');

            let html = '';

            html += '<div id="noticeForm">';
            html += '<div id="noticeheader"><h2>'+"공지사항"+'<h2><input type="button" id="indexbtn" value="목록으로 돌아가기"></div>';
            html += '<div>';
            html += '<div>'+data.title+'</div>';
            html += '<div>'+data.nickname+'</div>';
            html += '<div>'+data.reg_date+'</div>';
            html += '</div>';
            html += '<div>'+data.content+'</div>';
            html += '</div>';
            $('.board_body').empty();
            $('.board_body').append(html);

            document.getElementById('indexbtn').addEventListener('click', function (){
                board_notice();
                console.log("공지사항으로 돌아가")
            })
        }

        // FAQ 클릭
        function board_FAQ(){

            $.ajax({
                type: 'GET',
                url: '<c:url value="/board/BoardFAQ"/>',
                async: false,
                dataType: 'text',
                success: function (results) {
                    board_data = JSON.parse(results);
                    console.log(board_data);
                },
                error: function (e) {
                    console.log(e);
                }
            });

            let html = '';
            allEmpty();
            $('#boardContainer').css('display', 'block');
            $('.board_body').css('display', '');
            html += '자주받는 질문입니다(멍청이들의모임)';
            html += '<div class="board_index"><table width="100%"><tr>';
            html += '<td width="33%">번호</td>';
            html += '<td>분류</td>';
            html += '<td>제목</td>';
            html += '</tr></table></div>';
            for (const i in board_data) {
                html += '<div class="notice_index" ><table width="100%"><tr class="FAQDetail">';
                html += '<td width="25%">' + board_data[i].id + '</td>';
                html += '<td>'+ board_data[i].kind +'</td>';
                html += '<td>'+ board_data[i].title +'</td>';
                html += '</tr></table></div>';
            }
            $('.board_body').empty();
            $(".board_body").append(html);

            let FAQDetail = document.getElementsByClassName('FAQDetail');

            for (let i = 0; i < FAQDetail.length ; i++) {

                FAQDetail[i].onclick = function (){
                    FAQ_Detail(board_data[i]);
                }
            }
        }

        function FAQ_Detail(data){
            allEmpty();
            $('#boardContainer').css('display', 'block');
            $('.board_body').css('display', '');

            let html = '';

            html += '<div id="noticeForm">';
            html += '<div id="noticeheader"><h2>'+"FAQ"+'<h2><input type="button" id="FAQbtn" value="목록으로 돌아가기"></div>';
            html += '<div>';
            html += '<div>['+data.kind+']</div>';
            html += '<div>'+data.title+'</div>';
            html += '</div>';
            html += '<div>'+data.content+'</div>';
            html += '</div>';
            $('.board_body').empty();
            $('.board_body').append(html);

            document.getElementById('FAQbtn').addEventListener('click', function (){
                board_FAQ();
            })
        }

        // inquriry 클릭
        function board_inquriry(){

            $.ajax({
                type: 'GET',
                url: '<c:url value="/board/BoardInquiry"/>',
                data: 'user_id=' + s_UserData.id,
                async: false,
                dataType: 'text',
                success: function (results) {
                    board_data = JSON.parse(results);
                    console.log(board_data);
                },
                error: function (e) {
                    console.log(e);
                }
            });

            let html = '';
            allEmpty();
            $('#boardContainer').css('display', 'block');
            $('.board_body').css('display', '');

            html += '1:1문의입니다';
            html += '<div><input type="button" value="문의 내역" id ="inquriryHistory">';
            html += '<input type="button" value="문의하기" id="doInquriry"></div>';
            html += '<div class="board_index"><table width="100%"><tr>';
            html += '<td width="20%">번호</td>';
            html += '<td>분류</td>';
            html += '<td>제목</td>';
            html += '<td>날짜</td>';
            html += '<td>답변여부</td>';
            html += '</tr></table></div>';
            for (const i in board_data) {
                html += '<div class="notice_index" ><table width="100%"><tr class="inquriryDetail">';
                html += '<td width="20%">' + board_data[i].id + '</td>';
                html += '<td>'+ board_data[i].kind +'</td>';
                html += '<td>'+ board_data[i].title +'</td>';
                html += '<td>'+ board_data[i].reg_date +'</td>';
                html += '<td>'+ board_data[i].checked +'</td>';
                html += '</tr></table></div>';
            }
            $('.board_body').empty();
            $(".board_body").append(html);

            document.getElementById("doInquriry").addEventListener('click', function () {
                do_inquriry();
            })

            let inquriryDetail = document.getElementsByClassName('inquriryDetail');

            for (let i = 0; i < inquriryDetail.length ; i++) {

                inquriryDetail[i].onclick = function (){
                    inquriry_Detail(board_data[i]);
                }
            }
        }
        function inquriry_Detail(data){
            allEmpty()
            $('#boardContainer').css('display', 'block');
            $('.board_body').css('display', '');

            let html = '';

            html += '<div id="noticeForm">';
            html += '<div id="noticeheader"><h2>'+"문의내역"+'<h2><input type="button" id="indexbtn" value="목록으로 돌아가기"></div>';
            html += '<div>';
            html += '<div>['+data.kind+']</div>';
            html += '<div>'+data.title+'</div>';
            html += '</div>';
            html += '<div>'+data.content+'</div>';
            if(data.checked == "답변완료"){
                html += '<div>'+data.answer+'</div>';
            }
            html += '</div>';
            $('.board_body').empty();
            $('.board_body').append(html);

            document.getElementById('indexbtn').addEventListener('click', function (){
                board_inquriry();
            })
        }

        function do_inquriry(){
            document.getElementById("doInquriry").addEventListener('click', function (){
                allEmpty();
                $('#boardContainer').css('display', 'block');
                $('.board_body').css('display', '');

                let html = '';

                html += '<div>1:1문의 글쓰기<input type="button" id="indexbtn" value="목록으로 돌아가기"></div>';
                html += '<div>'+s_UserData.nickname+'</div>';
                html += '<div>분류<input type="text" id = "inquriryKind"></div>';
                html += '<div>제목<input type="text" id = "inquriryTitle"></div>';
                html += '<div>상세내용<input type="text" id="inquriryContent"></div>';
                html += '<div><input type="button" value="작성하기" id="dobtn"></div>';
                html += '<div><input type="hidden" value="미확인" id="inquriryChecked">';
                $('.board_body').empty();
                $('.board_body').append(html);

                document.getElementById('indexbtn').addEventListener('click', function (){
                    board_inquriry();
                })

                document.getElementById("dobtn").addEventListener('click', function () {
                    $.ajax({
                        type: 'GET',
                        url: '<c:url value="/board/BoardInquiryReg"/>',
                        data: {"user_id" : s_UserData.id,
                            "nickname" : s_UserData.nickname,
                            "login_id" : s_UserData.login_id,
                            "kind" : $('#inquriryKind').val(),
                            "title" : $('#inquriryTitle').val(),
                            "content" : $('#inquriryContent').val(),
                            "checked" : $('#inquriryChecked').val()
                        },
                        async: false,
                        dataType: 'text',
                        success: function (results) {
                            alert("작성완료");
                            board_inquriry();
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    });
                })
            })
        }

        //차트 클릭시
        $('.chart').click(function () {

            allEmpty();
            // $('#top100').attr("style", "background: purple");
            $('.chartTable').attr("style", "display:");
            $('.chartContainer').attr("style", "display:");
            $('#chart_h1').html("TOP100");
            $('#modal_add').css("display", "")
            $.ajax({
                url: "<c:url value="/chart/ChartTop100"/>",
                type: "GET",
                dataType: 'text',
                async: false,

                success: function (data) {
                    const json = JSON.parse(data);
                    console.log("----차트 json----")
                    console.log(json);

                    s_LibraryData = json;
                    console.log(s_LibraryData);

                    $('.find_Container').attr("style", "display:none");
                    $('.find_title').empty();
                    $('.find_artist').empty();
                    $('.chartTbody').empty();

                    let html = "";

                    //Top100
                    $.each(json, function (i, item) {

                        html = $('<tr class="b-wrap">' +
                            '<td scope="row">' +
                            '<input class="check" type="checkbox" name="check">' +
                            '</td>' +
                            '<td id="rank">' + (i + 1) + '</td>' +
                            '<td>' +
                            '<img class="innerImg" src="img/' + item.cover_img + '">' +
                            '</td>' +
                            '<td id="title">' + item.title + '<br>' + item.album + '</td>' +
                            '<td id="artist">' + item.artist + '</td>' +
                            '<td>' +
                            '<i class="selectPlay fa-solid fa-play"></i>' +
                            '</td>' +
                            '<td>' +
                            '<i class="selectList fa-solid fa-list"></i>' +
                            '</td>' +
                            '<td>' +
                            '<i class="selectAdd fa-solid fa-folder-plus"></i>' +
                            '</td>' +
                            '<td>' + '<i class="fa-solid fa-ellipsis-vertical" data-bs-toggle="dropdown"></i>'
                            + '<ul class="dropdown-menu">'
                            + '<li><a class="dropMusicInfo dropdown-item" href="#">곡 정보</a></li>'
                            + '<li><a class="dropAlbumInfo dropdown-item" href="#">앨범 정보</a></li>'
                            + '<li><a class="dropArtistInfo dropdown-item" href="#">아티스트 정보</a></li>'
                            + '</ul>' + '</td>' +
                            '</tr>');

                        $(".chartTbody").append(html);


                    }) //지우지마셈

                    playButtonCLick(json);
                    detailClick(json);

                    /** 발라드 클릭시 */
                    $('#ballad').click(function () {
                        console.log("클릭")
                        $('#chart_h1').html("발라드");
                        $.ajax({
                            url: "<c:url value="/chart/ChartBallad"/>",
                            type: "GET",
                            dataType: 'text',
                            async: false,
                            success: success,
                            error: function (e) {

                                console.log(e)
                            }

                        });
                    });

                    /** 락 클릭시 */
                    $('#rock').click(function () {

                        console.log("클릭")
                        $('#chart_h1').html("락");
                        $.ajax({
                            url: "<c:url value="/chart/ChartRock"/>",
                            type: "GET",
                            dataType: 'text',
                            async: false,
                            success: success,

                            error: function (e) {

                                console.log(e)
                            }

                        });

                    });

                    /** 힙합 클릭시 */
                    $('#hiphop').click(function () {

                        console.log("클릭")
                        $('#chart_h1').html("힙합");
                        $.ajax({
                            url: "<c:url value="/chart/ChartHiphop"/>",
                            type: "GET",
                            dataType: 'text',
                            async: false,
                            success: success,

                            error: function (e) {

                                console.log(e)
                            }

                        });

                    });

                    /** 댄스 클릭시 */
                    $('#dance').click(function () {

                        console.log("클릭")
                        $('#chart_h1').html("댄스");
                        $.ajax({
                            url: "<c:url value="/chart/ChartDance"/>",
                            type: "GET",
                            dataType: 'text',
                            async: false,
                            success: success,

                            error: function (e) {

                                console.log(e)
                            }

                        });

                    });

                    /** 재즈 클릭시 */
                    $('#jazz').click(function () {

                        console.log("클릭")
                        $('#chart_h1').html("재즈");
                        $.ajax({
                            url: "<c:url value="/chart/ChartJazz"/>",
                            type: "GET",
                            dataType: 'text',
                            async: false,
                            success: success,

                            error: function (e) {

                                console.log(e)
                            }

                        });

                    });

                /** 클래식 클릭시*/
                    $('#classic').click(function () {

                        console.log("클릭")
                        $('#chart_h1').html("클래식");
                        $.ajax({
                            url: "<c:url value="/chart/ChartClassic"/>",
                            type: "GET",
                            dataType: 'text',
                            async: false,
                            success: success,

                            error: function (e) {

                                console.log(e)
                            }

                        });

                    });

                    /** 팝 클릭시 */
                    $('#pop').click(function () {

                        console.log("클릭")
                        $('#chart_h1').html("팝");
                        $.ajax({
                            url: "<c:url value="/chart/ChartPop"/>",
                            type: "GET",
                            dataType: 'text',
                            async: false,
                            success: success,

                            error: function (e) {

                                console.log(e)
                            }

                        });

                    });
                },
                error: function (e) {
                    console.log(e)
                }
            });

           /** chart success 함수 */
            function success(data) {
                const json = JSON.parse(data);
                s_LibraryData = json;
                $('.chartTbody').empty();

                $.each(json, function (i, item) {
                    html = $('<tr class="b-wrap">' +
                        '<td scope="row">' +
                        '<input class="check" type="checkbox" name="check">' +
                        '</td>' +
                        '<td id="rank">' + (i + 1) + '</td>' +
                        '<td>' +
                        '<img class="innerImg" src="img/' + item.cover_img + '">' +
                        '</td>' +
                        '<td id="title">' + item.title + '<br>' + item.album + '</td>' +
                        '<td id="artist">' + item.artist + '</td>' +
                        '<td>' +
                        '<i class="selectPlay fa-solid fa-play"></i>' +
                        '</td>' +
                        '<td>' +
                        '<i class="selectList fa-solid fa-list"></i>' +
                        '</td>' +
                        '<td>' +
                        '<i class="selectAdd fa-solid fa-folder-plus"></i>' +
                        '</td>' +
                        '<td>' + '<i class="fa-solid fa-ellipsis-vertical" data-bs-toggle="dropdown"></i>'
                        + '<ul class="dropdown-menu">'
                        + '<li><a class="dropMusicInfo dropdown-item" href="#">곡 정보</a></li>'
                        + '<li><a class="dropAlbumInfo dropdown-item" href="#">앨범 정보</a></li>'
                        + '<li><a class="dropArtistInfo dropdown-item" href="#">아티스트 정보</a></li>'
                        + '</ul>' + '</td>' +
                        '</tr>');
                    $(".chartTbody").append(html);
                })
                playButtonCLick(json);
                detailClick(json);
             }

            })
        /** 디테일 클릭 */
        function detailClick(json) {

            let dropMusicInfo = document.getElementsByClassName("dropMusicInfo");
            let dropAlbumInfo = document.getElementsByClassName("dropAlbumInfo");
            let dropArtistInfo = document.getElementsByClassName("dropArtistInfo");


            for (let i = 0; i < dropMusicInfo.length; i++) {


                dropMusicInfo[i].addEventListener('click', function () {
                    allEmpty();
                    console.log("곡정보 클릭!");
                    $('#chartTbody').css('display', 'block');
                    let html = '';

                    html += '<div class="suggestion_detail">' +
                        '<img src="img/' + json[i].cover_img + '">';
                    html += '<div id="detailInfo">' +
                        '<div>' +
                        '<a href="#" class="detail_title dropMusicInfo">' + json[i].title + '</a>' +
                        '</div>';
                    html += '<div>' +
                        '<a href="#" class="detail_album dropAlbumInfo">' + json[i].album + '</a>' +
                        '</div>'
                    html += '<div>' +
                        '<a href="#" class="detail_artist dropArtistInfo">' + json[i].artist + '</a>' +
                        '</div>';
                    html += '<div class="select_icon">' +
                        '<i class="selectPlay fa-solid fa-play">' +
                        '</i>'
                    html += '<i class="selectList fa-solid fa-list" id = "selectList"></i>';
                    html += '<i class="selectAdd fa-solid fa-folder-plus"></i>' + '</div>' +
                        '</div>';
                    // html += '<div id="indexbtn"><button type="button" id="go_suggestion" ><h5>뒤로<h5></button></div>'
                    html += '</div>'
                    html += '<div id ="suggestion_lylics">'
                    html += json[i].lyrics + '</div>'
                    $("#suggestion_body").append(html);

                    let selectPlay = document.getElementsByClassName("selectPlay");
                    let selectList = document.getElementsByClassName("selectList");
                    let selectAdd = document.getElementsByClassName("selectAdd");



                    selectPlay[0].addEventListener('click', function () {
                        $('#player-play').css('display', 'block');
                        $('#player-pause').css('display', 'none');
                        audio.pause();

                        nowPlayList = [];
                        nowPlayList.push("<c:url value="/mp3/"/>" + json[i].file_path);

                        for (const i in nowPlayList) {
                            preloadAudio(nowPlayList[i]);
                        }

                        audioIndex = 0;

                        playListInit3(json[i]);

                        setTimeout(() => {
                            $('#player-play').css('display', 'none');
                            $('#player-pause').css('display', 'block');
                            audio.play();
                        }, 300);
                    })

                    selectList[0].addEventListener('click', function () {
                        nowPlayList.push("<c:url value="/mp3/"/>" + json[i].file_path);

                        playListInit3(json[i]);
                    })

                    selectAdd[0].addEventListener('click', function () {
                        $.ajax({
                            type: 'GET',
                            url: '<c:url value="/music/MusicAddLibrary"/>',
                            data: 'music_id=' + json[i].id,
                            async: false,
                            success: function (result) {
                                getLibrary();
                                $('#modal-body2').text('보관함에 추가되었습니다');
                                $('#modal2').modal('toggle');

                            },
                            error: function (e) {
                                console.log(e);
                            }
                        });
                    })

                    detailClick(json);
                    // document.getElementById('go_suggestion').addEventListener('click', function () {
                    //     suggestion();
                    // })


                });


                dropArtistInfo[i].addEventListener('click', function () {
                    allEmpty();
                    $('#chartTbody').css('display', 'block');
                    console.log("----아티스트 정보클릭----");
                    console.log("i : " + i);
                    console.log(json);
                    $.ajax({
                        url: "<c:url value="/find/FindResult"/>",
                        type: "POST",
                        dataType: 'text',
                        data: 'find-input=' + json[i].artist,
                        async: false,
                        success: function (data) {
                            let json = JSON.parse(data);
                            console.log("--아티스트 정보 받음--")
                            console.log(json)
                            let html = '';
                            let htmlb = '';

                            $.each(json[1], function (i, item) {
                                htmlb = '<div class="suggestion_detail"><img src="img/' + item.artist_img + '">' +
                                    '<div id="detailInfo"><div><h4 class="detail_artist ">' + item.artist + '</h4></div>' +
                                    '<div><h2>' + item.genre + '</h2></div>' +
                                    // '<div class="select_icon"><i class="selectPlay fa-solid fa-play"></i>' +
                                    // '<i class="selectList fa-solid fa-list" id = "selectList"></i>' +
                                    // '<i class="selectAdd fa-solid fa-folder-plus"></i>' + '</div></div>' +
                                    // // html += '<div id="indexbtn"><button type="button" id="go_suggestion" ><h5>뒤로<h5></button></div>'
                                    '</div></div>' +
                                    '<div id ="suggestion_lylics">' +
                                    '<table class="findTitle_table table table-hover">' +
                                    ' <thead class="table-dark" id="findTitleHead">' +
                                    '<tr><th scope="col" width="5%"><input type="checkbox"></th>' +
                                    '<th scope="col" width="5%">곡/앨범</th>' +
                                    '<th scope="col" width="20%"></th>' +
                                    '<th scope="col" width="15%">아티스트</th>' +
                                    '<th scope="col" width="5%">듣기</th>' +
                                    ' <th scope="col" width="5%">재생목록</th>' +
                                    ' <th scope="col" width="5%">내 리스트</th>' +
                                    ' <th scope="col" width="5%">더보기</th></tr></thead>' +
                                    '<tbody class="findTbody">' +
                                    '</tbody></table>' +
                                    '</div>';

                                html += '<tr class="b-wrap">'
                                html += '<td scope="row">'
                                html += '<input class="check" type="checkbox" name="check">'
                                html += '</td>'
                                html += '<td>'
                                html += '<img class="innerImg" src="img/' + item.cover_img + '">'
                                html += '</td>'
                                html += '<td id="title">' + item.title + '<br>' + item.album + '</td>'
                                html += '<td id="artist">' + item.artist + '</td>'
                                html += '<td>'
                                html += '<i class="selectPlay fa-solid fa-play"></i>'
                                html += '</td>'
                                html += '<td>'
                                html += '<i class="selectList fa-solid fa-list"></i>'
                                html += '</td>'
                                html += '<td>'
                                html += '<i class="selectAdd fa-solid fa-folder-plus"></i>'
                                html += '</td>' + '<td>' + '<i class="fa-solid fa-ellipsis-vertical" data-bs-toggle="dropdown"></i>'
                                    + '<ul class="dropdown-menu">'
                                    + '<li><a class="dropMusicInfo dropdown-item" href="#">곡 정보</a></li>'
                                    + '<li><a class="dropAlbumInfo dropdown-item" href="#">앨범 정보</a></li>'
                                    + '<li><a class="dropArtistInfo dropdown-item" href="#">아티스트 정보</a></li>'
                                    + '</ul>' + '</td>' +
                                    '</tr>'

                            })

                            $("#suggestion_body").append(htmlb);
                            $(".findTbody").append(html);


                            let selectPlay = document.getElementsByClassName("selectPlay");
                            let selectList = document.getElementsByClassName("selectList");
                            let selectAdd = document.getElementsByClassName("selectAdd");

                            detailClick(json[1]);

                            $.each(json[1], function (i, item) {

                                selectPlay[i].addEventListener('click', function () {
                                    $('#player-play').css('display', 'block');
                                    $('#player-pause').css('display', 'none');
                                    audio.pause();

                                    nowPlayList = [];
                                    nowPlayList.push("<c:url value="/mp3/"/>" + item.file_path);

                                    for (const i in nowPlayList) {
                                        preloadAudio(nowPlayList[i]);
                                    }

                                    audioIndex = 0;

                                    playListInit3(item);

                                    setTimeout(() => {
                                        $('#player-play').css('display', 'none');
                                        $('#player-pause').css('display', 'block');
                                        audio.play();
                                    }, 300);
                                })

                                selectList[i].addEventListener('click', function () {
                                    nowPlayList.push("<c:url value="/mp3/"/>" + item.file_path);

                                    playListInit3(item);
                                })

                                selectAdd[i].addEventListener('click', function () {
                                    $.ajax({
                                        type: 'GET',
                                        url: '<c:url value="/music/MusicAddLibrary"/>',
                                        data: 'music_id=' + json[i].id,
                                        async: false,
                                        success: function (result) {
                                            getLibrary();
                                            $('#modal-body2').text('보관함에 추가되었습니다');
                                            $('#modal2').modal('toggle');

                                        },
                                        error: function (e) {
                                            console.log(e);
                                        }
                                    });
                                })
                                // document.getElementById('go_suggestion').addEventListener('click', function () {
                                //     suggestion();
                                // })

                            })


                        },
                        error: function (e) {

                            console.log(e)
                        }

                    });

                });



                dropAlbumInfo[i].addEventListener('click', function () {
                    allEmpty();
                    $('#chartTbody').css('display', 'block');

                    console.log("----앨범 정보클릭----");
                    console.log("i : " + i);
                    console.log(json);
                    $.ajax({
                        url: "<c:url value="/find/FindResult"/>",
                        type: "POST",
                        dataType: 'text',
                        data: 'find-input=' + json[i].album,
                        async: false,
                        success: function (data) {
                            let json = JSON.parse(data);
                            console.log("--앨범 정보 받음--")
                            console.log(json)
                            let html = '';
                            let htmlb = '';


                            $.each(json[2], function (i, item) {
                                console.log("들어가서 i : " + i);
                                htmlb = '<div class="suggestion_detail"><img src="img/' + item.cover_img + '">' +
                                    '<div id="detailInfo"><div><a class="detail_album dropAlbumInfo">' + item.album + '</a></div>' +
                                    '<div><a class="detail_artist dropArtistInfo">' + item.artist + '</a></div>' +
                                    '<div><h2>' + item.genre + '</h2></div>' +
                                    '<div><h2>' + item.release_date + '</h2></div>' +
                                    '<div class="select_icon">' +
                                    '<i class="selectList fa-solid fa-list" id = "selectList"></i>' +
                                    '<i class="selectAdd fa-solid fa-folder-plus"></i>' + '</div></div>' +
                                    // html += '<div id="indexbtn"><button type="button" id="go_suggestion" ><h5>뒤로<h5></button></div>'
                                    '</div>' +
                                    '<div id ="suggestion_lylics">' +
                                    '<table class="findTitle_table table table-hover">' +
                                    ' <thead class="table-dark" id="findTitleHead">' +
                                    '<tr><th scope="col" width="5%"><input type="checkbox"></th>' +
                                    '<th scope="col" width="5%">곡/앨범</th>' +
                                    '<th scope="col" width="20%"></th>' +
                                    '<th scope="col" width="15%">아티스트</th>' +
                                    '<th scope="col" width="5%">듣기</th>' +
                                    ' <th scope="col" width="5%">재생목록</th>' +
                                    ' <th scope="col" width="5%">내 리스트</th>' +
                                    ' <th scope="col" width="5%">더보기</th></tr></thead>' +
                                    '<tbody class="findTbody">' +
                                    '</tbody></table>' +
                                    '</div>';
                                html += '<tr class="b-wrap">'
                                html += '<td scope="row">'
                                html += '<input class="check" type="checkbox" name="check">'
                                html += '</td>'
                                html += '<td>'
                                html += '<img class="innerImg" src="img/' + item.cover_img + '">'
                                html += '</td>'
                                html += '<td id="title">' + item.title + '<br>' + item.album + '</td>'
                                html += '<td id="artist">' + item.artist + '</td>'
                                html += '<td>'
                                html += '<i class="selectPlay fa-solid fa-play"></i>'
                                html += '</td>'
                                html += '<td>'
                                html += '<i class="selectList fa-solid fa-list"></i>'
                                html += '</td>'
                                html += '<td>'
                                html += '<i class="selectAdd fa-solid fa-folder-plus"></i>'
                                html += '</td>' + '<td>' + '<i class="fa-solid fa-ellipsis-vertical" data-bs-toggle="dropdown"></i>'
                                    + '<ul class="dropdown-menu">'
                                    + '<li><a class="dropMusicInfo dropdown-item" href="#">곡 정보</a></li>'
                                    + '<li><a class="dropAlbumInfo dropdown-item" href="#">앨범 정보</a></li>'
                                    + '<li><a class="dropArtistInfo dropdown-item" href="#">아티스트 정보</a></li>'
                                    + '</ul>' + '</td>' +
                                    '</tr>'
                            })

                            $("#suggestion_body").append(htmlb);
                            $(".findTbody").append(html);



                            let selectPlay = document.getElementsByClassName("selectPlay");
                            let selectList = document.getElementsByClassName("selectList");
                            let selectAdd = document.getElementsByClassName("selectAdd");

                            $.each(json[2], function (i, item) {


                                selectPlay[i].addEventListener('click', function () {
                                    $('#player-play').css('display', 'block');
                                    $('#player-pause').css('display', 'none');
                                    audio.pause();

                                    nowPlayList = [];
                                    nowPlayList.push("<c:url value="/mp3/"/>" + item.file_path);

                                    for (const i in nowPlayList) {
                                        preloadAudio(nowPlayList[i]);
                                    }

                                    audioIndex = 0;

                                    playListInit3(item);

                                    setTimeout(() => {
                                        $('#player-play').css('display', 'none');
                                        $('#player-pause').css('display', 'block');
                                        audio.play();
                                    }, 300);
                                })

                                selectList[i].addEventListener('click', function () {
                                    nowPlayList.push("<c:url value="/mp3/"/>" + item.file_path);

                                    playListInit3(item);
                                })



                                selectAdd[i].addEventListener('click', function () {
                                    $.ajax({
                                        type: 'GET',
                                        url: '<c:url value="/music/MusicAddLibrary"/>',
                                        data: 'music_id=' + json[i].id,
                                        async: false,
                                        success: function (result) {
                                            getLibrary();
                                            $('#modal-body2').text('보관함에 추가되었습니다');
                                            $('#modal2').modal('toggle');

                                        },
                                        error: function (e) {
                                            console.log(e);
                                        }
                                    });
                                })
                                detailClick(json[2]);

                                // document.getElementById('go_suggestion').addEventListener('click', function () {
                                //     suggestion();
                                // })

                            })


                        },
                        error: function (e) {

                            console.log(e)
                        }

                    });


                });

            }
        }

        /** 플레이버튼 클릭시 함수 */
        function playButtonCLick(json) {
            let selectPlay = document.getElementsByClassName("selectPlay");
            let selectList = document.getElementsByClassName("selectList");
            let selectAdd = document.getElementsByClassName("selectAdd");
            let check = document.getElementsByClassName("check");
            let totalCheck = document.getElementById("ChartTotalCheckbox");
            let unCheck = document.getElementById("unCheck");

            for (let i = 0; i < selectList.length; i++) {

                selectPlay[i].addEventListener('click', function () {
                    $('#player-play').css('display', 'block');
                    $('#player-pause').css('display', 'none');
                    audio.pause();

                    nowPlayList = [];
                    nowPlayList.push("<c:url value="/mp3/"/>" + json[i].file_path);

                    for (const i in nowPlayList) {
                        preloadAudio(nowPlayList[i]);
                    }

                    audioIndex = 0;

                    playListInit();

                    setTimeout(() => {
                        $('#player-play').css('display', 'none');
                        $('#player-pause').css('display', 'block');
                        audio.play();
                    }, 300);
                })

                selectList[i].addEventListener('click', function () {
                    nowPlayList.push("<c:url value="/mp3/"/>" + json[i].file_path);

                    playListInit();
                })

                check[i].addEventListener('change', function () {

                    checkBoxJudge(totalCheck, check);
                })

                selectAdd[i].addEventListener('click', function () {
                    $.ajax({
                        type: 'GET',
                        url: '<c:url value="/music/MusicAddLibrary"/>',
                        data: 'music_id=' + json[i].id,
                        async: false,
                        success: function (result) {
                            getLibrary();
                        },
                        error: function (e) {
                            console.log(e);
                        }
                    });
                })
            }

            totalCheck.addEventListener('change', function () {

                totalChange(totalCheck, check);
            })

            unCheck.addEventListener('click', function () {

                totalCheck.checked = false;
                totalChange(totalCheck, check);
            })
        }

        /** find엔터 */
        $("#findEnter").keydown(function (key) {
            if (key.keyCode == 13) {

                if ($('.find-input').val() != '') {
                    console.log('Enter');
                    allEmpty();

                    $('.find_Container').attr("style", "display:");
                    $('#findTitle_Container').attr("style", "display:");
                    $('#findAlbum_Container').attr("style", "display:");
                    $('#findArtist_Container').attr("style", "display:");
                    $('#findLyrics_Container').attr("style", "display:");
                    $('#findLyrics_h1').attr("style", "display:");
                    $('#findAlbum_h1').attr("style", "display:");
                    $('#findArtist_h1').attr("style", "display:");
                    $('#findTitle_h1').attr("style", "display:");

                    $('#modal_add').css("display","")
                    $('#find_h1').html('\'' + $('.find-input').val() + '\'' + " 검색결과");

                    $.ajax({
                        url: "<c:url value="/find/FindResult"/>",
                        type: "POST",
                        dataType: 'text',
                        data: 'find-input=' + $('.find-input').val(),
                        async: false,
                        success: function (data) {
                            console.log($('.find-input').val());
                             const json = JSON.parse(data);
                            s_LibraryData = json[0];

                            if (json[0].length > 0) {
                                $('#findTitleHead').attr("style", "display:");
                            } else {
                                $('#findTitleHead').attr("style", "display:none");
                            }
                            if (json[3].length > 0) {
                                $('#findLyricsHead').attr("style", "display:");
                            } else {
                                $('#findLyricsHead').attr("style", "display:none");
                            }

                            /** 곡 검색*/

                            $(".findTbody").empty();
                            let html = "";

                            $.each(json[0], function (i, item) {

                                if (i < 5) {

                                    html = $('<tr class="b-wrap">' +
                                        '<td scope="row">' +
                                        '<input class="check" type="checkbox" name="check">' +
                                        '</td>' +
                                        '<td>' +
                                        '<img class="innerImg" src="img/' + item.cover_img + '">' +
                                        '</td>' +
                                        '<td id="title">' + item.title + '<br>' + item.album + '</td>' +
                                        '<td id="artist">' + item.artist + '</td>' +
                                        '<td>' +
                                        '<i class="selectPlay fa-solid fa-play"></i>' +
                                        '</td>' +
                                        '<td>' +
                                        '<i class="selectList fa-solid fa-list"></i>' +
                                        '</td>' +
                                        '<td>' +
                                        '<i class="selectAdd fa-solid fa-folder-plus"></i>' +
                                        '</td>' +
                                        '<td>' + '<i class="fa-solid fa-ellipsis-vertical" data-bs-toggle="dropdown"></i>'
                                        + '<ul class="dropdown-menu">'
                                        + '<li><a class="dropMusicInfo dropdown-item" href="#">곡 정보</a></li>'
                                        + '<li><a class="dropAlbumInfo dropdown-item" href="#">앨범 정보</a></li>'
                                        + '<li><a class="dropArtistInfo dropdown-item" href="#">아티스트 정보</a></li>'
                                        + '</ul>' + '</td>' +
                                        '</tr>');

                                    $(".findTbody").append(html);

                                } else {

                                    html = $('<tr class="b-wrap" style="display: none">' +
                                        '<td scope="row">' +
                                        '<input class="check" type="checkbox" name="check">' +
                                        '</td>' +
                                        '<td>' +
                                        '<img class="innerImg" src="img/' + item.cover_img + '">' +
                                        '</td>' +
                                        '<td id="title">' + item.title + '<br>' + item.album + '</td>' +
                                        '<td id="artist">' + item.artist + '</td>' +
                                        '<td>' +
                                        '<i class="selectPlay fa-solid fa-play"></i>' +
                                        '</td>' +
                                        '<td>' +
                                        '<i class="selectList fa-solid fa-list"></i>' +
                                        '</td>' +
                                        '<td>' +
                                        '<i class="selectAdd fa-solid fa-folder-plus"></i>' +
                                        '</td>' +
                                        '<td>' +
                                        '<i class="fa-solid fa-ellipsis-vertical" data-bs-toggle="dropdown"></i>'
                                        + '<ul class="dropdown-menu">'
                                        + '<li><a class="dropMusicInfo dropdown-item" href="#">상세 정보</a></li>'
                                        + '<li><a class="dropLike dropdown-item" href="#">좋아요</a></li>'
                                        + '</ul>' +
                                        '</td>' +
                                        '</tr>');


                                    $(".findTbody").append(html);
                                }

                                $('#findTitle_h1').click(function () {
                                    $('#findTitle_h1').attr("style", "display:none");
                                    $('#findAlbum_Container').attr("style", "display:none");
                                    $('#findArtist_Container').attr("style", "display:none");
                                    $('#findLyrics_Container').attr("style", "display:none");
                                    $('.b-wrap').attr("style", "display:");


                                });

                            });

                            /** 가수 검색*/

                            $(".findArtist_List").empty();
                            $.each(json[1], function (i, item) {

                                if (i < 5) {
                                    html = $(
                                        '<li class="findArtist_li">' +
                                        ' <div>' +
                                        ' <div>' +
                                        '<a>' +
                                        '<img class="artist_img" src="img/' + item.artist_img + '">' +
                                        '</a>' +
                                        '</div>' +
                                        '<a class="aa" href="#">' + item.artist + '</a>' +
                                        '</div>' +
                                        '</li>');

                                    $(".findArtist_List").append(html);
                                } else {
                                    html = $(
                                        '<li class="findArtist_li" style="display: none">' +
                                        ' <div>' +
                                        ' <div>' +
                                        '<a>' +
                                        '<img class="artist_img" src="img/' + item.artist_img + '">' +
                                        '</a>' +
                                        '</div>' +
                                        '<a class="aa" href="#">' + item.artist + '</a>' +
                                        '</div>' +
                                        '</li>');


                                    $(".findArtist_List").append(html);
                                }

                                $('#findArtist_h1').click(function () {

                                    $('#findArtist_h1').attr("style", "display:none");
                                    $('#findTitle_Container').attr("style", "display:none");
                                    $('#findAlbum_Container').attr("style", "display:none");
                                    $('#findLyrics_Container').attr("style", "display:none");
                                    $('.findArtist_li').attr("style", "display:");

                                });
                            });

                            /** 앨범 검색*/

                            $(".findAlbum_List").empty();
                            $.each(json[2], function (i, item) {

                                if (i < 5) {
                                    console.log(i);
                                    html = $(
                                        '<li class="findArtist_li">' +
                                        '<div>' +
                                        '<div>' +
                                        '<a>' +
                                        '<img class="album_img" src="img/' + item.cover_img + '">' +
                                        '</a>' +
                                        '</div>' +
                                        '<div>' +
                                        '<a class="aa" href="#">' + item.album + '</a>' +
                                        '<a class="aa" href="#">' + item.artist + '</a>' +
                                        '</div>' +
                                        '</div>' +
                                        '</li>');

                                    $(".findAlbum_List").append(html);
                                } else {
                                    html = $(
                                        '<li class="findAlbum_li" style="display: none">' +
                                        '<div>' +
                                        '<div>' +
                                        '<a>' +
                                        '<img class="album_img" src="img/' + item.cover_img + '">' +
                                        '</a>' +
                                        '</div>' +
                                        '<div>' +
                                        '<a class="aa" href="#">' + item.album + '</a>' +
                                        '<a class="aa" href="#">' + item.artist + '</a>' +
                                        '</div>' +
                                        '</div>' +
                                        '</li>');

                                    $(".findAlbum_List").append(html);
                                }

                                $('#findAlbum_h1').click(function () {
                                    $('#findAlbum_h1').attr("style", "display:none");
                                    $('#findTitle_Container').attr("style", "display:none");
                                    $('#findArtist_Container').attr("style", "display:none");
                                    $('#findLyrics_Container').attr("style", "display:none");
                                    $('.findAlbum_li').attr("style", "display:");

                                })
                            });

                            /** 가사 검색*/
                            $(".findLyricsTbody").empty();
                            $.each(json[3], function (i, item) {

                                if (i < 5) {

                                    html = $('<tr class="b-wrap" style="height: 117px">' +
                                        '<td scope="row">' +
                                        '<input class="check" type="checkbox" name="check">' +
                                        '</td>' +
                                        '<td>' +
                                        '<img class="innerImg" src="img/' + item.cover_img + '">' +
                                        '</td>' +
                                        '<td id="title" class="lyricsTd">' + item.title + '<br>' + item.lyrics + '</td>' +
                                        '<td id="artist">' + item.artist + '</td>' +
                                        '<td id="lyrics">' + item.album + '</td>' +
                                        '</tr>');

                                    $(".findLyricsTbody").append(html);

                                } else {

                                    html = $('<tr class="b-wrap" style="height: 117px; display: none" >' +
                                        '<td scope="row">' +
                                        '<input class="check" type="checkbox" name="check">' +
                                        '</td>' +
                                        '<td>' +
                                        '<img class="innerImg" src="img/' + item.cover_img + '">' +
                                        '</td>' +
                                        '<td id="title" class="lyricsTd">' + item.title + '<br>' + item.lyrics + '</td>' +
                                        '<td id="artist">' + item.artist + '</td>' +
                                        '<td id="lyrics">' + item.album + '</td>' +
                                        '</tr>');

                                    $(".findLyricsTbody").append(html);

                                }
                                ;

                                $('#findLyrics_h1').click(function () {
                                    $('#findLyrics_h1').attr("style", "display:none");
                                    $('#findAlbum_Container').attr("style", "display:none");
                                    $('#findArtist_Container').attr("style", "display:none");
                                    $('#findTitle_Container').attr("style", "display:none");
                                    $('.b-wrap').attr("style", "display:");

                                });

                            });


                            $('.find-input').val("");


                            playButtonCLick(json[0]);
                            detailClick(json[0]);

                        },
                        error: function (e) {
                            alert("실패" + $('.find-input').val())
                            console.log(e);
                        }
                    });
                } else {
                    alert('검색어를 입력해주세요');
                    $('.find-input').focus();
                }
            }
        });

    }
</script>
</html>