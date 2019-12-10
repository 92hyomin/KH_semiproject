<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	padding-top: 40px;
}

.hm_h1{
	font-family: 'Nanum Gothic', '나눔고딕', '돋움', Dotum, sans-serif;
	text-align: center;
	margin: 0 auto;
	margin-bottom: 60px;
	font-weight: bold;
	font-family: 'Notokr', sans-serif;
}

.ptxt{
	text-align: center;
	color: gray;
}

table.tbl{
	width: 30%;
	margin: 0 auto;
}

table.tbl tr{
	font-size: 10pt;
	height: 50px;
}

input#inputPasswd{
	width: 270px;
	height: 40px;
}

table.tbl tbody tr th,table.tbl tbody tr td{
	padding: 10px;
	margin: 0 auto;
}

.frmtxt{
	color: gray;
	margin-right: 10px;
}

.btn{
	width: 230px;
	height: 50px;
	border: solid 1px #231f20;
	padding: 15px;
	font-size: 12pt;
	border-radius: 0px;
}

#btnArea{
	text-align: center;
	margin-bottom: 50px;
}

.submitBtn{
	background-color: #231f20;
	color: white;
}

.cancelBtn{
	background-color: white;
	color: #231f20;
}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>

<script>
$(document).ready(function(){
	$(".submitBtn").hover(
		function(){
			$(this).removeClass("submitBtn");
			$(this).addClass("cancelBtn");
		},
		function(){
			$(this).removeClass("cancelBtn");
			$(this).addClass("submitBtn");
		});
	
	$(".cancelBtn").hover(
		function(){
			$(this).removeClass("cancelBtn");
			$(this).addClass("submitBtn");
			$(this).css("color","white");
		},
		function(){
			$(this).removeClass("submitBtn");
			$(this).addClass("cancelBtn");
			$(this).css("color","#231f20");
		});
	
});

function goCheck(){
	var passwd = $("#inputPasswd").val().trim();
	
	if(passwd==""){
		alert("패스워드를 입력하세요");
		$("#inputPasswd").focus();
	}
	else{
		var frm = document.passcheckFrm;
		frm.method = "POST";
		frm.action = "passwordCheck.up";
		frm.submit();
	}
}

</script>
<div id="login_container">
	<h1 class="hm_h1">비밀번호 재확인</h1>
	<p style="text-align: center;"><img alt="이미지" src="../hm_img/security.png" height="200px;"></p>
	<span>
	<p class="ptxt">
	저희 쇼핑몰에서는 회원님의 소중한 개인정보를 안전하게 보호하고 <br/>
	개인정보 도용으로 인한 피해를 예방하기 위하여 비밀번호를 확인합니다. <br/>
	비밀번호는 타인에게 노출되지 않도록 주의해주세요.
	</p>
	<hr style="border: solid 0.5px silver;" />
	
	<form id="passcheckFrm">
		<table class="tbl">
		
			<tr>
				<td><span class="frmtxt">ID</span>	</td>
				<td><span class="frminput" name="userid">92hyomin</span>	</td>
			</tr>
			<tr>
				<td><span class="frmtxt">PASSWORD</span></td>
				<td><input id="inputPasswd" type="password" placeholder="ENTER PASSWORD" name="passwd"/></td>
			</tr>
		</table>	
	</form>
	
	<hr style="border: solid 0.5px silver; margin-bottom: 40px;" />
	
	<div id="btnArea">
		
		<a class="btn submitBtn" type="button" id="submitBtn" onclick="goCheck()">확인</a>
		<a class="btn cancelBtn" id="cancelBtn" href="javascript:history.back()">취소</a>
	</div>
</div>

<%@include file="../footer_dog.jsp" %>