<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/header_dog.jsp"/>


<style>

	#body_body {
		width: 80%;
		margin: 0 auto;
	}
	
	#body_body table {
		width: 100%;
	}
	
	#body_navi {
		text-align: right;
		color: gray;
		margin: 15px 0 ;
	}
	
	#body_title {
		font-size: 24pt;
		font-weight: bold;
		text-align: center;
		padding: 20px 0; 
	}
	
	#body_joinbody {
		border-top: solid 2px black;
		margin-bottom: 70px;
	}
	
	
	
	
	#joinNecessary {
		margin-bottom: 50px;
	}
	
	#joinNecessary select {
		height: 30px;
	}
	
	#joinNecessary td {
		border-top: solid 1px #d9d9d9;
		border-bottom: solid 1px #d9d9d9;
		padding: 20px 5px;
		
	}
	
	#joinNecessary table tr td:nth-child(1) {
	
		background: #f2f2f2;
		font-weight: bold;
		font-size: 110%;
		padding-left: 20px;
	}
	
	#joinNecessary table tr td:nth-child(2) {
	
		padding-left: 20px;
	
	}
	
	#joinNecessary input !input:radio{
		height: 30px;
		border: solid 1px #d9d9d9;
	}
	
	#joinNecessary input:focus {
		border: solid 1px black;
		background: #ffffe6;
	}
	
	#joinNecessary button {
		background-color: white;
		border: solid 1px black;
		font-size: 80%;
		padding: 3px 20px;
		margin-left: 10px;
		height: 30px;
		transition: 0.35s;
	}
	
	#joinNecessary button:hover {
		background-color: black;
		color: white;
	}
	
	
	
	.joinOption {
		border-top: solid 2px black;
	}
	
	.joinOption td {
		border-top: solid 1px #d9d9d9;
		border-bottom: solid 1px #d9d9d9;
		padding: 20px 5px;
	}
	
	#joinOptionBtns {
		text-align: right;
		margin: 15px 0 50px 0;
	}
	
	.joinOption input {
		height: 25px;
	}
	
	.joinOption input:focus {
		background: #ffffe6;
	}
	
	.joinOption select {
		height: 25px;
	}
	
	#joinOptionBtns button {
		border: none;
		font-weight: bold;
		padding : 5px 20px;
	}
	
	
	#joinAgree tr {
		border: solid 1px #d9d9d9;
	}
	
	
	#joinAgree td {
		padding : 15px 0;
		padding-left: 40px;
	}
	
	
	#agreeContent {
		margin-top: 50px;
	}
	
	
	#agreeContent table td {
		border: solid 1px #d9d9d9;
		text-align: center;
		padding: 10px;
		font-size:90%;
	}
	
	.agreeBtn {
		font-size:90%;
		padding: 3px 12px;
		margin-left: 20px;
		background-color: #f2f2f2;
		border: solid 1px black;
	}
	
	
	
</style>

