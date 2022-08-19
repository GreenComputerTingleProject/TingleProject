<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tingle</title>
</head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
      integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>
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
    #main_contents{
        overflow-y: auto;
        margin-bottom: 100px;
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
                    success: function (data) {
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
                    error: function (e) {
                        console.log(e);
                    }
                });
            } else {
                alert('로그인 후 이용하실 수 있습니다.');
            }
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