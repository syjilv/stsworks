<%@page import="openapi.dto.ParseDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css" href="/minishop/common/css/master.css" rel="stylesheet" media="screen,print" />
<link type="text/css" href="/minishop/common/css/print.css" rel="stylesheet" media="print" />
<link type="text/css" href="/minishop/common/css/mall.css" rel="stylesheet" media="screen,print" />
<link type="text/css" href="/minishop/common/css/weather.css" rel="stylesheet" media="screen,print" />

<%
	ArrayList<ParseDTO> weatherlist = (ArrayList<ParseDTO>)request.getAttribute("weatherlist");
	int size = weatherlist.size();
	ParseDTO dto = new ParseDTO();
%>
</head>
<body>
	<div id ="weather">
		<%
		for(int i = 0; i < weatherlist.size(); i++){
			dto = weatherlist.get(i);
		%>
			<div id="location" class="<%=	dto.getWeatherLocation() %>">
				<ul>
					<li class="title"><%=	dto.getWeatherName() %></li>
					<li><img src="http://www.kma.go.kr/<%=	dto.getWeatherImg() %>" alt="<%=	dto.getWeatherStatus() %>"/></li>
					<li><%=	dto.getWeatherDegree() %></li>
				</ul>
			</div>
		<% } %>
		<h1>오늘의 날씨</h1>
		<span>(<%=	dto.getWeatherClock() %>)</span>

	</div>
</body>
</html>