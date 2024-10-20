
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품정보 삭제 확인</title>
</head>
<body>
<h1>나의글 삭제</h1>

<%

	request.setCharacterEncoding("EUC-KR");

	String posnum = request.getParameter("posnum");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String joboffdiv = request.getParameter("joboffdiv");

	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn =
				DriverManager.getConnection(
						"jdbc:mysql://localhost/gj"
						, "root"
						, "1234");
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("Delete from post where posnum = '" + posnum + "' ");
		
		
		
		
		stmt.close();
		conn.close();
		
		response.sendRedirect("MyPost.jsp");
		
	} catch(SQLException e){
		e.printStackTrace();
		
		
	}

%>



</body>
</html>