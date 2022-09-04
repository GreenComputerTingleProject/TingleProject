<%--
<%@ page import="java.lang.reflect.Array" %>
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
 /* var mSerch = document.getElementById("mSerch")
  $(function () {
    $("#mSerch").click(function (){
      if ($('#mname').val() != '') {
        var mname = $('#mname').val();
        location.href="AdminMnameSerch?mname="+mname;
      } else {
        alert("검색어를 입력해주세요")
      }
    })
  })*/



</script>

<div id = adminUrl>
  <h2>FAQ 페이지입니다</h2>
  <div>
    <a href="AdminCenter?noticeKind=noticeList">공지사항</a>
    <a href="AdminCenterFAQ?FAQKind=FAQList">FAQ</a>
    <a href="AdminCenterInquiry?inquiryKind=inquiryList">1:1문의</a>
  </div>

  <table border="" width="100%">
    &lt;%&ndash;<tr>
      <td colspan="6">
        <input type="text" id = "mname"><input type="button" value="검색" id="mSerch"/>
      </td>
    </tr>&ndash;%&gt;
    <tr>
      <td>번호</td>
      <td>분류</td>
      <td>제목</td>
      <td>작성자</td>
      <td>날짜</td>
    </tr>
    <c:forEach items="${FAQData }" var="dto" >
      <tr>
        <td><a href="AdminCenterFAQ?id=${dto.id }&FAQKind=FAQDetail">${dto.id }</a></td>
        <td>${dto.kind}</td>
        <td>${dto.title}</td>
        <td>${dto.nickname}</td>
        <td>${dto.reg_date}</td>
      </tr>
    </c:forEach>
    <tr>
      <td colspan="6" align="right">
        <a href="AdminCenterFAQ?FAQKind=FAQInsert">등록</a>
      </td>
    </tr>
  </table>

</div>
--%>

<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.MusicDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
  #adminUrl { width: 100%; float: left; align-items: center;}
  th,td {  text-align: center; justify-content: center; }
  td {border-bottom: 1px solid #dddddd; }
  h5:hover { color: orchid;}
</style>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script>
  /* var mSerch = document.getElementById("mSerch")
   $(function () {
     $("#mSerch").click(function (){
       if ($('#mname').val() != '') {
         var mname = $('#mname').val();
         location.href="AdminMnameSerch?mname="+mname;
       } else {
         alert("검색어를 입력해주세요")
       }
     })
   })*/

</script>

<div id=adminUrl>
  <form style=" background: white;">
    <br>
    <table style="border-collapse: collapse; width: 100%;" >
      <h1 class="nav navbar-text justify-content-center"><b>F&Q</b></h1>
      <br>
      <thead style="align-items: center; text-align: center;">
      <div class="btn-group" style="display: flex; margin: auto; width: 60%;">
        <a class="btn" href="AdminCenter?noticeKind=noticeList" style="width: 10%; background: mediumpurple; color: honeydew; "><h5 style="line-height: inherit;">공지사항</h5></a>
        <a class="btn" href="AdminCenterFAQ?FAQKind=FAQList" style="width: 10%; background: rebeccapurple; color: honeydew; "><h5 style="line-height: inherit;">F&Q</h5></a>
        <a class="btn" href="AdminCenterInquiry?inquiryKind=inquiryList" style="width: 10%; background: indigo; color: honeydew; "><h5 style="line-height: inherit;">1:1문의</h5></a>
      </div>
      <br>
      <tr style="background: mediumslateblue; color: honeydew;">
        <th>번호</th>
        <th>분류</th>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
      </tr>
      </thead>
      <c:forEach items="${FAQData }" var="dto" >
        <tbody>
        <tr>
          <td><a style="color: red;" href="AdminCenterFAQ?id=${dto.id }&FAQKind=FAQDetail">${dto.id }</a></td>
          <td>${dto.kind}</td>
          <td>${dto.title}</td>
          <td>${dto.nickname}</td>
          <td>${dto.reg_date}</td>
        </tr>
        </tbody>
      </c:forEach>
      <tfoot>
      <tr>
        <th colspan="5"></th>
      </tr>
      <tr>
        <th colspan="5">
          <a class="btn btn col-md-4" style="background:mediumpurple; color:honeydew;" href="AdminCenterFAQ?FAQKind=FAQInsert"><h5 style="line-height: inherit;">등록</h5></a>
        </th>
      </tr>
      </tfoot>
    </table>
  </form>
</div>

