<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nickCheckForm.jsp</title>
</head>
<body>
	<div style="text-align: center">
	<h3>* 닉네임 중복확인  *</h3>
    <form method="post" action="nickCheckProc.jsp" onsubmit="return blankCheck(this)">
    닉네임 : <input type="text" name="nickname" maxlength="10" autofocus>
    <input type="submit" value="중복확인">
    </form>
    </div>
    
   <script>
   
    function blankCheck(f){
    	var nickname=f.nickname.value;
    	nickname=nickname.trim();
        if(nickname.length == 0){
        	alert("닉네임을 입력해주세요.");
            return false;
        }//if end
        return true;
    }
    </script>
 </body>
 </html>