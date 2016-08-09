<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
	<%-- ������ �߿��ϴ� POST�� �ѱ�� ��ũ��Ʈ --%>
	function cardClose(board_id) {
	    if (confirm("�����Ͻðڽ��ϱ�?") == true) {
		    var delform = document.createElement("form");
		    delform.setAttribute("method", "POST");
		    delform.setAttribute("action", "/jetstream/board/card_close.do");
	        var field = document.createElement("input");
			field.setAttribute("type", "hidden");
			field.setAttribute("name", "board_id");
			field.setAttribute("value", board_id);
	        delform.appendChild(field);
		    document.body.appendChild(delform);
		    delform.submit();
	    } else {
	        alert('��ҵǾ����ϴ�.');
	    }
	}
	// ��� ���� �� üũ
	function commentCreateCheck() {
		// ����, ���� ������ üũ�ϴ� ���Խ�(�ƽ�Ű�ڵ�� 1, �����ڵ�� 3���� ���)
		var commentSize = commentCreateForm.comment_txt.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;

		if(replySize <= 0) {
			alert("������ �Է��� �ּ���.");
			replyWriteForm.reply.focus();
			return false;
		} else if(replySize > 2000) {
			alert("����� �ѱ� 666��, ���� 2000�� �̳��� �ۼ����ּ���.");
			replyWriteForm.reply.focus();
			return false;
		} else {
			if (confirm("�����Ͻðڽ��ϱ�?") == true) {
				return true;
			} else {
		        alert('��ҵǾ����ϴ�.');
				return false;
			}
		}
	}
	
	<%-- ��� �� Ŭ���� �α������� �ѱ�� ��ũ��Ʈ --%>
	function replyLogin() {
	    if (confirm("�α��� �Ͻðڽ��ϱ�?") == true) {
	    	location.href='/finalshop/member/login.do';
	    } else {
	        alert('��ҵǾ����ϴ�.');
	    }
	}
	
	<%-- ��� ���� POST�� �ѱ�� ��ũ��Ʈ --%>
	function replyDel(seq) {
	    if (confirm("�����Ͻðڽ��ϱ�?") == true) {
		    var replydelform = document.createElement("form");
		    replydelform.setAttribute("method", "POST");
		    replydelform.setAttribute("action", "/finalshop/board/reply_delete.do");
	        var field = document.createElement("input");
			field.setAttribute("type", "hidden");
			field.setAttribute("name", "seq");
			field.setAttribute("value", seq);
	        replydelform.appendChild(field);
		    document.body.appendChild(replydelform);
		    replydelform.submit();
	    } else {
	        alert('��ҵǾ����ϴ�.');
	    }
	}
	<%-- replaceAll �������ִ� �Լ� --%>
	function replaceAll(str, searchStr, replaceStr) {
	    return str.split(searchStr).join(replaceStr);
	}

	<%-- ��� ���� --%>
	function replyMod(seq) {
		$("#replyModForm .form-group").remove();
		$(".reply").show();
		var reply = $("#reply-" + seq + " p").html();
		reply = replaceAll(reply, "'", "��");
		reply = replaceAll(reply, "&nbsp;", "\u0020");
		reply = replaceAll(reply, "<br>", "\r\n");

		$("#reply-" + seq + " .reply").hide();
		$("#reply-" + seq).append("<input type=\"hidden\" name=\"seq\" value=\"" + seq + "\"/>");
		$("#reply-" + seq).append("<div class=\"form-group\"><div class=\"col-md-10\">"
								   + "<textarea class=\"form-control\" style=\"resize:none;\" rows=\"4\" name=\"reply\" id=\"reply\">" + reply + "</textarea>"
								   + "</div><div class=\"col-md-2\">"
								   + "<button type=\"submit\" class=\"btn btn-block btn-lg btn-warning\" style=\"height:93px\" style=\"height:93px\">"
								   + "<i class=\"fa fa-fw fa-pencil-square-o\"></i> ����</button></div></div>");
	}
	
	// ��� ���� ���� �� üũ
	function replyModCheck() {
		// ����, ���� ������ üũ�ϴ� ���Խ�(�ƽ�Ű�ڵ�� 1, �����ڵ�� 3���� ���)
		var replySize = replyModForm.reply.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;

		if(replySize <= 0) {
			alert("������ �Է��� �ּ���.");
			replyModForm.reply.focus();
			return false;
		} else if(replySize > 2000) {
			alert("����� �ѱ� 666��, ���� 2000�� �̳��� �ۼ����ּ���.");
			replyModForm.reply.focus();
			return false;
		} else {
			if (confirm("�����Ͻðڽ��ϱ�?") == true) {
				return true;
			} else {
		        alert('��ҵǾ����ϴ�.');
				return false;
			}
		}
	}
		
