<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <title>네이버 로그인</title>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	
	<div style="width: 50%; height: 30%; margin:0 auto; text-align: center;">
		<br><br>
		<span style="font-weight: bold;font-size: 110%;">자동으로 팝업창이 나오지 않는다면 아래 버튼을 눌러 로그인을 해주세요.</span>
		<br><br>
		<!-- 네이버아이디로로그인 버튼 노출 영역 -->
		<div id="naver_id_login"></div>
  	</div>
  
 </body> 
  
  
  <div id="hiddenJoin">
		<form name="snsLoginForm">
			<input name="user_sns" id="user_sns" type="hidden">
			<input name="email" id="email" type="hidden">
		</form>
	</div>
  
  
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
 	var naver_id_login = new naver_id_login("", "http://localhost:9090/Semi_Team1/login/naverLoginEnd.dog");
 	var state = naver_id_login.getUniqState();
 	naver_id_login.setButton("green", 30, 40);
 	naver_id_login.setDomain("http://localhost:9090");
 	naver_id_login.setState(state);
 	naver_id_login.setPopup();
 	naver_id_login.init_naver_id_login();
 	
 	$(document).ready(function(){
	
		$("img").trigger("click");
	}); 
	 	
  </script>
</html>




 