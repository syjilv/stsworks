<%@page import="product.dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/minishop/common/css/style.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300,300italic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript"
	src="/minishop/common/js/modernizr.custom.79639.js"></script>
<%
	ArrayList<ProductDTO> toplist = (ArrayList<ProductDTO>) request.getAttribute("toplist");
	int size = toplist.size();
%>
</head>
<body>
	<div class="ia-container">
		<%
			for (int i = 0; i < size; i++) {
				ProductDTO prd = toplist.get(i);
		%>
		<figure>
			<img src="/minishop/images/product/<%=prd.getImg_gen_file_nm()%>"
				alt="<%=prd.getPrd_nm()%>" />
			<input type="radio" name="radio-set" <%if (i == 0) {%>
				checked="checked" <%}%> />
			<figcaption>
				<span><%= prd.getPrd_nm()%></span>
			</figcaption>
			<%
				}
				for (int i = 0; i < size; i++) {
			%>
		</figure>
		<%
			}
		%>

	</div>
</body>
</html>