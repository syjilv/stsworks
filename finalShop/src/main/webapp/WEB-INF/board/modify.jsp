<%@page import="member.dto.MemberDTO"%>
<%@page import="board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true" import="java.util.*"%>
<script>
<% 	BoardDTO board = (BoardDTO) request.getAttribute("board");
	MemberDTO mem = (MemberDTO) session.getAttribute("mem");

	// ���� ���� ���� - �ۼ��ڿ� �α��� ���̵� �ٸ� ��� ����Ʈ�� �����̷�Ʈ
//	if(mem != null && !mem.getMemId().equals(board.getMemId()) || mem == null) { %>
		alert('�߸��� �����Դϴ�.');
		location.href='board_list.do';
<%//	} %>
	// ���� �� üũ
	function modCheck() {
		// ����, ���� ������ üũ�ϴ� ���Խ�(�ƽ�Ű�ڵ�� 1, �����ڵ�� 3���� ���)
		var titleSize = modifyform.title.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
		var textSize = modifyform.text.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;

		if(titleSize <= 0) {
			alert("������ �Է��� �ּ���.");
			modifyform.title.focus();
			return false;
		} else if(titleSize > 100) {
			alert("������ �ѱ� 33��, ���� 100�� �̳��� �ۼ����ּ���.");
			modifyform.title.focus();
			return false;
		} else if(textSize <= 0) {
			alert("������ �Է��� �ּ���.");
			modifyform.text.focus();
			return false;
		} else if(textSize > 4000) {
			alert("������ �ѱ� 1,333��, ���� 4000�� �̳��� �ۼ����ּ���.");
			modifyform.text.focus();
			return false;
		}
		else return true;
	}
	
	// ��ҽ� ����
	function cancelCheck() {
	    if (confirm("����Ͻðڽ��ϱ�?") == true) {
			history.back(-1);
	    }
	}
	
</script>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>�Խù� ����</h1>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" role="form" name="modifyform" action="/finalshop/board/modify.do" method="POST" onsubmit="return modCheck()">
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="title" class="control-label">����</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control input-lg" name="title" id="title" value="${board.title}">
							<input type="hidden" name="board_no" value="${board.board_no}">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="text" class="control-label">����</label>
						</div>
						<div class="col-md-10">
							<textarea class="form-control" rows="20" name="text" id="text">#{board.text}</textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-lg btn-warning">
								<span class="fa fa-fw fa-check"></span> ����
							</button>
							<button type="button" class="btn btn-danger btn-lg" onclick="javascript:cancelCheck()">
								<span class="fa fa-fw fa-close"></span> ���
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>