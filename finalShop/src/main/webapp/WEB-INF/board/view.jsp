<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	<%-- 삭제는 중요하니 POST로 넘기는 스크립트 --%>
	function del(board_no) {
	    if (confirm("삭제하시겠습니까?") == true) {
		    var delform = document.createElement("form");
		    delform.setAttribute("method", "POST");
		    delform.setAttribute("action", "/finalshop/board/delete.do");
	        var field = document.createElement("input");
			field.setAttribute("type", "hidden");
			field.setAttribute("name", "board_no");
			field.setAttribute("value", board_no);
	        delform.appendChild(field);
		    document.body.appendChild(delform);
		    delform.submit();
	    } else {
	        alert('취소되었습니다.');
	    }
	}
</script>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>게시물 조회</h1>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 style="word-wrap:break-word;"><span class="fa fa-fw fa-star"></span>&nbsp;

							<c:set var="newTitle" value="${board.title}"/>
							<c:set var="newTitle" value="${fn:replace(newTitle, \"′\", \"'\")}"/>
							<c:set var="newTitle" value="${fn:replace(newTitle, \"\\\u0020\", \"&nbsp;\")}"/>
							<c:set var="newTitle" value="${fn:replace(newTitle, \">\", \"&gt;\")}"/>
							<c:set var="newTitle" value="${fn:replace(newTitle, \"<\", \"&lt;\")}"/>
							${newTitle}
						</h3>
						<h4 class="text-muted">
							<span class="fa fa-fw fa-flip-horizontal fa-slack"></span>&nbsp;<span class="text-primary">${board.board_no}</span>&nbsp;&nbsp;
							<span class="fa fa-fw fa-user"></span>&nbsp;<span class="text-primary">${board.mem_nm}(${board.mem_id})</span>&nbsp;&nbsp;
							<span class="fa fa-fw fa-eye"></span>&nbsp;<span class="text-primary">${board.count}</span>&nbsp;&nbsp;
							<span class="fa fa-fw fa-clock-o"></span>&nbsp;<span class="text-primary">
								<fmt:parseDate var="regDtm" value="${board.reg_dtm}" pattern="yyyyMMddHHmmss"/>
								<fmt:formatDate value="${regDtm}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
							</span>
							<%-- 수정한 흔적이 있으면 수정 시간 표시 --%>
							<c:if test="${board.mod_dtm ne null}">
								&nbsp;&nbsp;<span class="fa fa-fw fa-refresh"></span>&nbsp;<span class="text-primary">
									<fmt:parseDate var="modDtm" value="${board.mod_dtm}" pattern="yyyyMMddHHmmss"/>
									<fmt:formatDate value="${modDtm}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
							</c:if>
						</h4>
					</div>
					<div class="panel-body">
						<p class="lead">
							<%-- 내용 금칙문자 처리 --%>
							<c:set var="newText" value="${board.text}"/>
							<c:set var="newText" value="${fn:replace(newText, \"′\", \"'\")}"/>
							<c:set var="newText" value="${fn:replace(newText, \"\\\u0020\", \"&nbsp;\")}"/>
							<c:set var="newText" value="${fn:replace(newText, \">\", \"&gt;\")}"/>
							<c:set var="newText" value="${fn:replace(newText, \"<\", \"&lt;\")}"/>
							${newText}
						</p>
					</div>
				</div>
			</div>
		</div>

			<div class="row">
				<div class="col-md-6">
					<c:choose>
						<c:when test="${mode eq 'search'}">
							<a class="btn btn-default btn-lg" href="/finalshop/board/list.do?mode=${mode}$target=${target}$keyword=${keyword}&page_no=${page_no}">
						</c:when>
						<c:otherwise>
							<a class="btn btn-default btn-lg" href="/finalshop/board/list.do?mode=${mode}&page_no=${page_no}">
						</c:otherwise>
					</c:choose>
					<span class="fa fa-fw fa-th-list"></span> 목록</a>
				</div>
				<div class="col-md-6 text-right">
					<%-- 글 작성자가 아닐 경우 수정 / 삭제 버튼이 보이지 않음 --%>
					<c:if test="${sessionScope.member.mem_id eq board.mem_id}">
						<a class="btn btn-lg btn-warning" href="/finalshop/board/modify.do?board_no=${board.board_no}"><span class="fa fa-fw fa-eraser"></span> 수정</a>
						<a class="btn btn-lg btn-danger" href="javascript:del(${board.board_no});"><span class="fa fa-fw fa-trash"></span> 삭제</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>