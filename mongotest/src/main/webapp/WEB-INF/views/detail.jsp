<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
			<form role="form" class="form-horizontal" method="GET">
				<fieldset>
					<div class="form-group">
						<!-- 부서코드 -->
						<label class="control-label col-sm-2" for="orgcode">아이디</label>
						<div class="col-sm-3">
							<span>${doc.id}</span>
						</div>
					</div>
					<div class="form-group">
						<!-- 부서명-->
						<label class="control-label col-sm-2" for="orgname">성명</label>
						<div class="col-sm-3">
							<span>${doc.name}</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="orgloc">부서명</label>
						<div class="col-sm-3">
							<span>${doc.dept}</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="orgtel">주소</label>
						<div class="col-sm-3">
							<span>${doc.addr}</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="orgcode">자바점수</label>
						<div class="col-sm-3">
							<span>${doc.java}</span>
						</div>
					</div>
					<div class="form-group">
						<!-- 부서명-->
						<label class="control-label col-sm-2" for="orgname">서블릿</label>
						<div class="col-sm-3">
							<span>${doc.servlet}</span>
						</div>
					</div>
					<div class="form-group">
						<!-- 부서위치-->
						<label class="control-label col-sm-2" for="orgloc">spring</label>
						<div class="col-sm-3">
							<span>${doc.spring}</span>
						</div>
					</div>
					<div class="form-group">
						<!-- 전화번호-->
						<label class="control-label col-sm-2" for="orgtel">보너스</label>
						<div class="col-sm-3">
							<span>${doc.bonus}</span>
						</div>
					</div>
					<div class="form-group">
						<!-- Button -->
						<div class="col-sm-3 col-sm-offset-2">
							<input type="submit" value="수정하기" class="btn btn-success"/>
						</div>
					</div>
				</fieldset>
			</form>
	</div>
</body>
</html>