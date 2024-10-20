<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="BulletinStyle.css">
<title>관리자 전체글 열람 페이지</title>
<script type="text/javascript"></script>
</head>
<body>
 <header>
      <div class="logo">
     <a href="Main_UI.jsp"> <!-- 로고를 누를 경우 메인 페이지로 이동한다 -->
     <img src="GJ_Logo.png" class="img_logo" style="display: block; width:300px; "/>
     </a>
      </div>
      <div class="search"><!-- 검색창에서 키워드를 검색할 경우 해당 게시글이 나타난다 -->
      <form name="search" action="Search_UI.jsp" method="post" >
        <fieldset>
          <legend class="visually-hidden">검색</legend>
          <div class="search_box">
            <input name="_keyword" type="text" maxlength="225" tabindex="1" />
            <button type="submit" tabindex="2">
              검색
            </button>
            
          </div>
          
        </fieldset>
        
      </form>
      </div>
      <div class="login">
       <ul class="myinfo"><!-- 로그인 정보를 가져온다 - 관리자 -->
            <li><a href="Adm_Board.jsp"><b><%= (String)session.getAttribute("__NAME") %></b></a>님</li>
            <li><a href="Logout.jsp" class="link_text" >로그아웃</a></li> <!-- 로그아웃을 누르면 로그인 안된 헤더를 가진 메인 페이지로 이동 -->
        </ul>
        <div class="member"><!-- 본 웹사이트에 가입한 총 회원수를 받아온다 -->
       
        
        <%
	//총 회원수 받아오기, 성공..!
		
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/gj","root", "1234");
		
		Statement stmt = conn.createStatement();
		
		String strQuery = "Select count(id) from member";
	    ResultSet rs = stmt.executeQuery(strQuery);

	    String Countrun="";
	      while(rs.next()){
	      Countrun = rs.getString(1);
	      
	       } 
	      
	      out.println("<p style='text-align: center;'>"+"총 회원수 : <b>"+ Countrun + "명</b></p>");
	      
		rs.close();
		stmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
            
        </div>
      </div>
      
    </header>
    <nav class="navbar">
 	  <!-- menu -->
      <ul class="navbar-menu">
        <li><a href="Adm_Board.jsp">전체게시글</a></li>
        <li><a href="Adm_main.jsp">회원정보</a></li>
        <li><a href="AllInquiry.jsp">문의내역</a></li>
      </ul>
     
    </nav>

