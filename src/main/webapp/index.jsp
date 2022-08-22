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

        /* 하단 플레이어 스타일 */

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

        /* 메인 컨텐츠 스타일 */

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

        #player-title{
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

        .progress:hover{
            cursor: pointer;
        }

        #currentTime, #duration {
            line-height: 100px;
            margin: 0 5px 0 5px;
            color: gray;
        }

        #player-volume, #player-volume-mute{
            margin-right: 5px;
        }

        #player-volume-range{
            width: 100px;
            margin-top: 38px;
        }

        #control-zone{
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

        /*현석 스타일*/

        #suggestion_album {
            width: 100%;
            height: 300px;
            background: #1a1e21;
            margin-bottom: 40px;
        }

        .suggestion_table{
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


        #detailInfo{
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
    </style>
</head>
<body>
<div id="page-wrapper">
    <!-- 사이드바 -->
    <div id="sidebar-wrapper">
        <ul class="sidebar-nav">
            <li class="sidebar-brand">
                <a href="#">Tingle</a>
            </li>
            <c:choose>
                <c:when test="${userData == null}">
                    <li><a href="<c:url value="/user/UserLogIn"/>">로그인</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="<c:url value="/user/UserLogOut"/>">로그아웃</a></li>
                </c:otherwise>
            </c:choose>
            <li><a href="#">추천</a></li>
            <li><a href="#">차트</a></li>
            <li><a id="library" href="#">보관함</a></li>
            <li><a href="#">게시판</a></li>
            <li><a href="admin/AdminLogin">관리자</a></li>
        </ul>
    </div>
    <!-- /사이드바 -->

    <!-- 본문 -->
    <div id="page-content-wrapper">
        <div id="main_contents" class="container-fluid">
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

    <%--현석 본문--%>
    <div id="page-content-wrapper">
        <div id="main_contents2" class="container-fluid">
            <div id ="suggestion_body">

            </div>


        </div>
    </div>

    <!--모달1-->
    <div id="modal1" class="modal">
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
    <!--/모달-->

    <!--보관함에서 쓰는 미니모달-->
    <div id="btn-group" class="btn-group">
        <button id="unCheck" class="btn btn-primary"><i class="fa-solid fa-x"></i></button>
        <button id="modal_play" class="btn btn-primary"><i class="selectPlay fa-solid fa-play"></i></button>
        <button id="modal_list" class="btn btn-primary"><i class="fa-solid fa-list"></i></button>
<%--        <button id="modal_folder" class="btn btn-primary"><i class="fa-solid fa-folder-plus"></i></button>--%>
    </div>
    <!--/미니모달-->

    <!--더보기 드롭다운 메뉴-->
    <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="#">Action</a></li>
        <li><a class="dropdown-item" href="#">Another action</a></li>
        <li><a class="dropdown-item" href="#">Something else here</a></li>
    </ul>
    <!--/더보기 드롭다운 메뉴-->
</div>
</body>
<script>
    $(function () {
        let s_UserData;
        let s_LibraryData;
        let isSessionLoaded = false;
        let audio;
        let nowPlayList;
        let coverImgList = [];
        let loaded = 0;
        let audioIndex = 0;
        let nowVolume = 1;
        let isShuffle = false;
        let repeatMode = 0;
        let s_SuggestionList;

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
            s_SuggestionList = JSON.parse('${sessionScope.suggestionList}')
            isSessionLoaded = true;

            nowPlayList = [];

            for (const i in s_LibraryData) {
                nowPlayList[i] = "<c:url value="/mp3/"/>" + s_LibraryData[i].file_path;
                coverImgList[i] = "<c:url value="/img/"/>" + s_LibraryData[i].cover_img;
            }

            playListInit();

            audio = document.getElementById("audio");

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
            if (isSessionLoaded) {
                audio.play();
                $('#player-play').css('display', 'none');
                $('#player-pause').css('display', 'block');
            }
        })

        $('#player-pause').click(function () {
            if (isSessionLoaded) {
                audio.pause();
                $('#player-play').css('display', 'block');
                $('#player-pause').css('display', 'none');
            }
        })

        $('.fa-forward').click(function () {
            if (isSessionLoaded) {
                audio.pause();

                if(!isShuffle) {
                    audioIndex++;

                    if (audioIndex == nowPlayList.length) {
                        if(repeatMode == 0 || repeatMode == 2) {
                            audioIndex--;
                        } else if(repeatMode == 1) {
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
            }
        })

        $('.fa-backward').click(function () {
            if (isSessionLoaded) {
                audio.pause();

                if(!isShuffle) {
                    audioIndex--;

                    if (audioIndex == -1) {

                        if(repeatMode == 0 || repeatMode == 2) {
                            audioIndex++;
                        } else if(repeatMode == 1) {
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
            }
        })

        $('#player-list').click(function () {
            if ($('#playList').css("display") == 'none') {
                $('#playList').css("display", "block");
            } else {
                $('#playList').css("display", "none");
            }
        })

        $('#library').click(function () {
            if (!isSessionLoaded) {
                $('#modal-body1').text('로그인 후에 이용할 수 있습니다');
                $('#modal1').modal('toggle');
                return;
            }

            drawLibraryList();
        })

        function drawLibraryList() {
            let html = "";

            $('#dynamicTable').css('display', 'block');

            for (const i in s_LibraryData) {
                html += '<tr>';
                html += '<td scope="row">' + '<input class="check" type="checkbox" name="check">' + '</td>';
                html += '<td>' + '<img class="innerImg" src="" alt="">' + '</td>';
                html += '<td>' + s_LibraryData[i].title + '<br>' + s_LibraryData[i].album + '</td>';
                html += '<td>' + s_LibraryData[i].artist + '</td>';
                html += '<td>' + '<i class="selectPlay fa-solid fa-play"></i>' + '</td>';
                html += '<td>' + '<i class="selectList fa-solid fa-list"></i>' + '</td>';
                // html += '<td>' + '<i class="fa-solid fa-folder-plus"></i>' + '</td>';
                html += '<td>' + '<i class="fa-solid fa-ellipsis-vertical" data-bs-toggle="dropdown"></i>'
                    + '<ul class="dropdown-menu">'
                    + '<li><a class="dropMusicInfo dropdown-item" href="#">곡 정보</a></li>'
                    + '<li><a class="dropAlbumInfo dropdown-item" href="#">앨범 정보</a></li>'
                    + '<li><a class="dropArtistInfo dropdown-item" href="#">아티스트 정보</a></li>'
                    + '<li><a class="dropLike dropdown-item" href="#">좋아요</a></li>'
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
                    }, 100);
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
            }, 100);
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

        function playListInit() {
            let html = "";

            for (const i in nowPlayList) {
                if(i == audioIndex) {
                    html += '<div style="color: red">' + nowPlayList[i] + '</div>';
                } else {
                    html += '<div>' + nowPlayList[i] + '</div>';
                }
            }

            $("#playList_items").empty();
            $("#playList_items").append(html);

            for (const i in s_LibraryData) {
                if(("<c:url value="/mp3/"/>" + s_LibraryData[i].file_path) == nowPlayList[audioIndex]) {
                    $("#player-img").attr('src', "<c:url value="/img/"/>" + s_LibraryData[i].cover_img);

                    let html = s_LibraryData[i].title + '<br>' + s_LibraryData[i].album
                    $("#player-title").empty();
                    $("#player-title").append(html);
                }
            }
        }

        $(".progress").click(function (e) {
            if (isSessionLoaded) {
                let x = e.pageX - $('.progress').offset().left;
                $('.progress-bar').css("width", x);

                audio.currentTime = audio.duration * ((x / 3) / 100);
            }
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
            if(!isShuffle) {
                isShuffle = true;
                $("#player-shuffle").removeClass("player-control2");
                $("#player-shuffle").addClass("player-control2-change");

                audio.onended = function () {

                    if(repeatMode != 2) {
                        audioIndex = Math.floor(Math.random() * nowPlayList.length);

                        if (audioIndex >= nowPlayList.length) {
                            // 끝
                            $('#player-play').css('display', 'block');
                            $('#player-pause').css('display', 'none');
                            audioIndex = 0;
                            audio.src = nowPlayList[0];

                            if(repeatMode == 0) {
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

                    if(repeatMode != 2) {
                        audioIndex++;

                        if (audioIndex >= nowPlayList.length) {
                            // 끝
                            $('#player-play').css('display', 'block');
                            $('#player-pause').css('display', 'none');
                            audioIndex = 0;
                            audio.src = nowPlayList[0];

                            if(repeatMode == 0) {
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
            if(repeatMode == 0) {
                repeatMode = 1;
                $("#player-repeat").removeClass("player-control2");
                $("#player-repeat").addClass("player-control2-change");

                audio.onended = function () {
                    if(isShuffle){
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
            } else if(repeatMode == 1) {
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
            if(repeatMode == 2) {
                repeatMode = 0;
                $("#player-repeat").css("display", "inline-block");
                $("#player-repeat-1").css("display", "none");

                audio.onended = function () {
                    if(isShuffle){
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

        /*현석 스크립트*/



        $('#suggestion').click(function (){
            suggestion();

        })

        let suggestion = function (){
            if(!isSessionLoaded){
                $('modal-body1').text('로그인 후에 이용할 수 있습니다');
                $('#modal1').modal('toggle');
                return;
            }
            let html = '';
            let data = new Array();
            $("#dynamicTbody").empty();
            $("#suggestion_body").empty();
            $('#suggestion_body').css('display', 'block');
            html += '<div id ="suggestion_album"></div>';

            for (const i in s_SuggestionList) {
                let jArrays = s_SuggestionList[i];
                html += '<h2>'+jArrays[0].kind+'</h2>';
                html += '<table class = suggestion_table>';
                html += '<tr>';
                for (const i in jArrays) {
                    data.push(jArrays[i])
                    html += '<td width="20%">' + '<button type ="button" class = "viewDetail" >';
                    html += '<img src="img/'+jArrays[i].cover_img+'"/></button>';
                    html += jArrays[i].title;
                    html += '<i class="selectPlay fa-solid fa-play"></i>';
                    html += '<i class="selectList fa-solid fa-list"></i>';
                    html += '<i class="fa-solid fa-folder-plus"></i>';
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

            console.log("재생버튼 개수" + selectPlay.length);
            suggestion_player(data, selectPlay, selectList)


            for (let i = 0; i < viewDetail.length; i++) {
                viewDetail[i].addEventListener('click', function (){
                    // 오브젝트 배열
                    console.log(data[i])
                    console.log("버튼눌렸어요 "+i+"번째")
                    $("#suggestion_body").empty();
                    $('#suggestion_body').css('display', 'block');
                    let html = '';

                    html += '<div class="suggestion_detail"><img src="img/'+data[i].cover_img+'">';
                    html += '<div id="detailInfo"><div><h2>'+data[i].title+'<h2></div>'
                    html += '<div><h4>'+data[i].artist+'</h4></div>';
                    html += '<div><i class="selectPlay fa-solid fa-play"></i>'
                    html += '<i class="selectList fa-solid fa-list" id = "selectList"></i></div></div>'
                    html += '<div id="indexbtn"><button type="button" id="go_suggestion" ><h5>뒤로<h5></button></div>'
                    html += '</div>'
                    html += '<div id ="suggestion_lylics">'
                    html += '<h2>가사</h2></div>'
                    $("#suggestion_body").append(html);

                    let selectPlay = document.getElementsByClassName("selectPlay");

                    selectPlay[0].addEventListener('click', function () {
                        $('#player-play').css('display', 'block');
                        $('#player-pause').css('display', 'none');
                        audio.pause();
                        console.log("눌렸어용");

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
                        }, 100);


                        selectList[0].addEventListener('click', function () {
                            nowPlayList.push("<c:url value="/mp3/"/>" + data[i].file_path);

                            playListInit3(data[i]);
                        })
                    })


                    document.getElementById('go_suggestion').addEventListener('click',function (){
                        suggestion();
                    })

                })
            }


        }

        let suggestion_player = function (data,selectPlay,selectList){

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
                    }, 100);


                    selectList[i].addEventListener('click', function () {
                        nowPlayList.push("<c:url value="/mp3/"/>" + data[i].file_path);

                        playListInit2(data);
                    })
                })


            }
        }

        function playListInit2(data) {
            let html = "";

            for (const i in nowPlayList) {
                if(i == audioIndex) {
                    html += '<div style="color: red">' + nowPlayList[i] + '</div>';
                } else {
                    html += '<div>' + nowPlayList[i] + '</div>';
                }
            }

            $("#playList_items").empty();
            $("#playList_items").append(html);

            for (const i in data) {
                if(("<c:url value="/mp3/"/>" + data[i].file_path) == nowPlayList[audioIndex]) {
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
                if(i == audioIndex) {
                    html += '<div style="color: red">' + nowPlayList[i] + '</div>';
                } else {
                    html += '<div>' + nowPlayList[i] + '</div>';
                }
            }

            $("#playList_items").empty();
            $("#playList_items").append(html);

            for (const i in data) {
                if(("<c:url value="/mp3/"/>" + data.file_path) == nowPlayList[audioIndex]) {
                    $("#player-img").attr('src', "<c:url value="/img/"/>" + data.cover_img);

                    let html = data.title + '<br>' + data.album;
                    $("#player-title").empty();
                    $("#player-title").append(html);
                    console.log("플레이어 인잇2 성공");
                }
            }
        }


    })
</script>
</html>