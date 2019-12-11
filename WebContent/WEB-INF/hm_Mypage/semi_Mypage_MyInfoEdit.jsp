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

.myinfo, .petInfo, .addPet{
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

input.myinfo_input{
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

#petImg{
	width: 25px; 
	height: 25px; 
	position: relative; 
	bottom: 3px;
	cursor: pointer;
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
	$(".error").hide();
	$("#zipcodeSearch").click(function(){
		new daum.Postcode({
			oncomplete: function(data) {
			    $("#post1").val(data.postcode1);  // 우편번호의 첫번째 값     예> 151
			    $("#post2").val(data.postcode2);  // 우편번호의 두번째 값     예> 019
			    $("#addr1").val(data.address);    
			}
		}).open();
	});
	
	
	if( "${ gender == 1}" ){
		$("#M").attr('checked','checked');
	}
	else{
		$("#F").attr('checked','checked');
	}
	
	if( "${ alert_email == 1}" ){
		$("#emailreceiveY").attr('checked','checked');
	}
	else{
		$("#emailreceiveN").attr('checked','checked');
	}
	
	if( "${ alert_sms == 1}" ){
		$("#smsreceiveY").attr('checked','checked');
	}
	else{
		$("#smsreceiveN").attr('checked','checked');
	}
	
});


function goEdit(){
	var user_pw = $("#passwd1").val();
	var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
	var bool = regExp.test(user_pw);
	
	var passwd1 = $("#passwd1").val().trim();
	var passwd2 = $("#passwd2").val().trim();
	
	if(passwd1==""){
		alert("패스워드를 입력하세요");
		$("#passwd1").focus();
	}
	
	else if(!bool){
		alert("비밀번호는 최소 8자리에 숫자,영문자,특수문자가 각 1개씩 포함되어야 합니다."); 
	}
	
	else if(passwd2==""){
		alert("패스워드 확인을 입력하세요");
		$("#passwd2").focus();
	}
	else if(passwd1 != passwd2){
		alert("패스워드와 패스워드확인이 일치하지 않습니다");
		$("#passwd1").focus();
	}
	else{
		var frm = document.editInfoFrm;
		frm.method = "POST";
		frm.action = "myInfoEdit.dog";
		frm.submit();
	}
}
</script>

