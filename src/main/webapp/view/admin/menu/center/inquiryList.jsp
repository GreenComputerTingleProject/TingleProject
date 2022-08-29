<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div id = adminUrl>
  <h2>1:1문의 페이지입니다</h2>
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
      <td>유저 번호</td>
      <td>유저 아이디</td>
      <td>닉네임</td>
      <td>제목</td>
      <td>분류</td>
      <td>날짜</td>
      <td>답변여부</td>
    </tr>
    <c:forEach items="${inquiryData }" var="dto" >
      <tr>
        <td><a href="AdminCenterInquiry?id=${dto.id }&inquiryKind=inquiryDetail">${dto.id }</a></td>
        <td>${dto.user_id}</td>
        <td>${dto.login_id}</td>
        <td>${dto.nickname}</td>
        <td>${dto.title}</td>
        <td>${dto.kind}</td>
        <td>${dto.reg_date}</td>
        <td>${dto.checked}</td>
      </tr>
    </c:forEach>
  </table>

</div>--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
  #adminUrl { width: 100%; float: left; align-items: center;}
  th,td {  text-align: center; justify-content: center; }
  td {border-bottom: 1px solid #dddddd; }
  h5:hover { color: orchid;}

</style>

<div id=adminUrl>
  <form style=" background: white;">
    <br>
    <table style="border-collapse: collapse; width: 100%;" >
      <h1 class="nav navbar-text justify-content-center"><b>1:1문의</b></h1>
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
        <th>유저 번호</th>
        <th>유저 아이디</th>
        <th>닉네임</th>
        <th>제목</th>
        <th>분류</th>
        <th>날짜</th>
        <th>답변여부</th>
      </tr>
      </thead>
      <c:forEach items="${inquiryData }" var="dto" >
        <tbody>
          <tr>
            <td><a href="AdminCenterInquiry?id=${dto.id }&inquiryKind=inquiryDetail">${dto.id }</a></td>
            <td>${dto.user_id}</td>
            <td>${dto.login_id}</td>
            <td>${dto.nickname}</td>
            <td>${dto.title}</td>
            <td>${dto.kind}</td>
            <td>${dto.reg_date}</td>
            <td>${dto.checked}</td>
          </tr>
        </tbody>
      </c:forEach>
    </table>
  </form>
</div>
