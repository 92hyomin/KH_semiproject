<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<form name="naverEndForm">
		<input type="hidden" name="user_sns" id="user_sns">
		<input type="hidden" name="email" id="email">
	</form>


<script type="text/javascript">
  var naver_id_login = new naver_id_login("tW0Ie2LxQlaCuZIPRS7U", "http://localhost:9090/Semi_Team1/practice/callback.jsp");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    
  }
  
  $("#user_sns").val("naver");
  $("#email").val(naver_id_login.getProfileData('email'));
  
  var frm = document.naverEndForm;
  frm.method = "POST";
  frm.action = "<%= request.getContextPath() %>/register/snsJoinPage.dog";
  frm.submit();
  
  self.close();
  
  //opener.location.href="";
  
</script>
</body>