<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String param = request.getParameter("param");
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>pw.jsp</title>
<style type="text/css">
	th {width: 100px; background-color: rgb(200, 150, 200); align:center;}
</style>
</head>
<body>
<h1>PW - Input - select</h1>
<hr>
<form action="pwProc.jsp" method="post">
<input type="hidden" name="param" value="<%=param %>">
<table border="1">
<tr><th>PW</th><td><input type="text" name="password"></td></tr>
<tr><td colspan="2" align="center">
<input type="submit" value="CHECK">
<input type="button" value="돌아가기" onclick="history.back();">

</td></tr>
</table>
</form>
</body>
</html>