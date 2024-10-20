<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 처리</title>
</head>
<body>
<% 
request.setCharacterEncoding("UTF-8");
String posnum = request.getParameter("_posnum");
String userID =  (String) session.getAttribute("__NAME");
if(userID==null){		//로그아웃상태면 오류메시지 로그인페이지로 이동
	out.println("<script>alert('접근 오류');</script>");		
	out.println("<script>location.href='Main.jsp';</script>");
}  

try{
	
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false", "root", "1234");
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("select * from likes where liknic='"+userID+"' and posnum = '"+posnum+"'");   //me2 세션으로 아이디 받아와야함
	if(rs.next()) {
		out.println("<script>alert('좋아요는 한 번만 누를 수 있습니다.');</script>");
		out.println("<script>history.back()</script>");
	}
						
	else {
		stmt.executeUpdate("insert into likes values ('"+posnum+"','"+userID+"')");	
		out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
	}
	stmt.close();
	conn.close();
	rs.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
</body>
</html>