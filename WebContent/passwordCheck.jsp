<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header_dog.jsp" %>
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

.hm_h1{
	text-align: center;
	margin: 0 auto;
	margin-top: 40px;
	margin-bottom: 60px;
	font-weight: bold;
	font-family: 'Notokr', sans-serif;
}

</style>

<div id="login_container">
	<h1 class="hm_h1">비밀번호 재확인</h1>
	<p><img alt="이미지" src="/Semi_Team1/WebContent/img/security.jpg" height="200px;"></p>
	<span>
	저희 쇼핑몰에서는 회원님의 소중한 개인정보를 안전하게 보호하고
	개인정보 도용으로 인한 피해를 예방하기 위하여 비밀번호를 확인합니다.
	비밀번호는 타인에게 노출되지 않도록 주의해주세요.
	</span>
</div>

<%@include file="footer_dog.jsp" %>