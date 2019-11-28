<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header_dog.jsp" %>

<title>회원 로그인</title>
<style type="text/css">

@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);

#login_container {
	width: 70%;
	margin: 0 auto;
	margin-bottom: 10px;
	font-family: 'Nanum Gothic', '나눔고딕', '돋움', Dotum, sans-serif;
	color: black;
}

#box_form {
	width: 35%;
	margin: 0 auto;
}

#top_comment {
	color: gray;
	float: right;
	font-size: 9pt;
}

#loginform, #bottom_SNS { margin: 0 auto; }


input#userid, input#passwd {
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
	width: 100%;
	height: 50px;
	cursor: pointer;
	margin: 20px 0;
}

#bottomtxt {
	text-align: center;
	font-size: 10pt;
}

#snslogin {	text-align: center; }

#bottom_container {
	margin-top: 50px;
	background: #f8f8f8;
}

img#kakaoLogin {
	width: 270px;
	height: 50px;
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
	$("#userid").focus();
	
});

function goLogin(){
	var userid = $("#userid").val().trim();
	var passwd = $("#passwd").val().trim();
	
	if(userid==""){
		alert("아이디를 입력하세요");
		$("#userid").focus();
	}
	else if(passwd==""){
		alert("패스워드를 입력하세요");
		$("#passwd").focus();
	}
	else{
		/* submit작업 */
	}
}
</script>


<body>
	<div id="login_container">
		<span id="top_comment">Home>회원로그인</span><br>

		<h1 class="hm_h1">로그인</h1>
		<hr style="border: solid 1px gray;">
		<div id="box_form">
			<table id="loginform" >
				<tbody>
					<tr>
						<td><h3>회원 로그인</h3></td>
					</tr>
					<tr>
						<td><input id="userid" name="userid" type="text"
							placeholder="아이디" /></td>
					</tr>
					<tr>
						<td><input id="passwd" name="passwd" type="password"
							placeholder="패스워드" /></td>
					</tr>
					<tr>
						<td>
						<input id="secureConn" name="secureConn" type="checkbox" checked onclick="return false;"/>
						<label class="checkboxTxt" for="secureConn" >보안접속</label> 
						<input id="saveid" name="saveid" type="checkbox" />
						<label class="checkboxTxt" for="saveid">아이디저장</label>
						</td>
					</tr>
					<tr>
						<td><button id="loginbtn" name="loginbtn" type="button" onclick="goLogin()">로그인</button></td>
					</tr>
				</tbody>
			</table>
			<div id="bottomtxt">
				<a href="#" style="text-decoration: none; color: black;">아이디/비밀번호 찾기 </a>
				<span style="color: gray;">|</span>
				<a href="#" style="text-decoration: none; color: black;"> 회원가입하기</a>
			</div>
		</div>
		<hr>
		<div id="bottom_container">
		<table id="bottom_SNS">
		<tr><td><a style="font-weight: bold;">SNS 간편 로그인/회원가입</a></td></tr>
		<tr><td>
			<div id="snslogin">
				<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img id="kakaoLogin"
					src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
					width="300" /></a>
			</div></td></tr>
		</table>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>

<%@include file="footer_dog.jsp" %>

