<%@page import="emp.dto.MyEmpDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" session="true" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% MyEmpDTO userInfo = (MyEmpDTO) session.getAttribute("userInfo"); %>

	<div>
		<h3>����������<br/>(������̼�)</h3>
		<hr/>
		<% if(userInfo != null) { %>
			<h5>���̵� : ${userInfo.id}</h5>
			<h5>��  �� : ${userInfo.name}</h5>
			<h5><a href="/mySecondPro/logout.do">�α׾ƿ�</a></h5>
		<% } else { %>

			<h5><a href="/mySecondPro/login.do">�α���</a></h5>
		<% } %>
		<hr/>
		<h5><a href="/mySecondPro/test.do">������ �� MVC�����ϱ�</a></h5>
		<h5><a href="/mySecondPro/insert.do">ȸ������</a></h5>
		<h5><a href="/mySecondPro/list.do">ȸ�����</a></h5>
		<h5><a href="/mySecondPro/search.do">ȸ���˻�</a></h5>
		<hr/>
		<h5><a href="/mySecondPro/emp/count.do">�ο��� Ȯ��(Mybatis)</a></h5>
		<h5><a href="/mySecondPro/mybatisList.do">ȸ�����(Mybatis)</a></h5>
		<h5><a href="/mySecondPro/mybatisSearch.do">ȸ���˻�(Mybatis)</a></h5>
		<h5><a href="/mySecondPro/insert.do">ȸ������(Mybatis)</a></h5>
		<h5><a href="/mySecondPro/txInsert.do">ȸ������(Ʈ�����ó��)</a></h5>
		<h5><a href="/mySecondPro/i18nTest.do?lang=ko">�ٱ�������(ko)</a></h5>
		<h5><a href="?lang=en">�ٱ�������(en)</a></h5>
		<h5><a href="?lang=jp">�ٱ�������(jp)</a></h5>
	</div>
</body>
</html>