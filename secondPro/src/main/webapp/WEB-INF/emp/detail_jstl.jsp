<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<form name="form1" method="post" action="update_form.do">
			<table width="400" border="1">
				<tr>
					<td>회원아이디</td>
					<td><input type="text" name="id" value="${user.id}" size="25" readonly></td>
				</tr>
				<tr>
					<td>회원패스워드</td>
					<td><input type="text" name="pass" value="${user.pass}" size="25" readonly></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="name" value="${user.name}" size="25" readonly></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="addr" value="${user.addr}" size="25" readonly></td>
				</tr>
				<tr>
					<td>회원부서코드</td>
					<td><input type="text" name="deptno" value="${user.deptno}" size="25" readonly></td>
				</tr>
				<tr>
					<td>등급</td>
					<td><input type="text" name="grade" value="${user.grade}" size="25" readonly></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기" />
						<input type="button" value="삭제하기" onclick="location.href='mybatisDelete.do?id=${user.id}'"/>
						<input type="button" value="목록보기" onclick="location.href='mybatisList.do'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>









