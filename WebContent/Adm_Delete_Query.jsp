
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����ڿ� ȸ�� ���� ������</title>
</head>
<body>
<h1>�����ڿ� ȸ�� ���� ������</h1>

<%

	request.setCharacterEncoding("EUC-KR");
	
	//ȸ���� �ҷ��� ���̺��� ���̵� �� �޾ƿ�
	String id = request.getParameter("id");

	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn =
				DriverManager.getConnection(
						"jdbc:mysql://localhost/gj"
						, "root"
						, "1234");
		
		Statement stmt = conn.createStatement();
		
		//���� ��ư�� ������ �޾ƿ� ���̵� ���� ���� �������� �־� ȸ�� ����
		stmt.executeUpdate("Delete from member where id = '" + id + "' ");
		
		//ȸ�� ������ �Ϸ�Ǹ� alertâ���� �˸�
		out.println("alert(<h3>ȸ�� ������ �Ϸ�Ǿ����ϴ�.</h3>)");		
		
		stmt.close();
		conn.close();
		
		//ȸ������ �� �����ڿ� ȸ������ �������� �̵�
		response.sendRedirect("Adm_main.jsp");
		
	} catch(SQLException e){
		e.printStackTrace();
		
		
	}

%>



</body>
</html>