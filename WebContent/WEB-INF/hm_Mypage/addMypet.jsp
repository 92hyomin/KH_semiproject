<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		dateFormat: 'yy-mm-dd'
	});
});

function goAddpet(){
	var petName = $("#petName").val().trim();
	var petWeight = $("#petWeight").val().trim();
	var petBirthday = $(".petBirthday").val().trim();
	
	if(petName==""){
		alert("이름을 입력하세요");
	}
	
	else if(petWeight==""){
		alert("체중을 입력하세요");
	}
	
	else if(petBirthday==""){
		alert("출생시기를 입력하세요");
	}
	
	else{
		alert("성공");
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
		<table class="mypetTbl" style="text-align: left;">
			<tr>
				<th>이름</th>
				<td><input id="petName" type="text" /></td>
				<th>종류</th>
				<td colspan="3"><%@include file="SelectDogbreed.jsp" %></td>
			</tr>
			<tr>
				<th>체중</th>
				<td><input id="petWeight" type="text" />kg</td>
				<th>성별</th>
				<td>
					<select name="petType" form="petTylefrm" style="width: 100px; height: 30px;">
						<option value="1">남아</option>
						<option value="2">여아</option>
					</select>
				</td>
				<th>출생시기</th>
				<td><input id="datepicker" class="petBirthday" type="text" readonly /></td>
			</tr>
			<tr>
				<th>사진등록</th>
				<td colspan="5">
				<span>파일선택</span><br/>
				<span>
					- 권장사이즈 : 300*300pixels 이상 (jpg/gif/png 파일만 업로드 가능)<br/>
					- 1Mb 이하의 용량만 업로드 가능
				</span>
				</td>
			</tr>
		</table>
		<br/>
		<div id="btnArea">
			<span class="btns" id="submitBtn" onclick="goAddpet()">반려동물 등록</span>
			<span class="btns" id="rewriteBtn" onclick="self.location.reload()">다시입력</span>
			<span class="btns" id="addpetCloseBtn" onclick="self.close()">닫기</span>
		</div>
</div>
</body>
</html>