<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tingle</title>
</head>
<link rel="stylesheet" href="<c:url value="/bootstrap/"/>css/bootstrap.min.css">
<script type="text/javascript" src="<c:url value="/bootstrap/"/>js/bootstrap.bundle.min.js"></script>
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
        background: gray;
        z-index: 2;
        position: fixed;
        left: 0;
        bottom: 0;
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

</style>
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
                    <li><a href="user/UserLogIn">로그인</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="user/UserLogOut">로그아웃</a></li>
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
        <h1>플레이어입니다</h1>
        <audio id="audio"></audio>
    </div>
    <!--/플레이어-->
</div>
</body>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script>
    $(function () {
        const audio = document.getElementById("audio");

        $('#library').click(function () {
            if (${userData != null}) {
                $.ajax({
                    type: 'GET',
                    url: '<c:url value="/music/MusicList"/>',
                    async: false,
                    dataType: 'text', // jsonArray를 받을때는 text로 받고  parse를 해줘야함
                    success: function(data) {
                        const musics = JSON.parse(data);

                        // 동적 HTML 생성부
                        $.each(musics, function (i, item) {
                            const btn = document.createElement("button");
                            btn.value = "<c:url value="/mp3/"/>" + item.file_path;
                            btn.innerHTML = item.title;
                            btn.className = "musicBtn";

                            $("#main_contents").append(btn);

                            $(".musicBtn").click(function () {
                                $("#audio").attr("src", $(this).val());
                                audio.load();
                                audio.play();
                            })
                        })
                    },
                    error: function(e) {
                        console.log(e);
                    }
                });
            } else {
                alert('로그인 후 이용하실 수 있습니다.');
            }
        });
    })
</script>
</html>