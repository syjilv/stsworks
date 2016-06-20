<%@page import="member.dto.MemberDTO"%>
<%@page import="board.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" session="true" import="java.util.*"%>

<script type="text/javascript">
	function del(boardNo) {
	    if (confirm("삭제하시겠습니까?") == true) {
		    var delform = document.createElement("form");
		    delform.setAttribute("method", "POST");
		    delform.setAttribute("action", "del.do");
	        var field = document.createElement("input");
			field.setAttribute("type", "hidden");
			field.setAttribute("name", "boardNo");
			field.setAttribute("value", boardNo);
	        delform.appendChild(field);
		    document.body.appendChild(delform);
		    delform.submit();
	    } else {
	        alert('취소되었습니다.');
	    }
	}
</script>
	<%
		BoardDTO board = (BoardDTO) request.getAttribute("board");
		int pageNo = (int) request.getAttribute("pageNo");
		String mode = (String) request.getAttribute("mode");
		String target = (String) request.getAttribute("target");
		String keyword = (String) request.getAttribute("keyword");

		MemberDTO mem = (MemberDTO) session.getAttribute("mem");
	
		String newTitle = board.getTitle();
		newTitle = newTitle.replaceAll("′","'");
		newTitle = newTitle.replaceAll("\u0020","&nbsp;");
		newTitle = newTitle.replaceAll(">","&gt;");
		newTitle = newTitle.replaceAll("<","&lt;");

		String newText = board.getText();
		newText = newText.replaceAll("′","'");
		newText = newText.replaceAll("\u0020","&nbsp;");		
		newText = newText.replaceAll(">","&gt;");
		newText = newText.replaceAll("<","&lt;");
		newText = newText.replaceAll("\r\n","<br>");
		
		StringBuffer regDtm = new StringBuffer(board.getRegDtm());
		regDtm.insert(4, "-");
		regDtm.insert(7, "-");
		regDtm.insert(10, " ");
		regDtm.insert(13, ":");
		regDtm.insert(16, ":");
		if(board.getModDtm() != null) {
			regDtm.append(board.getModDtm());
			regDtm.insert(23, "-");
			regDtm.insert(26, "-");
			regDtm.insert(29, " ");
			regDtm.insert(32, ":");
			regDtm.insert(35, ":");
			regDtm.insert(19, "</span>&nbsp;&nbsp;<span class=\"fa fa-fw fa-refresh\"></span>&nbsp;<span class=\"text-primary\">");
			regDtm.append("</span>");
		}
		%>
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
								<h3 style="word-wrap:break-word;"><span class="fa fa-fw fa-star"></span>&nbsp;<%= newTitle %></h3>
								<h4 class="text-muted">
									<span class="fa fa-fw fa-flip-horizontal fa-slack"></span>&nbsp;<span class="text-primary">${board.board_no}</span>&nbsp;&nbsp;
									<span class="fa fa-fw fa-user"></span>&nbsp;<span class="text-primary">${board.mem_nm}(${board.mem_id})</span>&nbsp;&nbsp;
									<span class="fa fa-fw fa-eye"></span>&nbsp;<span class="text-primary">${board.count}</span>&nbsp;&nbsp;
									<span class="fa fa-fw fa-clock-o"></span>&nbsp;<span class="text-primary"><%= regDtm %></span>
								</h4>
						</div>
						<div class="panel-body">
							<p class="lead"><%= newText %></p>
						</div>
					</div>
				</div>
			</div>
			<!-- 글 작성자가 아닐 경우 수정 / 삭제 버튼이 보이지 않음 -->
				<div class="row">
					<div class="col-md-6">
						<a class="btn btn-default btn-lg" href="board_list.do?pageNo=<%= pageNo %>"><span class="fa fa-fw fa-th-list"></span> 목록</a>
					</div>
					<div class="col-md-6 text-right">
						<% if(mem != null && mem.getMemId().equals(board.getMemId())) { %>
							<a class="btn btn-lg btn-warning" href="modify.do?boardNo=<%= board.getBoardNo() %>"><span class="fa fa-fw fa-eraser"></span> 수정</a>
							<a class="btn btn-lg btn-danger" href="javascript:del(<%= board.getBoardNo() %>);"><span class="fa fa-fw fa-trash"></span> 삭제</a>
						<% } %>
					</div>
				</div>
		</div>
	</div>
</body>

</html>
<% if(mode.equals("search")) { %>
	<jsp:include page="/finalshop/board/board_search.do"></jsp:include>
<% } else { %>
	<jsp:include page="/finalshop/board/board_list.do"></jsp:include>
<% } %>