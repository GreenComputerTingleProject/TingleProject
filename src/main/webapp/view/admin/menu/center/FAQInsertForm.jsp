<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<form action="AdminFAQInsertReg" method="get" >
  <Table border="">
    <tr>
      <td>분류</td>
      <td>
        <select name="kind">
        <option value="사이트이용">사이트이용</option>
        <option value="결제관련">결제관련</option>
        <option value="스트리밍">스트리밍</option>
      </select>
      </td>
    </tr>
    <tr>
      <td>제목</td>
      <td><input type = "text" name ="title"></td>
    </tr>
    <tr>
      <td>내용</td>
      <td><input type = "text" name ="content"></td>
    </tr>

    <tr>
      <td colspan="2" align="right">
        <input type="submit" value="등록하기" id = "submit">
        <a href="AdminCenterFAQ?FAQKind=FAQList">목록으로</a>
      </td>
    </tr>

  </Table>
</form>
