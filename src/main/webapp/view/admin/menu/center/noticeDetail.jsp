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
    <td>${noticeData.id}</td>
  </tr>
  <tr>
    <td>작성자</td>
    <td>${noticeData.nickname}</td>
  </tr>
  <tr>
    <td>제목</td>
    <td>${noticeData.title}</td>
  </tr>
  <tr>
    <td>분류</td>
    <td>${noticeData.kind}</td>
  </tr>
  <tr>
    <td>날짜</td>
    <td>${noticeData.reg_date}</td>
  </tr>
  <tr>
    <td>내용</td>
    <td>${noticeData.content}</td>
  </tr>

  <tr>
    <td colspan="2" align="right">
      <a href = "AdminCenter?id=${noticeData.id}&noticeKind=noticeModify">수정</a>
      <a href = "AdminCenter?id=${noticeData.id}&noticeKind=noticeDelete">삭제</a>
      <a href = "AdminCenter?noticeKind=noticeList">목록으로</a>
    </td>
  </tr>

</Table>
