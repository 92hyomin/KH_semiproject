<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header_dog.jsp"/>
<link rel="stylesheet" type="text/css" href="/Semi_Team1/css/hm/style.css" /> 
<div id="login_container">
<h1 class="hm_h1">마이페이지</h1>
<jsp:include page="semi_Mypage_Submenu.jsp"/>
<style>
.addPet{
	cursor: pointer;
}

.addPet:hover {
	border-width: 2px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$(".addPet").click(function(){
		addMypet();
	});
	
	
});
	$("#subtabli10 > a").addClass('subtabClick');
	$(".subTab").hide();
	$("#tab3").addClass("tabClick")
	$(".subTab:eq(2)").show();
	$("#top_comment").html("Home>Mypage>반려동물 정보");
	
function addMypet(){
    var url = "/Semi_Team1/mypage/addMypet.dog";
    var name = "addMypet";
    var option = "width = 900px, height = 400px, location = no"
    window.open(url, name, option);
}

function editMypet(pet_seq){
	var url = "/Semi_Team1/mypage/addMypet.dog?pet_seq="+pet_seq;
    var name = "addMypet";
    var option = "width = 900px, height = 400px, location = no"
    window.open(url, name, option);
}

function deleteMypet(pet_seq){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href='/Semi_Team1/mypage/deletePet.dog?pet_seq='+pet_seq;
	}

}

</script>

<div style="border-top: solid 1px black; border-bottom: solid 1px black; width: 500px; text-align: center; margin: 50px auto; padding: 10px;">
<span style="font-size: 13pt;"><span>${name}</span>님께서 등록한 반려 동물은 <strong style="color: #da291c; font-size: 15pt;">총[${totalPet}마리]</strong> 입니다.</span>
</div>

<div class="myPetInfoDiv" >

	
	<c:if test="${empty requestScope.myPetList}">
	
	</c:if>
	
	
	<c:if test="${!empty requestScope.myPetList}">
		<c:forEach var="rvo" items="${requestScope.myPetList}" varStatus="status">
			<div class="mypetInfo col-md-3">
			<table>
			<tr>
				<td colspan="2">
					<img src="../mypetimg/${rvo.pet_photo}" style="border-radius: 100%;">
					<p class="myPetTxt">이름: ${rvo.pet_name}</p>
					<p class="myPetTxt">견종: ${rvo.pet_type}</p>
					<p class="myPetTxt">체중: ${rvo.pet_weight}kg</p>
					<p class="myPetTxt">성별: ${rvo.pet_gender}</p>
					<p class="myPetTxt">생년월일: ${rvo.pet_birthday}</p>
				</td>
			</tr>
			<tr>
				<td style="width: 50%;"><button class="myPetBtn myPetEdit" type="button" id="myPetEdit${status.index}" onclick="editMypet(${rvo.pet_seq})" >수정</button></td>
				<td style="width: 50%;"><button class="myPetBtn" type="button" style="border-left: hidden;" onclick="deleteMypet(${rvo.pet_seq})" >삭제</button></td>
			</tr>
			</table>
			</div>
		
		</c:forEach>
	</c:if>
	
	<%--반려동물은 최대 5마리까지만 등록가능  --%>
	<c:if test="${totalPet < 5}">
		<div class="mypetInfo col-md-3 addPet" style="padding-top: 80px;">
			<img src="../hm_img/addPetimg.png">
		</div>
	</c:if>
</div>
</div>
<jsp:include page="../footer_dog.jsp"/>