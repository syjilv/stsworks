<%@ page language="java" contentType="text/html; charset=EUC-KR" session="true" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
// 댓글 전송 전 체크
function commentWriteCheck() {
	// 제목, 내용 사이즈 체크하는 정규식(아스키코드는 1, 유니코드는 3으로 계산)
	var commentSize = commentWriteForm.prd_comment.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;

	if(commentSize <= 0) {
		alert("내용을 입력해 주세요.");
		commentWriteForm.prd_comment.focus();
		return false;
	} else if(commentSize > 60) {
		alert("댓글은 한글 20자, 영문 6자 이내로 작성해주세요.");
		commentWriteForm.prd_comment.focus();
		return false;
	} else {
		if (confirm("전송하시겠습니까?") == true) {
			return true;
		} else {
	        alert('취소되었습니다.');
			return false;
		}
	}
}

<%-- 댓글 폼 클릭시 로그인으로 넘기는 스크립트 --%>
function commentLogin() {
    if (confirm("로그인 하시겠습니까?") == true) {
    	location.href='/finalshop/member/login.do';
    } else {
        alert('취소되었습니다.');
    }
}

<%-- 댓글 삭제 POST로 넘기는 스크립트 --%>
function commentDel(seq) {
    if (confirm("삭제하시겠습니까?") == true) {
	    var commentdelform = document.createElement("form");
	    commentdelform.setAttribute("method", "POST");
	    commentdelform.setAttribute("action", "/finalshop/product/comment_delete.do");
        var field = document.createElement("input");
		field.setAttribute("type", "hidden");
		field.setAttribute("name", "seq");
		field.setAttribute("value", seq);
        commentdelform.appendChild(field);
	    document.body.appendChild(commentdelform);
	    commentdelform.submit();
    } else {
        alert('취소되었습니다.');
    }
}
<%-- replaceAll 구현해주는 함수 --%>
function replaceAll(str, searchStr, replaceStr) {
    return str.split(searchStr).join(replaceStr);
}

<%-- 댓글 수정 --%>
function commentMod(seq) {
	$("#commentModForm .form-group").remove();
	$(".comment").show();
	var comment = $("#comment-" + seq + " p").html();
	comment = replaceAll(comment, "'", "′");
	comment = replaceAll(comment, "&nbsp;", "\u0020");
	comment = replaceAll(comment, "<br>", "\r\n");

	$("#comment-" + seq + " .comment").hide();
	$("#comment-" + seq).append("<input type=\"hidden\" name=\"seq\" value=\"" + seq + "\"/>");
	$("#comment-" + seq).append("<div class=\"form-group\"><div class=\"col-md-10\">"
							   + "<textarea class=\"form-control\" style=\"resize:none;\" rows=\"4\" name=\"prd_comment\" id=\"prd_comment\">" + comment + "</textarea>"
							   + "</div><div class=\"col-md-2\">"
							   + "<button type=\"submit\" class=\"btn btn-block btn-lg btn-warning\" style=\"height:93px\" style=\"height:93px\">"
							   + "<i class=\"fa fa-fw fa-pencil-square-o\"></i> 수정</button></div></div>");
}

// 댓글 수정 전송 전 체크
function commentModCheck() {
	// 제목, 내용 사이즈 체크하는 정규식(아스키코드는 1, 유니코드는 3으로 계산)
	var commentSize = commentModForm.prd_comment.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;

	if(commentSize <= 0) {
		alert("내용을 입력해 주세요.");
		commentModForm.prd_comment.focus();
		return false;
	} else if(commentSize > 60) {
		alert("댓글은 한글 20자, 영문 60자 이내로 작성해주세요.");
		commentModForm.prd_comment.focus();
		return false;
	} else {
		if (confirm("수정하시겠습니까?") == true) {
			return true;
		} else {
	        alert('취소되었습니다.');
			return false;
		}
	}
}
	
