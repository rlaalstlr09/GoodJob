<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내역 관리자</title>
</head>
<style>

.color {
	color: white;
}
.colors {
	color: black;
}
 body {
    margin: 0; /* body의 기본마진을 없애줍니다(선택사항) */
    font-family: sans-serif;
  }
  /* 기본 밑줄을 제거합니다 */
   a {
    text-decoration: none; 
    
  }
  /* 마우스 커서가 올라갔을 때 밑줄을 생성합니다*/
   a:hover {
    text-decoration: underline; 
  } 

   #header {
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 100%;
    height: 160px;
    display: inline-flex;
    align-items: center; /* 하위 요소들 수직 가운데정렬 */
    position: relative;
    background-color: rgb(255, 255, 255);
  }
  
  fieldset {
    border: none;
    display: inline-block;
  }

  .logo{
    width: 30%;
    height: 150px;
    /* background-color: #acbfe1; */
    padding-left: 180px;
  }
  
  .logo img {
    right: 20px;
    padding-top: 37px;
  }
  
  .visually-hidden { /* legend 안보이게 설정. 이렇게하면 접근성을 준수하면서 디자인을 해치지 않습니다. */
    position: absolute !important;
    height: 1px;
    width: 1px;
    overflow: hidden;
    clip: rect(1px 1px 1px 1px);
    clip: rect(1px, 1px, 1px, 1px);
    white-space: nowrap;
  }
 

  .search {
    width : 45%;
    height: 150px;
    padding-top: 55px;
    padding-left: 70px;
    /* background-color: #acbfe1; */
  }

  .search_box {
    width: 500px;
    height: 50px;
    
    border: 4px solid #3D5F95;
    display: flex;
    align-items: center;
  }
  .search_box input {
    flex: 9; /* search-box내부에서 9만큼의 크기를 차지(비율) */
    height: 46px;
    padding-left: 12px;
    padding-right: 12px;
    border: none;
    outline: none;
    font-size: 18px;
  }
  .search_box button {
    flex: 1; /* search-box내부에서 1만큼의 크기를 차지(비율) */
    height: 46px;
    padding: 0;
    border: none;
    outline: none;
    background: #3D5F95;
    color: #ffffff;
  }

  .login {
    width: 25%;
    height: 150px;
    background-color: #ffffff;
    padding: 0px;
  }



  .myinfo {
    justify-content: flex-end;
    display: flex;
    list-style: none;
    padding-right: 130px;
    padding-top: 50px;
    font-size: 12px;
    width: 100%;
    height: 80px;
    
  }
  
   .myinfo li {
    font-size: 17px;
    padding: 5px 10px;
   
  }
  .myinfo li:hover{
    text-decoration: underline;
  }

  .member {
    margin: auto;
    width: 100%;
    height: 20px;
    padding-right: 120px;
    padding-top: 10px;
   
  }
  
 /* 메뉴바 */
	:root {
  
    --background-color: #3D5F95;
    --accent-color: #6a87b5;
}

  /* 폰트는 최상위 컴포넌트에 */
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}



.navbar {
    position:sticky;
    top:0;
    justify-content: space-between;
    display: flex;
    align-items: center;
    padding: 22px 12px;
    background-color: var(--background-color);
    width: 100%;
    border-radius: 5px;
}

  /* menu */

.navbar-menu {
    display: flex;
    margin: auto;
    padding-left: 0px;
    list-style: none;
    font-size: 22px;
    /* font-family: "Black Han Sans", sans-serif; */
    color: #ffffff;
}
.navbar-menu li {
    padding: 15px 35px;
    word-spacing: 20px;
}

.navbar-menu li:hover {
    background-color: var(--accent-color);
    border-radius: 5px;
}

  


@media screen and (max-width: 768px) {
    .navbar {
        flex-direction: column;
        align-items: center;
        padding: 8px 24px;
    }

    .navbar-menu {
        display: none;
        flex-direction: column;
        text-align: center;
        width: 100%;
    }
      .navbar-menu a {
        display: block;
    }



    .navbar-menu.active {
        display: flex;
    }

}
		
		#nav {
		/* 문의 내역 */
			width: 80%;
			float: center;
			height: 400px;
			position: relative;
			left:400px;
		}
		#section {
			/* 메뉴 */
			width: 200px;
			float: center;
			height: 400px;
			position: absolute;
			top: 350px;
			left:100px;
			
		}
		.bd-sidebar {
  background: #eee;
  height:350px;
  
}
	footer {
    color: black;   
    height: 90px;
    font-size: 12px;
    position: relative;
    clear: both;
    width:100%;
    bottom: 0;
  }
  
 
  .bottom_box {
    
    flex: 2;
    font-size: 14px;
    text-align: center;
  }
  .bottom_box ul > li {
    display: inline-block; /* 수평정렬 */
    margin-left: 8px;
  }
  .bottom_box >p { /* 마지막 li요소 (굿잡 Corp.) 굵게 */
    font-weight: bold;
  }
  /* 재사용 클래스 */
  
  .text_bold-13 {
    font-weight: bold;
    font-size: 13px;
  }
	</style>
	<link rel="stylesheet" href="/css/bootstrap.css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
