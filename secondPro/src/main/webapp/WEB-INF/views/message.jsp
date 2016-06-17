<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- �����������ӿ�ũ ����(MessageSource��ü)�� ���õ� message�� ���������� ����ϱ� ����
	 �Ϲ� JSP���� ���Ǵ� �±׸� �̿��ؼ� ����� �� ���� spring���� �����Ǵ� Ŀ���� �±׸� �̿��ؼ� ����ؾ� �Ѵ�. --%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form:form method="POST" action="">
		<table>
			<tr>
				<td>
					<form:label path="id"><spring:message code="member.form.id"/></form:label>
				</td>
				<td>
					<form:input path="id"/>
				</td>
			</tr>
			<tr>
				<td>
					<form:label path="pass"><spring:message code="member.form.pass"/></form:label>
				</td>
				<td>
					<form:input path="pass"/>
				</td>
			</tr>
			<tr>
				<td>
					<form:label path="name"><spring:message code="member.form.name"/></form:label>
				</td>
				<td>
					<form:input path="name"/>
				</td>
			</tr>
			<tr>
				<td>
					<form:label path="addr"><spring:message code="member.form.addr"/></form:label>
				</td>
				<td>
					<form:input path="addr"/>
				</td>
			</tr>
		</table>
	</form:form>
</body>
</html>