</script>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<img src="/finalshop/resources/images/product/${prd.img_gen_file_nm}" class="img-responsive">
			</div>
			<div class="col-md-6">
				<h1>${prd.prd_nm}</h1>
				<h3>${prd.sell_prc_unit}</h3>
			</div>
		</div>
		<hr>
		<%-- 댓글 표시 시작 --%>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>
							<span class="fa fa-fw fa-comment"></span>&nbsp;상품평 <span class="text-default">${commentSize}</span>
						</h4>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form" id="commentModForm" name="commentModForm" action="/finalshop/product/comment_modify.do" method="POST" onsubmit="return commentModCheck()">
							<c:if test="${fn:length(commentList) ne 0}">
								<c:forEach var="comment" items="${commentList}">
									<h4>
										<span class="fa fa-fw fa-user"></span>&nbsp;<span class="text-primary">${comment.mem_nm}(${comment.mem_id})</span>&nbsp;&nbsp;
										<span class="fa fa-fw fa-clock-o"></span>&nbsp;<span class="text-primary">
											<fmt:parseDate var="commentRegDtm" value="${comment.reg_dtm}" pattern="yyyyMMddHHmmss"/>
											<fmt:formatDate value="${commentRegDtm}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
										</span>
										<%-- 로그인한 사람이 쓴 댓글이면 수정/삭제 표시 --%>
										<c:if test="${member.mem_id eq comment.mem_id}">
											<span class="text-muted">&nbsp;&nbsp;<a class="btn btn-warning btn-xs" href="javascript:commentMod(${comment.seq})">수정</a>&nbsp;&nbsp;<a class="btn btn-danger btn-xs" href="javascript:commentDel(${comment.seq});">삭제</a></span>
										</c:if>
									</h4>
									<div id="comment-${comment.seq}">
										<%-- 내용 금칙문자 처리 --%>
										<% pageContext.setAttribute("crlf", "\r\n"); %>
										<% pageContext.setAttribute("u0020", "\u0020"); %>
										<c:set var="newComment" value="${comment.prd_comment}"/>
										<c:set var="newComment" value="${fn:replace(newComment, \"′\", \"'\")}"/>
										<c:set var="newComment" value="${fn:replace(newComment, u0020, \"&nbsp;\")}"/>
										<c:set var="newComment" value="${fn:replace(newComment, \">\", \"&gt;\")}"/>
										<c:set var="newComment" value="${fn:replace(newComment, \"<\", \"&lt;\")}"/>
										<c:set var="newComment" value="${fn:replace(newComment, crlf, \"<br>\")}"/>
										<p class="lead comment">${newComment}</p>
									</div>
									<hr/>
								</c:forEach>
							</c:if>
						</form>
						<%-- 목록 표시 끝 / 입력 시작 --%>
						<form class="form-horizontal" role="form" name="commentWriteForm" action="/finalshop/product/comment_write.do" method="POST" onsubmit="return commentWriteCheck()">
							<div class="form-group">
								<div class="col-md-10">
									<input type="hidden" name="prd_no" value="${prd.prd_no}"/>
									<input type="hidden" name="mem_id" value="${member.mem_id}"/>
										<c:choose>
											<c:when test="${member.mem_id eq null}">
													<textarea class="form-control" style="resize:none;" rows="4" onclick="javascript:commentLogin();" placeholder="로그인이 필요합니다." name="prd_comment" id="prd_comment"></textarea>
												</div>
												<div class="col-md-2">
													<button type="submit" class="btn btn-block btn-lg btn-success" style="height:93px" disabled>
											</c:when>								
											<c:otherwise>
													<textarea class="form-control" style="resize:none;" rows="4" name="prd_comment" id="prd_comment"></textarea>
												</div>
												<div class="col-md-2">
													<button type="submit" class="btn btn-block btn-lg btn-success" style="height:93px">
											</c:otherwise>
										</c:choose>
										<i class="fa fa-fw fa-pencil-square-o"></i> 쓰기
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
