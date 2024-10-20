
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자용 회원 삭제 페이지</title>
</head>
<body>
<h1>관리자용 회원 삭제 페이지</h1>

<%

	request.setCharacterEncoding("EUC-KR");
	
	//회원들 불러온 테이블에서 아이디 값 받아옴
	String id = request.getParameter("id");

	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn =
				DriverManager.getConnection(
						"jdbc:mysql://localhost/gj"
						, "root"
						, "1234");
		
		Statement stmt = conn.createStatement();
		
		//삭제 버튼을 누르면 받아온 아이디 값을 삭제 쿼리문에 넣어 회원 삭제
		stmt.executeUpdate("Delete from member where id = '" + id + "' ");
		
		//회원 삭제가 완료되면 alert창으로 알림
		out.println("alert(<h3>회원 삭제가 완료되었습니다.</h3>)");		
		
		stmt.close();
		conn.close();
		
		//회원삭제 후 관리자용 회원정보 페이지로 이동
		response.sendRedirect("Adm_main.jsp");
		
	} catch(SQLException e){
		e.printStackTrace();
		
		
	}

%>



</body>
</html>