<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-25
  Time: 오후 8:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="AdminFAQModifyReg" method="get" >
  <Table border="">
    <input type ="hidden" name ="id" value="${FAQData.id}">
    <tr>
      <td>제목</td>
      <td><input type = "text" name ="title" value="${FAQData.title}"></td>
    </tr>
    <tr>
      <td>분류</td>
      <td>
        <select name="kind">
          <option value=${FAQData.kind}>현재 분류 : ${FAQData.kind}</option>
          <option value="사이트이용">사이트이용</option>
          <option value="결제관련">결제관련</option>
          <option value="스트리밍">스트리밍</option>
        </select>
      </td>
    </tr>
    <tr>
      <td>내용</td>
      <td><input type = "text" name ="content" value="${FAQData.content}"></td>
    </tr>

    <tr>
      <td colspan="2" align="right">
        <input type="submit" value="등록하기" id = "submit">
        <a href="AdminCenterFAQ?id=${FAQData.id}&FAQKind=FAQDetail">목록으로</a>
      </td>
    </tr>
