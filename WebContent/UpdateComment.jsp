<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글, 답글 수정</title>
<style>
#comment{
width:65%;
float : left; 
margin-left : 15%;
}

    .writeCom{
     margin: auto;
     width : 65px;
    height: 55px;
    font-size : 12px;
    border: none;
    outline: none;
    background-color: #3D5F95;
    padding-bottom: 0px;
    color: #ffffff;
    border-radius: 5px;
    
    }
</style>

</head>
<body>
<%
	String comnum = request.getParameter("_comnum");		//수정할 댓글의 댓글번호를 받아옴
	String content = request.getParameter("_content");		//수정할 댓글의 원래 내용을 받아옴
	String comchk = request.getParameter("_comchk");		//수정을 원하는 댓글이 댓글인지 답글인지 여부를 받아옴
	String posnum = request.getParameter("_posnum");		//다시 원래 게시글로 돌아가기 위한 게시글 번호를 받아옴
	String userID =  (String) session.getAttribute("__NAME");   		//세션에서 로그인중인 닉네임 받아옴

	if(userID==null){		//로그아웃상태면 오류메시지 로그인페이지로 이동
		out.println("<script>alert('접근 오류');</script>");		
		out.println("<script>location.href='Main.jsp';</script>");
	}  
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj?useSSL=false","root","1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from comment where comnic = '"+userID+"' and comnum = '"+comnum+"' and comrepdiv = '"+comchk+"'");
	if(!rs.next()){
		out.println("<script>alert('권한이 없습니다.');</script>");	
		out.println("<script>location.href='View.jsp?_posnum="+posnum+"';</script>");
	} else{
%>
<div id="comment">
	<h3>댓글 수정</h3>
	<hr><br>
	<!-- UpdateCommentBack.jsp에 댓글번호, 댓,답글 여부, 게시글 번호, 수정할 내용 전달 -->
	<form action = UpdateCommentBack.jsp method = "post">	
	<input type = "hidden" name = "_comnum" value = <%=comnum%>>
	<input type = "hidden" name = "_comchk" value = <%=comchk%>>
	<input type = "hidden" name = "_posnum" value = <%=posnum%>>
	<textarea style = "width : 700px; height : 50px; resize: none;" name = "_content"><%=content %></textarea>
	<span style = "margin-left : 1%; vertical-align : top;">  
	<button type = "submit" class = "writeCom">댓글 수정</button>
	</span>
	</form>
</div>
<%
	}
	}  catch(Exception e){
		e.printStackTrace();
	}	
	
%>
</body>
</html>