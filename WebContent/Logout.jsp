<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<h1>로그아웃</h1>

<%
    // 기존의 세션 데이터를 모두 삭제
    session.invalidate();
    // 로그인 안된 헤더를 가진 메인페이지로 이동시킴.
    response.sendRedirect("Main.jsp");
%>
</body>
</html>