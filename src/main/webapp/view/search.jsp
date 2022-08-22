<%--
  Created by IntelliJ IDEA.
  User: moon
  Date: 2022-08-13
  Time: 오후 8:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>










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

    </tbody>
</table>

$('#dynamicTable').css('display', 'block');

for (const i in s_LibraryData) {
html += '<tr>';
    html += '<td scope="row">' + '<input class="check" type="checkbox" name="check">' + '</td>';
    html += '<td>' + '<img class="innerImg" src="" alt="">' + '</td>';
    html += '<td>' + s_LibraryData[i].title + '<br>' + s_LibraryData[i].album + '</td>';
    html += '<td>' + s_LibraryData[i].artist + '</td>';
    html += '<td>' + '<i class="selectPlay fa-solid fa-play"></i>' + '</td>';
    html += '<td>'+'<i class="fa-solid fa-list"></i>'+'</td>';
    html += '<td>'+'<i class="fa-solid fa-folder-plus"></i>'+'</td>';
    html += '<td>' + '<i class="fa-solid fa-ellipsis-vertical"></i>' + '</td>';
    html += '</tr>';
}

$("#dynamicTbody").empty();
$("#dynamicTbody").append(html);


function success(data) {
const json = JSON.parse(data);
console.log(json);

$.each(json, function (i, item) {


html = $('<tr class="b-wrap">' +
    '<td scope="row">' +
        '<input class="check" type="checkbox" name="check">' +
        '</td>' +
    '<td id="rank">' + (i + 1) + '</td>' +
    '<td>' +
        '<img class="innerImg" src="" alt="">' +
        '</td>' +
    '<td id="title">'+ item.title + '<br>' + item.album +'</td>' +
    '<td id="artist">' +item.artist + '</td>' +
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

})
$(".chartTbody").empty();
$(".chartTbody").append(html);

}






</body>
</html>
for (MusicDTO ch : findArtist) {
JSONObject dataArtist = new JSONObject();
dataArtist.put("id", ch.getId());
dataArtist.put("cnt", ch.getCnt());
dataArtist.put("title", ch.getTitle());
dataArtist.put("album", ch.getAlbum());
dataArtist.put("artist", ch.getArtist());
dataArtist.put("genre", ch.getGenre());
dataArtist.put("genre_no", ch.getGenre());
dataArtist.put("file_path", ch.getFile_path());
jsonArray.add(dataArtist);
}