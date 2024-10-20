<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center">
	<h3>* 아이디 중복 확인 결과 *</h3>
<%
	request.setCharacterEncoding("UTF-8"); 
    //1) 사용가능한 아이디일 경우, 아이디 입력 폼에 넣기 위함
    String id=request.getParameter("id");
    try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost/gj", "root", "1234");
		Statement stmt = conn.createStatement();
		
		 out.println("입력 ID : <strong>" + id + "</stong>");
		    	
		//1. 입력한 아이디가 db에 있을 때
		ResultSet rs = stmt.executeQuery("Select * from member where id = '"+id+"'");
		if(rs.next())	{
			do {
				String idvalue = rs.getString("id");

			} while(rs.next());
			out.println("<p style='color: red'>중복된 아이디입니다.</p>");
		} else {
			out.println("<p>사용 가능한 아이디입니다.</p>");
			out.println("<a href='javascript:sendChildValue1(\"" + id + "\")'>[적용]</a>");
		}
		
		stmt.close();
		conn.close();
		
	} catch (SQLException e){
		e.printStackTrace();
	}
	

   
%>

	<script>

	//부모 창에게 값 넘겨주기
	function sendChildValue1(name){
		opener.setChildValue1(name);
		window.close();
		}

    </script>

 <hr>
 <a href="javascript:history.back()">[다시시도]</a>
 &nbsp; &nbsp;
 <a href="javascript:window.close()">[창닫기]</a>
 </div>
 </body>
 </html>