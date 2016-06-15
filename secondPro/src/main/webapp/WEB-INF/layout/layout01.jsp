<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	#header {
		height:auto;
	}
	#left {
		width:25%;
		height:auto;
		float:left;
	}
	#content {
		width:75%;
		height:auto;
		float:right;
	}
</style>
</head>
<body>
	<div id="header">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</div>
	<div id="left">
		<tiles:insertAttribute name="left"></tiles:insertAttribute>
	</div>
	<div id="content">
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</div>
</body>
</html>