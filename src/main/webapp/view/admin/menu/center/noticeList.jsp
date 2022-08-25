<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MusicDTO" %><%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-13
  Time: 오전 1:41
  To change this template use File | Settings | File Templates.
--%>

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
  <h2>공지사항 페이지입니다</h2>
  <div>
    <input type="button" value="공지사항" id="noticeBtn">
    <input type="button" value="FAQ" id="FAQBtn">
    <input type="button" value="1:1문의" id="inquiryBtn">
  </div>

  <table border="" width="100%">
    <%--<tr>
      <td colspan="6">
        <input type="text" id = "mname"><input type="button" value="검색" id="mSerch"/>
      </td>
    </tr>--%>
    <tr>
      <td>번호</td>
      <td>작성자</td>
      <td>제목</td>
      <td>분류</td>
      <td>날짜</td>
      <td>내용</td>
    </tr>
    <c:forEach items="${noticeData }" var="dto" >
      <tr>
        <td><a href="AdminCenter?id=${dto.id }&noticeKind=noticeDetail">${dto.id }</a></td>
        <td>${dto.nickname}</td>
        <td>${dto.title}</td>
        <td>${dto.kind}</td>
        <td>${dto.reg_date}</td>
        <td>${dto.content}</td>
      </tr>
    </c:forEach>
    <tr>
      <td colspan="6" align="right">
        <a href="AdminCenter?noticeKind=noticeInsert">등록</a>
      </td>
    </tr>
  </table>

</div>

