<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/header_dog.jsp"/>

<% String ctxPath = request.getContextPath(); %>

<title>개인/기업 선택화면</title>
<style>

	
	#mainJoin_header {
		
		padding-top: 90px;
		border-bottom: solid 2px black;
		margin-bottom: 30px;
	}
	
	#mainJoin_header div {
		display: inline-block;
	}
	
	#mainJoin_body {
		width: 100%;
		height: 550px;
		text-align: center;
		background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url("/Semi_Team1/images/join_dog.jpg");
		background-position: center;
		background-repeat: no-repeat;
		background-size: cover;
		position: relative;
		
	}
	
	#body_text {
		font-size: 18pt;
		font-weight: bold;
		color: white;
		position: absolute;
		top: 60%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	
	#body_text a {
		border: solid 2px white;
		padding: 10px 25px;
		font-size: 12pt;
		color: white;
		background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5));
		text-decoration: none;
		-webkit-transition-property: background-color;
		-webkit-transition-duration: 1s;
	}
	
	#normalJoinBtn:hover {
		background-color: white;
		color: black;
		background-image: linear-gradient(rgba(0, 0, 0, 0.2), rgba(0, 0, 0, 0.2));
	}
	
	#mainJoin_footer {
		text-align: center;
		border-top: solid 2px black;
		margin-top: 30px;
		padding-top: 25px;
		margin-bottom: 90px;
	}
	#mainJoin_footer a {
		/* border: solid 1px gray; */
		width: 30%;
		display: inline-block;
		/* padding: 17px 0 ; */
		text-decoration: none;
		cursor:pointer;
		font-weight: bold;
		font-size: 12pt;
		padding:2px;
	}
	
	#fbjoin, #ktjoin, #nvjoin{
		border:solid 2px white;
	} 
	
	#fbjoin:hover {
		border:solid 2px #4669c3;
	}
	#ktjoin:hover {
		border:solid 2px #f6d468;
	}
	#nvjoin:hover {
		border:solid 2px #B0F0C0;
	}
	
	#mainJoin_footer a img {
		width: 100%;
		height: 100%;
	}
	
</style>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type='text/javascript'>
  
    // 카카오로 회원가입하기 
    Kakao.init('26508671b7dcd96c3c01e94adb358b94');
	function loginWithKakao() {
	  
		Kakao.Auth.login({
			success: function(authObj) {
	    	
				 Kakao.API.request({
				      url: '/v1/user/me',
				      success: function(res) {
					       
					       var userID = res.id;      //유저의 카카오톡 고유 id
					       var userEmail = res.kaccount_email;   //유저의 이메일
					       var userNickName = res.properties.nickname; //유저가 등록한 별명
					       var snsType = "kakao";
					       
					       $("#user_sns").val(snsType);
					       $("#email").val(userEmail);
					       
					       var frm = document.snsRegisterForm ;
					       
					       frm.method = "POST";
					       frm.action = "<%= request.getContextPath() %>/register/snsJoinPage.dog";
					       frm.submit();
					       
					      } ,
					      fail: function(error) {
					       alert(JSON.stringify(error));
					      }
				 });
				
	    	},
			fail: function(err) {
				alert(JSON.stringify(err));
	    	}
		});
	}; // end of 카카오 회원가입 ------------------------------------------------------------------
	
	
	// naver 로 회원가입 
	// 링크 걸고 자동으로 클릭하게 해버리기
	function loginWithNaver() {
		
		location.href="<%= ctxPath %>/register/naverJoinPage.dog";
		
	}
	
</script>




<div class="col-xs-9 col-md-2"></div>
<div class="col-xs-9 col-md-8" id="mainJoin">

	<div id="mainJoin_header">
		<div style="font-size:130%;font-weight:bold;">회원가입</div>
		<div style="float:right;font-size:85%;">회원종류에 따라 회원가입 절차가 다릅니다. 고객님께서 해당하는 유형을 선택하여 회원가입을 진행해 주시기 바랍니다.</div>
	</div>
	
	<div id="mainJoin_body">
		<div id="body_text">
			<div style="margin-bottom: 5px;">우리의 사랑스런 아이를 위해</div>
			<div style="margin-bottom: 20px;">지금 가입하세요</div>
			<a id="normalJoinBtn" href="<%= ctxPath %>/register/normalJoinPage.dog">일반회원가입</a>
		</div>
	</div>
	
	<div id="mainJoin_footer">
		<a href=""><img id="fbjoin" src="//image.makeshop.co.kr/makeshop/d3/basic_simple/member/member_sns_join_fb.jpg" alt="페이스북으로 회원가입"></a>
		<a href="javascript:loginWithKakao()"><img id="ktjoin" src="//image.makeshop.co.kr/makeshop/d3/basic_simple/member/member_sns_join_kakao.jpg" alt="카카오로 회원가입"></a>
		<a href="javascript:loginWithNaver()"><img id="nvjoin" src="//image.makeshop.co.kr/makeshop/d3/basic_simple/member/member_sns_join_naver.jpg" alt="네이버로 회원가입"></a>
	</div>
	
	
	<div id="hiddenJoin">
		<form name="snsRegisterForm">
			<input name="user_sns" id="user_sns" type="hidden">
			<input name="email" id="email" type="hidden">
		</form>
	</div>
	
	
</div>


<jsp:include page="/WEB-INF/footer_dog.jsp"/>