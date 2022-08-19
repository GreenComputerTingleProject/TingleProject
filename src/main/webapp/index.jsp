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

    #main_contents{
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
    .artist_img{
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
    .album_img{
        width: 150px;
        height: 150px;
        vertical-align: top;
        border-radius: 6px;
    }


   .findArtist_List{
       list-style: none;
       display: block;
       margin-block-start: 1em;
       margin-block-end: 1em;
       margin-inline-start: 0px;
       margin-inline-end: 0px;
       padding-inline-start: 40px;
   }
   .findArtist_li{
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
        h1{
            margin-bottom: 20px;
        }
        .aa{
            display: block;

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
            margin: 20px;
            font-size: 60px;
        }

        .fa-backward, .fa-forward, #player-list {
            margin: 30px;
            font-size: 40px;
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

        #currentTime, #duration {
            line-height: 100px;
            margin: 0 5px 0 5px;
            color: white;
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
            <li>
          <fieldset class="find_fieldset form-control rounded-pill">

              <i class="fa-solid fa-magnifying-glass"></i>  <input style="width: 80%" class=" find-input" type="text" placeholder="검색"
                     onkeyup="if(window.event.keyCode==13){enterFind()}"/>
          </fieldset>



            </li>
            <li><a href="#">추천</a></li>
            <li><a class="chart" id="chart" href="#">차트</a></li>
            <li><a id="library" href="#">보관함</a></li>
            <li><a href="#">게시판</a></li>
            <li><a href="admin/AdminLogin">관리자</a></li>
        </ul>
    </div>
    <!-- /사이드바 -->

    <!-- 본문 -->

<%--정환본문--%>
    <div id="page-content-wrapper">
        <div id="main_contents" class="container-fluid">
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
                    <th scope="col" width="5%"><input type="checkbox" id="totalCheckbox"></th>
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
                <div class="findTitle_Container" style="display: none">
                    <h1 id="find_h1">검색결과</h1>
                    <div>
                        <h1>곡 <i class="fa-solid fa-angle-right"></i></h1>
                        <table class="findTitle_table table table-hover" style="display: none">
                            <thead class="table-dark">
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
                    <div>
                        <h1>가수 <i class="fa-solid fa-angle-right"></i> </h1>
                        <div class="findArtist_Container">
                            <ul class="findArtist_List">
            <table id="dynamicTable" class="table table-hover" style="display: none">
                <thead class="table-dark">
                <tr>
                    <th scope="col" width="5%"><input type="checkbox" id="totalCheckbox"></th>
                    <th scope="col" width="5%">곡/앨범</th>
                    <th scope="col" width="20%"></th>
                    <th scope="col" width="15%">아티스트</th>
                    <th scope="col" width="5%">듣기</th>
                    <th scope="col" width="5%">재생목록</th>
                    <th scope="col" width="5%">내 리스트</th>
                    <th scope="col" width="5%">더보기</th>
                </tr>
                </thead>
                <tbody id="dynamicTbody">

                            </ul>
                        </div>
                    </div>

                    <div>
                        <h1>앨범 <i class="fa-solid fa-angle-right"></i></h1>
                        <div class="findArtist_Container">
                            <ul class="findAlbum_List">

                            </ul>
                        </div>
                    </div>
                    <div>
                        <h1>가사 <i class="fa-solid fa-angle-right"></i></h1>
                        <div class="find_lyrics"></div>
                    </div>
                </div>
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
        <img id="player-img" src="" alt="">
        <div id="player-title"></div>
        <i class="player-control fa-solid fa-backward"></i>
        <i id="player-play" class="player-control fa-solid fa-play"></i>
        <i id="player-pause" class="player-control fa-solid fa-pause" style="display: none"></i>
        <i class="player-control fa-solid fa-forward"></i>
        <span id="currentTime"></span>
        <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <span id="duration"></span>
        <i id="player-list" class="player-control fa-solid fa-list"></i>
    </div>
    <!--/플레이어-->

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

    <!--미니모달-->
    <div id="btn-group" class="btn-group">
        <button id="unCheck" class="btn btn-primary"><i class="fa-solid fa-x"></i></button>
        <button id="modal_play" class="btn btn-primary"><i class="selectPlay fa-solid fa-play"></i></button>
        <button id="modal_list" class="btn btn-primary"><i class="fa-solid fa-list"></i></button>
        <button class="btn btn-primary"><i class="fa-solid fa-folder-plus"></i></button>
    </div>
    <!--/미니모달-->
</div>
</body>
<script>

    $(function () {
        let s_UserData;
        let s_LibraryData;
        let isSessionLoaded = false;
        let audio;
        let nowPlayList = [];
        let coverImgList = [];
        let loaded = 0;
        let audioIndex = 0;

        if (${userData != null}) {
            init();
        }

        function init() {
            s_UserData = JSON.parse('${sessionScope.userData}');
            s_LibraryData = JSON.parse('${sessionScope.musicList}');

            isSessionLoaded = true;

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
                audioIndex++;
                if (audioIndex == nowPlayList.length) {
                    audioIndex--;
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
                audioIndex--;
                if (audioIndex == -1) {
                    audioIndex++;
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
                html += '<td>' + '<i class="fa-solid fa-folder-plus"></i>' + '</td>';
                html += '<td>' + '<i class="fa-solid fa-ellipsis-vertical"></i>' + '</td>';
                html += '</tr>';
            }

            $("#dynamicTbody").empty();
            $("#dynamicTbody").append(html);

            let innerImg = document.getElementsByClassName("innerImg");
            let selectPlay = document.getElementsByClassName("selectPlay");
            let selectList = document.getElementsByClassName("selectList");
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
        })

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
            let x = e.pageX - $('.progress').offset().left;
            $('.progress-bar').css("width", x);

            audio.currentTime = audio.duration * ((x / 3) / 100);
            // console.log((x / 3) / 100);
        });


        //차트 클릭시

        $('.chart').click(function () {
            // $('.find_Container').empty();
            $('.chartTable').attr("style", "display:");
            $('.chartContainer').attr("style", "display:");
            $('#chart_h1').html("TOP100");

            $.ajax({
                url: "<c:url value="/chart/ChartTop100"/>",
                type: "GET",
                dataType: 'text',
                async: false,

                success: function (data) {
                    const json = JSON.parse(data);
                    console.log(json);
                    $('.findTitle_Container').attr("style", "display:none");
                    $('.find_title').empty()
                    $('.find_artist').empty()


                    $('.chartTbody').empty();
                    let html = "";

                    $.each(json, function (i, item) {


                        html = $('<tr class="b-wrap">' +
                            '<td scope="row">' +
                            '<input class="check" type="checkbox" name="check">' +
                            '</td>' +
                            '<td id="rank">' + (i + 1) + '</td>' +
                            '<td>' +
                            '<img class="innerImg" src="" alt="">' +
                            '</td>' +
                            '<td id="title">' + item.title + '<br>' + item.album + '</td>' +
                            '<td id="artist">' + item.artist + '</td>' +
                            '<td>' +
                            '<i class="selectPlay fa-solid fa-play"></i>' +
                            '</td>' +
                            '<td>' +
                            '<i class="fa-solid fa-list"></i>' +
                            '</td>' +
                            '<td>' +
                            '<i class="fa-solid fa-folder-plus"></i>' +
                            '</td>' +
                            '<td>' +
                            '<i class="fa-solid fa-ellipsis-vertical"></i>' +
                            '</td>' +
                            '</tr>');

                        $(".chartTbody").append(html);

                    })


                    //발라드 클릭시
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

                    //락 클릭시
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

                },
                error: function (e) {

                    console.log(e)
                }

            });
        });


    });



    /* find 함수*/
    function enterFind() {
        if ($('.find-input').val() != '') {
            $('.chartTable').attr("style", "display:none");
            $('.chartContainer').attr("style", "display:none");
            $('.chartTbody').empty();
            $('.findTitle_Container').attr("style", "display:");
            $('#find_h1').html('\'' + $('.find-input').val() + '\'' + " 검색결과");
            $.ajax({
                url: "<c:url value="/find/FindResult"/>",
                type: "POST",
                dataType: 'text',
                data: 'find-input=' + $('.find-input').val(),
                async: false,
                success: function (data) {

                    const json = JSON.parse(data);
                    console.log(json);


                    $('.findTitle_table').attr("style", "display:");
                    // $('.find_title').empty()
                    // $('.find_artist').empty()

                /* 곡 검색*/

                    $(".findTbody").empty();
                    let html = "";

                    $.each(json[0], function (i, item) {
                        if(i<5){
                        html = $('<tr class="b-wrap">' +
                            '<td scope="row">' +
                            '<input class="check" type="checkbox" name="check">' +
                            '</td>' +
                            '<td>' +
                            '<img class="innerImg" src="" alt="">' +
                            '</td>' +
                            '<td id="title">' + item.t_title + '<br>' + item.t_album + '</td>' +
                            '<td id="artist">' + item.t_artist + '</td>' +
                            '<td>' +
                            '<i class="selectPlay fa-solid fa-play"></i>' +
                            '</td>' +
                            '<td>' +
                            '<i class="fa-solid fa-list"></i>' +
                            '</td>' +
                            '<td>' +
                            '<i class="fa-solid fa-folder-plus"></i>' +
                            '</td>' +
                            '<td>' +
                            '<i class="fa-solid fa-ellipsis-vertical"></i>' +
                            '</td>' +
                            '</tr>');


                        $(".findTbody").append(html);
                        }
                    });

              /* 가수 검색*/


                    $(".findArtist_List").empty();
                    $.each(json[1], function (i, item) {


                        if(i<5) {
                            html = $(
                                '<li class="findArtist_li">' +
                                ' <div>' +
                                ' <div>' +
                                '<a>' +
                                '<img class="artist_img" src="img/'+ item.a_artistImg +'">'+
                                '</a>' +
                                '</div>' +
                                '<a class="aa" href="#">' + item.a_artist + '</a>' +
                                '</div>' +
                                '</li>');


                            $(".findArtist_List").append(html);
                        }
                    });

               /* 앨범 검색*/

                    $(".findAlbum_List").empty();
                    $.each(json[2], function (i, item) {
                        if (i<5) {
                            console.log(i);
                            html = $(
                                '<li class="findArtist_li">' +
                                '<div>' +
                                '<div>' +
                                '<a>' +
                                '<img class="album_img" src="img/'+ item.b_coverImg +'">'+
                                '</a>' +
                                '</div>' +
                                '<div>' +
                                '<a class="aa" href="#">' + item.b_album + '</a>' +
                                '<a class="aa" href="#">' + item.b_artist + '</a>' +
                                '</div>' +
                                '</div>' +
                                '</li>');


                            $(".findAlbum_List").append(html);
                        }
                    });


                    $('.find-input').val("");

                },
                error: function (e) {
                    alert("실패" + $('.find-input').val())
                    console.log(e);
                }


            })
        } else {
            alert('검색어를 입력해주세요');
            $('.find-input').focus();

        }

    }

    function success(data) {
        const json = JSON.parse(data);
        console.log(json);
        $('.chartTbody').empty();

        $.each(json, function (i, item) {


            html = $('<tr class="b-wrap">' +
                '<td scope="row">' +
                '<input class="check" type="checkbox" name="check">' +
                '</td>' +
                '<td id="rank">' + (i + 1) + '</td>' +
                '<td>' +
                '<img class="innerImg" src="" alt="">' +
                '</td>' +
                '<td id="title">' + item.title + '<br>' + item.album + '</td>' +
                '<td id="artist">' + item.artist + '</td>' +
                '<td>' +
                '<i class="selectPlay fa-solid fa-play"></i>' +
                '</td>' +
                '<td>' +
                '<i class="fa-solid fa-list"></i>' +
                '</td>' +
                '<td>' +
                '<i class="fa-solid fa-folder-plus"></i>' +
                '</td>' +
                '<td>' +
                '<i class="fa-solid fa-ellipsis-vertical"></i>' +
                '</td>' +
                '</tr>');
            $(".chartTbody").append(html);
        })


    }
</script>
</html>