<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-25
  Time: 오후 8:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="AdminNoticeModifyReg" method="get" >
  <Table border="">
    <input type ="hidden" name ="id" value="${noticeData.id}">
    <tr>
      <td>제목</td>
      <td><input type = "text" name ="title" value="${noticeData.title}"></td>
    </tr>
    <tr>
      <td>분류</td>
      <td><select name="kind">
        <option value=${noticeData.kind}>현재 분류 : ${noticeData.kind}</option>
        <option value="공지사항">공지사항</option>
        <option value="업데이트">업데이트</option>
      </select>
      </td>
    </tr>
    <tr>
      <td>내용</td>
      <td><input type = "text" name ="content" value="${noticeData.content}"></td>
    </tr>

    <tr>
      <td colspan="2" align="right">
        <input type="submit" value="등록하기" id = "submit">
        <a href="AdminCenter?id=${noticeData.id}&noticeKind=noticeDetail">목록으로</a>
      </td>
    </tr>
