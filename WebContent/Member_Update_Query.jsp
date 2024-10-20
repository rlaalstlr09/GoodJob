<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	 <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>레이아웃</title>
    <link rel="stylesheet" href="main.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/77e29b57dd.js"
    ></script>
	<title>HTML Layouts</title>
	<style>
		 #header {
    
    margin: auto; /* header의 양쪽 여백(margin)을 동등하게 맞춤 -> 수평가운데정렬 */
    width: 100%;
    height: 160px;
    display: flex;
    align-items: center; /* 하위 요소들 수직 가운데정렬 */
    position: relative;
  }
    /* 기본 border 없애기(이 코드를 지우고 기본 border를 확인해보세요) */
  fieldset {
    border: none;
    display: inline-block;
  }

  .logo{
    width: 30%;
    height: 150px;
    background-color: #acbfe1;
    padding-left: 180px;
  }
  .logo img {
    right: 20px;
    
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
  /* 링크들을 상단 우측에 위치시킵니다. */
  /* .links {
    position: absolute;
    top: 0;
    right: 0;
  }
  .link_text {
    font-size: 10px;
    margin-left: 5px;
  }
  .img_logo {
    margin-bottom: 12px;
    width: 220px;
    height: 65px;
  } */

  .search {
    width : 45%;
    height: 150px;
    padding-top: 60px;
    padding-left: 30px;
    background-color: #acbfe1;
  }

  .search_box {
    width: 500px;
    height: 50px;
    
    border: 4px solid #4479db;
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
    background: #4479db;
    color: #ffffff;
  }

  .login {
    width: 25%;
    height: 150px;
    background-color: #acbfe1;
    padding: 10px;
  }

  .login_idpw {
    display: block;
    margin: auto;
    width: 200px;
    height: 70px;
    background-color: #93abf4;
    padding: 5px;
  }

  .login_idpw input {
    display: block;
    width: 150px;
    height: 30px;
    padding: 10px;
  }

  .login_button {
   
    margin: auto;
    width: 200px;
    height: 30px;
    background-color: #93abf4;
    padding: 5px;
  }

  .login_button input {
   /* padding-left: 5px;  */
  }

  .member {
    margin: auto;
    width: 250px;
    height: 46px;
    /* background-color: #8361d4; */
    padding-left: 80px;
    padding-top: 0px;
  }
		
		#nav {
			/* 내 정보 */
			width: 70%;
			float: center;
			height: 400px;
			position: relative;
			left:400px;
			overflow-x:hidden;
			overflow-y:hidden"
			
		}
		
		#section {
			/* 메뉴 */
			width: 200px;
			float: center;
			height: 400px;
			position: absolute;
			top: 160px;
			left:100px;
			
		}
		.bd-sidebar {
  background: #eee;
  height:350px;
  
}

	footer {
  color: black;   
  height: 110px;
  font-size: 12px;
  background-color: rgb(176, 176, 229);
  position: relative;
  clear: both;
  width:100%;
}

.aside_box {
  flex: 1;
  display: flex;
  align-items: center;
  border-bottom: 1px solid #91acd6;
}
.area_user {
  flex: 4;
  line-height: 2em; /* 줄간격 */
}
.area_user_row {
  display: flex;
}
.area_user_row span {
  flex: 1;
}
.area_user_row ul {
  flex: 6;
}
.aur_title {
  font-size: 13px;
  font-weight: bold;
}
.area_user_row ul > li {
  display: inline-block; /* li 수평정렬하는 방법 */
  margin-left: 8px;
}
.area_col {
  flex: 1;
  display: flex;
}
.area_col .ac_content {
  line-height: 20px;
}
.area_col .ac_img {
  width: 60px;
  height: 60px;
}
.bottom_box {
  flex: 2;
  padding-top: 20px;
  font-size: 14px;
  text-align: center;
}
.bottom_box ul > li {
  display: inline-block; /* 수평정렬 */
  margin-left: 8px;
}
.bottom_box ul > li:last-child { /* 마지막 li요소 (Naver Corp.) 굵게 */
  font-weight: bold;
}
/* 재사용 클래스 */

