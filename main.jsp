<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp" %>
<%
String ssesionId = (String)session.getAttribute("SessionUserid");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/layout.css">
<title>Main</title>
</head>
<script>
function fn_login() {
	  var f = document.frm;
	  if(f.userid.value == "") {
		  alert("아이디를 입력해주세요.");
		  return false;
	  }
	  if(f.pass.value == "") {
		  alert("패스워드를 입력해주세요.");
		  return false;
	  }
	  f.submit();
}

function fn_memberModify() {
	var url = "../member/memberMoldify.jsp";
	location = url;
}

function fn_logout() {
	var url = "../member/logout.jsp";
	location = url;
}
function fn_logout() {
	var url = "../member/memberWrite.jsp";
	location = url;
}


</script>
<body>
<%@ include file = "../include/topmenu.jsp" %>
<div id="img">
	<div class="word">당신의 선물로<br>아기의 생명을 지킬 수 있어요.</div>
</div>
<form name="frm" method="post" action="../member/loginSub.jsp">
<div id="content2">
	<div class="sidebox">
	<p>

	
	<%
	if(ssesionId == null || "".equals(ssesionId)) { 
	%>
		아이디 <input type="text" name="userid"><br>
		비밀번호 <input type="password" name="pass"><br><br>
		<button type="submit" name="login" onclick="fn_login(); return false;">로그인</button>
		<button type="button" onclick="fn_memberWrite();">회원가입</button>
	<%
	} else {
	%>
		<%=ssesionId %> 님 환영합니다.<br><br><br>
		<button type="button" name="member" onclick="fn_memberModify();">회원정보수정</button>
		<button type="button" name="member" onclick="fn_logout();">로그아웃</button>
	<%
	}
	%>

	</p>
	</div>
	<div class="box1">
	</div>
	<div class="box1"></div>
	<div class="box1"></div>
</div>
</form>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>