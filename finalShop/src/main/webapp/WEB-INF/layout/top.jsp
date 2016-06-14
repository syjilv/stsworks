<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/finalshop/resources/common/css/lavalamp_test.css" type="text/css" media="screen">
<script type="text/javascript" src="/finalshop/resources/common/js/jquery-1.2.3.min.js"></script>
<script type="text/javascript" src="/finalshop/resources/common/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="/finalshop/resources/common/js/jquery.lavalamp.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("#menu").lavaLamp({
            fx: "backout",
            speed: 700
		});
    });
</script>

<title>자바나라 쇼핑몰</title>

</head>
<body>
	<div style="width:800; margin:auto;">
		<h1 style="float: left;">자바나라 쇼핑몰</h1>
		<div>
			<h5 style="float: right; margin-left: 10px">
			<a href="#">게시판</a></h5>
			<h5 style="float: right; margin-left: 10px">e-book</h5>
			<h5 style="float: right; margin-left: 10px">
				님</h5>
			<h5 style="float: right; margin-left: 10px">
				<a href="#">로그아웃</a></h5>
			<h5 style="float: right; margin-left: 10px">
				<a href="#">회원가입</a></h5>
			<h5 style="float: right; margin-left: 10px">
				<a href="#">로그인</a></h5>
		
		</div>
		<div style="clear:both;">
			<ul class="lavaLampNoImage" id="menu">
				<li class="current">
				<a href="index.do">Home</a></li>
				<li><a href="prdlist.do?category=CAT000000001">DRESS</a></li>
				<li><a href="prdlist.do?category=CAT000000002">TOP</a></li>
				<li><a href="prdlist.do?category=CAT000000003">BOTTOM</a></li>
				<li><a href="prdlist.do?category=CAT000000004">OUTER</a></li>
				<li><a href="prdlist.do?category=CAT000000005">ACC</a></li>
				<li><a href="prdlist.do?category=CAT000000006">CARDIGAN</a></li>
			</ul>
		</div>
	</div>
</body>
</html>