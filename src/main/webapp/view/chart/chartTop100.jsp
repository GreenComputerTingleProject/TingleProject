<%--
  Created by IntelliJ IDEA.
  User: moon
  Date: 2022-08-13
  Time: 오후 4:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
    <script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>
    <style>

        td {
            display: table-cell;
        }

        tr {
            box-sizing: border-box;
            border-top: 1px solid gray;
            border-bottom: 1px solid gray;
            display: table;
            width: 1000px;
        }

        .h-wrap {
            height: 40px;
        }

        .b-wrap {
            border-top: 0;
            height: 80px;
            border-bottom: 1px solid gray;
        }


    </style>
<%--    success:
    $('#ballad').click(function () {
    console.log("클릭")
    $('h1').html("발라드");
    $.ajax({
    url: "<c:url value="/chart/ChartBallad"/>",
    type: "POST",
    dataType: 'text',
    async: false,
    success: success,
    error: function (e) {

    console.log(e)
    }

    });
    }),
    error: function (e) {

    console.log(e)
    }

    });
    });--%>
</head>

<body>
<header>
    <h1>TOP100</h1>
</header>
<section>
    <table>
        <thead>
        <tr class="h-wrap">
            <td class="h-select h-td">
                <input type="checkbox">
            </td>
            <td class="h-rank  h-td">
                순위
            </td>
            <td class="h-songAlbum  h-td">
                곡/앨범
            </td>
            <td class="h-artist  h-td">
                아티스트
            </td>
            <td class="h-listen  h-td">
                듣기
            </td>
            <td class="h-playList  h-td">
                재생목록
            </td>
        </tr>
        </thead>
        <c:forEach begin="0" end="100" var="i">
        <tbody>
        <tr class="b-wrap">
            <td class="b-select">
                <input type="checkbox">
            </td>
            <td class="b-rank b-td" id="rank">
                ${i+1}
            </td>
            <td class="b-songAlbum b-td" id="title${i}">
                곡/앨범
            </td>
            <td class="b-artist b-td" id="artist${i}">
                아티스트
            </td>
            <td class="b-listen b-td">
              ▶
            </td>
            <td class="b-playList b-td">
                재생목록
            </td>
        </tr>
        </tbody>
        </c:forEach>
    </table>
<%--    view/chart/chartMain.jsp--%>
</section>
<script>
    $(function () {
        $.ajax({
            url: "<c:url value="/chart/ChartTop100"/>",
            type: "GET",
            dataType:'text',
            async:false,
            success: function (data) {
                var json = JSON.parse(data);
                console.log(json);
                $.each(json, function (i, item) {
                    console.log(i+1);
                    $("#title"+i).text(item.title+"/"+item.album);
                    $("#artist"+i).text(item.artist);

                })
            },
            error: function (e){

                console.log(e)
            }

        });
    });


</script>
<footer>

<%--
    $('<h1>TOP100</h1>').appendTo("#main_contents");
    $('<button id="top100" class="genreBtn" type="button">top100</button>' +
    '<button id="ballad" class="genreBtn" type="button">발라드</button>' +
    '<button id="rock" class="genreBtn" type="button">락</button>' +
    '<button id="hiphop" class="genreBtn" type="button">힙합</button>' +
    '<button id="dance" class="genreBtn" type="button">댄스</button>' +
    '<button id="jazz" class="genreBtn" type="button">재즈</button>' +
    '<button id="classic" class="genreBtn" type="button">클래식</button>' +
    '<button id="pop" class="genreBtn" type="button">팝</button>'
    ).appendTo("#main_contents");


    $('<table class="wrap"></table>').appendTo("#main_contents");
    $('<tr class="h-wrap"></tr>').appendTo('.wrap');
    $('<td><input type="checkbox"></td><td>순위</td><td>곡/앨범</td><td>아티스트</td><td>듣기</td><td>재생목록</td>').appendTo('.h-wrap');
    --%>
</footer>
</body>
</html>
