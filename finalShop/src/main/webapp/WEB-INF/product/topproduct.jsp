<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="ia-container">
	<c:forEach var="prd" items="${toplist}" varStatus="status">
		<figure>
			<img src="/finalshop/resources/images/product/${prd.img_gen_file_nm}"
				alt="${prd.prd_nm}" />
			<c:choose>
				<c:when test="${status.first}">
					<input type="radio" name="radio-set" checked="checked" />
				</c:when>
				<c:otherwise>
					<input type="radio" name="radio-set" />
				</c:otherwise>
			</c:choose>
			<figcaption>
				<span>${prd.prd_nm}</span>
			</figcaption>
	</c:forEach>
	<c:forEach items="${toplist}">
		</figure>
	</c:forEach>
</div>