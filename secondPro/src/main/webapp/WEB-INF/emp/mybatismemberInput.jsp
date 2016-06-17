<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
<form:form name="form1" method="post" action="insert.do">
<table align="center" cellpadding="0" cellspacing="0" width="479">
    <tr>
        <td width="469" colspan="2" height="42">
            <p align="center"><code><b><span style="font-size:20pt;">회원가입-Mybatis</span></b></code></p>
        </td>
    </tr>
    <tr>
        <td width="479" colspan="2">
            <hr></td>
    </tr>
 
    <tr>
        <td width="104">
            <form:label path="id"><spring:message code="member.form.id"/></form:label>
        </td>
        <td width="359">
					<form:input path="id"/>
        </td>
    </tr>
   <tr>
        <td width="104">
					<form:label path="pass"><spring:message code="member.form.pass"/></form:label>
        </td>
        <td width="359">
					<form:password path="pass"/>
        </td>
    </tr>
    <tr>
        <td width="104">
					<form:label path="name"><spring:message code="member.form.name"/></form:label>
        </td>
        <td width="359">
					<form:input path="name"/>
        </td>
    </tr>
    <tr>
        <td width="104">
					<form:label path="addr"><spring:message code="member.form.addr"/></form:label>
        </td>
        <td width="359">
					<form:input path="addr"/>
        </td>
    </tr>
 
    <tr>
        <td width="104">
					<form:label path="grade"><spring:message code="member.form.memo"/></form:label>
        </td>
        <td width="359">
					<form:textarea path="grade"/>
        </td>
    </tr>
   
   
    <tr>
        <td width="479" colspan="2">
            <hr>        </td>
    </tr>
    <tr>
        <td width="479" colspan="2">
            <p align="center"><form:button><spring:message code="member.form.submit"/></form:button>
        </td>
    </tr>
    <tr>
    </tr>
    <tr>
        <td width="479" colspan="2" height="57" valign="bottom">            <p align="right"><code><input type="hidden" name="jumin"><input type="hidden" name="ilsi"></code></p>
        </td>
    </tr>
</table>
</form:form>
</body>
</html>