<%@ page import="model.MusicDTO" %><%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>



<style>
  img {
    width: 100px;
    height: 100px;
  }

</style>

<form action="AdminCenterInquiry" method="get">
<Table border="">
  <tr>
    <td>번호</td>
    <td>${inquiryData.id}</td>
  </tr>
  <tr>
    <td>유저번호</td>
    <td>${inquiryData.user_id}</td>
  </tr>
  <tr>
    <td>유저 아이디</td>
    <td>${inquiryData.login_id}</td>
  </tr>
  <tr>
    <td>닉네임</td>
    <td>${inquiryData.nickname}</td>
  </tr>
  <tr>
    <td>제목</td>
    <td>${inquiryData.title}</td>
  </tr>
  <tr>
    <td>분류</td>
    <td>${inquiryData.kind}</td>
  </tr>
  <tr>
    <td>날짜</td>
    <td>${inquiryData.reg_date}</td>
  </tr>
  <tr>
    <td>내용</td>
    <td>${inquiryData.content}</td>
  </tr>
  <tr>
    <td>답변여부</td>
    <td>${inquiryData.checked}</td>
  </tr>
  <tr>
    <td>답변</td>
    <td><input type="text" value="${inquiryData.answer}" name="answer"></td>
  </tr>
  <input type="hidden" value="${inquiryData.id}" name ="id">
  <input type="hidden" value="inquiryAnswer" name ="inquiryKind">

  <tr>
    <td colspan="2" align="right">
      <input type="submit" value="답변하기">
      <a href = "AdminCenterInquiry?id=${inquiryData.id}&inquiryKind=inquiryDelete">삭제</a>
      <a href = "AdminCenterInquiry?noticeKind=noticeList">목록으로</a>
    </td>
  </tr>

</Table>
</form>
