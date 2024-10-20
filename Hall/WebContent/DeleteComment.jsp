<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 삭제</title>
</head>
<body>
<%
	String comnum = request.getParameter("_comnum");		//삭제를 원하는 댓글의 댓글 번호를 가져옴
	String comchk = request.getParameter("_comchk");		//삭제를 원하는 댓글이 댓글인지 답글인지 여부를 가져옴
	String posnum = request.getParameter("_posnum");		//처리 후 원래 게시글로 넘어가기 위해 게시글 번호를 받아옴
	String userID =  (String) session.getAttribute("__NAME"); //세션에서 ID 값을 받아옴
		
	if(userID==null){		//로그아웃상태면 오류메시지 메인페이지로 이동
		out.println("<script>alert('접근 오류');</script>");		
		out.println("<script>location.href='Main.jsp';</script>");
	}  
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false","root","1234");
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("select * from comment where comnic = '"+userID+"' and comnum = '"+comnum+"' and comrepdiv = 1");
			ResultSet rsR = stmt.executeQuery("select * from comment where comnic = '"+userID+"' and comnum = '"+comnum+"' and comrepdiv = 0");
			
			if(rs.next()){		//댓글 작성자가 댓글 삭제를 원할경우 (댓글은 삭제하지 않고 delchk만 0으로 만들어서 삭제된 댓글의 답글도 출력)
				stmt.executeUpdate("update comment set delchk = 1 where comnic = '"+userID+"' and comnum = '"+comnum+"' and comrepdiv = 1");
				out.println("<script>alert('댓글 삭제가 완료되었습니다.');</script>");	
				out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
				
			} else if(rsR.next()) {		//답글 작성자가 답글 삭제를 원할경우 답글은 DB에서 삭제
				stmt.executeUpdate("delete from comment where comnic = '"+userID+"' and comnum = '"+comnum+"' and comrepdiv = 0");
				out.println("<script>alert('답글 삭제가 완료되었습니다.');</script>");	
				out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
			}
			else {		//작성자가 현재 로그인된 사용자와 다를 경우
				out.println("<script>alert('권한이 없습니다.');</script>");	
				out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
			}
			stmt.close();
			conn.close();
			rs.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	
%>
	
</body>
</html>