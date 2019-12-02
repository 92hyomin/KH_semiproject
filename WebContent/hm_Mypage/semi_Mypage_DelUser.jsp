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
}

.grayTxt{
	color: #7f7f7f;
	font-size: 9pt;
}
</style>
<script type="text/javascript">


function delMember(){
	if(confirm("회원을 탈퇴하시겠습니까?") == true){
		
		location.href="semi_Mypage_DelUser.jsp"
		
		alert("회원탈퇴가 완료되었습니다.")
	}
	else{
		location.href="semi_Mypage_Myshopping.jsp?tabMenu=1";
		return;
	}
}
</script>

<body>
<div id="login_container">
	<span id="top_comment">Home>Mypage>회원탈퇴</span><br>
	<h1 class="hm_h1">마이페이지</h1>
		
	<%@include file="semi_Mypage_Submenu.jsp" %>
    
	<div id="delUserDiv">
	<h2>회원정보 탈퇴신청</h2>
	<span class="grayTxt">저희 쇼핑몰의 부족했던 점과 아쉬웠던 점을 적어주십시오. 더 좋은 모습으로 발전하도록 최선을 다하겠습니다.</span>
	<span class="grayTxt">앞으로 더 나은 모습으로 고객님을 다시 만날 수 있도록 노력하겠습니다. 그동안 이용해주신 것을 진심으로 감사드립니다.</span>
	<br />
	<span>탈퇴 사유를 적어주시면 쇼핑몰 운영에 적극 반영하겠습니다.</span>
	</div>
	
</body>


<%@include file="../footer_dog.jsp" %>






