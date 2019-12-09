<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="/WEB-INF/header_dog.jsp" %>

<title>회원 로그인</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
 
<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

#login_container {
	font-family: 'Nanum Gothic', '나눔고딕', '돋움', Dotum, sans-serif;
	color: black;
}

#box_form {
	width: 50%;
	margin: 0 auto;
	padding: 50px 0;
}

#top_comment {
	color: gray;
	float: right;
	font-size: 9pt;
	padding: 15px 0 ;
}

#loginform, #bottom_SNS { margin: 0 auto; }

#loginform { text-align: center; width: 50%; }

#loginform tr {
	height: 35px;
}

input#user_id, input#user_pw {
	border: solid 1px black;
	width: 300px;
	height: 50px;
	margin-bottom: 10px;
	padding: 10px;
	
}

.checkboxTxt { font-size: 10pt; }

#loginbtn {
	border: 1px solid #42362f;
	background: #42362f;
	color: #fff !important;
	width: 300px;
	height: 50px;
	cursor: pointer;
	margin: 20px 0;
}

#bottomtxt {
	text-align: center;
	font-size: 10pt;
}

#snslogin {	text-align: center; margin-top: 40px; }

#snslogin a {
	cursor: pointer;
}

#login_snsLoginBar {
	margin-top: 50px;
	background: #f8f8f8;
	padding-top: 35px;
	padding-bottom: 35px;
	height: 200px;
}

#bottomtxt { margin-bottom: 40px; }

.hm_h1{
	text-align: center;
	margin-top: 40px;
	font-weight: bold;
	font-family: 'Notokr', sans-serif;
}

</style>
<script type="text/javascript">

	$(document).ready(function(){
		
		// 아이디 저장의 경우 아이디 불러오기
		var loginUserid = localStorage.getItem('saveid');
		
		if(loginUserid != null	){
			
			$("#user_id").val(loginUserid);
			$("input:checkbox[id=saveid]").prop("checked", true) ;
		}

		$("#user_id").keydown(function(event){
			
			if(event.keyCode == 13){
				$("#user_pw").focus();
			}
		});
		
		$("#user_pw").keydown(function(event){
			if( event.keyCode == 13 ){  
				goLogin();		
			}
			
		});
		
		// 로그인 버튼 
		$("#loginbtn").click(function(){
			
			goLogin();
			
		}); // end of 로그인 버튼 ---------------------------------
		
		
		
	}); // end of $document.ready ---------------------------------------
	
	
	
	// 로그인 메소드 
	function goLogin(){
		
		var userid = $("#user_id").val().trim();
		var passwd = $("#user_pw").val().trim();
		
		if(userid==""){
			alert("아이디를 입력하세요");
			$("#user_id").focus();
			return;
		}
		else if(passwd==""){
			alert("패스워드를 입력하세요");
			$("#user_pw").focus();
			return;
		}
		
		if( $("input:checkbox[id=saveid]").is(":checked") == true ){		// 아이디 저장 체크박스에 체크된 경우
			
			var loginUserid = localStorage.getItem('saveid');			// key 값이 saveid !
			
			if(loginUserid == null){
				
				localStorage.setItem("saveid", $("#user_id").val());
			}
			else if (loginUserid != null && loginUserid != $("#user_id").val() ) {
				
				localStorage.removeItem("saveid");
				localStorage.setItem("saveid", $("#user_id").val());
			}
			
			
		}
		else {			// 아이디 저장 체크박스에 체크 안된 경우
			
			var loginUserid = localStorage.getItem('saveid');			// key 값이 saveid !
			
			if(loginUserid != null){
				
				localStorage.removeItem("saveid");
			}
			
		}
		
		var frm = document.normalLoginForm;
		frm.method="POST";
		frm.action="<%= ctxPath%>/login/login.dog";
		frm.submit();
		
	} // end of goLogin ---------------------------------------------------
	
	
	// 카카오로 로그인 하기 
    Kakao.init('26508671b7dcd96c3c01e94adb358b94');
	function loginWithKakao() {
	  
		Kakao.Auth.login({
			success: function(authObj) {
	    	
				 Kakao.API.request({
				      url: '/v1/user/me',
				      success: function(res) {
					       
					       var userEmail = res.kaccount_email;   //유저의 이메일
					       var snsType = "kakao";
					       
					       $("#user_sns").val(snsType);
					       $("#email").val(userEmail);
					       
					       var frm = document.snsLoginForm ;
					       
					       frm.method = "POST";
					       frm.action = "<%= request.getContextPath() %>/login/login.dog";
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
	}; // end of 카카오 로그인 ------------------------------------------------------------------
		
	function loginWithNaver() {
		
		location.href="<%= ctxPath %>/login/naverLogin.dog";
		
	} // end of 네이버 로그인 -------------------------------------------------------------------
	
	
</script>


<body>


<div class="col-xs-9 col-md-2"></div>
<div class="col-xs-9 col-md-8" id="login_container">
	<span id="top_comment">Home > 회원로그인</span><br>

		<h1 class="hm_h1">로그인</h1>
		<hr style="border: solid 1px gray;">
		
		<div id="box_form">
			<form name="normalLoginForm">
				<table id="loginform" >
					<tbody>
						<tr>
							<td><span style=" font-size: 22pt; font-weight:bold;">회원 로그인</span></td>
						</tr>
						<tr>
							<td>
								<input id="user_id" name="user_id" type="text" placeholder="아이디" maxlength="15"/>
							</td>
						</tr>
						<tr>
							<td>
								<input id="user_pw" name="user_pw" type="password" placeholder="패스워드" maxlength="30" />
							</td>
						</tr>
						<tr>
							<td>
							<input id="secureConn" name="secureConn" type="checkbox" checked onclick="return false;"/>
							<label class="checkboxTxt" for="secureConn" >보안접속</label> &nbsp;&nbsp;
							<input id="saveid" name="saveid" type="checkbox" />
							<label class="checkboxTxt" for="saveid">아이디저장</label>
							</td>
						</tr>
						<tr>
							<td>
								<button id="loginbtn" name="loginbtn" type="button">로그인</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
			<div id="bottomtxt">
				<a href="<%= ctxPath %>/login/findIDPW.dog" style="text-decoration: none; color: black;">아이디/비밀번호 찾기 </a>&nbsp;
				<span style="color: gray;">|</span>&nbsp;
				<a href="<%= ctxPath %>/register/mainJoinPage.dog" style="text-decoration: none; color: black;"> 회원가입하기</a>
			</div>
		</div>
		<hr style="border: solid 1px gray;">
		
		<div id="login_snsLoginBar">
			<div id="bottom_SNS">
				<div style="font-weight: bold; text-align: center; font-size: 16pt;">SNS 간편 로그인/회원가입</div>
			
				<div id="snslogin">
					
					<a href=""><img alt="" src="/Semi_Team1/images/login/facebook_login.png"></a>

					<a href="javascript:loginWithKakao()"><img alt="" src="/Semi_Team1/images/login/kakao_login.png"></a>
					
					<a href="javascript:loginWithNaver()"><img alt="" src="/Semi_Team1/images/login/naver_login.png"></a>

				</div>
			</div>
		</div>
		
	<%-- sns 로그인을 위한 hidden 입력창 --%>	
		<div>
			<form name="snsLoginForm">
				<input name="user_sns" id="user_sns" type="hidden">
				<input name="email" id="email" type="hidden">
			</form>
		</div>


</div>


	
</body>

<%@include file="/WEB-INF/footer_dog.jsp" %>