.text_bold-13 {
  font-weight: bold;
  font-size: 13px;
}
		@media (max-width: 600px) {
			#nav, #section {
				width: 100%;
				height: 100%;
			}
		}
		*.box     { border:1px solid black; background-color:gold; } 
		a{text-decoration:none}
		ul{list-style:none;}
.menu{
	color: black;
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

	<div id="header">
	
      <div class="logo">
      <img src="images/Logo.png" class="img_logo" style="display: block; margin: 0 auto; width:150px; height:150px;"/>
      </div>
      <div class="search">
      <form>
        <fieldset>
          <legend class="visually-hidden">검색</legend>
          <div class="search_box">
            <input type="text" maxlength="225" tabindex="1" />
            <button type="submit" tabindex="2">
              검색
            </button>
            
          </div>
          
        </fieldset>
        
      </form>
      </div>
      <div class="login">
        <div class="login_idpw">
            <input type="text" placeholder="아이디" >
            <input type="password" placeholder="비밀번호">
        </div>
        <div class="login_button">
            <input type="button" value="로그인">
            <input type="button" value="회원가입">
        </div>
        <div class="member"><p>회원수 4명</p>
        </div>
      </div>
      
   
	
	</div>
	<div id="nav">

		<h1>내 정보</h1>
		<hr width="50%" align="left">

	<%
	request.setCharacterEncoding("utf-8");	

	String nickname = request.getParameter("nickname");
	
	try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost/project","root","1234");
	Statement stmt = conn.createStatement();
	stmt.executeUpdate("update member set nickname = '"+nickname+"' where id='"+(String)session.getAttribute("__ID")+"'");
	
	out.println("<script>alert('수정완료!');</script>");
	out.println("<script>location.href='Login.jsp';</script>");
	
	stmt.close();
	conn.close();
	
	} catch(SQLException e){
	
	out.println("<script>alert('닉네임중복!');</script>");
	out.println("<script>location.href='Member_Update_List.jsp';</script>");

	}
%>

	</div>
	
	<div id="section">

  <div class="row flex-nowrap" style="text-align:center">
    <div class="col-3 bd-sidebar">
      <ul class="nav"  >
 		<li><h3><a href = "MyInfo.jsp?">내 정보<br></a></h3></li>
        <li><h3><a href="MyPost.jsp?">내가 쓴 글</a></h3></li>
        <li><h3><a href="LikePost.jsp">좋아요 누른 글</a></h3></li>
        <li><h3><a href="Inquiry.jsp">문의 내역</a></h3></li>
        
      </ul>
      <br>
    </div>
   </div>
   	</div>
	
	<footer>
   
    <div class="aside_box">
      <div class="area_user">
        <div class="area_user_row">
          <span class="text_bold-13">Creators</span>
          <ul>
            <li><p>크리에이터</p></li>
            <li><p>스몰비즈니스</p></li>
          </ul>
        </div>
        <div class="area_user_row">
          <span class="text_bold-13">Partners</span>
          <ul>
            <li><p>비즈니스 광고</p></li>
            <li><p>스토어 개설</p></li>
            <li><p>지역업체 등록</p></li>
          </ul>
        </div>
        <div class="area_user_row">
          <span class="text_bold-13">Developers</span>
          <ul>
            <li><p>굿잡 개발자센터</p></li>
            <li><p>오픈API</p></li>
            <li><p>오픈소스</p></li>
            <li><p>굿잡 D2</p></li>
            <li><p>굿잡 D2SF</p></li>
            <li><p>굿잡 랩스</p></li>
          </ul>
          
        </div>
      </div>
    </div>
    <div class="bottom_box">
        <ul>
          <li><p>회사소개</p></li>
          <li><p>인재채용</p></li>
          <li><p>제휴제안</p></li>
          <li><p>이용약관</p></li>
          <li><p>개인정보처리방침</p></li>
          <li><p>문의하기</p></li>
          <li><p>굿잡 정책</p></li>
          <li><p>고객센터</p></li>
          <li><p>&copy; 굿잡 Corp.</p></li>
        </ul>
      </div>
  </footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
</body>

</html>