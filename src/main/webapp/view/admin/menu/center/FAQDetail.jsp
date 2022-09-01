
<%@ page import="model.MusicDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  img { width: 100px; height: 100px; }
  option {text-align: center;}
  .input-group-prepend { width: 25%; }
  .input-group { width: 100%; margin: auto;}
  .input-group-text { justify-content: center; background:white ; color: black;}
  form { background-color: white;}
</style>
<form>
  <br>
  <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">FAQ 상세보기</b></h1>
  <br>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">번호</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%; ">${FAQData.id}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">분류</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%; ">${FAQData.nickname}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">제목</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%;">${FAQData.title}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">작성자</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%;">${FAQData.kind}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">날짜</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%;">${FAQData.reg_date}</span>
  </div>
  <div class="input-group">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew; width: 25%">내용</span>
    <textarea class="form-control justify-content-start" style="width: 75%; height: 30vh;" disabled>${FAQData.content}</textarea>
  </div>


  <div class="input-group">
    <a class="btn btn-dark col-md-4" href="AdminCenterFAQ?id=${FAQData.id}&FAQKind=FAQModify" style="background-color: mediumpurple; border-color: mediumpurple;"><h5 style="line-height: inherit; font-size: 20px;">수정</h5></a>
    <a class="btn btn-dark col-md-4" href="AdminCenterFAQ?id=${FAQData.id}&FAQKind=FAQDelete" style="background-color: rebeccapurple; border-color:rebeccapurple"><h5 style="line-height: inherit; font-size: 20px;">삭제</h5></a>
    <a class="btn btn-dark col-md-4" href="AdminCenterFAQ?FAQKind=FAQList" style="background-color: indigo; border-color: indigo;"><h5 style="line-height: inherit; font-size: 20px;">목록으로</h5></a>
    <%--<a href = "AdminCenterFAQ?id=${FAQData.id}&FAQKind=FAQModify">수정</a>
    <a href = "AdminCenterFAQ?id=${FAQData.id}&FAQKind=FAQDelete">삭제</a>
    <a href = "AdminCenterFAQ?FAQKind=FAQList">목록으로</a>--%>
  </div>
</form>

