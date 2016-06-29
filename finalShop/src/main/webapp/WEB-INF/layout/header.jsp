<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header/Navbar -->
<div class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="/finalshop/"><span>JavaNara Shop</span></a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-ex-collapse">
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${sessionScope.member.mem_id != null}">
						<li><a><b>${member.mem_nm}(${member.mem_id})님 <span class="fa fa-fw fa-heart text-danger"></span></b></a></li>
						<li><a href="/finalshop/member/logout.do">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/finalshop/member/login.do">로그인</a></li>
					</c:otherwise>
				</c:choose>
				<li><a href="/finalshop/product/word_count_result.do">Word Count</a></li>
				<li><a href="/finalshop/board/list.do">게시판</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- header/Menu -->
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<ul id="menu" class="lead nav nav-justified nav-pills">
					<li><a href="/finalshop/product/prdlist.do?category=CAT000000001">DRESS</a></li>
					<li><a href="/finalshop/product/prdlist.do?category=CAT000000002">TOP</a></li>
					<li><a href="/finalshop/product/prdlist.do?category=CAT000000003">BOTTOM</a></li>
					<li><a href="/finalshop/product/prdlist.do?category=CAT000000004">OUTER</a></li>
					<li><a href="/finalshop/product/prdlist.do?category=CAT000000005">ACC</a></li>
					<li><a href="/finalshop/product/prdlist.do?category=CAT000000006">CARDIGAN</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>