<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,emp.dto.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% List<MyEmpDTO> userlist  =
			(List<MyEmpDTO>)request.getAttribute("userlist"); 
	   int size = userlist.size();	%>
	<h1>회원목록(MVC)</h1>
	
	<hr/>
	<table align="center" border="1" width="600">
		<tr bgcolor="skyblue">
			<th>아이디</th><th>패스워드</th><th>성명</th>
			<th>주소</th><th>부서번호</th>
			<th>삭제</th>
		</tr>
		<%for(int i = 0;i<size;i++){
			MyEmpDTO user = userlist.get(i);%>
			<tr>
				<td><a href="mybatisDetail.do?id=<%= user.getId() %>"><%= user.getId() %></a></td>
				<td><%= user.getPass() %></td>
				<td><%= user.getName() %></td>
				<td><%= user.getAddr()%></td>
				<td><%= user.getDeptno() %></td>
				<td>
		<a href="mybatisDelete.do?id=<%=user.getId() %>">삭제</a></td>
			</tr>
		<%} %>
	</table>
</body>
</html>










