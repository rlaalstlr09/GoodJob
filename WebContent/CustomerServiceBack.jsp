<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 처리</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("_type");
	String title = request.getParameter("_title");
	String date = request.getParameter("_date");
	String content = request.getParameter("_content");
	String userID =  (String) session.getAttribute("__NAME");


try{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj", "root", "1234");
	Statement stmt = conn.createStatement();
		stmt.executeUpdate("insert into inquiry(category, inqtit, inqnic, inqdat, inqcon, process) values ('"+ type +"', '" + title + "','"+userID+"', '" + date + "', '"+content+"', 0)");
		out.println("<script>alert('문의가 완료되었습니다.');</script>");	
		out.println("<script>location.href='CustomerService.jsp';</script>");
	stmt.close();
	conn.close();
 }catch(Exception e){
	 e.printStackTrace();
 }
%>
</body>
</html>