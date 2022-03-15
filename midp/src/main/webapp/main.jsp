<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그인 체크
if(session.getAttribute("id") == null){
%>
<script>
alert('잘못된 접근이나 장시간 사용하지 않았어요!\n 다시 로그인해주세요.');
location.href = "login.jsp";
</script>
<% }%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<style>

}</style>
</head>
<body>
<h1>Main - 로그인 성공 페이지</h1>
<hr>
<%=session.getAttribute("name") %> 님 환영합니다 <a href="logout.jsp">LOG-OUT</a> |
<a href="pw.jsp?param=u">정보수정</a> 
| <a href="pw.jsp?param=d">회원탈퇴</a>
</body>
</html>