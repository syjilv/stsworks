<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="page-header">
					<h1>상품 가격 비교</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<h3>결과 : ${total}</h3>
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>사이트명</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="shop" items="${list}" varStatus="i">
							<tr>
								<td>${i.count}</td>
								<td>${shop.shop}</td>
								<td>${shop.price}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr>
				<a href="/finalshop/product/compare.do?page_no=0">1</a>
				<a href="/finalshop/product/compare.do?page_no=1">2</a>
				<a href="/finalshop/product/compare.do?page_no=2">3</a>
			</div>
		</div>
	</div>
</div>