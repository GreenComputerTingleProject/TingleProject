<%--
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
      <td><input type = "text" name ="kind" value="${noticeData.kind}"></td>
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
  </Table>
</form>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
  option {text-align: center;}
  .input-group-prepend { width: 25%; }
  .input-group { width: 100%; margin: auto;}
  .input-group-text { justify-content: center; background: mediumslateblue; color: honeydew;}
  form { background-color: white;}
</style>

<form action="AdminNoticeModifyReg" method="get">
  <input type ="hidden" name ="id" value="${noticeData.id}">
  <br><br><br>
  <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">공지사항 수정하기</b></h1>
  <br>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text">제목</span>
    </div>
    <input type="text" class="form-control" name ="title" value="${noticeData.title}">
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text">분류</span>
    </div>
    <input type="text" class="form-control" name ="kind" value="${noticeData.kind}">
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text">내용</span>
    </div>
    <input type="text" class="form-control" name="content" value="${noticeData.content}">
  </div>
  <div class="input-group">
    <input type="submit" value="등록하기" class="form-control btn col-lg-4" style="background:mediumpurple; color:honeydew; font-size: 20px;">
    <a class="btn btn-dark col-md-4" href="AdminCenter?id=${noticeData.id}&noticeKind=noticeDetail" style="background-color: rebeccapurple; "><h5 style="line-height: inherit; font-size: 20px;">뒤로</h5></a>
  </div>
</form>

