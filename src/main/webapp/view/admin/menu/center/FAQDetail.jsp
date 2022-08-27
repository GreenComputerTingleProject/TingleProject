<%@ page import="model.MusicDTO" %><%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  img {
    width: 100px;
    height: 100px;
  }

</style>

<Table border="">
  <tr>
    <td>번호</td>
    <td>${FAQData.id}</td>
  </tr>
  <tr>
    <td>분류</td>
    <td>${FAQData.nickname}</td>
  </tr>
  <tr>
    <td>제목</td>
    <td>${FAQData.title}</td>
  </tr>
  <tr>
    <td>작성자</td>
    <td>${FAQData.kind}</td>
  </tr>
  <tr>
    <td>날짜</td>
    <td>${FAQData.reg_date}</td>
  </tr>
  <tr>
    <td>내용</td>
    <td>${FAQData.content}</td>
  </tr>

  <tr>
    <td colspan="2" align="right">
      <a href = "AdminCenterFAQ?id=${FAQData.id}&FAQKind=FAQModify">수정</a>
      <a href = "AdminCenterFAQ?id=${FAQData.id}&FAQKind=FAQDelete">삭제</a>
      <a href = "AdminCenterFAQ?FAQKind=FAQList">목록으로</a>
    </td>
  </tr>

</Table>
