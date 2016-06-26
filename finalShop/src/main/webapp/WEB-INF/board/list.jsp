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
	// 검색모드일 경우 Option에 selected 적용
	$(document).ready(function() {
		$("#target > option").removeAttr("selected");
		$("#target > option[value=${target}]").attr("selected", "ture");
	});
</script>
<%-- 검색모드일 경우 주소에 파라미터 매번 붙이기 귀찮으니 세트로 묶음 --%>
<c:choose>
	<c:when test="${mode eq 'search'}">
		<c:set var="modeParam" value="mode=${mode}&target=${target}&keyword=${keyword}&"/>
		<c:set var="modeRef" value="search.do"/>
		
	</c:when>
	<c:otherwise>
		<c:set var="modeParam" value=""/>
		<c:set var="modeRef" value="list.do"/>
	</c:otherwise>
</c:choose>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>게시판</h1>
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
										<c:when test="${board.board_no eq board_no}">
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
											<c:set var="newTitle" value="${board.title}"/>
											<%-- 제목 너무 길면 자르기 --%>
											<c:if test="${fn:length(newTitle) gt 50}">
												<c:set var="newTitle" value="${fn:substring(newTitle, 0, 50)}..."/>
											</c:if>
											<%-- 제목 싱글쿼트, 태그, 공백 처리 --%>
											<% pageContext.setAttribute("u0020", "\u0020"); %>
											<c:set var="newTitle" value="${fn:replace(newTitle, \"′\", \"'\")}"/>
											<c:set var="newTitle" value="${fn:replace(newTitle, u0020, \"&nbsp;\")}"/>
											<c:set var="newTitle" value="${fn:replace(newTitle, \">\", \"&gt;\")}"/>
											<c:set var="newTitle" value="${fn:replace(newTitle, \"<\", \"&lt;\")}"/>

											<a href="view.do?${modeParam}page_no=${page_no}&board_no=${board.board_no}">${newTitle}</a>
											<%-- 댓글 수 표시 --%>
											<c:if test="${board.reply_size ne 0}">
												<span class="text-danger"> [${board.reply_size}]</span>
											</c:if>
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
				<a class="btn btn-default btn-lg" href="/finalshop/board/list.do"><span class="fa fa-fw fa-th-list"></span> 최신목록</a>
			</div>
			<%-- 검색폼을 난 왜 붙여서 고생하는가 --%>
			<div class="col-md-6">
				<form role="form" name="searchform" action="/finalshop/board/search.do" method="GET" onsubmit="return searchCheck()">
					<div class="input-group input-group-lg">
						<select id="target" class="form-control input-lg" name="target" style="width:30%">
							<option value="all">제목+내용</option>
							<option value="title">제목</option>
							<option value="text">내용</option>
							<option value="mem_nm">작성자(이름)</option>
							<option value="mem_id">작성자(ID)</option>
						</select>
						<!-- 키워드 표시 -->
						<c:choose>
							<c:when test="${keyword ne null}">
								<input type="text" class="form-control" name="keyword" value="${keyword}" style="width:70%">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" name="keyword" placeholder="검색도 할 수 있습니다" style="width:70%">
							</c:otherwise>
						</c:choose>
						<span class="input-group-btn">
							<button class="btn btn-default btn-success" type="submit"><span class="fa fa-fw fa-search"></span> 찾기</button>
						</span>
					</div>
				</form>
			</div>
			<!--  검색폼 끝 -->
			<div class="col-md-3 text-right">
				<a class="btn btn-lg btn-primary" href="/finalshop/board/write.do"><span class="fa fa-fw fa-pencil"></span> 글쓰기</a>
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
						<c:when test="${(listSize % 10) eq 0}">
							<c:set var="lastPage" value="${listSize / 10}"/>
						</c:when>
						<c:otherwise>
							<fmt:parseNumber var="lastPage" value="${(listSize / 10) + 1}" integerOnly="true"/>
						</c:otherwise>
					</c:choose>
					<ul class="pagination pagination-lg">
						<%-- Prev 처리 --%>
						<c:choose>
							<c:when test="${page_no eq 1}">
								<li class="disabled"><a href="#">Prev</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/finalshop/board/${modeRef}?${modeParam}page_no=${page_no - 1}">Prev</a></li>
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
										<a href="/finalshop/board/${modeRef}?${modeParam}page_no=${showPage}">${showPage}</a>
									</li>
						</c:forEach>
						
						<%-- Next 처리 --%>
						<c:choose>
							<c:when test="${page_no eq lastPage}">
								<li class="disabled"><a href="#">Next</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/finalshop/board/${modeRef}?${modeParam}page_no=${page_no + 1}">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
</div>
