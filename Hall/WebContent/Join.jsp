<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="JoinStyle.css">
<title>Insert title here</title>
</head>
<link rel="shortcut icon" type="image/x-icon" href="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/800px-Apple_logo_black.svg.png">


<body>
<header>

      <div class="logo">
      <a href="Main.jsp">
     <img src="GJ_Logo.png" class="img_logo" style="display: block; width:300px; "/>
     </a>
      </div>
      <div class="search">
      <form name="search" action="Search.jsp" method="post" >
        <fieldset>
          <legend class="visually-hidden">검색</legend>
          <div class="search_box">
            <input name="_keyword" type="text" maxlength="225" tabindex="1" />
            <button type="submit" tabindex="2">검색</button>
          </div>
        </fieldset>
      </form>
      </div>
	
       
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
	      
	      out.println("<p>"+"총 회원수 : <b>"+ Countrun + "명</b></p>");
	      
		rs.close();
		stmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
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
    
<script type="text/javascript">
	function loginCheck(obj) {		//로그인 체크 - 미입력값 있을시
		if(!obj.id.value || obj.id.value.trim().length == 0) {	//아이디 미입력시
			alert("아이디를 입력해주세요.");
			obj.id.value = "";
			obj.id.focus();
			return false;
		}
		else if(!obj.nickname.value ||  obj.nickname.value.trim().length == 0) {	//닉네임 미입력시
			alert("닉네임을 입력해주세요.");
			obj.nickname.value = "";
			obj.nickname.focus();
			return false;
		} 
		else if(!obj.pw.value ||  obj.pw.value.trim().length == 0) {	//비밀번호 미입력시
			alert("비밀번호를 입력해주세요.");
			obj.pw.value = "";
			obj.pw.focus();
			return false;
		} 
		else if(obj.pw.value != obj.pwcon.value) {	//비밀번호 불일치시
			alert("비밀번호가 일치하지 않습니다.");
			obj.pwcon.value = "";
			obj.pwcon.focus();
			return false;
		}   
		else if(!obj.email.value ||  obj.email.value.trim().length == 0) {	//이메일 미입력시
			alert("이메일을 입력해주세요.");
			obj.email.value = "";
			obj.email.focus();
			return false;
		} 
	
		//회원등급 직장인인데 기업 구분 미선택시
		if(obj.job.value == "직장인" && obj.etype.value == "------") {	
			alert("기업 구분을 해주세요.");
			return false;
		} 
		
		return true;
	}
</script>			
    
<form action="Join_Query.jsp" method = "post" onsubmit="return loginCheck(this)" >	

<nav class = "nav2">
<div class = "dd">
<h2>회원가입</h2>
<% request.setCharacterEncoding("UTF-8"); %>
	<table cellspacing = "5" cellpadding = "20" >
					<tr height="30">
						<td bgcolor="efefef">아이디</td>
						<td><input type="text" placeholder="1~10자" maxlength="10"
							name="_id" id="id"></td><td><input type="button" class = "button" value="중복확인" onclick="idCheck()"></td>
					</tr>
				
					<tr height="30">
						<td bgcolor="efefef">닉네임</td>
						<td><input type="text" name="_nickname" placeholder="1~6자" maxlength="8" id="nickname"></td>
						<td><input type="button" class = "button" value="중복확인" onclick="nickCheck()"></td>
					</tr>
					
					<tr height="30">
						<td bgcolor="efefef">비밀번호</td>
						<td><input type="password" placeholder="1~10자"
							maxlength="10" name="_pw" id="pw"></td>
					</tr>
					
					<tr height="30">
						<td bgcolor="efefef">비밀번호 확인</td>
						<td><input type="password" placeholder="한 번 더 입력하세요."
							maxlength="10" name="_pwcon" id="pwcon"></td>
					</tr>
					
					<tr height="30">
						<td bgcolor="efefef">이메일</td>
						<td ><input type="text" name="_email" id="email"></td> <td>@<select name="_emailOp">
								<option value="naver.com">naver.com</option>
								<option value="gmail.com">gmail.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="itc.ac.kr">itc.ac.kr</option>
						</select></td>
					</tr>
					
					<tr height="30">
						<td bgcolor="efefef">등급 선택</td>
						<td>직장인<input type="radio" name="_joboffdiv" id="job" value="직장인" checked="checked">
							일반회원<input type="radio" name="_joboffdiv" value="일반회원" ></td>
					</tr>
					
					<tr height="30">
						<td bgcolor="efefef">기업 형태</td>
						<td><select name="_etype" id="etype">
								<option value="------">------</option>
								<option value="대기업">대기업</option>
								<option value="중견기업">중견기업</option>
								<option value="중소기업">중소기업</option>
						</select></td>
					</tr>
					
					<tr height="30">
						<td bgcolor="efefef">회사명</td>
						<td><input type="text" name="_ename"></td>
					</tr>
					</table>
			
					<input class = "btnbottom1 btn-gradient blue mini" type="submit" value="회원가입 완료">
					<a href="Main.jsp" class="btnbottom2 btn-gradient blue mini">취소</a>
						
								</div>
		</nav>
</form>

<script type="text/javascript">
	//아이디 중복확인할 창 띄우기
    function idCheck(){	
    	var _width = '450'; //창 크기 지정
        var _height = '300';
     
        // 팝업을 가운데 위치시키기 위해 중앙값 구하기
        var _left = Math.ceil(( window.screen.width - _width )/2);
        var _top = Math.ceil(( window.screen.height - _height )/2); 
        window.open("idCheckForm.jsp", 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );    }
    
	
  	//닉네임 중복확인할 창 띄우기
    function nickCheck(){	
    	var _width = '450'; 
        var _height = '300';
     
        var _left = Math.ceil(( window.screen.width - _width )/2);
        var _top = Math.ceil(( window.screen.height - _height )/2); 
        window.open("nickCheckForm.jsp", 'popup-test', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );    }
    
	
	
    //자식 창에서 중복확인 후 적용한 아이디 값 받아오는 함수
    function setChildValue1(name){
        document.getElementById("id").value = name;
  }

    //자식 창에서 중복확인 후 적용한  닉네임값 받아오는 함수
    function setChildValue2(name){
        document.getElementById("nickname").value = name;
  }
</script>	
<footer>
   <div class="bottom_box">
        <ul>
        <li><p>회사소개</p></li>
        <li><p>인재채용</p></li>
        <li><p>제휴제안</p></li>
        <li><p>이용약관</p></li>
        <li><p><a>문의하기</a></p></li>
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