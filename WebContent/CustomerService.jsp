<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import = "java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<style type ="text/css">
div#text{
float : left;
margin-left : 45%;
}

#main{
width:65%;
float : left;
margin-left : 18%;
border-radius: 30px;
border : 1px solid;
}
  body {
    margin: 0; /* body의 기본마진을 없애줍니다(선택사항) */
    font-family: sans-serif;
  }
  /* 기본 밑줄을 제거합니다 */
   a {
    text-decoration: none; 
    color: rgb(54, 50, 50);
  }
  /* 마우스 커서가 올라갔을 때 밑줄을 생성합니다*/
   a:hover {
    text-decoration: underline; 
  }  
  
  
  header {
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
    /* background-color: #8361d4; */
    padding-right: 120px;
    padding-top: 10px;
   
  }
 /* 메뉴바 */
	:root {
   /* --text-color: #eee5e9; */
    --background-color: #3D5F95;
    --accent-color: #6a87b5;
}

  /* 폰트는 최상위 컴포넌트에 */
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* .body {
    margin: 0;
  } */

a {
    text-decoration: none;
    color: var(--text-color);
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
    ￼ .navbar-menu a {
        display: block;
    }



    .navbar-menu.active {
        display: flex;
    }

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
  
   .btn{
    margin: auto;
    width: 70px;
    height: 30px;
    border: none;
    outline: none;
    background-color: #3D5F95;
    padding-bottom: 0px;
    color: #ffffff;
    border-radius: 5px;
    }
    .table {
    width:95%; 
    margin-left : -3%;
 	margin-top : 5%;
 	margin-bottom : 5%;
  }
  textarea{
  width : 100%; 
  height : 350px; 
  resize: none; 
  background-color : rgb(240, 255, 255);
  margin-top : 5px;
  }
  
  text{
  font-size : 3px; 
  color : rgb(220, 220, 220);
  }
    
</style>
<body>
 <header>
      <div class="logo">
     <a href="Main_UI.jsp">
     <img src="GJ_Logo.png" class="img_logo" style="display: block; width:300px; "/>
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
            <li><a href="Main_UI.jsp"><b><%= (String)session.getAttribute("__NAME") %></b></a>님</li>
            <li><a href="MyInfo.jsp" class="link_text" ><b>내정보</b></a></li> 
            <li><a href="Logout.jsp" class="link_text" >로그아웃</a></li> 
        </ul>
        <div class="member">
       
        
        <%
	//총 회원수 받아오기, 성공..!
		
	LocalDate now = LocalDate.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	 
    String date = now.format(formatter);
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
        <li><a href="BulletinBoard.jsp">전체게시판</a></li>
        <li><a href="BulletinBoard3.jsp">자유게시판</a></li>
        <li><a href="BulletinBoard5.jsp">질문게시판</a></li>
        <li><a href="BulletinBoard4.jsp">면접게시판</a></li>
        <li><a href="BulletinBoard2.jsp">취업후기</a></li>
        <li><a href="BulletinBoard6.jsp">채용정보</a></li>
      </ul>
     
    </nav>
<%
	String userID =  (String) session.getAttribute("__NAME");   		//세션에서 로그인중인 id 받아옴

	if(userID==null){		//로그아웃상태면 오류메시지 로그인페이지로 이동
		out.println("<script>alert('문의를 하려면 로그인을 하십시오.');</script>");		
		out.println("<script>location.href='Main.jsp';</script>");
	}  
%>
	
    <div id = "text">
    	<br><h1>고객센터</h1><br>
    </div>
    <div id = "main">
    <form action = "CustomerServiceBack.jsp" method = "post">
    	<table class = "table">
    	<tr>
    		<td style = "text-align : right; "> <text>문의사항 |&nbsp;</text></td>
    		<td><select name = "_type" style = "width : 50%; height : 30px;">
					   <option>버그 제보</option>
					   <option>사용자 신고</option>
					   <option>건의사항</option>
				   	   </select>
			</td>
    	</tr>
    	<tr><td	style = "text-align : right;"><text> 제목 |&nbsp; </text></td>
    		<td> <input type = "text" style = "width : 100%; height : 30px; margin-top : 5px;" name = "_title" size = 50 placeholder = "제목을 입력하세요" required></td>
    	</tr>
    	<tr>
    		<td style = "text-align : right;"><text> 발생일자 |&nbsp; </text></td>
    		<td><input type = "date" style = "width : 50%; height : 30px; margin-top : 5px;" name = "_date" min = "2022-11-01" max = <%=date %> required></td>
    	</tr>
    	<tr>
    		<td style = "vertical-align : top; text-align : right;"> <text>문의내용 |&nbsp;</text> </td>
    		<td> <textarea name = "_content" placeholder = "내용을 입력하세요" required></textarea> </td>
   		</tr>			  
   		<tr>
   			<td colspan = "2" style = "text-align : right;">
		   		<input type = "submit" class = "btn" value = "문의" >
				<input type = "reset" class = "btn" value = "취소" > 
			</td>
		</tr>
   		</table>
	 </form>
	</div>
	<br>

<!--풋터-->
  <footer>
  <br>
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