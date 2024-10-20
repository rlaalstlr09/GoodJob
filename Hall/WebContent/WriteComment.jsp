<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" import = "java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글, 답글 작성 처리</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String comchk = request.getParameter("_comchk");
	String comcon = request.getParameter("_content"); 
	String fgnnum = request.getParameter("_fgnnum"); 
	String posnum = request.getParameter("_posnum");
	String userID =  (String) session.getAttribute("__NAME");
	
	LocalDate now = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	 
    String date = now.format(formatter);
	if(userID==null){		//로그아웃상태면 오류메시지 로그인페이지로 이동
		out.println("<script>alert('접근 오류');</script>");		
		out.println("<script>location.href='Main.jsp';</script>");
	}  
	
	try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false", "root", "1234");
		Statement stmt = conn.createStatement();
		
			stmt.executeUpdate("insert into comment (comnic, comcon, comdat, comrepdiv, fgnnum, delchk) values ('"+userID+"','"+comcon+"', '"+date+"', '"+comchk+"', '"+fgnnum+"', 0)");
			if(comchk.equals("1"))
				out.println("<script>alert('댓글이 등록되었습니다.');</script>");	
			else
				out.println("<script>alert('답글이 등록되었습니다.');</script>");	
				out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
			
			conn.close();
			stmt.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>