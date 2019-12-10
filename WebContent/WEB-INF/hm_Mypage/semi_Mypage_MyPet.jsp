<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../header_dog.jsp"/>
<link rel="stylesheet" type="text/css" href="/Semi_Team1/css/hm/style.css" /> 
<div id="login_container">
<h1 class="hm_h1">마이페이지</h1>
<jsp:include page="semi_Mypage_Submenu.jsp"/>

<script type="text/javascript">
	$("#subtabli10 > a").addClass('subtabClick');
	$(".subTab").hide();
	$("#tab3").addClass("tabClick")
	$(".subTab:eq(2)").show();
	$("#top_comment").html("Home>Mypage>반려동물 정보");
</script>

<div style="border-top: solid 1px black; border-bottom: solid 1px black; width: 500px; text-align: center; margin: 50px auto; padding: 10px;">
<span style="font-size: 13pt;">[이름]님께서 등록한 반려 동물은 <strong style="color: #da291c; font-size: 15pt;">총[마리수]</strong> 입니다.</span>
</div>

<div class="myPetInfoDiv" >
	<div class="mypetInfo col-md-3">
	<table>
	<tr>
		<td colspan="2">
			<img src="../hm_img/mypet.png" style="border-radius: 100%;">
			<p class="myPetTxt">이름: [반려동물이름]</p>
			<p class="myPetTxt">견종: [견종]</p>
			<p class="myPetTxt">체중: [체중]kg</p>
			<p class="myPetTxt">성별: [성별]</p>
			<p class="myPetTxt">생년: [생년월일]</p>
		</td>
	</tr>
	<tr>
		<td style="width: 50%;"><button class="myPetBtn" type="button" onclick="/Semi_Team1/mypage/addMypet.dog">수정</button></td>
		<td style="width: 50%;"><button class="myPetBtn" type="button" style="border-left: hidden;">삭제</button></td>
	</tr>
	</table>
	</div>

	<div class="mypetInfo col-md-3" style="padding-top: 80px;">
		<img src="../hm_img/addPetimg.png">
	</div>
</div>
</div>
<jsp:include page="../footer_dog.jsp"/>