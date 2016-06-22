<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true" import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%><%@page import="board.dto.BoardDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<%
/* 		List<BoardDTO> list = (List<BoardDTO>) request.getAttribute("list");
		int count = (int) request.getAttribute("count");
		int pageNo = (int) request.getAttribute("pageNo");
		String boardNo = (String) request.getAttribute("boardNo");
		String target = (String) request.getAttribute("target");
		String keyword = (String) request.getAttribute("keyword");
		String mode = (String) request.getAttribute("mode");
		int size = list.size();
		
 */		// 검색일 경우와 아닐 경우 체크
		String modeRef = "board_list.do?";
		if(mode.equals("search")) {
			modeRef = "board_search.do?target=" + target + "&keyword=" + keyword + "&";
		}
		
		%>
	
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
								<!-- 목록이 없을 경우 -->
								<c:when test="${count eq 0}">
									<tr class="text-center">
										<td colspan="5">글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="board" items="${list}">
										<!-- 게시물 보기 밑에 붙는 리스트일 경우 현재 보고 있는 게시물 표시 -->
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
										<!-- 글 제목 -->
											<td class="text-left">
												<!-- 검색모드일 경우 구분 -->
												<c:choose>
													<c:when test="${mode eq 'search'}">
														<a href="view.do?mode=${mode}&target=${target}&keyword=${keyword}&page_no=${page_no}&board_no=${board.board_no}">
													</c:when>
													<c:otherwise>
														<a href="view.do?page_no=${page_no}&boardNo=${board.board_no}">
													</c:otherwise>
												</c:choose>
												<!-- 제목 싱글쿼트, 태그, 공백 처리 -->
												<c:set var="newTitle" value="${board.title}"/>
													${fn:replace(newTitle, "′", "\'")}
													${fn:replace(newTitle, "\\u0020", "&nbsp;")}
													${fn:replace(newTitle, ">", "&gt;")}
													${fn:replace(newTitle, "<", "&lt;")}
												<!-- 제목 너무 길면 자르기 -->
												<c:if test="${fn:length(newTitle) gt 50}">
													<c:set var="newTitle" value="${fn:substring(newTitle, 0, 50)}..."/>
												</c:if>
												${newTitle}</a>
												<!-- 작성한지 12시간 이내면 New 뱃지 달아주기 -->
												<c:if test="${(now.time - (1000*60*60*12)) le writeDtm.time}">
													<sup><span class="label label-warning">New</span></sup>
												</c:if>
											</td>
											<!-- 글쓴이 -->
											<td class="text-center">
												${board.mem_nm}<small>(${board.mem_id})</small>
											</td>
											<!-- 작성일 -->
											<td class="text-center">
												<!-- 오늘 작성된 글이면 시간 표출, 아니면 날짜 표출 -->
												<c:set var="now" value="<%= new java.util.Date() %>"/>
												<fmt:formatDate var="today" value="${now}" type="date" pattern="yyyy-MM-dd"/>
												<fmt:formatDate var="writeDate" value="${writeDtm}" type="date" pattern="yyyy-MM-dd"/>
												<c:choose>
													<c:when test="${today} eq ${writeDate}">
														<fmt:formatDate value="${writeDtm}" type="both" pattern="HH:mm:ss"/>
													</c:when>
													<c:otherwise>
														${writeDate} 
													</c:otherwise>
												</c:choose>
											</td>
											<!-- 조회수 -->
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
					<a class="btn btn-default btn-lg" href="board_list.do?page_no=${page_no}"><span class="fa fa-fw fa-th-list"></span> 목록</a>
				</div>
				
				
				
				<!-- 검색폼을 난 왜 붙여서 고생하는가 -->
				<div class="col-md-6">
					<form role="form" name="searchform" action="board_search.do" method="GET" onsubmit="return searchCheck()">
						<div class="input-group input-group-lg">
							<select class="form-control input-lg" name="target" style="width:30%">
							<% 	// 검색했을 경우 선택값 selected 체크
								String targetSelect1 = "";
								String targetSelect2 = "";
								String targetSelect3 = "";
								String targetSelect4 = "";
								
								if(target != null) {
									switch(target) {
									case "title" :
										targetSelect1 = "selected";
										break;
									case "all" :
										targetSelect2 = "selected";
										break;
									case "memNm" :
										targetSelect3 = "selected";
										break;
									case "memId" :
										targetSelect4 = "selected";
										break;
									}
								}
							%>
								<option value="title" <%= targetSelect1 %>>제목</option>
								<option value="all" <%= targetSelect2 %>>제목+내용</option>
								<option value="memNm" <%= targetSelect3 %>>작성자(이름)</option>
								<option value="memId" <%= targetSelect4 %>>작성자(ID)</option>
							</select>
							<!-- 키워드 표시 -->
							<% if (keyword != null) { %>
								<input type="text" class="form-control" name="keyword" value="<%= keyword %>" style="width:70%">
							<% } else { %>
								<input type="text" class="form-control" name="keyword" placeholder="검색도 할 수 있습니다" style="width:70%">
							<% } %>
							<input type="hidden" name="pageNo" value="1">
							<span class="input-group-btn">
								<button class="btn btn-default btn-success" type="submit"><span class="fa fa-fw fa-search"></span> 찾기</button>
							</span>
						</div>
					</form>
				</div>
				<!--  검색폼 끝 -->
				<div class="col-md-3 text-right">
					<a class="btn btn-lg btn-primary" href="write.do"><span class="fa fa-fw fa-pencil"></span> 글쓰기</a>
				</div>
				<!-- 페이징 -->
				<div class="row">
					<div class="col-md-12 text-center">
					<% if (count != 0) { %>
						<ul class="pagination pagination-lg">

						<% 	// 페이징에서 보여지는 첫 페이지
						int startPage = 1;
						if(pageNo % 5 == 0) {
							startPage = pageNo - 4; 
						} else if (pageNo > 5) {
							startPage = pageNo - (pageNo % 5) + 1;
						}
						// 전체 게시물의 마지막 페이지
						int lastPage = 0;
						if((count % 10) == 0) {
							lastPage = (count / 10);
						} else {
							lastPage = (count / 10) + 1;
						}
						
						// Prev 처리
						if(pageNo == 1) { %>
							<li class="disabled"><a href="#">Prev</a></li>
						<% } else { %>
								<li><a href="<%= modeRef %>pageNo=<%= pageNo - 1 %>">Prev</a></li>
						<% }
						// 총 페이지가 5페이지 미만일 경우 페이징 처리
						int pageSize = 5;
						if((startPage + 4) > lastPage) {
							pageSize = lastPage - startPage + 1;
						}
						// 페이징 표시 및 링크 처리
						for(int j = 0; j < pageSize; j++) {
							int showPage = startPage + j;
							if(showPage == pageNo) {
						%>
								<li class="active">
						<% } else { %>
								<li>
						<% } %>
								<a href="<%= modeRef %>pageNo=<%= showPage %>"><%= showPage %></a></li>
						<% }
						// Next 처리
						if(pageNo == lastPage) { %>
							<li class="disabled"><a href="#">Next</a></li>
						<% } else { %>
							<li><a href="<%= modeRef %>pageNo=<%= pageNo + 1 %>">Next</a></li>
						<% } %>
						</ul>
					<% } %>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>