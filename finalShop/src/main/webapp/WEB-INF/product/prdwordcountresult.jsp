<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate var="month" value="${now}" pattern="M" />
<fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />


<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h1>${month}월 상품평 Word Count <small>${today} 현재</small></h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<h3>전체 목록</h3>
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>Word</th>
							<th>Count</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="word" items="${result}" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${word.word}</td>
								<td>${word.count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-6">
				<h3>Top 10</h3>
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>Word</th>
							<th>Count</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="word" items="${result}" end="9" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${word.word}</td>
								<td>${word.count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>