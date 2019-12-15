<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style type="text/css">
#container{
}
.mypetTbl{
width: 100%;
border-spacing: 0;
border-collapse: collapse;
}

.mypetTbl tr td{
	border: solid 1px gray;
	font-size: 9pt;
	padding: 10px;
}
.mypetTbl tr th{
	border: solid 1px gray;
	background-color: #f8f8f8;
	width: 10%;
	font-size: 10pt;
	text-align: center;
}

.tblText{
	font-weight: bold;
	font-size: 11pt;
}

#closeBtn{
	border: solid 1px black;
	text-align: center;
	margin: 0 auto;
	display: inline-block;
	width: 100px;
	padding: 10px;
	cursor: pointer;
}

.submitBtn{
	background-color: #231f20;
	color: white;
}

.cancelBtn{
	background-color: white;
	color: #231f20;
}

#petName, #petWeight, #petBirthday{
	width: 180px;
	height: 30px;
}

.btns{
	display: inline-block;
	border: solid 1px black;
	font-size: 9pt;
	padding: 5px 15px;
	vertical-align: middle;
	cursor: pointer;
}

#submitBtn{
	border: solid 1px #ef3f22;
	color: white;
	background-color: #ef3f22;
}

#btnArea{
	text-align: center;
}
</style>


<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>


<script type="text/javascript">
$(document).ready(function(){
	$( "#datepicker" ).datepicker({
		dateFormat: 'yymmdd'
	});
	
	//펫 기본 정보로 값 설정하기
	$("#petGender").val("${myPetInfo.pet_gender}").prop("selected", true);
	$("#dogBreed").val("${myPetInfo.pet_type}").prop("selected", true);
	$("#petNeutralStatus").val("${myPetInfo.pet_neutral}").prop("selected", true);
	$("#datepicker").val("${myPetInfo.pet_birthday}");

	//SELECT선택시 hidden값 변경
	$("#dogBreed").change(function(){
		$("#petType").val($("#dogBreed").val());
	});
	
	$("#petNeutralStatus").change(function(){
		$("#petNeutral").val($("#petNeutralStatus").val());
	});
	
});

function goAddpet(){
	var petName = $("#petName").val().trim();
	var petWeight = $("#petWeight").val().trim();
	var petBirthday = $(".petBirthday").val().trim();
	var petNeutral = $("#petNeutralStatus").val();
	var petWeight = $("#petWeight").val().trim();
	var petType = $("#petType").val();
	//체중 유효성 검사
	if(petWeight != ""){
		var regExp=/^[0-9]+$/;
		var bool = regExp.test(petWeight);
		
		if( bool == false){
			alert("반려동물 체중은 숫자만 입력하세요.");
			$("#petWeight").focus();
			return false;
		}
		
		if((petWeight > 200) || (petWeight <1) ){
			alert("반려동물 체중을 정확히 입력해주세요");
			$("#petWeight").focus();
			return false;
		}
	}
	
	if(petName==""){
		alert("이름을 입력하세요");
		$("#petName").focus();
	}
	
	else if(petWeight==""){
		alert("체중을 입력하세요");
		$("#petWeight").focus();
	}
	
	else if(petBirthday==""){
		alert("출생시기를 입력하세요");
	}
	
	else if(petNeutral==""){
		alert("중성화 여부를 선택하세요");
	}
	
	else if(petType==""){
		alert("견종을 선택하세요");
	}
	
	else{
		var frm = document.addPetFrm;
		frm.submit();
	}
	
}


</script>

<head>
<meta charset="EUC-KR">
<title>나의 반려동물</title>
</head>
<body>
<div id="container">
		<span class="tblText">나의 반려동물 등록하기</span>
		<form name="addPetFrm"
		      action="<%= request.getContextPath()%>/mypage/addMypet.dog"
		      method="POST"
		      enctype="multipart/form-data"> 
			<table class="mypetTbl" style="text-align: left;">
				<tr>
					<th>이름</th>
					<td><input id="petName" name="petName" type="text" value="${myPetInfo.pet_name}"/></td>
					
					<th>종류</th>
					<td>
						<select name="dogBreed" id="dogBreed" form="dogBreedFrm" style="width: 100px; height: 30px;">
							<%@include file="SelectDogbreed.jsp" %>
						</select>
						<input type="hidden" id="petType" name="petType" value="${myPetInfo.pet_type}" />
					</td>
					
					<th>중성화여부</th>
					<td>
						<select name="petNeutralStatus" id="petNeutralStatus" form="petNeutralFrm" style="width: 100px; height: 30px;">
							<option value="">선택</option>
							<option value="1">유</option>
							<option value="0">무</option>
						</select>
						
						<input type="hidden" id="petNeutral" name="petNeutral" value="${myPetInfo.pet_neutral}" />
					</td>
				</tr>
				<tr>
					<th>체중</th>
					<td><input id="petWeight" name="petWeight" type="text" value="${myPetInfo.pet_weight}"/>kg</td>
					<th>성별</th>
					<td>
						<select name="petGender" id="petGender" name="petGender" style="width: 100px; height: 30px;">
							<option value="1">남아</option>
							<option value="2">여아</option>
						</select>
					</td>
					<th>출생시기</th>
					<td><input id="datepicker" class="petBirthday" name="petBirthday" type="text" readonly /></td>
				</tr>
				<tr>
					<th>사진등록</th>
					<c:if test="${myPetInfo.pet_photo == null}">
						<td colspan="5">
							<input type="file" name="petImage" id="petImage" class="infoData" accept=".gif, .jpg, .png" /><br/>
							<span>
								- 권장사이즈 : 300*300pixels 이상 (jpg/gif/png 파일만 업로드 가능)<br/>
								- 10mb 이하 파일만 업로드 가능
							</span>
						</td>
					</c:if>
					
					<c:if test="${myPetInfo.pet_photo != null}">
						<td colspan="5">
							<img src="../mypetimg/${myPetInfo.pet_photo}" width="150px" height="150px">
						</td>
					</c:if>
				</tr>
				<%
				String pet_seq = request.getParameter("pet_seq"); 
				pageContext.setAttribute("pet_seq", pet_seq);
				%>
				<c:set var="pet_seq" value="${pageScope.pet_seq}"/>
				<input type="hidden" name="pet_seq" value="${pageScope.pet_seq}" />
				<input type="hidden" name="petPhoto" value="${myPetInfo.pet_photo}" />
			</table>
		</form>
		
		<br/>
		<div id="btnArea">
			<span class="btns" id="submitBtn" onclick="goAddpet()">반려동물 등록</span>
			<span class="btns" id="rewriteBtn" onclick="self.location.reload()">다시입력</span>
			<span class="btns" id="addpetCloseBtn" onclick="self.close()">닫기</span>
		</div>
</div>
</body>
</html>