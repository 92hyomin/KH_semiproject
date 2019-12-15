<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

	


<script type="text/javascript">
  var naver_id_login = new naver_id_login("tW0Ie2LxQlaCuZIPRS7U", "http://localhost:9090/Semi_Team1/practice/prac_callback.jsp");
  // 접근 토큰 값 출력
  // alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    // alert(naver_id_login.getProfileData('email'));
    
    var email = naver_id_login.getProfileData('email');
    var user_sns = "naver";
    
    $("#user_sns",opener.document).val(user_sns);
    $("#email",opener.document).val(email);
    
    // 메인 페이지에 값 입력하기 ( opener 이용하기 )
    var frm = opener.document.snsRegisterForm;
    frm.method = "POST";
    frm.action="<%= request.getContextPath() %>/practice/prac_snsJoinPage.jsp";
    frm.submit();
    
    self.close();
  }
</script>
</body>
</html>