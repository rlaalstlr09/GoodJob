<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("euc-kr");	

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nickname = request.getParameter("nickname");
	
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/project","root","1234");
	Statement stmt = conn.createStatement();
	stmt.executeUpdate("delete from member where id = '"+id+"'");
	
	out.println("<script>alert('탈퇴완료!');</script>");
	out.println("<script>location.href='Login.jsp';</script>");
	
	stmt.close();
	conn.close();
	
	} catch(SQLException e){
	e.printStackTrace();
	}
%>

</body>
</html>