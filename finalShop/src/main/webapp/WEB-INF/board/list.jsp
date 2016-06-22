<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<script>
// 전송 전 체크
function searchCheck() {
	if(searchform.keyword.value.length == 0) {
		alert("검색어를 입력해 주세요.");
		searchform.keyword.focus();
		return false;
	} else if(searchform.keyword.value.length <= 1) {
		alert("검색어는 2자 이상 입력해 주세요.");
		searchform.keyword.focus();
		return false;
	}
	else return true;
}
</script>
<%-- 검색모드일 경우 구분 --%>
<c:choose>
	<c:when test="${mode eq 'search'}">
		<c:set var="modeParam" value="mode=${mode}&target=${target}&keyword=${keyword}&"/>
	</c:when>
	<c:otherwise>
		<c:set var="modeParam" value=""/>
	</c:otherwise>
</c:choose>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>게시판 </h1>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<thead>
						<tr class="active">
							<th class="text-center col-md-1">#</th>
							<th class="text-center col-md-6">제목</th>
							<th class="text-center col-md-2">작성자</th>
							<th class="text-center col-md-2">날짜</th>
							<th class="text-center col-md-1">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<%-- 목록이 없을 경우 --%>
							<c:when test="${fn:length(list) eq 0}">
								<tr class="text-center">
									<td colspan="5">글이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="board" items="${list}">
									<%-- 게시물 보기 밑에 붙는 리스트일 경우 현재 보고 있는 게시물 표시 --%>
									<c:choose>
										<c:when test="${board_no eq board.board_no}">
											<tr class="active">
												<td class="text-center">
													<span class="fa fa-fw fa-angle-double-right"></span>
												</td>
										</c:when>
										<c:otherwise>
											<tr>
												<td class="text-center">
													${board.board_no}
												</td>
										</c:otherwise>
									</c:choose>
									<%-- 글 제목 --%>
										<td class="text-left">
											<%-- 제목 싱글쿼트, 태그, 공백 처리 --%>
											<c:set var="new_title" value="${board.title}"/>
											<c:set var="new_title" value="${fn:replace(new_title, \"′\", \"'\")}"/>
											<c:set var="new_title" value="${fn:replace(new_title, \"\\\u0020\", \"&nbsp;\")}"/>
											<c:set var="new_title" value="${fn:replace(new_title, \">\", \"&gt;\")}"/>
											<c:set var="new_title" value="${fn:replace(new_title, \"<\", \"&lt;\")}"/>
											<%-- 제목 너무 길면 자르기 --%>
											<c:if test="${fn:length(new_title) gt 50}">
												<c:set var="new_title" value="${fn:substring(newTitle, 0, 50)}..."/>
											</c:if>

											<a href="view.do?${modeParam}&page_no=${page_no}&board_no=${board.board_no}">${new_title}</a>									</a>

											<%-- 작성한지 12시간 이내면 New 뱃지 달아주기 --%>
											<c:set var="now" value="<%= new java.util.Date() %>"/>
											<fmt:parseDate var="write_dtm" value="${board.reg_dtm}" pattern="yyyyMMddHHmmss" />
											<c:if test="${(now.time - (1000*60*60*12)) le write_dtm.time}">
												<sup><span class="label label-warning">New</span></sup>
											</c:if>
										</td>
										<%-- 글쓴이 --%>
										<td class="text-center">
											${board.mem_nm}<small>(${board.mem_id})</small>
										</td>
										<%-- 작성일 --%>
										<td class="text-center">
											<%-- 오늘 작성된 글이면 시간 표출, 아니면 날짜 표출 --%>
											<fmt:formatDate var="today" value="${now}" type="both" pattern="yyyy-MM-dd"/>
											<fmt:formatDate var="write_date" value="${write_dtm}" type="both" pattern="yyyy-MM-dd"/>
											<c:choose>
												<c:when test="${today} eq ${write_date}">
													<fmt:formatDate value="${write_dtm}" type="both" pattern="HH:mm:ss"/>
												</c:when>
												<c:otherwise>
													${write_date}
												</c:otherwise>
											</c:choose>
										</td>
										<%-- 조회수 --%>
										<td class="text-center">
											${board.count}
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<a class="btn btn-default btn-lg" href="/finalshop/board/list.do?page_no=${page_no}"><span class="fa fa-fw fa-th-list"></span> 목록</a>
			</div>
			<!--  검색폼 끝 -->
			<div class="col-md-3 text-right">
				<a class="btn btn-lg btn-primary" href="write.do"><span class="fa fa-fw fa-pencil"></span> 글쓰기</a>
			</div>
		</div>
			<!-- 페이징 -->
		<div class="row">
			<div class="col-md-12 text-center">
				<c:if test="${fn:length(list) ne 0}">
					<%-- 페이징에서 보여지는 첫 페이지 --%>
					<c:choose>
						<c:when test="${(page_no % 5) eq 0}">
							<c:set var="startPage" value="${page_no - 4}"/>
						</c:when>
						<c:when test="${page_no gt 5}">
							<c:set var="startPage" value="${page_no - (page_no % 5) + 1}"/>
						</c:when>
						<c:otherwise>
							<c:set var="startPage" value="1"/>
						</c:otherwise>
					</c:choose>
				 	<%-- 전체 게시물의 마지막 페이지 --%>
					<c:choose>
						<c:when test="${(count % 10) eq 0}">
							<c:set var="lastPage" value="${count / 10}"/>
						</c:when>
						<c:otherwise>
							<fmt:parseNumber var="lastPage" value="${(count / 10) + 1}" integerOnly="true"/>
						</c:otherwise>
					</c:choose>
					<ul class="pagination pagination-lg">
						<%-- Prev 처리 --%>
						<c:choose>
							<c:when test="${page_no eq 1}">
								<li class="disabled"><a href="#">Prev</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/finalshop/board/list.do?${modeParam}&page_no=${page_no - 1}">Prev</a></li>
							</c:otherwise>
						</c:choose>

						<%-- 기본적으로 보여지는 페이징 수는 5 --%>
						<c:set var="pageSize" value="5"/>
						<%-- 페이지 수가 5페이지가 안될 경우 --%>
						<c:if test="${(startPage + 4) gt lastPage}">
							<c:set var="pageSize" value="${lastPage - startPage + 1}"/>
						</c:if>
						<%-- 페이징 표시 및 링크 처리 --%>
						<c:forEach var="i" begin="0" end="${pageSize - 1}" step="1">
							<c:set var="showPage" value="${startPage + i}"/>
							<c:choose>
								<c:when test="${showPage eq page_no}">
									<li class="active">
								</c:when>
								<c:otherwise>
									<li>
								</c:otherwise>
							</c:choose>
										<a href="/finalshop/board/list.do?${modeParam}page_no=${showPage}">${showPage}</a>
									</li>	
						</c:forEach>
						
						<%-- Next 처리 --%>
						<c:choose>
							<c:when test="${page_no eq lastPage}">
								<li class="disabled"><a href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/finalshop/board/list.do?${modeParam}page_no=${page_no + 1}">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
</div>