<script type="text/javascript">

	$(document).ready(function(){ 
		
		/* 날짜 넣기 */
		
		var date = new Date();
		var year = date.getFullYear();
		var selectValue = document.getElementsByClassName("year");
		var optionIndex = 0;
		
		for( var j = 0; j<selectValue.length; j++){
		
			for(var i=year-100; i<=year ; i++){
	
				selectValue[j].add(new Option(i,i),optionIndex++);                        
	
			}
		}
	
		selectValue = document.getElementsByClassName("month"); 

		optionIndex = 0;

		for( var j=0; j<selectValue.length; j++){

			for(var i=1;i<=12;i++){
	
					selectValue[j].add(new Option(i,i),optionIndex++);
	
			}
		}
		
		selectValue = document.getElementsByClassName("day");

		optionIndex = 0;
		
		for( var j=0; j<selectValue.length; j++){
		
			for(var i=1;i<=31;i++){
	
					selectValue[j].add(new Option(i,i),optionIndex++);
	
			}
		}
		// end of 날짜 넣기 -------------------------------------------------------------------
		
		
		/* 삭제, 추가 버튼 구현하기 */
		
		$("#joinOption2").hide();
		$("#joinOption3").hide();
		$("#joinOption4").hide();
		$("#joinOption5").hide();
		
		var startNum=2;
		
		$("#OptionAdd").click(function(){ 
			
			if( startNum < 6) {
				
				$("#joinOption"+startNum).show();
				startNum ++;
				
			}
			else {
				
				alert("더이상 추가할 수 없습니다.");
			}
			
		});
		
		$("#OptionDel").click(function(){ 
			
			
			if(startNum != 2){
				
				if( confirm("정말로 삭제하시겠습니까? ")){
					// 확인 눌렀을 때
					
					startNum --;
					
					$("#joinOption"+startNum+" input").val("");
					$("#joinOption"+startNum+" select").val("");
					$("#joinOption"+startNum).hide();
					
				} else {
					// 취소 눌렀을 때
					
				}
				
			} else {	// 더이상 삭제할 수 없게 하기
				
				alert("더이상 삭제할 수 없습니다.");
				startNum = 2;
			}
			
		}); // end of 삭제, 추가 버튼 구현하기 ------------------------------------------
		
		
		/* 내용보기 클릭하면 이용약관 탭 이동 */
		
		$('.agreeBtn').click(function(){

			var offset = $('#agreeContent').offset(); 

	        $('html').animate({scrollTop : offset.top}, 400);

		}); // end of 내용보기 클릭하면 이용약관 탭 이동 ----------------------------------------
		
		
		/* 견종 넣기 */
			
		var dogtypes = ["골든리트리버","말라뮤트","말티즈","불독","비숑프리제","사모예드","슈나우저","스피츠","시베리안허스키","시츄","진돗개","치와와","웰시코기","푸들","푸들(토이)"];
		
		var doginputs = document.getElementsByClassName("dog_type_sel");
		
		optionIndex = 0;
		
		for( var j = 0; j<doginputs.length; j++){
			
			for(var i=0; i<dogtypes.length ; i++){
	
				doginputs[j].add(new Option(dogtypes[i],dogtypes[i]),++optionIndex);                        
	
			}
		}
		// end of 견종 넣기 ---------------------------------------------
		
		/* 약관 체크박스들 */
		
		/* 마케팅 수신동의 */
		$("#agree4").click(function(){
			
			var agree4 = $("#agree4").prop("checked");
			
			if(agree4 == true){
				$("#agree5").prop("checked",true);
				$("#agree6").prop("checked",true);
			}
			else{
				$("#agree5").prop("checked",false);
				$("#agree6").prop("checked",false);
				$("#agree1").prop("checked",false);
			}
			
		}); 
		
		$("#agree5").click(function(){
			
			var agree5 = $("#agree5").prop("checked");
			var agree6 = $("#agree6").prop("checked");
			if(agree5 || agree6) $("#agree4").prop("checked",true);
			else if(!agree5 && !agree6) $("#agree4").prop("checked",false);
			
		});
		
		$("#agree6").click(function(){
			
			var agree5 = $("#agree5").prop("checked");
			var agree6 = $("#agree6").prop("checked");
			if(agree5 || agree6) $("#agree4").prop("checked",true);
			else if(!agree5 && !agree6) $("#agree4").prop("checked",false);
		});
		
		
		$(".agreeCB").each(function(){
			
			$(this).click(function(){
				
				if ( $(this).prop("checked") == false ) {
					
					$("#agree1").prop("checked", false);
				}				
				else if( $(".agreeCB:checked").length == 5 ){
					$("#agree1").prop("checked",true);
				}
				
			});
			
		}); // end of 마케팅 동의 버튼 --------------------------------------------
		
		
		/* 주소 사용하기 */
		$("#zipcodeSearch").click(function(){
			new daum.Postcode({
				oncomplete: function(data) {
				    $("#postcode").val(data.postcode1+data.postcode2);  // 우편번호의 첫번째 값     예> 151
				    $("#addr1").val(data.address);    // 큰주소                        예> 서울특별시 종로구 인사로 17 
				    $("#addr2").focus();
				}
			}).open();
		}); // end of 주소 사용하기 --------------------------------------------------
		
		
		/* 아이디 중복확인 */
		$("#idCheck").click(function(){
				
				var user_idCheck = $("#user_idCheck").val();
				
				// 아이디 유효성 검사
				var regExp = ;
				var bool = regExp.test(user_idCheck);
				
				if( bool == false) {
					
					return false;
				}
				
				location.href="?user_id="+user_idCheck;
		}); // end of 아이디 중복확인 ----------------------------------------------
		
		
		/* 이메일 중복확인 */
		
		$("#emailCheck").click(function(){
			
			var email = $("#email1").val()+"@"+$("#email2").val();
			
			// 이메일 유효성 검사
			
			
			location.href="?email="+email;
		}); // end of 이메일 중복확인 -----------------------------------------------

		
		
		
		
		
		/*======================================= 유효성 검사하기 ============================= */
		
		$("#submitBtn").click(function(){  
			
			
		/* 사람 필수 정보 이메일, 생년월일 히든창에 넣기 */	
			
			var email = $("#email1").val()+"@"+$("#email2").val();
			$("#email").val(email);
			
			
			var user_month = $("#user_month").val();
			if( parseInt(user_month) <10) {
				user_month = "0"+user_month;
			}
			
			var user_day = $("#user_day").val();
			if( parseInt(user_day) <10) {
				user_day = "0"+user_day;
			}
			
			var birthday = $("#user_year").val()+user_month+user_day;
			$("#user_birthday").val(birthday);
		
			
		/* 동물 생년월일 히든창에 넣기 */	
			
			for( var i=1; i< 6 ; i++ ){
				
				var pet_month = $("#pet_month"+i).val();
				if( parseInt(pet_month) <10) {
					pet_month = "0"+pet_month;
				}
				
				var pet_day = $("#pet_day"+i).val();
				if( parseInt(pet_day) <10) {
					pet_day = "0"+pet_day;
				}
				
				var birthday = $("#pet_year"+i).val()+pet_month+pet_day;
				$("#pet_birthday"+i).val(birthday);
				
			}
		
		/* 입력창에 특수문자 입력하진 않았는지 유효성 검사하기 */
		
			// 이름 체크하기
			var user_name = $("#user_name").val();
			var regExp = /^[가-힣]+$/;
			var bool1 = regExp.test(user_name);
			regExp = /[a-zA-Z]/;
			var bool2 = regExp.test(user_name);
			
			if(bool1 == false && bool2 == false){
				
				alert("이름은 한글 혹은 영문자만 가능합니다.");
				$("#user_name").focus();
				
				return false;
			}
			
			
			// 아이디 체크하기 
			
			var user_id = $("#user_id").val();
			var user_idCheck = $("#user_idCheck").val();
			
			if( user_id != user_idCheck ){
				
				alert("아이디 중복확인을 다시 해주세요.");
				$("#user_idCheck").focus("");
				
				return false;
			}
			
		
		/* 비밀번호 검사하기 */
		
			var user_pw = $("#user_pw").val();
			
			var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
			
			var bool = regExp.test(user_pw);
			
			if(bool == false){}
			
			var user_pw2 = $("#user_pw2").val();
			
			if( user_pw2 != user_pw){}
			
		
		/* 이메일 중복검사 */
		
		
			var emailChecked = "${ emailChecked }";
		
		
		
		/* 제출하기 */	
			
			var frm = document.memberRegisterForm ;
			frm.method ="POST";
			frm.action = "";
			frm.submit();
			
		
		}); // end of 유효성 검사 -----------------------------------------------------------------
		
		
	}); // end of $(document).ready ----------------------------------------------------------------------

	// 이메일 주소 입력하기
	function inputEmail(){
		
		var email3 = $("#email3").val();
		
		
		if(email3 == "none"){
			
			$("#email2").val("");
			$("#email2").prop("readonly",false);
			$("#email2").css("background","");
		}
		else {
			
			$("#email2").prop("readonly", true);
			$("#email2").val($("#email3").val());
			$("#email2").css("background","#ffffe6");
		}
		
	} // end of inputEmail --------------------------
	
	// 견종 입력하기 
	function  goChangeDogType(number) {
		
		var dogsel = $("#dog_type_sel"+number).val();
		
		if(dogsel == "none"){
			
			$("#pet_type"+number).val("");
			$("#pet_type"+number).prop("readonly",false);
			$("#pet_type"+number).css("background","");
			
		}
		else {
			$("#pet_type"+number).prop("readonly", true);
			$("#pet_type"+number).val(dogsel);
			$("#pet_type"+number).css("background","#ffffe6");	
			
		}
		
	} // end of goChangeDogType -----------------------
	
	function goChangeAll(){
		
		var agree1 = $("#agree1").prop("checked");
		
		
		if(agree1 == true){
			
			$("#agree2").prop("checked", true);
			$("#agree3").prop("checked", true);
			$("#agree4").prop("checked", true);
			$("#agree5").prop("checked", true);
			$("#agree6").prop("checked", true);
		}
		else {
			$("#agree2").prop("checked", false);
			$("#agree3").prop("checked", false);
			$("#agree4").prop("checked", false);
			$("#agree5").prop("checked", false);
			$("#agree6").prop("checked", false);
		}
			
		
	} // end of goChangeAll ----------------------------------------
	
	
	
	
