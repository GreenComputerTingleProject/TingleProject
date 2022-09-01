


<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MusicDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #adminUrl { width: 100%; float: left; align-items: center;}
    th,td {  text-align: center; justify-content: center; }
    /*tr {border-bottom: 1px solid #dddddd; }*/
    td {border-bottom: 1px solid #dddddd; }
</style>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script>


    $(function () {
        $("#mSerch").click(function (){
            if ($('#serchName').val() != '') {
                var serchName = $('#serchName').val();
                location.href="AdminMnameSerch?serchName="+serchName;
            } else {
                alert("검색어를 입력해주세요")
            }
        })

        $("#serchName").keydown(function (key) {
            if (key.keyCode == 13) {

                if ($('#serchName').val() != '') {
                    var serchName = $('.find_input').val();
                    console.log(serchName)
                    location.href="AdminMnameSerch?serchName="+serchName;
                } else {
                    alert("검색어를 입력해주세요")
                }
            }
        })
    })
</script>
<div id=adminUrl>
    <form style=" background: white;">
        <br>
        <table style="border-collapse: collapse; width: 100%;" >
            <h1 class="nav navbar-text justify-content-center"><b>Music Page</b></h1>
            <br>
            <thead style="align-items: center; text-align: center;">
            <div class="input-group" style="width: 50%; margin: auto;">
                <input type="text" id="serchName" class="form-control find_input" placeholder="Search..">
                <div class="input-group-append">
                    <button id="mSerch" class="btn btn-dark" type="button" style="color: honeydew;">검색</button>
                </div>
            </div>
            <br>
            <tr style="background: mediumslateblue; color: honeydew;">
                <th>아이디</th>
                <th>제목</th>
                <th>가수</th>
                <th>가수번호</th>
                <th>앨범</th>
                <th>장르</th>
                <th>파일</th>
                <th>이미지</th>
                <th>날짜</th>
                <th>스트리밍횟수</th>
            </tr>
            </thead>
            <c:forEach items="${musicData }" var="dto" >
                <tbody>
                <tr>
                    <td><a style="color: red;" href=AdminMusicDetail?id=${dto.id }&nowPage=${nowPage}&serchName=${serchName}">${dto.id }</a></td>
                    <td>${dto.title}</td>
                    <td>${dto.artist}</td>
                    <td>${dto.artist_no}</td>
                    <td>${dto.album}</td>
                    <td>${dto.genre}</td>
                    <td>${dto.file_path}</td>
                    <td>${dto.cover_img}</td>
                    <td>${dto.release_date}</td>
                    <td>${dto.cnt}</td>
                </tr>
                </tbody>
            </c:forEach>
            <tfoot>
            <tr>
                <td colspan="10" align="center">
                    <c:if test="${firstPage>1 }">
                        <a href="?nowPage=${firstPage-1 }">이전</a>
                    </c:if>
                    <c:forEach begin="${firstPage }" end="${endPage }" var="i">
                        <c:choose>
                            <c:when test="${i==nowPage }">
                                [${i }]
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${serchName != null}">
                                        <a href="AdminMnameSerch?serchName=${serchName}&nowPage=${i }">${i }</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="?nowPage=${i }">${i }</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>


                    </c:forEach>
                    <c:if test="${endPage<totalPage }">
                        <a href="?nowPage=${endPage+1 }">다음</a>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th colspan="10">
                    <a class="btn btn col-md-4" style="background:mediumpurple; color:honeydew;" href="AdminMusicInsert"><h5 style="line-height: inherit;">음원등록</h5></a>
                </th>
            </tr>
            </tfoot>
        </table>
    </form>
</div>


