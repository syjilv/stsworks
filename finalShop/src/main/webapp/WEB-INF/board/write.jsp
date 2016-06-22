<%@page import="member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true" import="java.util.*"%>
<script>
<% 	MemberDTO mem = (MemberDTO) session.getAttribute("mem");

	// ���� ���� ���� - ������ ���� ��� �α������� �����̷�Ʈ
	if(mem == null) { %>
		alert('�α��� ���ּ���.');
		location.href='login.do?ref=write';
	<%	} %>
	
	// ���� �� üũ
	function writeCheck() {
		// ����, ���� ������ üũ�ϴ� ���Խ�(�ƽ�Ű�ڵ�� 1, �����ڵ�� 3���� ���)
		var titleSize = writeform.title.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
		var textSize = writeform.text.value.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;

		if(titleSize <= 0) {
			alert("������ �Է��� �ּ���.");
			writeform.title.focus();
			return false;
		} else if(titleSize > 100) {
			alert("������ �ѱ� 33��, ���� 100�� �̳��� �ۼ����ּ���.");
			writeform.title.focus();
			return false;
		}
		if(textSize <= 0) {
			alert("������ �Է��� �ּ���.");
			writeform.text.focus();
			return false;
		} else if(textSize > 4000) {
			alert("������ �ѱ� 1,333��, ���� 4000�� �̳��� �ۼ����ּ���.");
			writeform.text.focus();
			return false;
		}
		else return true;
	}
	// ��ҽ� ����
	function cancelCheck() {
	    if (confirm("����Ͻðڽ��ϱ�?") == true) {
			location.href='board_list.do';
	    }
	}
	
</script>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>�Խù� �ۼ�</h1>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" role="form" name="writeform" action="write.do" method="POST" onsubmit="return writeCheck()">
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="title" class="control-label">����</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control input-lg" name="title" id="title" placeholder="����">
							<input type="hidden" name="memId" id="memId" value="${mem.memId}">
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-2 text-right">
							<label for="text" class="control-label">����</label>
						</div>
						<div class="col-md-10">
							<textarea class="form-control" rows="20" name="text" id="text"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-12 text-center">
							<button type="submit" class="btn btn-lg btn-primary">
								<i class="fa fa-fw fa-check"></i> �۾���
							</button>
							<button type="button" class="btn btn-danger btn-lg" onclick="javascript:cancelCheck()">
								<i class="fa fa-fw fa-close"></i> ���
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>