</script>


<div id="body_container">
	<div class="col-xs-9 col-md-2"></div>
	<div class="col-xs-9 col-md-8">
		<div id="body_navi">Home &gt; Mypage &gt; 회원 정보 입력</div>
		<div id="body_body">
			<div id="body_title">회원정보입력</div>
			<div style="font-size: 90%; text-align: right;color: red;font-weight:bold;">아래 사항은 필수사항입니다. </div>
			
			<div id="body_joinbody">
			
				<form name="memberRegisterForm" style="border-bottom:solid 1px #e6e6e6;" enctype="multipart/form-data">
				
				<!-- 필수 사항 -->
				
					<div id="joinNecessary">
						<table>
							<tr>	
								<td>이름</td>
								<td>
									<input name="user_name" id="user_name" type="text" size="30" />
								</td>
							</tr>
							
							<tr>	
								<td>아이디</td>
								<td>
									<input name="user_idCheck" id="user_idCheck"  type="text" size="30" />
									<button id="idCheck" type="button">중복확인</button>
									<input name="user_id" id="user_id"  type="hidden" size="30" />
								</td>
							</tr>
							
							<tr>	
								<td>비밀번호</td>
								<td>
									<input name="user_pw" id="user_pw"  type="password" size="30" />
									<br><span style="font-size:80%;">비밀번호는 최소 8자리에 숫자,영문자,특수문자가 각 1개씩 포함되어야 합니다.</span>
								</td>
							</tr>
							
							<tr>	
								<td>비밀번호 확인</td>
								<td>
									<input id="user_pw2"  type="password" size="30" />
								</td>
							</tr>
							
							<tr>	
								<td>생년월일</td>
								<td>
									
									<select name="user_year" id="user_year"  class="year">
										<option value="none">선택</option>
									</select>년
									<select name="user_month" id="user_month"  class="month">
										<option value="none">선택</option>
									</select>월
									<select name="user_day" id="user_day"  class="day">
										<option value="none">선택</option>
									</select>일
									
									&nbsp;&nbsp;<input name="user_gender" id="gender1" value="1" type="radio"><label for="gender1">남</label>
									&nbsp;&nbsp;<input name="user_gender" id="gender2" value="2" type="radio"><label for="gender2">여</label>
									
								</td>
							</tr>
							
							<tr>	
								<td>우편번호</td>
								<td>
									<input name="postcode" id="postcode" type="text" size="10" readonly>
									<button type="button" id="zipcodeSearch" >우편번호검색</button>
								</td>
							</tr>
							
							<tr>	
								<td>집주소</td>
								<td>
									<input name="addr1" id="addr1" type="text" size="60" readonly>
								</td>
							</tr>
							
							<tr>	
								<td>상세주소</td>
								<td>
									<input name="addr2" id="addr2" type="text" size="60">
								</td>
							</tr>
							
							<tr>	
								<td>연락처</td>
								<td>
									<input name="tel" id="tel"  type="text" size="30">
								</td>
							</tr>
							
							<tr>	
								<td>휴대폰</td>
								<td>
									<input name="phone" id="phone"  type="text" size="30" placeholder="-는 제외하고 입력해주세요.">
								</td>
							</tr>
							
							<tr>	
								<td>이메일</td>
								<td>
									<input name="email1" id="email1" type="text" size="20">@<input name="email2" id="email2" type="text" size="30"><br>
									<select id="email3" onchange="inputEmail();">
										<option value="none" selected>직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="hotmail.com">hotmail.com</option>
									</select>
									<button id="emailCheck" type="button" style="margin-top: 10px;">이메일 중복확인</button>
								</td>
							</tr>
							
						</table>
					</div>
				
				<!-- 생년월일 , 이메일 하나로 통합 -->	
					<input type="hidden" name="user_birthday" id="user_birthday">
					<input type="hidden" name="email" id="email">
					
				<!-- 옵션 사항 -->	
				
					<div style="text-align: left; font-weight:bold;font-size: 16pt;">나의 반려동물 등록</div>
					<div style="font-size: 90%; text-align: right;font-weight:bold;">아래사항은 선택사항입니다.</div>
					<div> 
						<table id="joinOption1" class="joinOption">
							<tr>
								<td>이름</td>
								<td style="width:40%;">
									<input name="pet_name1" id="pet_name1"  type="text" size="30" style="height:30;">
								</td>
								<td>출생일</td>
								<td>
									<select name="pet_year1" id="pet_year1"  class="year">
										<option value="none">선택</option>
									</select>년
									<select name="pet_month1" id="pet_month1"  class="month">
										<option value="none">선택</option>
									</select>월
									<select name="pet_day1" id="pet_day1"  class="day">
										<option value="none">선택</option>
									</select>일
									
									<input type="hidden" name="pet_birthday1" id="pet_birthday1">
								</td>
							</tr>
							
							<tr>
								<td>견종</td>
								<td colspan="3">
									<select class="dog_type_sel" id="dog_type_sel1" onchange="goChangeDogType('1')">
										<option value="none">선택</option>
									</select>
									<input id="pet_type1" name="pet_type1" type="text"  size="20" style="height:30;margin-right: 30px;">
									중성화 여부
									<select name="pet_neutral1" id="pet_neutral1" >
										<option value="1">유</option>
										<option value="0">무</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>체중</td>
								<td><input  name="pet_weight1" id="pet_weight1"  type="text"  size="15" style="height:30;">&nbsp;Kg</td>
								<td>성별</td>
								<td>
									<select name="pet_gender1" id="pet_gender1"  style="width:80%;">
										<option>여아</option>
										<option>남아</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>사진등록</td>
								<td colspan="3">
									<input type="file"  name="pet_photo1" id="pet_photo1"  ><br>
									<span>- 권장 : 300*300pixels 이상 (jpg/gif/png 파일만 업로드)</span><br>
									<span>- 1Mb 이하의 용량만 업로드 가능</span>
								</td>
							</tr>
							
						</table>
						<table id="joinOption2" class="joinOption">
							<tr>
								<td>이름</td>
								<td style="width:40%;">
									<input name="pet_name2" id="pet_name2"  type="text" size="30" style="height:30;">
								</td>
								<td>출생일</td>
								<td>
									<select name="pet_year2" id="pet_year2"  class="year">
										<option value="none">선택</option>
									</select>년
									<select name="pet_month2" id="pet_month2"  class="month">
										<option value="none">선택</option>
									</select>월
									<select name="pet_day2" id="pet_day2"  class="day">
										<option value="none">선택</option>
									</select>일
									<input type="hidden" name="pet_birthday2" id="pet_birthday2">
								</td>
							</tr>
							
							<tr>
								<td>견종</td>
								<td colspan="3">
									<select class="dog_type_sel" id="dog_type_sel2" onchange="goChangeDogType('2')">
										<option value="none">선택</option>
									</select>
									<input id="pet_type2" name="pet_type2" type="text"  size="20" style="height:30;margin-right: 30px;">
									중성화 여부
									<select name="pet_neutral2" id="pet_neutral2" >
										<option value="1">유</option>
										<option value="0">무</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>체중</td>
								<td><input name="pet_weight2" id="pet_weight2"  type="text"  size="15" style="height:30;">&nbsp;Kg</td>
								<td>성별</td>
								<td>
									<select name="pet_gender2" id="pet_gender2"  style="width:80%;">
										<option>여아</option>
										<option>남아</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>사진등록</td>
								<td colspan="3">
									<input type="file" name="pet_photo2" id="pet_photo2"  ><br>
									<span>- 권장 : 300*300pixels 이상 (jpg/gif/png 파일만 업로드)</span><br>
									<span>- 1Mb 이하의 용량만 업로드 가능</span>
								</td>
							</tr>
							
						</table>
						<table id="joinOption3" class="joinOption">
							<tr>
								<td>이름</td>
								<td style="width:40%;">
									<input name="pet_name3" id="pet_name3"  type="text" size="30" style="height:30;">
								</td>
								<td>출생일</td>
								<td>
									<select name="pet_year3" id="pet_year3"  class="year">
										<option value="none">선택</option>
									</select>년
									<select name="pet_month3" id="pet_month3"  class="month">
										<option value="none">선택</option>
									</select>월
									<select name="pet_day3" id="pet_day3"  class="day">
										<option value="none">선택</option>
									</select>일
									<input type="hidden" name="pet_birthday3" id="pet_birthday3">
								</td>
							</tr>
							
							<tr>
								<td>견종</td>
								<td colspan="3">
									<select class="dog_type_sel" id="dog_type_sel3" onchange="goChangeDogType('3')">
										<option value="none">선택</option>
									</select>
									<input id="pet_type3" name="pet_type3" type="text"  size="20" style="height:30;margin-right: 30px;">
									중성화 여부
									<select name="pet_neutral3" id="pet_neutral3" >
										<option value="1">유</option>
										<option value="0">무</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>체중</td>
								<td><input name="pet_weight3" id="pet_weight3"  type="text"  size="15" style="height:30;">&nbsp;Kg</td>
								<td>성별</td>
								<td>
									<select name="pet_gender3" id="pet_gender3"  style="width:80%;">
										<option>여아</option>
										<option>남아</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>사진등록</td>
								<td colspan="3">
									<input type="file" name="pet_photo3" id="pet_photo3"  ><br>
									<span>- 권장 : 300*300pixels 이상 (jpg/gif/png 파일만 업로드)</span><br>
									<span>- 1Mb 이하의 용량만 업로드 가능</span>
								</td>
							</tr>
							
						</table>
						<table id="joinOption4" class="joinOption">
							<tr>
								<td>이름</td>
								<td style="width:40%;">
									<input name="pet_name4" id="pet_name4"  type="text" size="30" style="height:30;">
								</td>
								<td>출생일</td>
								<td>
									<select name="pet_year4" id="pet_year4"  class="year">
										<option value="none">선택</option>
									</select>년
									<select name="pet_month4" id="pet_month4"  class="month">
										<option value="none">선택</option>
									</select>월
									<select name="pet_day4" id="pet_day4"  class="day">
										<option value="none">선택</option>
									</select>일
									<input type="hidden" name="pet_birthday4" id="pet_birthday4">
								</td>
							</tr>
							
							<tr>
								<td>견종</td>
								<td colspan="3">
									<select class="dog_type_sel" id="dog_type_sel4" onchange="goChangeDogType('4')">
										<option value="none">선택</option>
									</select>
									<input id="pet_type4" name="pet_type4" type="text"  size="20" style="height:30;margin-right: 30px;">
									중성화 여부
									<select name="pet_neutral4" id="pet_neutral4" >
										<option value="1">유</option>
										<option value="0">무</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>체중</td>
								<td><input name="pet_weight4" id="pet_weight4"  type="text"  size="15" style="height:30;">&nbsp;Kg</td>
								<td>성별</td>
								<td>
									<select name="pet_gender4" id="pet_gender4"  style="width:80%;">
										<option>여아</option>
										<option>남아</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>사진등록</td>
								<td colspan="3">
									<input type="file"  name="pet_photo4" id="pet_photo4" ><br>
									<span>- 권장 : 300*300pixels 이상 (jpg/gif/png 파일만 업로드)</span><br>
									<span>- 1Mb 이하의 용량만 업로드 가능</span>
								</td>
							</tr>
							
						</table>
						<table id="joinOption5" class="joinOption">
							<tr>
								<td>이름</td>
								<td style="width:40%;">
									<input name="pet_name5" id="pet_name5"  type="text" size="30" style="height:30;">
								</td>
								<td>출생일</td>
								<td>
									<select name="pet_year5" id="pet_year5"  class="year">
										<option value="none">선택</option>
									</select>년
									<select name="pet_month5" id="pet_month5"  class="month">
										<option value="none">선택</option>
									</select>월
									<select name="pet_day5" id="pet_day5"  class="day">
										<option value="none">선택</option>
									</select>일
									<input type="hidden" name="pet_birthday5" id="pet_birthday5">
								</td>
							</tr>
							
							<tr>
								<td>견종</td>
								<td colspan="3">
									<select class="dog_type_sel" id="dog_type_sel5" onchange="goChangeDogType('5')">
										<option value="none">선택</option>
									</select>
									<input id="pet_type5" name="pet_type5" type="text"  size="20" style="height:30;margin-right: 30px;">
									중성화 여부
									<select name="pet_neutral5" id="pet_neutral5" >
										<option value="1">유</option>
										<option value="0">무</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>체중</td>
								<td><input name="pet_weight5" id="pet_weight5"  type="text"  size="15" style="height:30;">&nbsp;Kg</td>
								<td>성별</td>
								<td>
									<select name="pet_gender5" id="pet_gender5"  style="width:80%;">
										<option>여아</option>
										<option>남아</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>사진등록</td>
								<td colspan="3">
									<input type="file" name="pet_photo5" id="pet_photo5"  ><br>
									<span>- 권장 : 300*300pixels 이상 (jpg/gif/png 파일만 업로드)</span><br>
									<span>- 1Mb 이하의 용량만 업로드 가능</span>
								</td>
							</tr>
							
						</table>
					</div>
					
					<div id="joinOptionBtns">
						<button type="button" id="OptionDel" style="color:white;background:#e60000;">삭제</button>
						<button type="button" id="OptionAdd" style="color:white;background:gray;">추가</button>
					</div>
					
					
				<!-- 약관 동의하기 -->	
					<div id="joinAgree">
						<table>
							<tr >
								<td colspan="2" style="padding-left: 20px;" ><input type="checkbox" id="agree1" onchange="goChangeAll();">&nbsp;<label for="agree1">전체동의</label></td>
							</tr>
							
							<tr >
								<td>
									<input id="agree2" class="agreeCB" type="checkbox">&nbsp;<label for="agree2">이용약관</label><button type="button" class="agreeBtn">내용보기</button>
								</td>
								<td>
									<input id="agree3" class="agreeCB" type="checkbox">&nbsp;<label for="agree3">개인정보 수집 및 이용 안내</label><button type="button" class="agreeBtn">내용보기</button>
								</td>
							</tr>
							
							<tr >
								<td colspan="2">
									<input id="agree4" class="agreeCB" type="checkbox">&nbsp;<label for="agree4">마케팅 수신동의</label>
									(&nbsp;<input id="agree5" class="agreeCB" type="checkbox"><label for="agree5">이메일</label>
									&nbsp;&nbsp;&nbsp;<input id="agree6" class="agreeCB" type="checkbox"><label for="agree6">SMS</label>&nbsp;)<br>
									<div style="margin-top: 8px;font-size:90%;">
										쇼핑몰에서 제공하는 신상품 소식/ 할인쿠폰을 무상으로 보내드립니다!<br>
										단, 상품 구매 정보는 수신동의 여부 관계없이 발송됩니다.<br>
										<span style="font-weight:bold;">제공 동의를 하지 않으셔도 서비스 이용에는 문제가 없습니다.</span>
									</div> 
								</td>
							</tr>
						</table>
					</div>
					
					<div style="text-align: center;margin: 20px 0 25px 0;">
						<button id="submitBtn" style="font-size: 120%; background:#0099cc;color:white;border:none;font-weight:bold;padding:5px 20px;">
							동의하고 가입완료
						</button>
					</div>
					
				</form>
				
				<div id="agreeContent">
					<div style="font-size:110%;font-weight: bold;">이용약관</div>
					<iframe src="" height="300" style="width:100%;"></iframe>
					
					<div style="margin-top: 50px;">
						<div style="font-size:110%;font-weight: bold;">개인정보 수집 , 이용</div>
						<table>
							<tr>
								<td>구분</td>
								<td>목적</td>
								<td>항목</td>
								<td>보유기간</td>
							</tr>
							<tr>
								<td>필수정보</td>
								<td>회원제 서비스 이용 / 본인확인</td>
								<td>
									이름, 아이디, 비밀번호, 생일, 성별,<br>
									 이메일, 주소, 연락처, 휴대폰, <br>
									 PET생년월일
								 </td>
								<td>회원탈퇴 후 5일까지</td>
							</tr>
							<tr>
								<td>선택정보</td>
								<td>마케팅 활용(이벤트, 맞춤형 광고)</td>
								<td>휴대폰, 이메일, 쿠키정보</td>
								<td>회원탈퇴 후 5일까지</td>
							</tr>
						</table>
					</div>
					
					<div style="margin-top: 50px;font-size:90%;font-weight: bold;">
						귀하께서는 쇼핑몰에서 위와 같이 수집하는 개인정보에 대해, 동의하지 않거나 개인정보를 기재하지 않음으로써 거부할 수 있습니다.<br>
						다만, 이때 회원에게 제공되는 서비스가 제한될 수 있습니다.
					</div>
				</div>
			
			</div>
			
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/footer_dog.jsp"/>