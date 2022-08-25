<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-26
  Time: 오전 1:31
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

<div id = adminUrl>
  <h2>1:1문의 페이지입니다</h2>
  <div>
    <input type="button" value="공지사항" id="noticeBtn">
    <input type="button" value="FAQ" id="FAQBtn">
    <a href="AdminCenterInquiry?inquiryKind=inquiryList">1:1문의</a>
  </div>

  <table border="" width="100%">
    <%--<tr>
      <td colspan="6">
        <input type="text" id = "mname"><input type="button" value="검색" id="mSerch"/>
      </td>
    </tr>--%>
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

</div>
