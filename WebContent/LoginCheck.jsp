<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>


<%
	//아이디와 비밀번호 체크
	//메인화면 헤더 로그인부분에서 아이디와 비밀번호를 받아온다
	String id = request.getParameter("_id");	
	String pw = request.getParameter("_pw");	

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		Statement stmt = conn.createStatement();
		
		//아이디와 비밀번호가 DB에 있는 정보와 일치하는지 확인
		ResultSet rs = stmt.executeQuery(
				"Select * from member where id = '"+ id + "' and pw = '" + pw +"'" );
		
		if(rs.next()){
			
			String nickname = rs.getString("nickname");
			
			//세션으로 아이디와 닉네임 받아오기.
			session.setAttribute("__ID", id);
			session.setAttribute("__NAME", nickname);
			
			//Admin은 관리자의 아이디로, 관리자가 로그인 할 경우 관리자 메인 페이지로 이동한다.
			if(id.equals("Admin")){
				response.sendRedirect("Adm_Board.jsp");
			} else
			
			//관리자가 아닌 일반 회원이 로그인 할 경우 로그인된 헤더를 가진 메인화면으로 이동한다.
			response.sendRedirect("Main_UI.jsp");
		} else {
			
			//아이디와 비밀번호가 틀렸을 경우 alert창으로 틀렸음을 알리고 다시 메인화면으로 돌아간다.
			out.println("<script>alert('아이디/비밀번호가 틀렸습니다.');</script>");
			out.println("<script>location.href='Main.jsp';</script>");
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>

</body>
</html>