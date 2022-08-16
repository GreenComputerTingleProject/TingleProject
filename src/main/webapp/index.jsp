<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tingle</title>
    <link rel="shortcut icon" href="#">
    <script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
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
            background: #000;
            overflow-x: hidden;
            overflow-y: auto;
        }

        #page-content-wrapper {
            width: 100%;
            padding: 20px;
        }

        #bottom-player-wrapper {
            width: 100%;
            height: 100px;
            background: darkorchid;
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

        .fa-play, .fa-pause {
            margin: 15px;
            font-size: 70px;
        }

        .fa-backward, .fa-forward {
            margin: 25px;
            font-size: 50px;
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
        </ul>
    </div>
    <!-- /사이드바 -->

    <!-- 본문 -->
    <div id="page-content-wrapper">
        <div id="main_contents" class="container-fluid">
        </div>
    </div>
    <!-- /본문 -->

    <!--플레이어-->
    <div id="bottom-player-wrapper">
        <audio id="audio"></audio>
        <i class="player-control fa-solid fa-backward"></i>
        <i class="player-control fa-solid fa-play"></i>
        <i class="player-control fa-solid fa-pause" style="display: none"></i>
        <i class="player-control fa-solid fa-forward"></i>
    </div>
    <!--/플레이어-->

    <!--모달-->
    <div id="modal1" class="modal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>로그인 필요</h4>
                    <button class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>
    <!--/모달-->
</div>
</body>
<script>
    $(function () {
        let s_UserData;
        let s_LibraryData;
        let audio;
        let isSessionLoaded = false;
        let nowPlayList = [];
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
            }

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
            if (loaded == nowPlayList.length){
                // 모든 리스트가 로드되었다면
                audioInit();
            }
        }

        function audioInit() {
            // 파일 완전히 로드된 후
            // 플레이가 온전히 끝나면 다음노래
            audio.onended = function() {
                audioIndex++;
                if (audioIndex >= nowPlayList.length) {
                    // 끝
                    $('.fa-play').css('display', 'block');
                    $('.fa-pause').css('display', 'none');
                    audioIndex = 0;
                    audio.src = nowPlayList[0];
                    return;
                }
                play(audioIndex);
            };

            // 첫곡은 장전시켜둔다.
            audio.src = nowPlayList[0];
        }

        function play(index) {
            audio.src = nowPlayList[index];
            audio.play();
        }

        $('.fa-play').click(function () {
            if (isSessionLoaded) {
                audio.play();
                $('.fa-play').css('display', 'none');
                $('.fa-pause').css('display', 'block');
            }
        })

        $('.fa-pause').click(function () {
            if (isSessionLoaded) {
                audio.pause();
                $('.fa-play').css('display', 'block');
                $('.fa-pause').css('display', 'none');
            }
        })

        $('.fa-forward').click(function () {
            if (isSessionLoaded) {
                audio.pause();
                audioIndex++;
                if(audioIndex == nowPlayList.length) {
                    audioIndex--;
                }
                play(audioIndex);
            }
        })

        $('.fa-backward').click(function () {
            if (isSessionLoaded) {
                audio.pause();
                audioIndex--;
                if(audioIndex == -1) {
                    audioIndex++;
                }
                play(audioIndex);
            }
        })

        $('#library').click(function () {
            
        })
    })
</script>
</html>