<input type="hidden" name="_id" value="<%= (String)session.getAttribute("__ID") %>">
<div id="header">
      <div class="logo">
     <a href="Main_UI.jsp">
    <img src="GJ_Logo.png" class="img_logo" style="display: block; width:300px;"/>
     </a>
      </div>
      <div class="search">
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
        <ul class="myinfo">
            <li><a class="colors" href="Adm_Board.jsp"><b><%= (String)session.getAttribute("__NAME") %></b></a>님</li>
            <li><a class="colors" href="Logout.jsp" class="link_text" >로그아웃</a></li> 
        </ul>
        <div class="member">
       
        
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
      
    </div>
    <nav class="navbar">
 	  <!-- menu -->
      <ul class="navbar-menu">
        <li><a class="color" href="Adm_Board.jsp">전체게시글</a></li>
        <li><a class="color" href="Adm_main.jsp">회원정보</a></li>
        <li><a class="color" href="AllInquiry.jsp">문의내역</a></li>
        
      </ul>
     
    </nav>
	<div id="nav">

		<h1>문의 내역</h1>
	<hr>
	<div style="border: 1px solid black; height: 250px;width: 70%;">
	 <div style="overflow: auto; width:100%; height:100%;">
	<table class="table table-striped" style="overflow-x:scroll" >
      <thead>
          <tr>
              <th style="background-color: #eeeeee; text-align: center; width:100px">문의번호</th>
                <th style="background-color: #eeeeee; text-align: center; width:300px">제목</th>
                <th style="background-color: #eeeeee; text-align: center; width: 120px">작성자</th>
                <th style="background-color: #eeeeee; text-align: center; width:200px">작성일</th>
                <th style="background-color: #eeeeee; text-align: center; width:100px">처리여부</th>
            </tr>
        </thead>
       
        <%
 	try{
 		Class.forName("com.mysql.jdbc.Driver");
 		Connection conn = DriverManager.getConnection(
 				"jdbc:mysql://localhost/gj","root","1234");
 		Statement stmt = conn.createStatement();
 		ResultSet rs = stmt.executeQuery
 				("select * from inquiry"); 		//조건추가해서 해당정보만 출력
 		
		if(rs.next()==false){%>
			
<tr align="center" bgcolor="#FFFFFF" height="30">
	    <td colspan="5" >문의내역이 없습니다.</td> 	
	  </tr> 
	<% 	}
		rs = stmt.executeQuery
 				("select * from inquiry order by inquiry.inqnum asc"); 
 		while(rs.next()){
 			String inqnum = rs.getString("inqnum");
 			String inqtit = rs.getString("inqtit");
 			String inqnic = rs.getString("inqnic");
 			String inqdat = rs.getString("inqdat");
 			String process = rs.getString("process");
 			
 			
 			if(process.equals("0")){
 	             process="미처리";
 	          }else{
 	             process="처리";
 	          }
 			%>
 			
 			<tr> <th style="text-align: center;"><%=inqnum%></th>
 			<th style="text-align: center;"><a href="ViewCS.jsp?_inqnum=<%=inqnum %>" ><%=inqtit%></a></th>
 			<th style="text-align: center;"><%=inqnic%></th>
 			<th style="text-align: center;"><%=inqdat%></th>
 			<th style="text-align: center;"><%=process%></th>
 			</tr>
 			<%
 		} 
 		} catch(SQLException e){
 		e.printStackTrace();
 	}
%>
        </table>
        </div>
</div>
</div>

	<footer>
	<hr>
	   <div class="bottom_box">
        <ul>
        <li><p>회사소개</p></li>
        <li><p>인재채용</p></li>
        <li><p>제휴제안</p></li>
        <li><p>이용약관</p></li>
        <li><p>개인정보처리방침</p></li>
        <li><p><a href = "CustomerService.jsp">문의하기</a></p></li>
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