</script>
<%-- �˻������ ��� �ּҿ� �Ķ���� �Ź� ���̱� �������� ��Ʈ�� ���� --%>
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
				<h1>�Խù� ��ȸ</h1>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 style="word-wrap:break-word;"><span class="fa fa-fw fa-star"></span>&nbsp;
							<%-- ���� ��Ģó�� --%>
							<% pageContext.setAttribute("crlf", "\r\n"); %>
							<% pageContext.setAttribute("u0020", "\u0020"); %>
							<c:set var="newTitle" value="${article.title}"/>
							<c:set var="newTitle" value="${fn:replace(newTitle, \"��\", \"'\")}"/>
							<c:set var="newTitle" value="${fn:replace(newTitle, u0020, \"&nbsp;\")}"/>
							<c:set var="newTitle" value="${fn:replace(newTitle, \">\", \"&gt;\")}"/>
							<c:set var="newTitle" value="${fn:replace(newTitle, \"<\", \"&lt;\")}"/>
							${newTitle}
						</h3>
						<h4 class="text-muted">
							<span class="fa fa-fw fa-flip-horizontal fa-slack"></span>&nbsp;<span class="text-primary">${article.board_no}</span>&nbsp;&nbsp;
							<span class="fa fa-fw fa-user"></span>&nbsp;<span class="text-primary">${article.mem_nm}(${article.mem_id})</span>&nbsp;&nbsp;
							<span class="fa fa-fw fa-eye"></span>&nbsp;<span class="text-primary">${article.count}</span>&nbsp;&nbsp;
							<span class="fa fa-fw fa-comment"></span>&nbsp;<span class="text-primary">${replySize}</span>&nbsp;&nbsp;
							<span class="fa fa-fw fa-clock-o"></span>&nbsp;<span class="text-primary">
								<fmt:parseDate var="regDtm" value="${article.reg_dtm}" pattern="yyyyMMddHHmmss"/>
								<fmt:formatDate value="${regDtm}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
							</span>
							<%-- ������ ������ ������ ���� �ð� ǥ�� --%>
							<c:if test="${article.mod_dtm ne null}">
								&nbsp;&nbsp;<span class="fa fa-fw fa-refresh"></span>&nbsp;<span class="text-primary">
									<fmt:parseDate var="modDtm" value="${article.mod_dtm}" pattern="yyyyMMddHHmmss"/>
									<fmt:formatDate value="${modDtm}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
								</span>
							</c:if>
						</h4>
					</div>
					<div class="panel-body">
						<p class="lead">
							<%-- ���� ��Ģ���� ó�� --%>
							<c:set var="newText" value="${article.text}"/>
							<c:set var="newText" value="${fn:replace(newText, \"��\", \"'\")}"/>
							<c:set var="newText" value="${fn:replace(newText, u0020, \"&nbsp;\")}"/>
							<c:set var="newText" value="${fn:replace(newText, \">\", \"&gt;\")}"/>
							<c:set var="newText" value="${fn:replace(newText, \"<\", \"&lt;\")}"/>
							<c:set var="newText" value="${fn:replace(newText, crlf, \"<br>\")}"/>
							${newText}
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<a class="btn btn-default btn-lg" href="/finalshop/board/list.do?${modeParam}page_no=${page_no}">
				<span class="fa fa-fw fa-th-list"></span> ���</a>
			</div>
			<div class="col-md-6 text-right">
				<%-- �� �ۼ��ڰ� �ƴ� ��� ���� / ���� ��ư�� ������ ���� --%>
				<c:if test="${sessionScope.member.mem_id eq article.mem_id}">
					<a class="btn btn-lg btn-warning" href="/finalshop/board/modify.do?${modeParam}board_no=${article.board_no}&page_no=${page_no}"><span class="fa fa-fw fa-eraser"></span> ����</a>
					<a class="btn btn-lg btn-danger" href="javascript:del(${article.board_no});"><span class="fa fa-fw fa-trash"></span> ����</a>
				</c:if>
			</div>
		</div>
		<hr/>
		<%-- ��� ǥ�� ���� --%>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>
							<span class="fa fa-fw fa-comment"></span>&nbsp;��� <span class="text-default">${replySize}</span>
						</h4>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form" id="replyModForm" name="replyModForm" action="/finalshop/board/reply_modify.do" method="POST" onsubmit="return replyModCheck()">
							<c:if test="${fn:length(replyList) ne 0}">
								<c:forEach var="reply" items="${replyList}">
									<h4>
										<span class="fa fa-fw fa-user"></span>&nbsp;<span class="text-primary">${reply.mem_nm}(${reply.mem_id})</span>&nbsp;&nbsp;
										<span class="fa fa-fw fa-clock-o"></span>&nbsp;<span class="text-primary">
											<fmt:parseDate var="replyRegDtm" value="${reply.reg_dtm}" pattern="yyyyMMddHHmmss"/>
											<fmt:formatDate value="${replyRegDtm}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
										</span>
										<%-- ������ ������ ������ ���� �ð� ǥ�� --%>
										<c:if test="${reply.mod_dtm ne null}">
											&nbsp;&nbsp;<span class="fa fa-fw fa-refresh"></span>&nbsp;<span class="text-primary">
												<fmt:parseDate var="replyModDtm" value="${reply.mod_dtm}" pattern="yyyyMMddHHmmss"/>
												<fmt:formatDate value="${replyModDtm}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
											</span>
										</c:if>
										<%-- �α����� ����� �� ����̸� ����/���� ǥ�� --%>
										<c:if test="${member.mem_id eq reply.mem_id}">
											<span class="text-muted">&nbsp;&nbsp;<a class="btn btn-warning btn-xs" href="javascript:replyMod(${reply.seq})">����</a>&nbsp;&nbsp;<a class="btn btn-danger btn-xs" href="javascript:replyDel(${reply.seq});">����</a></span>
										</c:if>
									</h4>
									<div id="reply-${reply.seq}">
										<%-- ���� ��Ģ���� ó�� --%>
										<c:set var="newReply" value="${reply.reply}"/>
										<c:set var="newReply" value="${fn:replace(newReply, \"��\", \"'\")}"/>
										<c:set var="newReply" value="${fn:replace(newReply, u0020, \"&nbsp;\")}"/>
										<c:set var="newReply" value="${fn:replace(newReply, \">\", \"&gt;\")}"/>
										<c:set var="newReply" value="${fn:replace(newReply, \"<\", \"&lt;\")}"/>
										<c:set var="newReply" value="${fn:replace(newReply, crlf, \"<br>\")}"/>
										<p class="lead reply">${newReply}</p>
									</div>
									<hr/>
								</c:forEach>
							</c:if>
						</form>
						<%-- ��� ǥ�� �� / �Է� ���� --%>
						<form class="form-horizontal" role="form" name="replyWriteForm" action="/finalshop/board/reply_write.do" method="POST" onsubmit="return replyWriteCheck()">
							<div class="form-group">
								<div class="col-md-10">
									<input type="hidden" name="board_no" value="${article.board_no}"/>
									<input type="hidden" name="mem_id" value="${member.mem_id}"/>
										<c:choose>
											<c:when test="${member.mem_id eq null}">
													<textarea class="form-control" style="resize:none;" rows="4" onclick="javascript:replyLogin();" placeholder="�α����� �ʿ��մϴ�." name="reply" id="reply"></textarea>
												</div>
												<div class="col-md-2">
													<button type="submit" class="btn btn-block btn-lg btn-success" style="height:93px" disabled>
											</c:when>								
											<c:otherwise>
													<textarea class="form-control" style="resize:none;" rows="4" name="reply" id="reply"></textarea>
												</div>
												<div class="col-md-2">
													<button type="submit" class="btn btn-block btn-lg btn-success" style="height:93px">
											</c:otherwise>
										</c:choose>
										<i class="fa fa-fw fa-pencil-square-o"></i> ����
									</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>