<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>로그인</h1>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" role="form" name="loginform" method="post" action="/finalshop/member/login.do">
					<div class="form-group has-feedback">
						<div class="col-sm-2 text-right">
							<label path="memId" class="control-label">ID</label>
						</div>
						<div class="col-sm-10">
							<input type="text" class="form-control input-lg" path="memId"
								name="mem_id" placeholder="ID" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 text-right">
							<label for="pwd" class="control-label">Password</label>
						</div>
						<div class="col-sm-10">
							<input type="password" class="form-control input-lg" id="pwd"
								name="pwd" placeholder="Password">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-lg btn-success">
								<span class="fa fa-fw fa-sign-in"></span> 로그인
							</button>
							<button type="button" class="btn btn-lg btn-danger"
								onclick="history.back(-1)">
								<span class="fa fa-fw fa-close"></span> 취소
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>