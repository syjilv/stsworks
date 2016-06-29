<%@ page language="java" contentType="text/html; charset=EUC-KR" session="true" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h4>총 ${fn:length(list)}개의 상품이 있습니다.</h4>
				<hr>
			</div>
		</div>
		<div class="row">
			<c:forEach var="prd" items="${list}">
				<div class="col-md-3">
					<img src="/finalshop/resources/images/product/${prd.img_gen_file_nm}" class="img-responsive">
					<h3><a href="/finalshop/product/view.do?prd_no=${prd.prd_no}">${prd.prd_nm}</a></h3>
					<h4>${prd.sell_prc_unit}</h4>
				</div>
			</c:forEach>
		</div>
	</div>
</div>