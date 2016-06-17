<%@page import="emp.dto.MyEmpDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" session="true" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% MyEmpDTO userInfo = (MyEmpDTO) session.getAttribute("userInfo"); %>

	<div>
		<h3>메인페이지<br/>(어노테이션)</h3>
		<hr/>
		<% if(userInfo != null) { %>
			<h5>아이디 : ${userInfo.id}</h5>
			<h5>이  름 : ${userInfo.name}</h5>
			<h5><a href="/mySecondPro/logout.do">로그아웃</a></h5>
		<% } else { %>

			<h5><a href="/mySecondPro/login.do">로그인</a></h5>
		<% } %>
		<hr/>
		<h5><a href="/mySecondPro/test.do">스프링 웹 MVC연동하기</a></h5>
		<h5><a href="/mySecondPro/insert.do">회원가입</a></h5>
		<h5><a href="/mySecondPro/list.do">회원목록</a></h5>
		<h5><a href="/mySecondPro/search.do">회원검색</a></h5>
		<hr/>
		<h5><a href="/mySecondPro/emp/count.do">인원수 확인(Mybatis)</a></h5>
		<h5><a href="/mySecondPro/mybatisList.do">회원목록(Mybatis)</a></h5>
		<h5><a href="/mySecondPro/mybatisSearch.do">회원검색(Mybatis)</a></h5>
		<h5><a href="/mySecondPro/insert.do">회원가입(Mybatis)</a></h5>
		<h5><a href="/mySecondPro/txInsert.do">회원가입(트랙잭션처리)</a></h5>
		<h5><a href="/mySecondPro/i18nTest.do?lang=ko">다국어지원(ko)</a></h5>
		<h5><a href="?lang=en">다국어지원(en)</a></h5>
		<h5><a href="?lang=jp">다국어지원(jp)</a></h5>
	</div>
</body>
</html>