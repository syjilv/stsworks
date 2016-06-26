<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
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
	// �˻������ ��� Option�� selected ����
	$(document).ready(function() {
		$("#target > option").removeAttr("selected");
		$("#target > option[value=${target}]").attr("selected", "ture");
	});
</script>
<%-- �˻������ ��� �ּҿ� �Ķ���� �Ź� ���̱� �������� ��Ʈ�� ���� --%>
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
				<h1>�Խ���</h1>
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
							<%-- ����� ���� ��� --%>
							<c:when test="${fn:length(list) eq 0}">
								<tr class="text-center">
									<td colspan="5">���� �����ϴ�.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="board" items="${list}">
									<%-- �Խù� ���� �ؿ� �ٴ� ����Ʈ�� ��� ���� ���� �ִ� �Խù� ǥ�� --%>
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
									<%-- �� ���� --%>
										<td class="text-left">
											<c:set var="newTitle" value="${board.title}"/>
											<%-- ���� �ʹ� ��� �ڸ��� --%>
											<c:if test="${fn:length(newTitle) gt 50}">
												<c:set var="newTitle" value="${fn:substring(newTitle, 0, 50)}..."/>
											</c:if>
											<%-- ���� �̱���Ʈ, �±�, ���� ó�� --%>
											<% pageContext.setAttribute("u0020", "\u0020"); %>
											<c:set var="newTitle" value="${fn:replace(newTitle, \"��\", \"'\")}"/>
											<c:set var="newTitle" value="${fn:replace(newTitle, u0020, \"&nbsp;\")}"/>
											<c:set var="newTitle" value="${fn:replace(newTitle, \">\", \"&gt;\")}"/>
											<c:set var="newTitle" value="${fn:replace(newTitle, \"<\", \"&lt;\")}"/>

											<a href="view.do?${modeParam}page_no=${page_no}&board_no=${board.board_no}">${newTitle}</a>
											<%-- ��� �� ǥ�� --%>
											<c:if test="${board.reply_size ne 0}">
												<span class="text-danger"> [${board.reply_size}]</span>
											</c:if>
											<%-- �ۼ����� 12�ð� �̳��� New ���� �޾��ֱ� --%>
											<c:set var="now" value="<%= new java.util.Date() %>"/>
											<fmt:parseDate var="write_dtm" value="${board.reg_dtm}" pattern="yyyyMMddHHmmss" />
											<c:if test="${(now.time - (1000*60*60*12)) le write_dtm.time}">
												<sup><span class="label label-warning">New</span></sup>
											</c:if>
										</td>
										<%-- �۾��� --%>
										<td class="text-center">
											${board.mem_nm}<small>(${board.mem_id})</small>
										</td>
										<%-- �ۼ��� --%>
										<td class="text-center">
											<%-- ���� �ۼ��� ���̸� �ð� ǥ��, �ƴϸ� ��¥ ǥ�� --%>
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
										<%-- ��ȸ�� --%>
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
				<a class="btn btn-default btn-lg" href="/finalshop/board/list.do"><span class="fa fa-fw fa-th-list"></span> �ֽŸ��</a>
			</div>
			<%-- �˻����� �� �� �ٿ��� ����ϴ°� --%>
			<div class="col-md-6">
				<form role="form" name="searchform" action="/finalshop/board/search.do" method="GET" onsubmit="return searchCheck()">
					<div class="input-group input-group-lg">
						<select id="target" class="form-control input-lg" name="target" style="width:30%">
							<option value="all">����+����</option>
							<option value="title">����</option>
							<option value="text">����</option>
							<option value="mem_nm">�ۼ���(�̸�)</option>
							<option value="mem_id">�ۼ���(ID)</option>
						</select>
						<!-- Ű���� ǥ�� -->
						<c:choose>
							<c:when test="${keyword ne null}">
								<input type="text" class="form-control" name="keyword" value="${keyword}" style="width:70%">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" name="keyword" placeholder="�˻��� �� �� �ֽ��ϴ�" style="width:70%">
							</c:otherwise>
						</c:choose>
						<span class="input-group-btn">
							<button class="btn btn-default btn-success" type="submit"><span class="fa fa-fw fa-search"></span> ã��</button>
						</span>
					</div>
				</form>
			</div>
			<!--  �˻��� �� -->
			<div class="col-md-3 text-right">
				<a class="btn btn-lg btn-primary" href="/finalshop/board/write.do"><span class="fa fa-fw fa-pencil"></span> �۾���</a>
			</div>
		</div>
			<!-- ����¡ -->
		<div class="row">
			<div class="col-md-12 text-center">
				<c:if test="${fn:length(list) ne 0}">
					<%-- ����¡���� �������� ù ������ --%>
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
				 	<%-- ��ü �Խù��� ������ ������ --%>
					<c:choose>
						<c:when test="${(listSize % 10) eq 0}">
							<c:set var="lastPage" value="${listSize / 10}"/>
						</c:when>
						<c:otherwise>
							<fmt:parseNumber var="lastPage" value="${(listSize / 10) + 1}" integerOnly="true"/>
						</c:otherwise>
					</c:choose>
					<ul class="pagination pagination-lg">
						<%-- Prev ó�� --%>
						<c:choose>
							<c:when test="${page_no eq 1}">
								<li class="disabled"><a href="#">Prev</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/finalshop/board/${modeRef}?${modeParam}page_no=${page_no - 1}">Prev</a></li>
							</c:otherwise>
						</c:choose>

						<%-- �⺻������ �������� ����¡ ���� 5 --%>
						<c:set var="pageSize" value="5"/>
						<%-- ������ ���� 5�������� �ȵ� ��� --%>
						<c:if test="${(startPage + 4) gt lastPage}">
						<c:set var="pageSize" value="${lastPage - startPage + 1}"/>
						</c:if>
						<%-- ����¡ ǥ�� �� ��ũ ó�� --%>
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
						
						<%-- Next ó�� --%>
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
