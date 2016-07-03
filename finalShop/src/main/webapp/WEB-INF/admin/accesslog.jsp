<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true"%>
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
					<h1>접속 기록 <small>${today} 현재</small></h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h3>전체 기록</h3>
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>Year</th>
							<th>Month</th>
							<th>IP</th>
							<th>URI</th>
							<th>Count</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="log" items="${list}" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${log.year}</td>
								<td>${log.month}</td>
								<td>${log.ip}</td>
								<td>${log.uri}</td>
								<td>${log.count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h3>by Month</h3>
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>Year</th>
							<th>Month</th>
							<th>Count</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="month" items="${byMonth}" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${month.year}</td>
								<td>${month.month}</td>
								<td>${month.count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<h3>by IP</h3>
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>IP</th>
							<th>Count</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ip" items="${byIP}" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${ip.ip}</td>
								<td>${ip.count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-md-6">
				<h3>by URI</h3>
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>URI</th>
							<th>Count</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="uri" items="${byURI}" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${uri.uri}</td>
								<td>${uri.count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>