<body>
<div id="login_container">
	<span id="top_comment">Home>Mypage>회원정보 입력</span><br>
	<h1 class="hm_h1">회원정보 입력</h1>
	
	<div class="myinfo" style="border-top: solid 2px silver">
	<form name="editInfoFrm">
		<table class="myinfoTbl tbl">
			<colgroup>
				<col style="width: 155px;">
				<col style="width: auto;">
			</colgroup>
			<tbody>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>이름</div></th>
				<td><div class="col-cell"><input class="myinfo_input" type="text" id="inputName" value="${userName}" disabled ></div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>아이디</div></th>
				<td><div class="col-cell"><span>${userid}</span></div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>비밀번호</div></th>
				<td><div class="col-cell"><input class="myinfo_input" id="passwd1" name="passwd1" type="password">
					<br><span style="font-size: 9pt;">* 영문 대소문자/숫자/특수문자를 혼용하여 2종류 10~16자 또는 3종류 8~16자</span>
				</div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>비밀번호 확인</div></th>
				<td><div class="col-cell"><input class="myinfo_input" id="passwd2" name="passwd2" type="password"></div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>생년월일</div></th>
				<td><div class="col-cell">
				<select style="width:100px; height: 30px;" disabled value="${birthY}"><option>${birthY}</option></select> 년
				<select style="width:50px; height: 30px;" disabled value="${birthM}"><option>${birthM}</option></select> 월
				<select style="width:50px; height: 30px;" disabled value="${birthD}"><option>${birthD}</option></select> 일
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<input type="radio" class="gender" id="M" name="gender" value="1" disabled /><label for="M">남</label>
					&nbsp;&nbsp;&nbsp;
					<input type="radio" class="gender" id="F" name="gender" value="2" disabled /><label for="F">여</label>

				
				</div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell">　우편번호</div></th>
				<td><div class="col-cell">
				<input type="text" style="width: 80px; height: 30px; background-color: white; border: solid 1px silver;" id="post1" name="post1" size="6" maxlength="3" readonly />
			    &nbsp;-&nbsp;
			    <input type="text" style="width: 80px; height: 30px; background-color: white; border: solid 1px silver; " id="post2" name="post2" size="6" maxlength="3" readonly />&nbsp;&nbsp;
			    <!-- 우편번호 찾기 -->
			    <img id="zipcodeSearch" src="../hm_img/b_zipcode.gif" style="vertical-align: middle;" />
			    <span class="error error_post">우편번호 형식이 아닙니다.</span>
				</div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell">　집주소</div></th>
				<td><div class="col-cell">
				   <input type="text" id="addr1" class="address" name="addr1" style="width: 90%; height: 30px; background-color: white; border: solid 1px silver;" readonly />
				</div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell">　상세주소</div></th>
				<td><div class="col-cell">
				   <input type="text" id="addr2" class="address" name="addr2" style="width: 90%; height: 30px;" />
				</div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell">　휴대폰</div></th>
				<td><div class="col-cell"><input class="myinfo_input" id="phone" name="phone" type="text">
				</div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell"><span class="require">* </span>이메일</div></th>
				<td>
					<div class="col-cell"><span>${email}</span></div>
					<input type="hidden" name="email" value="${email}" />
				</td>
				
				<%-- <th><div class="head-cell">　이메일</div></th>
				<td><div class="col-cell">
				<input class="email" id="email1" name="email1" type="text" style="width: 150px; height: 30px;">
				@
				<input class="email" id="email2" name="email2" type="text" style="width: 150px; height: 30px;">
				<select id="mailSite" style="width: 100px; height: 30px;">
				<option value="">직접입력</option>
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
				</div></td> --%>
			</tr>
			
			<tr>
				<th><div class="head-cell">뉴스메일</div></th>
				<td><div class="col-cell">
				<input type="radio" id="emailreceiveY" name="emailreceive" value="1" checked /><label for="emailreceiveY">받습니다</label>
				&nbsp;&nbsp;&nbsp;
				<input type="radio" id="emailreceiveN" name="emailreceive" value="0" /><label for="emailreceiveN">받지 않습니다</label>
				</div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell">SMS안내</div></th>
				<td><div class="col-cell">
				<label><input type="radio" id="smsreceiveY" name="smsreceive" value="1" checked /><label for="smsreceiveY">받습니다</label>
				&nbsp;&nbsp;&nbsp;
				<label><input type="radio" id="smsreceiveN" name="smsreceive" value="0"/><label for="smsreceiveN">받지 않습니다</label>
				</div></td>
			</tr>
			</tbody>
		</table>
		</form>
	</div>
	
	<%-- <div class="petInfo">
	<span style="margin: 40px 0 0 0; font-size: 15pt; font-weight: bold;">나의 반려동물 정보</span>
	<img id="petImg" onclick="location.href='<%= ctxPath %>/mypage/myshopping.dog?tabMenu=10'" src="../hm_img/petinfo.png" >
	<hr style="border: solid 1px gray; margin: 0;">
	<table class="myinfoTbl tbl">
		<colgroup>
			<col style="width: 15%;">
			<col style="width: 35%;">
			<col style="width: 15%;">
			<col style="width: 35%;">
		</colgroup>
		<tbody>
		<tr>
			<th>이름</th>
			<td>leess</td>
			<th>출생일</th>
			<td>2018-11-07</td>
		</tr>
		<tr>
			<th>견종</th>
			<td colspan="3">말티즈</td>
		</tr>
		<tr>
			<th>체중</th>
			<td>5.0kg</td>
			<th>성별</th>
			<td>남아</td>
		</tr>
		<tr>
			<th>사진등록</th>
			<td colspan="3"></td>
		</tr>
		</tbody>
	</table>
	</div>
	
	<div class="addPet">
	<hr style="border: solid 1px gray; margin: 0;">
	<table class="myinfoTbl tbl">
		<colgroup>
			<col style="width: 155px;">
			<col style="width: auto;">
		</colgroup>
		<tbody>
			<tr>
				<th><div class="head-cell">반려동물선택</div></th>
				<td><div class="col-cell">
				<label><input type="radio" id="selectPetDog" name="selectPet" value="D" checked /><label for="selectPetDog">강아지</label>
				</div></td>
			</tr>
			<tr>
				<th><div class="head-cell">펫이름</div></th>
				<td><div class="col-cell"><input class="myinfo_input" type="text"></div></td>
			</tr>
			<tr>
				<th><div class="head-cell">반려동물생일</div></th>
				<td><div class="col-cell"><input class="myinfo_input" type="text"></div></td>
			</tr>
			<tr>
				<th><div class="head-cell">품종</div></th>
				<td><div class="col-cell">
				<select name="petType" form="petTylefrm" style="width: 100px; height: 30px;">
					<option value="">선택</option>                                        
					<option value="골든리트리버"  >골든리트리버</option>                                        
					<option value="그레이트 덴"  >그레이트 덴</option>                                        
					<option value="그레이하운드"  >그레이하운드</option>                                        
					<option value="꼬똥"  >꼬똥</option>                                        
					<option value="닥스훈트"  >닥스훈트</option>                                        
					<option value="달마티안"  >달마티안</option>                                        
					<option value="도벨만"  >도벨만</option>                                        
					<option value="도사견"  >도사견</option>                                        
					<option value="독일 세퍼드"  >독일 세퍼드</option>                                        
					<option value="라브라도리트리버"  >라브라도리트리버</option>                                        
					<option value="로트와일러"  >로트와일러</option>                                        
					<option value="마스티프"  >마스티프</option>                                        
					<option value="말라뮤트"  >말라뮤트</option>                                        
					<option value="말티즈"  >말티즈</option>                                        
					<option value="바셋하운드"  >바셋하운드</option>                                        
					<option value="보르조이"  >보르조이</option>                                        
					<option value="보스턴테리어"  >보스턴테리어</option>                                        
					<option value="복서"  >복서</option>                                        
					<option value="불독"  >불독</option>                                        
					<option value="불테리어"  >불테리어</option>                                        
					<option value="비글"  >비글</option>                                        
					<option value="비숑프리제"  >비숑프리제</option>                                        
					<option value="빠삐용"  >빠삐용</option>                                        
					<option value="사모예드"  >사모예드</option>                                        
					<option value="삽사리"  >삽사리</option>                                        
					<option value="세인트 버나드"  >세인트 버나드</option>                                        
					<option value="셔틀드 쉽독"  >셔틀드 쉽독</option>                                        
					<option value="소프트 코티드 휘튼 테리어"  >소프트 코티드 휘튼 테리어</option>                                        
					<option value="슈나우저"  >슈나우저</option>                                        
					<option value="스무스 폭스테리어"  >스무스 폭스테리어</option>                                        
					<option value="스피츠"  >스피츠</option>                                        
					<option value="시베리안허스키"  >시베리안허스키</option>                                        
					<option value="시츄"  >시츄</option>                                        
					<option value="실키테리어"  >실키테리어</option>                                        
					<option value="아메리칸 에스키모 도그"  >아메리칸 에스키모 도그</option>                                        
					<option value="아키다"  >아키다</option>                                        
					<option value="아프간하운드"  >아프간하운드</option>                                        
					<option value="에어데일테리어"  >에어데일테리어</option>                                        
					<option value="올드 잉글리쉬 쉽독"  >올드 잉글리쉬 쉽독</option>                                        
					<option value="와이어폭스테리어"  >와이어폭스테리어</option>                                        
					<option value="요크셔테리어"  >요크셔테리어</option>                                        
					<option value="잉글리쉬 세터"  >잉글리쉬 세터</option>                                        
					<option value="진돗개"  >진돗개</option>                                        
					<option value="치와와"  >치와와</option>                                        
					<option value="친"  >친</option>                                        
					<option value="카디건웰시코기"  >카디건웰시코기</option>                                        
					<option value="캐리블루 테리어"  >캐리블루 테리어</option>                                        
					<option value="코커스파니엘"  >코커스파니엘</option>                                        
					<option value="콜리"  >콜리</option>                                        
					<option value="퍼그"  >퍼그</option>                                        
					<option value="페키니스"  >페키니스</option>                                        
					<option value="펨브록"  >펨브록</option>                                        
					<option value="웰시 코기"  >웰시 코기</option>                                        
					<option value="포메라니언"  >포메라니언</option>                                        
					<option value="포인터"  >포인터</option>                                        
					<option value="폼피츠"  >폼피츠</option>                                        
					<option value="푸들"  >푸들</option>                                        
					<option value="푸들(토이)"  >푸들(토이)</option>                                        
					<option value="풍산개"  >풍산개</option>                                        
					<option value="핀셔"  >핀셔</option>                                        
					<option value="기타"  >기타</option>
				</select>
				</div></td>
			</tr>
			
			<tr>
			<th><div class="head-cell">나이</div></th>
			<td><div class="col-cell">
				<input type="radio" value="퍼피(1년미만)" id="petAge1" name="petAge" form="petAgeFrm" checked/>
				<label for="petAge1">퍼피(1년미만)</label>&nbsp;&nbsp;&nbsp;                                   
				
				<input type="radio" value="어덜트(1년~8년)" id="petAge2" name="petAge" form="petAgeFrm" />
				<label for="petAge2">어덜트(1년~8년)</label>&nbsp;&nbsp;&nbsp;                                    
				
				<input type="radio" value="시니어(8년이상)" id="petAge3" name="petAge" form="petAgeFrm" />
                <label for="petAge3">시니어(8년이상)</label>&nbsp;&nbsp;&nbsp;
                
				<input type="hidden" name="petAge4" form="petAgeFrm"  id="petAge4" /></div>
			</td></tr>
			
			<tr>
				<th><div class="head-cell">몸무게</div></th>
				<td><div class="col-cell"><input class="myinfo_input" type="text"></div></td>
			</tr>
			
			<tr>
				<th><div class="head-cell">프로모션 코드</div></th>
				<td><div class="col-cell"><input class="myinfo_input" type="text"></div></td>
			</tr>
		</tbody>
	</table>
	</div> --%>
	
	<div class="btns" style="margin-bottom: 40px;">
		<button id="editBtn" type="button" style="color: #fff;" onclick="goEdit()">수정하기</button>
		<button type="button" style="background-color: white; color: black;" onclick="location.href='javascript:history.back()'">취소하기</button>
	</div>
	
</div>
</body>

<%@include file="../footer_dog.jsp" %>






