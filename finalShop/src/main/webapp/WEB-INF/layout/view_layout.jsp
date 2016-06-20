<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
<c:if test="${param.category eq null}">
	<link href="/finalshop/resources/common/css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/finalshop/resources/common/js/modernizr.custom.79639.js"></script>
</c:if>
</head>
<body>
<!-- 메뉴 Active 스크립트 -->
<script type="text/javascript">
	$(document).ready(function() {
		var url = $(location).attr("pathname") + $(location).attr("search");
		$("#menu li a").each(function() {
			if ($(this).attr("href") == url) {
				$(this).parent().addClass("active");
			}
		})
	})
</script>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<tiles:insertAttribute name="middle"></tiles:insertAttribute>
	<tiles:insertAttribute name="content"></tiles:insertAttribute>
</body>
</html>