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
						<!-- �μ��ڵ� -->
						<label class="control-label col-sm-2" for="orgcode">���̵�</label>
						<div class="col-sm-3">
							<span>${doc.id}</span>
						</div>
					</div>
					<div class="form-group">
						<!-- �μ���-->
						<label class="control-label col-sm-2" for="orgname">����</label>
						<div class="col-sm-3">
							<span>${doc.name}</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="orgloc">�μ���</label>
						<div class="col-sm-3">
							<span>${doc.dept}</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="orgtel">�ּ�</label>
						<div class="col-sm-3">
							<span>${doc.addr}</span>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="orgcode">�ڹ�����</label>
						<div class="col-sm-3">
							<span>${doc.java}</span>
						</div>
					</div>
					<div class="form-group">
						<!-- �μ���-->
						<label class="control-label col-sm-2" for="orgname">����</label>
						<div class="col-sm-3">
							<span>${doc.servlet}</span>
						</div>
					</div>
					<div class="form-group">
						<!-- �μ���ġ-->
						<label class="control-label col-sm-2" for="orgloc">spring</label>
						<div class="col-sm-3">
							<span>${doc.spring}</span>
						</div>
					</div>
					<div class="form-group">
						<!-- ��ȭ��ȣ-->
						<label class="control-label col-sm-2" for="orgtel">���ʽ�</label>
						<div class="col-sm-3">
							<span>${doc.bonus}</span>
						</div>
					</div>
					<div class="form-group">
						<!-- Button -->
						<div class="col-sm-3 col-sm-offset-2">
							<input type="submit" value="�����ϱ�" class="btn btn-success"/>
						</div>
					</div>
				</fieldset>
			</form>
	</div>
</body>
</html>