<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 처리</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String posnum = request.getParameter("_posnum");
	String type = request.getParameter("_type");
	String title = request.getParameter("_title");
	String content = request.getParameter("_content");
try{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false", "root", "1234");
	Statement stmt = conn.createStatement();
	
		stmt.executeUpdate("update post set postit = '"+title+"', poscon = '"+content+"', btype = '"+type+"' where posnum = '"+posnum+"'");
		
		stmt.close();
		conn.close();
		
		out.println("<script>alert('게시글 수정이 완료되었습니다.');</script>");	
		out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
	
 }catch(Exception e){
	 e.printStackTrace();
 }
%>
</body>
</html>