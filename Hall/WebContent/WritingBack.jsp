<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*" import = "java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성 처리</title>
</head>
<body>
<% 
	
	request.setCharacterEncoding("UTF-8");
	String type = request.getParameter("_type");
	String title = request.getParameter("_title");
	String userID =  (String) session.getAttribute("__NAME");
	int posnum=0;
	
	LocalDate now = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	 
    String date = now.format(formatter);
    
	String content = request.getParameter("_content");

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false", "root", "1234");
		Statement stmt = conn.createStatement();
		int result = stmt.executeUpdate("insert into post (postit, poscon, posdat, posnic, views, btype) values ('" + title + "','"+content+"', '" + date + "', '"+userID+"', 0, '"+type+"')");
		if(result!=0){
			ResultSet rs = stmt.executeQuery("select posnum from post where postit = '"+title+"' and poscon = '"+content+"' and posdat = '"+date+"' and btype = '"+type+"'");
			if (rs.next()){
				posnum = rs.getInt("posnum");
				rs.close();
			}
		} else{
			out.println("<script>alert('글 작성 오류');</script>");	
			out.println("<script>location.href='WritingPage.jsp';</script>");
		}
		if(posnum != 0){
		out.println("<script>alert('게시글 작성이 완료되었습니다.');</script>");	
		out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
		} else{
			out.println("<script>alert('글 작성 오류');</script>");	
			out.println("<script>location.href='WritingPage.jsp';</script>");
		}
		stmt.close();
		conn.close();
		
	 }catch(Exception e){
		 e.printStackTrace();
	 }
	
%>
</body>
</html>