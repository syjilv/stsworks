<%@page import="member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true" import="java.util.*"%>
<script>
<% 	MemberDTO mem = (MemberDTO) session.getAttribute("mem");

	// 임의 접근 차단 - 세션이 없을 경우 로그인으로 리다이렉트
	if(mem == null) { %>
		alert('로그인 해주세요.');
		location.href='login.do?ref=write';
	<%	} %>
	
	// 전송 전 체크
	function writeCheck() {
		// 제목, 내용 사이즈 체크하는 정규식(아스키코드는 1, 유니코드는 3으로 계산)
		var titleSize = writeform.title.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
		var textSize = writeform.text.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;

		if(titleSize <= 0) {
			alert("제목을 입력해 주세요.");
			writeform.title.focus();
			return false;
		} else if(titleSize > 100) {
			alert("제목은 한글 33자, 영문 100자 이내로 작성해주세요.");
			writeform.title.focus();
			return false;
		}
		if(textSize <= 0) {
			alert("내용을 입력해 주세요.");
			writeform.text.focus();
			return false;
		} else if(textSize > 4000) {
			alert("내용은 한글 1,333자, 영문 4000자 이내로 작성해주세요.");
			writeform.text.focus();
			return false;
		}
		else return true;
	}
	// 취소시 컨펌
	function cancelCheck() {
	    if (confirm("취소하시겠습니까?") == true) {
			location.href='board_list.do';
	    }
	}
	
</script>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>게시물 작성</h1>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" role="form" name="writeform" action="write.do" method="POST" onsubmit="return writeCheck()">
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="title" class="control-label">제목</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control input-lg" name="title" id="title" placeholder="제목">
							<input type="hidden" name="memId" id="memId" value="${mem.memId}">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="text" class="control-label">내용</label>
						</div>
						<div class="col-md-10">
							<textarea class="form-control" rows="20" name="text" id="text"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-lg btn-primary">
								<i class="fa fa-fw fa-check"></i> 글쓰기
							</button>
							<button type="button" class="btn btn-danger btn-lg" onclick="javascript:cancelCheck()">
								<i class="fa fa-fw fa-close"></i> 취소
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>