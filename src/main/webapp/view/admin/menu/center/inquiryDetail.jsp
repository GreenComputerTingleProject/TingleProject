<%--<%@ page import="model.MusicDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>

<style>
  img {
    width: 100px;
    height: 100px;
  }

</style>

<form action="AdminCenterInquiry" method="get">
<Table border="">
  <tr>
    <td>번호</td>
    <td>${inquiryData.id}</td>
  </tr>
  <tr>
    <td>유저번호</td>
    <td>${inquiryData.user_id}</td>
  </tr>
  <tr>
    <td>유저 아이디</td>
    <td>${inquiryData.login_id}</td>
  </tr>
  <tr>
    <td>닉네임</td>
    <td>${inquiryData.nickname}</td>
  </tr>
  <tr>
    <td>제목</td>
    <td>${inquiryData.title}</td>
  </tr>
  <tr>
    <td>분류</td>
    <td>${inquiryData.kind}</td>
  </tr>
  <tr>
    <td>날짜</td>
    <td>${inquiryData.reg_date}</td>
  </tr>
  <tr>
    <td>내용</td>
    <td>${inquiryData.content}</td>
  </tr>
  <tr>
    <td>답변여부</td>
    <td>${inquiryData.checked}</td>
  </tr>
  <tr>
    <td>답변</td>
    <td><input type="text" value="${inquiryData.answer}" name="answer"></td>
  </tr>
  <input type="hidden" value="${inquiryData.id}" name ="id">
  <input type="hidden" value="inquiryAnswer" name ="inquiryKind">

  <tr>
    <td colspan="2" align="right">
      <input type="submit" value="답변하기">
      <a href = "AdminCenterInquiry?id=${inquiryData.id}&inquiryKind=inquiryDelete">삭제</a>
      <a href = "AdminCenterInquiry?inquiryKind=inquiryList">목록으로</a>
    </td>
  </tr>

</Table>
</form>--%>

<%@ page import="model.MusicDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/jquery/"/>jquery-3.6.0.js"></script>
<script src="<c:url value="/jquery/"/>jquery-ui.min.js"></script>
<style>
  img { width: 100px; height: 100px; }
  option {text-align: center;}
  .input-group-prepend { width: 25%; }
  .input-group { width: 100%; margin: auto;}
  .input-group-text { justify-content: center; background:white ; color: black;}
  form { background-color: white;}
  a:hover {background-color: white;}
</style>
<form action="AdminCenterInquiry" method="get">
  <br>
  <h1 class="nav navbar-text" style="display:block; text-align: center;"><b style="font-family: 'Play fair ';">1:1문의 상세보기</b></h1>
  <br>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">번호</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%; ">${inquiryData.id}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">유저번호</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%; ">${inquiryData.user_id}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">유저 아이디</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%;">${inquiryData.login_id}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">닉네임</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%;">${inquiryData.nickname}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">제목</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%;">${inquiryData.title}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">분류</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%;">${inquiryData.kind}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">날짜</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%;">${inquiryData.reg_date}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">내용</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%;">${inquiryData.content}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text" style="background-color: mediumslateblue; color:honeydew;">답변여부</span>
    </div>
    <span class="input-group-text justify-content-start" style="width: 75%;">${inquiryData.checked}</span>
  </div>
  <div class="input-group">
    <div class="input-group-prepend">
      <span class="input-group-text"style="background-color: mediumslateblue; color:honeydew;">답변</span>
    </div>
    <input type="text" class="form-control" name ="answer" value="${inquiryData.answer}" style="background: orchid; color: honeydew;">
    <input type="hidden" value="${inquiryData.id}" name ="id">
    <input type="hidden" value="inquiryAnswer" name ="inquiryKind">
  </div>

  <div class="input-group">
    <input type="submit" class="btn col-md-4 form-control" value="답변하기" style="color: honeydew; background-color: mediumpurple">
    <a class="btn btn-dark col-md-4" href="AdminCenterInquiry?id=${inquiryData.id}&inquiryKind=inquiryDelete" style="background-color: rebeccapurple; border-color: rebeccapurple;"><h5 style="line-height: inherit; font-size: 20px;">삭제</h5></a>
    <a class="btn btn-dark col-md-4" href="AdminCenterInquiry?inquiryKind=inquiryList" style="background-color: indigo; border-color: indigo;"><h5 style="line-height: inherit; font-size: 20px;">목록으로</h5></a>
  </div>
</form>

