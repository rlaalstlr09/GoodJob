<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" import = "java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글, 답글 수정 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userID =  (String) session.getAttribute("__NAME");		//세션에서 닉네임 값을 받아옴
	String comchk = request.getParameter("_comchk");		
	String content = request.getParameter("_content"); 
	String comnum = request.getParameter("_comnum");	
	String posnum = request.getParameter("_posnum");
	
	try{
			 Class.forName("com.mysql.jdbc.Driver");
		 	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false", "root", "1234");
			Statement stmt = conn.createStatement();   
			
			stmt.executeUpdate("update comment set comcon = '"+content+"' where comrepdiv = '"+comchk+"' and comnum = '"+comnum+"'");
			
			stmt.close();
			conn.close();
			
			out.println("<script>alert('댓글이 수정 되었습니다.');</script>");	
			out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>