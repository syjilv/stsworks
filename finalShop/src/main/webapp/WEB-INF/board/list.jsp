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
		
 */		// �˻��� ���� �ƴ� ��� üũ
		String modeRef = "board_list.do?";
		if(mode.equals("search")) {
			modeRef = "board_search.do?target=" + target + "&keyword=" + keyword + "&";
		}
		
		%>
<%		
		// ��¥ ó����
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat dff = new SimpleDateFormat("yyyyMMddHHmmss");
		Calendar c = Calendar.getInstance();
		String today = df.format(c.getTime());
		Long todayFull = Long.parseLong(dff.format(c.getTime()));
	%>
	
<script>
// ���� �� üũ
function searchCheck() {
	if(searchform.keyword.value.length == 0) {
		alert("�˻�� �Է��� �ּ���.");
		searchform.keyword.focus();
		return false;
	} else if(searchform.keyword.value.length <= 1) {
		alert("�˻���� 2�� �̻� �Է��� �ּ���.");
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
					<h1>�Խ��� </h1>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover">
						<thead>
							<tr class="active">
								<th class="text-center col-md-1">#</th>
								<th class="text-center col-md-6">����</th>
								<th class="text-center col-md-2">�ۼ���</th>
								<th class="text-center col-md-2">��¥</th>
								<th class="text-center col-md-1">��ȸ��</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${count} eq 0}">
									<tr class="text-center">
										<td colspan="5">������ �����ϴ�.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="board" items="${list}">

										// ���� �̱���Ʈ, �±�, ���� ó��
										<c:set var="newTitle" value="${board.title}"/>
											${fn:replace(newTitle, '��', '\'')}
											${fn:replace(newTitle, '\\u0020', '$nbsp;')}
											${fn:replace(newTitle, '>', '&gt;')}
											${fn:replace(newTitle, '<', '&lt')}

										// ���� �ʹ� ��� �ڸ���
										<c:if test="${fn:length(newTitle) gt 50}">
											<c:set var="newTitle" value="${fn:substring(newTitle, 0, 50)}..."/>
										</c:if>

										// �ð�/��¥ ǥ�ø� ���� String ������
										<c:set var="writeDtm" value="${board.reg_dtm}"/>
										<c:set var="writeDate" value="${fn:substring(writeDtm, 0, 8}"/>
										<c:set var="writeTime" value="${fn:substring(writeDtm, 8}"/>
	
										// ���� �ۼ��� ���̸� �ð� ǥ��, �ƴϸ� ��¥ ǥ��
										<c:choose>
											<c:when test="${today} eq ${writeDate}">
												<c:set var="showDate" value="${fn:substring(writeTime, 0, 2)}:${fn:substring(writeTime, 2, 4)}:${fn:substring(writeTime, 4)}"/>
											</c:when>
											<c:otherwise>
												<c:set var="showDate" value="${fn:substring(writeDate, 0, 4)}-${fn:substring(writeDate, 4, 6)}-${fn:substring(writeDate, 6)}"/>
											</c:otherwise>
										</c:choose>
									
										// �ۼ����� 12�ð� �̳��� New ���� �޾��ֱ�
											<c:set var="now" value="<%= new java.util.Date() %>"/>
											<c:parseNumber value="$now.time - writeDtm.time" / (1000*60*)
											
											<fmt:parseNumber value="${(now.time - DateData.time) / (1000*60*60*24) }" integerOnly="true" />
											
										<fmt:parseDate  var="writeDtm" value="${board.reg_dtm}" pattern="yyyyMMddHHmmss" />
										<fmt:formatDate value="${writeDtm}" type="both" pattern="HH:mm:ss" />
										
										
									Long hourGap = todayFull - 120000;
									String titleBadge = newTitle + "</a>";
									// 12�� �����̸� �Ϸ� �� ���� - ���� �Ѿ�°� �׳� ���������� ������ �϶�� ó�� ����
									if((hourGap - Long.parseLong(today + "000000")) < 0) {
										hourGap = hourGap - 760000;
									}
									if(hourGap <= Long.parseLong(writeDtm)) {
										titleBadge += "</a> <sup><span class=\"label label-warning\">New</span></sup>";
									}
									
									// �Խù� ���� �ؿ� �ٴ� ����Ʈ�� ��� ���� ���� �ִ� �Խù� ǥ��
									String currentBoardNo = board.getBoardNo();
									if(boardNo != null && boardNo.equals(board.getBoardNo())) {
										currentBoardNo = "<span class=\"fa fa-fw fa-angle-double-right\"></span>";	
									%>
										<tr class="active">
									<% } else { %>
										<tr>
									<% } %>
										<td class="text-center"><%= currentBoardNo %></td>
										<% if(mode.equals("search")) { %>
											<td class="text-left"><a href="view.do?mode=<%= mode %>&target=<%= target %>&keyword=<%= keyword %>&pageNo=<%= pageNo %>&boardNo=<%= board.getBoardNo() %>"><%= titleBadge %></td>
										<% } else { %>
											<td class="text-left"><a href="view.do?pageNo=<%= pageNo %>&boardNo=<%= board.getBoardNo() %>"><%= titleBadge %></td>
										<% } %>

										<td class="text-center"><%= board.getMemNm() %><small>(<%= board.getMemId() %>)</small></td>
										<td class="text-center"><%= showDate %></td>
										<td class="text-center"><%= board.getCount() %></td>
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
					<a class="btn btn-default btn-lg" href="board_list.do?pageNo=<%= pageNo %>"><span class="fa fa-fw fa-th-list"></span> ���</a>
				</div>
				<!-- �˻����� �� �� �ٿ��� ����ϴ°� -->
				<div class="col-md-6">
					<form role="form" name="searchform" action="board_search.do" method="GET" onsubmit="return searchCheck()">
						<div class="input-group input-group-lg">
							<select class="form-control input-lg" name="target" style="width:30%">
							<% 	// �˻����� ��� ���ð� selected üũ
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
								<option value="title" <%= targetSelect1 %>>����</option>
								<option value="all" <%= targetSelect2 %>>����+����</option>
								<option value="memNm" <%= targetSelect3 %>>�ۼ���(�̸�)</option>
								<option value="memId" <%= targetSelect4 %>>�ۼ���(ID)</option>
							</select>
							<!-- Ű���� ǥ�� -->
							<% if (keyword != null) { %>
								<input type="text" class="form-control" name="keyword" value="<%= keyword %>" style="width:70%">
							<% } else { %>
								<input type="text" class="form-control" name="keyword" placeholder="�˻��� �� �� �ֽ��ϴ�" style="width:70%">
							<% } %>
							<input type="hidden" name="pageNo" value="1">
							<span class="input-group-btn">
								<button class="btn btn-default btn-success" type="submit"><span class="fa fa-fw fa-search"></span> ã��</button>
							</span>
						</div>
					</form>
				</div>
				<!-- �˻��� �� -->
				<div class="col-md-3 text-right">
					<a class="btn btn-lg btn-primary" href="write.do"><span class="fa fa-fw fa-pencil"></span> �۾���</a>
				</div>
				<!-- ����¡ -->
				<div class="row">
					<div class="col-md-12 text-center">
					<% if (count != 0) { %>
						<ul class="pagination pagination-lg">

						<% 	// ����¡���� �������� ù ������
						int startPage = 1;
						if(pageNo % 5 == 0) {
							startPage = pageNo - 4; 
						} else if (pageNo > 5) {
							startPage = pageNo - (pageNo % 5) + 1;
						}
						// ��ü �Խù��� ������ ������
						int lastPage = 0;
						if((count % 10) == 0) {
							lastPage = (count / 10);
						} else {
							lastPage = (count / 10) + 1;
						}
						
						// Prev ó��
						if(pageNo == 1) { %>
							<li class="disabled"><a href="#">Prev</a></li>
						<% } else { %>
								<li><a href="<%= modeRef %>pageNo=<%= pageNo - 1 %>">Prev</a></li>
						<% }
						// �� �������� 5������ �̸��� ��� ����¡ ó��
						int pageSize = 5;
						if((startPage + 4) > lastPage) {
							pageSize = lastPage - startPage + 1;
						}
						// ����¡ ǥ�� �� ��ũ ó��
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
						// Next ó��
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