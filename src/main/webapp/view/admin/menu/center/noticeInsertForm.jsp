<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
</form>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
  option {text-align: center;}
  .input-group-prepend { width: 25%; }
  .input-group { width: 100%; margin: auto;}
  .input-group-text { justify-content: center; background: mediumslateblue; color: honeydew;}
  form { background-color: white;}
</style>
<form action="AdminNoticeInsertReg" method="get">
  <br>
  <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">공지사항 등록하기</b></h1>
  <br>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text">제목</span>
    </div>
    <input type="text" class="form-control" name ="title">
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text">분류</span>
    </div>
    <select name="kind" class="form-control">
      <option value="">--분류를 선택해 주세요--</option>
      <option value="공지사항">공지사항</option>
      <option value="업데이트">업데이트</option>
    </select>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text">내용</span>
    </div>
    <input type="text" class="form-control" name ="content">
  </div>
  <div class="input-group">
    <input type="submit" value="등록하기" class="form-control btn col-lg-4" style="background:mediumpurple; color:honeydew; font-size: 20px;">
    <a class="btn btn-dark col-md-4" href="AdminCenter?noticeKind=noticeList" style="background-color: rebeccapurple; "><h5 style="line-height: inherit; font-size: 20px;">목록으로</h5></a>
  </div>
</form>

