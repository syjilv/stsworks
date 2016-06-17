<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>

<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<h1>로그인</h1>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-8">
					<form class="form-horizontal" role="form" name="loginform" method="post" action="login.do">
						<div class="form-group has-feedback">
							<div class="col-sm-2 text-right">
								<label for="memId" class="control-label">ID</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control input-lg" id="id" name="id" placeholder="ID">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2 text-right">
								<label for="pwd" class="control-label">Password</label>
							</div>
							<div class="col-sm-10">
								<input type="password" class="form-control input-lg" id="pass" name="pass" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-lg btn-success">
									<span class="fa fa-fw fa-sign-in"></span> 로그인
								</button> 
								<button type="button" class="btn btn-lg btn-danger" onclick="history.back(-1)">
									<span class="fa fa-fw fa-close"></span> 취소
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>