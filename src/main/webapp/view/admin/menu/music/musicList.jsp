<%--<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MusicDTO" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
    *{
        margin: 0px;
        padding: 0px;
    }

    #adminUrl {
        width: 100%;
        height: 85%;
        background: #f0f0f0;
    }

    td {
        align-items: center;
    }

</style>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script>
    var mSerch = document.getElementById("mSerch")
    $(function () {
        $("#mSerch").click(function (){
            if ($('#mname').val() != '') {
               var mname = $('#mname').val();
               location.href="AdminMnameSerch?mname="+mname;
            } else {
                alert("검색어를 입력해주세요")
            }
        })
    })
</script>


<div id = adminUrl>
    <h2>음악 페이지입니다</h2>
    <table border="" width="100%">
        <tr>
            <td colspan="11">
                <input type="text" id = "mname"><input type="button" value="검색" id="mSerch"/>
            </td>
        </tr>
        <tr>
            <td>아이디</td>
            <td>제목</td>
            <td>가수</td>
            <td>앨범</td>
            <td>장르</td>
            <td>분위기</td>
            <td>파일</td>
            <td>이미지</td>
            <td>날짜</td>
            <td>스트리밍횟수</td>
            <td>가사</td>
        </tr>
        <c:forEach items="${musicData }" var="dto" >
            <tr>
                <td><a href=AdminMusicDetail?id=${dto.id }">${dto.id }</a></td>
                <td>${dto.title}</td>
                <td>${dto.artist}</td>
                <td>${dto.album}</td>
                <td>${dto.genre}</td>n
                <td>${dto.mood}</td>
                <td>${dto.file_path}</td>
                <td>${dto.cover_img}</td>
                <td>${dto.release_date}</td>
                <td>${dto.cnt}</td>
                <td>${dto.lyrics }</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="11" align="right">
                <a href="AdminMusicInsert">음원등록</a>
            </td>
        </tr>
    </table>
</div>--%>


<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MusicDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #adminUrl { width: 100%; float: left; align-items: center;}
    th,td {  text-align: center; justify-content: center; }
    tr {border-bottom: 1px solid #dddddd; }
</style>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script>
    var mSerch = document.getElementById("mSerch")
    $(function () {
        $("#mSerch").click(function (){
            if ($('#serchName').val() != '') {
                var serchName = $('#serchName').val();
                location.href="AdminMnameSerch?serchName="+serchName;
            } else {
                alert("검색어를 입력해주세요")
            }
        })
    })
</script>
<div id=adminUrl>
    <form style=" background: white;">
        <table style="border-collapse: collapse; width: 100%;" >
            <h2 class="nav navbar-text justify-content-center">Music Page</h2>
            <hr>
            <thead style="align-items: center; text-align: center;">
            <tr>
                <th colspan="11">
                    <input type="text" id = "serchName">
                    <input type="button" value="검색" id="mSerch"/>
                </th>
            </tr>
            <tr>
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
                    <td><a href="AdminMusicDetail?id=${dto.id }&nowPage=${nowPage}&serchName=${serchName}">${dto.id }</a></td>
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
                   <a class="btn btn-outline-primary float-end col-md" href="AdminMusicInsert">음원등록</a>
                </th>
            </tr>
            </tfoot>
        </table>
    </form>
</div>


