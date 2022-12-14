<%--
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
      <td><input type = "text" name ="kind" value="${FAQData.kind}"></td>
    </tr>
    <tr>
      <td>내용</td>
      <td><input type = "text" name ="content" value="${FAQData.content}"></td>
    </tr>

    <tr>
      <td colspan="2" align="right">
        <input type="submit" value="등록하기" id = "submit">

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

<form action="AdminFAQModifyReg" method="get">
  <input type ="hidden" name ="id" value="${FAQData.id}">
  <br>
  <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">FAQ 수정하기</b></h1>
  <br>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text">제목</span>
    </div>
    <input type="text" class="form-control" name ="title" value="${FAQData.title}">
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text">분류</span>
    </div>
    <select name="kind" class="form-control">
      <option value="${FAQData.kind}">현재 선택 분류: ${FAQData.kind}</option>
      <option value="사이트이용">사이트이용</option>
      <option value="결제관련">결제관련</option>
      <option value="스트리밍">스트리밍</option>
    </select>
  </div>
  <div class="input-group">
    <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew; width: 25%">내용</span>
    <textarea name="content" class="form-control justify-content-start" style="width: 75%; height: 30vh;">${FAQData.content}</textarea>
  </div>
  <div class="input-group">
    <input id = "submit" type="submit" value="등록하기" class="form-control btn col-lg-4" style="background:mediumpurple; color:honeydew; font-size: 20px;">
    <a class="btn btn-dark col-md-4" href="AdminCenterFAQ?id=${FAQData.id}&FAQKind=FAQDetail" style="background-color: rebeccapurple; "><h5 style="line-height: inherit; font-size: 20px;">목록으로</h5></a>
  </div>
</form>
