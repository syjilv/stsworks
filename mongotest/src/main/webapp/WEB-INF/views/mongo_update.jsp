<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			<form role="form" class="form-horizontal"
				action="/mongodb/score/update" method="POST">
				<fieldset>
					<div id="legend">
						<legend>�Ʒ� ����� �ۼ����ּ���.</legend>
					</div>
					<div class="form-group">
						<!-- �μ��ڵ� -->
						<label class="control-label col-sm-2" for="orgcode">���̵�</label>
						<div class="col-sm-3">
							<input type="text" id="orgcode" name="id"
								value="${document.id}" class="form-control"
								 required>
						</div>
					</div>
					<div class="form-group">
						<!-- �μ���-->
						<label class="control-label col-sm-2" for="orgname">����</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name"
								value="${document.name}" class="form-control" minlength="2" required>

						</div>
					</div>
					<div class="form-group">
						<!-- �μ���ġ-->
						<label class="control-label col-sm-2" for="orgloc">�μ���</label>
						<div class="col-sm-3">
							<input type="text" id="dept" name="dept"
								value="${document.dept}" class="form-control" minlength="2" >

						</div>
					</div>
					<div class="form-group">
						<!-- ��ȭ��ȣ-->
						<label class="control-label col-sm-2" for="orgtel">�ּ�</label>
						<div class="col-sm-3">
							<input type="text" id="addr" name="addr" 
							value="${document.addr}"
								class="form-control" minlength="2" required>

						</div>
					</div>
					<div class="form-group">
						<!-- �μ��ڵ� -->
						<label class="control-label col-sm-2" for="orgcode">�ڹ�����</label>
						<div class="col-sm-3">
							<input type="text" id="java" name="java"
								value="${document.java}" class="form-control"
								 required>
						</div>
					</div>

					
					
					<div class="form-group">
						<!-- �μ���-->
						<label class="control-label col-sm-2" for="orgname">����</label>
						<div class="col-sm-3">
							<input type="text" id="servlet" name="servlet"
								value="${document.servlet}" class="form-control" required>

						</div>
					</div>



				


					
					<div class="form-group">
						<!-- �μ���ġ-->
						<label class="control-label col-sm-2" for="orgloc">spring</label>
						<div class="col-sm-3">
							<input type="text" id="spring" name="spring"
								value="${document.spring}" class="form-control" >

						</div>
					</div>
					<div class="form-group">
						<!-- ��ȭ��ȣ-->
						<label class="control-label col-sm-2" for="orgtel">���ʽ�</label>
						<div class="col-sm-3">
							<input type="text" id="bonus" name="bonus" 
							value="${document.bonus}"
								class="form-control" required value="10000">

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