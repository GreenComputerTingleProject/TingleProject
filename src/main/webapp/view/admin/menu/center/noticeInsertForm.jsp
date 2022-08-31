<%--
  Created by IntelliJ IDEA.
  User: 82108
  Date: 2022-08-14
  Time: 오후 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<form action="AdminNoticeInsertReg" method="get" >
  <Table border="">
    <tr>
      <td>제목</td>
      <td><input type = "text" name ="title"></td>
    </tr>
    <tr>
      <td>분류</td>
      <td><select name="kind">
        <option value="">--분류를 선택해 주세요--</option>
        <option value="공지사항">공지사항</option>
        <option value="업데이트">업데이트</option>
      </select>
      </td>
    </tr>
    <tr>
      <td>내용</td>
      <td><input type = "text" name ="content"></td>
    </tr>

    <tr>
      <td colspan="2" align="right">
        <input type="submit" value="등록하기" id = "submit">
        <a href="AdminCenter?noticeKind=noticeList">목록으로</a>
      </td>
    </tr>

  </Table>
</form>
