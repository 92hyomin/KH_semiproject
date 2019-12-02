<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header_dog.jsp" %>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
#login_container {
	/* border: dashed 1px gray; */
	width: 70%;
	margin: 0 auto;
	margin-bottom: 10px;
	font-family: 'Nanum Gothic', '나눔고딕', '돋움', Dotum, sans-serif;
	color: black;
}

#top_comment {
	color: gray;
	float: right;
	font-size: 9pt;
}

.hm_h1{
	text-align: center;
	margin: 0 auto;
	margin-top: 40px;
	margin-bottom: 60px;
	font-weight: bold;
	font-family: 'Notokr', sans-serif;
}

.myQnA{
	width: 80%;
	margin: 0 auto;
	margin-bottom: 40px;
}

table.tbl{
	width: 100%;
	margin: 0 auto;
}

table.tbl tbody tr{
	border-bottom: solid 0.5px silver;
	font-size: 10pt;
	height: 50px;
}

input.myQnA_input{
	width: 270px;
	height: 30px;
}

table.tbl tbody tr th,table.tbl tbody tr td{
	padding: 10px;
}

.gender{
	position: relative;
    top: 3px;
}

.require{
	color: red;
}

.btns{
	text-align: center;
}

button{
	border: 1px solid #42362f;
	background: #42362f;
	width: 20%;
	height: 50px;
	cursor: pointer;
	margin: 20px 0;
}


</style>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	
});

function goQnA(){
	var passwd2 = $("#passwd2").val().trim();
	var phone = $("#phone").val().trim();
	var email1 = $("#email1").val().trim();
	var email2 = $("#email2").val().trim();
	var content = $("#content").val().trim();
	
	if(passwd2==""){
		alert("패스워드를 입력하세요");
		$("#passwd2").focus();
	}
	else if(phone==""){
		alert("연락처를 입력하세요");
		$("#phone").focus();
	}
	else if(email1==""){
		alert("이메일을 입력하세요");
		$("#email1").focus();
	}
	else if(email2==""){
		alert("이메일을 입력하세요");
		$("#email2").focus();
	}
	else if(content==""){
		alert("문의내용을 입력하세요");
		$("#content").focus();
	}

	else{
		alert("문의가 접수되었습니다");
		location.href="semi_Mypage_main.jsp";
	}
}
</script>

<body>
<div id="login_container">
	<span id="top_comment">Home>Mypage>1:1문의</span><br>
	<h1 class="hm_h1">1:1 문의하기</h1>
	
	<div class="myQnA" style="border-top: solid 2px silver">
		<table class="myQnATbl tbl">
			<colgroup>
				<col style="width: 155px;">
				<col style="width: auto;">
			</colgroup>
			<tbody>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>이름</div></th>
				<td><div class="col-cell"><input class="myQnA_input" type="text" value="최효민" disabled ></div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>아이디</div></th>
				<td><div class="col-cell"><span>92hyomin</span></div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>비밀번호 확인</div></th>
				<td><div class="col-cell"><input class="myQnA_input" id="passwd2" name="passwd2" type="password"></div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>휴대폰</div></th>
				<td><div class="col-cell"><input class="myQnA_input" id="phone" name="phone" type="text">
				</div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>이메일</div></th>
				<td><div class="col-cell">
				<input class="email" id="email1" name="email1" type="text" style="width: 150px; height: 30px;">
				@
				<input class="email" id="email2" name="email2" type="text" style="width: 150px; height: 30px;">
				<select id="mailSite" style="width: 100px; height: 30px;">
				<option value="direct">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="yahoo.com">yahoo.com</option>
				<option value="nate.com">nate.com</option>
				<option value="korea.com">korea.com</option>
				<option value="chol.com">chol.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="netian.com">netian.com</option>
				</select>
				</div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>문의내역</div></th>
				<td><div class="col-cell"><textarea id="content" class="input_textarea" rows="10" cols="70"></textarea>
				</div></td>
			</tr>
			
			</tbody>
		</table>
	</div>

	
	<div class="btns" style="margin-bottom: 40px;">
		<button id="QnABtn" type="button" style="color: #fff;" onclick="goQnA()">문의하기</button>
		<button type="button" style="background-color: white; color: black;" onclick="location.href='javascript:history.back()'">취소하기</button>
	</div>
	
</div>
</body>

<%@include file="../footer_dog.jsp" %>






