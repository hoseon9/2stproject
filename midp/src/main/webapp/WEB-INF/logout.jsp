<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그아웃 --> session 값 없애기
session.invalidate();
%>
<script>
alert("Logout OK!!");
location.href = "index.jsp";
</script>