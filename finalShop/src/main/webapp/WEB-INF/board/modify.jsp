<%@page import="member.dto.MemberDTO"%>
<%@page import="board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true" import="java.util.*"%>
<script>
<% 	BoardDTO board = (BoardDTO) request.getAttribute("board");
	MemberDTO mem = (MemberDTO) session.getAttribute("mem");

	// 임의 접근 차단 - 작성자와 로그인 아이디가 다를 경우 리스트로 리다이렉트
//	if(mem != null && !mem.getMemId().equals(board.getMemId()) || mem == null) { %>
		alert('잘못된 접근입니다.');
		location.href='board_list.do';
<%//	} %>
	// 전송 전 체크
	function modCheck() {
		// 제목, 내용 사이즈 체크하는 정규식(아스키코드는 1, 유니코드는 3으로 계산)
		var titleSize = modifyform.title.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
		var textSize = modifyform.text.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;

		if(titleSize <= 0) {
			alert("제목을 입력해 주세요.");
			modifyform.title.focus();
			return false;
		} else if(titleSize > 100) {
			alert("제목은 한글 33자, 영문 100자 이내로 작성해주세요.");
			modifyform.title.focus();
			return false;
		} else if(textSize <= 0) {
			alert("내용을 입력해 주세요.");
			modifyform.text.focus();
			return false;
		} else if(textSize > 4000) {
			alert("내용은 한글 1,333자, 영문 4000자 이내로 작성해주세요.");
			modifyform.text.focus();
			return false;
		}
		else return true;
	}
	
	// 취소시 컨펌
	function cancelCheck() {
	    if (confirm("취소하시겠습니까?") == true) {
			history.back(-1);
	    }
	}
	
</script>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>게시물 수정</h1>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" role="form" name="modifyform" action="/finalshop/board/modify.do" method="POST" onsubmit="return modCheck()">
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="title" class="control-label">제목</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control input-lg" name="title" id="title" value="${board.title}">
							<input type="hidden" name="board_no" value="${board.board_no}">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="text" class="control-label">내용</label>
						</div>
						<div class="col-md-10">
							<textarea class="form-control" rows="20" name="text" id="text">#{board.text}</textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-lg btn-warning">
								<span class="fa fa-fw fa-check"></span> 수정
							</button>
							<button type="button" class="btn btn-danger btn-lg" onclick="javascript:cancelCheck()">
								<span class="fa fa-fw fa-close"></span> 취소
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>