<nav class="nav2">
	<div class="box">
	<% //
	request.setCharacterEncoding("UTF-8");
	int state = 0;
	int comnum = 0;		//댓글 번호 저장할 변수 초기화
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(
				"jdbc:mysql://localhost/gj", "root", "1234");
		Statement stmt = conn.createStatement();
		Statement stmt2 = conn.createStatement();		//반복문 안에 stmt 객체는 하나밖에 존재할 수 없기 때문에 2중으로 사용하기 위한 statement 객체 생성
		ResultSet rsC = null; //반복문 안에서 선언이 불가하기 때문에 미리 선언하고 초기화
		ResultSet rs = stmt.executeQuery("Select * from post where posnum < 11");
		%>
		 <table border = "1" width="1200px"> 
			<tr height="30px"><th width="55">번호</th><th width="150">게시판</th><th width="500">제목</th><th width="100">작성자</th><th width="90">조회수</th><th width="120">작성일</th ><th width="60">댓글</th><th width="60">좋아요</th></tr>
			
		<% 	
	if(rs.next())	{
		do {
			int likesCnt = 0;							//좋아요 수 저장할 변수 초기화
			int commentCnt = 0;							//댓글 수 저장할 변수 초기화
			int posnum = rs.getInt("posnum");			//게시글번호
			String btype = rs.getString("btype");		//게시판유형
			String postit = rs.getString("postit");		//게시글제목
			String posnic = rs.getString("posnic");		//작성자
			int views = rs.getInt("views");				//조회수
			String posdat = rs.getString("posdat");		//날짜

				out.println("<tr height = '40'>");
				out.println("<td>" + posnum + "</td>"); //테이블에 게시글 번호
				out.println("<td>" + btype + "</td>");	//테이블에 개시판 유형
				//테이블에 게시판제목을 넘겨주고 게시글번호를 View.jsp에 넘겨준다
				out.println("<td><a href='View.jsp?_posnum="+posnum+"' class='a2'>" + postit + "</a></td>");	
				out.println("<td>" + posnic + "</td>");		//테이블에 작성자 
				out.println("<td>" + views + "</td>");		//테이블에 조회수
				out.println("<td>" + posdat + "</td>");		//테이블에 작성날짜
				
				
				rsC = stmt2.executeQuery("select comnum from comment where fgnnum = '"+posnum+"' and comrepdiv = 1");	//해당 게시글에 달린 댓글들의 번호를 구함
				
				if(rsC.next()){
					comnum = rsC.getInt("comnum");		//댓글들의 번호 저장 (while(rs.next()) 돌아갈 때마다 다른 게시글의 댓글 번호 가져옴)
					//해당 게시글에 달린 댓글 수와 위에서 구한 댓글 번호로 해당 댓글에 달린 답글 수를 구해서 총 댓글 갯수를 저장
					rsC = stmt2.executeQuery("select count(comnum) from comment where fgnnum = '"+posnum+"' and comrepdiv = 1 or fgnnum = '"+comnum+"' and comrepdiv = 0");	
					if(rsC.next()) commentCnt = rsC.getInt(1);
				}
				out.println("<td>" + commentCnt + "</td>");		//댓글 수 출력
				
				rsC = stmt2.executeQuery("Select count(posnum) from likes where posnum = '"+posnum+"'");		//좋아요테이블에서 해당 게시글에 달린 좋아요 수를 구함	
				if(rsC.next()) likesCnt = rsC.getInt(1); 			
				out.println("<td>" + likesCnt + "</td>");
				out.println("</tr>");
		} while(rs.next());
	}		
		else{
			String su = "등록된 글이 없습니다.";
			out.println("<tr>");
			out.println("<td height = '420' colspan = '8'>" + su + "</td>");
			out.println("</tr>");
			}
		rsC.close();
		stmt2.close();
		
		
		%> </table> <%
	} catch(SQLException e) {
		e.printStackTrace();
	}
%>
	</div>
</nav>


<section class="center3">
	<div class="box">
	<a href="BulletinBoard.jsp" class="btn-gradient blue mini">◁</a>
	<a href="BulletinBoard.jsp" class="btn-gradient blue mini">1</a>
			
<%
	request.setCharacterEncoding("UTF-8");
	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/gj", "root", "1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("Select posnum from post"); 
	
	if(rs.next())	{
		while(rs.next()){
			int postnum = rs.getInt("posnum");			//게시글번호
			
			if(postnum > 10) {
				out.println("<a href='BulletinBoardPage2.jsp' class='btn-gradient blue mini'>2</a>");
				out.println("<a href='BulletinBoardPage2.jsp' class='btn-gradient blue mini'>▷</a>");
				state = 1;
				break;
			} else {
			}
		} 
	}		
	conn.close();
	stmt.close();
	rs.close();
	
} catch(SQLException e) {
	e.printStackTrace();
}
%>
	</div>
</section>

<hr>
 <footer>
	  <div class="bottom_box">
        <ul>
        <li><p>회사소개</p></li>
        <li><p>인재채용</p></li>
        <li><p>제휴제안</p></li>
        <li><p>이용약관</p></li>
        <li><p>개인정보처리방침</p></li>
        <li><p>청소년보호정책</p></li>
        <li><p>굿잡 정책</p></li>
        <li><p>고객센터</p></li>
        
        </ul>
    </div>
     <div class="bottom_box">
     <p>&copy; 굿잡 Corp.</p>
     </div>
</footer>
</body>
</html>