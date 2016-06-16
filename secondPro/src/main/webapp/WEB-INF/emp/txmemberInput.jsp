<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red">
<form name="form1" method="post" action="txInsert.do">
<table align="center" cellpadding="0" cellspacing="0" width="479">
    <tr>
        <td width="469" colspan="2" height="42">
            <p align="center"><code><b><span style="font-size:20pt;">회원가입</span></b></code></p>
        </td>
    </tr>
    <tr>
        <td width="479" colspan="2">
            <hr></td>
    </tr>
 
    <tr>
        <td width="104">
            <p><code><b>아이디</b></code></p>
        </td>
        <td width="359">
            <p><code><input type="text" name="id" size="30"></code></p>
        </td>
    </tr>
   <tr>
        <td width="104">
            <p><code><b>비밀번호</b></code></p>
        </td>
        <td width="359">
            <p><code><input type="text" name="pass" size="30"></code></p>
        </td>
    </tr>
    <tr>
        <td width="104">
            <p><code><b>성명</b></code></p>
        </td>
        <td width="359">
            <p><code><input type="text" name="name" size="30"></code></p>
        </td>
    </tr>
    <tr>
        <td width="104">
            <p><code><b>주소</b></code></p>
        </td>
        <td width="359">
            <p><code><input type="text" name="addr" size="51"></code></p>
        </td>
    </tr>
 
    <tr>
        <td width="104">
            <p><code><b>등급</b></code></p>
        </td>
        <td width="359">
            <p><textarea name="grade" rows="10" cols="50"></textarea></p>
        </td>
    </tr>
   
   
    <tr>
        <td width="479" colspan="2">
            <hr>        </td>
    </tr>
    <tr>
        <td width="479" colspan="2">
            <p align="center"><input type="submit" name="formbutton1" value="가입"></p>
        </td>
    </tr>
    <tr>
        <td width="479" colspan="2" height="9" valign="bottom">            
                <p><code><a href="list.do">리스트(L)</a></code></p>
        </td>
    </tr>
    <tr>
        <td width="479" colspan="2" height="57" valign="bottom">            <p align="right"><code><input type="hidden" name="jumin"><input type="hidden" name="ilsi"></code></p>
        </td>
    </tr>
</table>
</form>
</body>
</html>