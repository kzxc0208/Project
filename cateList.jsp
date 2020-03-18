<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/dbcon2.jsp" %>

<%
	String dbcode = request.getParameter("code"); /* */
	
			String dbname = " ";  /* SQL쿼리 안에 cateName을 얻기 위해 문자타입으로 초기값 미리 만들어놓음 */
		if (dbcode != null && "".equals(dbcode))  {    /* 코드값이 null도 아니고 공백도 아닐때 = 코드값이 존재할때 */
			
				/* 코드 값이 존재할때 아래 SQL문을 실행한다 */
			String sql2 = " select cateName from category "
			            + " where code = '"+dbcode+"' ";
			ResultSet rs2 = stmt.executeQuery(sql2);
			rs2.next();
			dbname = rs2.getString("Name"); /* 초기값 잡아놨던 dbname을  cateName의 데이터를 가져오기 위해 getString으로 대입함 */
		}


	String sql = " select code,cateName from category "
	           + " order by cateName asc ";     /* cateName asc 을 통해 상품명 알파벳 순으로 정렬 */
     ResultSet rs = stmt.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 관리</title>

	<link rel="stylesheet" href="../css/adminlayout.css">

</head>
<style>
	
</style>
<body>
<div class="container">
	<div class="adminLeft"> <!-- DIV 왼쪽  -->
				<%@ include file="leftMenu.jsp" %>
		</div>
		
		<div class="adminRight"> <!-- DIV 오른쪽 -->
			<!-- 카테고리 목록 출력 -->		
	
	<table class="table1">
		<tr>
			<th width="20%">순번</th>
			<th width="50%">카테고리</th>
			<th width="15%">수정</th>
			<th width="15%">삭제</th>
		</tr>
		
		<%
			int number = 1;
			while (rs.next()) {
				String code = rs.getString("code"); // 위 SQL을 통한 code 데이터 가져오기
				String cateName = rs.getString("cateName"); // 위 SQL을 통한 cateName 데이터 가져오기
		%>
		
		<tr>
			<td><%=number %></td>
			<td><%=cateName %></td>                        <!--   ↓ 위 while문을 통해 얻어온 데이터 값  -->
			<td><a href="<%=request.getRequestURL() %>?code=<%=code %>">수정</a></td>  <!-- request.getRequestURL() : 자기자신을 호출하는 메소드 -->
			<td><a href="cateSave.jsp?code=<%=code %>&gubun=D">삭제</a></td>
		</tr>
		
		<%
				number++;
			}
		%>
		
	</table>


	<!-- 카테고리 등록 출력 -->
	  
	   <!-- 위의 dbcode를 이용한 하나의 버튼으로 '등록','수정' 사용하기 -->
	<%
	String buttonMsg = "";
		if ("".equals(dbcode) || dbcode == null) {
			buttonMsg = "등록";
		} else {
			buttonMsg = "수정";
		}
	%>
	
	<form name="frm" method="post" action="cateSave.jsp">   <!-- form 안의 데이터를 cateSave.jsp로 전송 ↓ 버튼 타입 submit이므로 따로 자바스크립트 없어도 전송된다. -->
		<input type="hidden" name="code" value="<%=dbcode %>"> <!-- 위에서 겟파라미터로 가져온 dbcode -->
		<input type="text" name="cateName" value="<%=dbname %>"> <!-- 위에서의 rs2.getString으로 가져온 cateName 데이터 -->
		<button type="submit" onclick=""><%=buttonMsg %></button>
	</form>	
	</div>
</div>
</body>
</html>
