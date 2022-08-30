<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<form action="AdminFAQInsertReg" method="get" >
  <Table border="">
    <tr>
      <td>분류</td>
      <td><input type = "text" name ="kind"></td>
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
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<style>
  option {text-align: center;}
  .input-group-prepend { width: 25%; }
  .input-group { width: 100%; margin: auto;}
  .input-group-text { justify-content: center; background: mediumslateblue; color: honeydew;}
  form { background-color: white;}
</style>
<form action="AdminFAQInsertReg" method="get">
  <br>
  <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">F&Q 등록하기</b></h1>
  <br>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text">분류</span>
    </div>
    <input type="text" class="form-control" name ="kind">
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text">제목</span>
    </div>
    <input type="text" class="form-control" name ="title">
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text">내용</span>
    </div>
    <input type="text" class="form-control" name ="content">
  </div>
  <div class="input-group">
    <input id = "submit" type="submit" value="등록하기" class="form-control btn col-lg-4" style="background:mediumpurple; color:honeydew; font-size: 20px;">
    <a class="btn btn-dark col-md-4" href="AdminCenterFAQ?FAQKind=FAQList" style="background-color: rebeccapurple; "><h5 style="line-height: inherit; font-size: 20px;">목록으로</h5></a>
  </div>
</form>
