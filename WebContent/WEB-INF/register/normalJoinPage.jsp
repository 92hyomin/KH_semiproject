<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/header_dog.jsp"/>
<title>개인 회원 가입/수정</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
		
		$(".DatePicker").datepicker({
			
			 yearRange: (year-100)+":"+year,
			 changeMonth: true, 
	         changeYear: true,
	         nextText: '다음 달',
	         prevText: '이전 달',
        	 showButtonPanel: true, 
             closeText: '닫기', 
             dateFormat: "yy 년 mm 월 dd 일",
           	 dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
             dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
             monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			
			
			
		}); // end of datepicker --------------------------------
		
		
		
		
		/* 삭제, 추가 버튼 구현하기 */
		
		$("#optionPetCount").val("1");
		
		$("#joinOption2").hide();
		$("#joinOption3").hide();
		$("#joinOption4").hide();
		$("#joinOption5").hide();
		
		var startNum=2;
		
		$("#OptionAdd").click(function(){ 
			
			if( startNum < 6) {
				$("#optionPetCount").val(startNum);
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
					$("#optionPetCount").val((startNum-1));
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
			
		var html = "<option value='골든리트리버'>골든리트리버</option><option value='그레이트 덴'>그레이트 덴</option><option value='그레이하운드'>그레이하운드</option><option value='꼬똥'>꼬똥</option><option value='닥스훈트'>닥스훈트</option><option value='달마티안'>달마티안</option><option value='도벨만'>도벨만</option><option value='도사견'>도사견</option><option value='독일 세퍼드'>독일 세퍼드</option><option value='라브라도리트리버'>라브라도리트리버</option><option value='로트와일러'>로트와일러</option><option value='마스티프'>마스티프</option><option value='말라뮤트'>말라뮤트</option><option value='말티즈'>말티즈</option><option value='바셋하운드'>바셋하운드</option><option value='보르조이'>보르조이</option><option value='보스턴테리어'>보스턴테리어</option><option value='복서'>복서</option><option value='불독'>불독</option><option value='불테리어'>불테리어</option><option value='비글'>비글</option><option value='비숑프리제'>비숑프리제</option><option value='빠삐용'>빠삐용</option><option value='사모예드'>사모예드</option><option value='삽사리'>삽사리</option><option value='세인트 버나드'>세인트 버나드</option><option value='셔틀랜드 쉽독'>셔틀랜드 쉽독</option><option value='소프트 코티드 휘튼 테리어 '>소프트 코티드 휘튼 테리어 </option><option value='슈나우저'>슈나우저</option><option value='스무스 폭스테리어'>스무스 폭스테리어</option><option value='스피츠'>스피츠</option><option value='시베리안허스키'>시베리안허스키</option><option value='시츄'>시츄</option><option value='실키테리어'>실키테리어</option><option value='아메리칸 에스키모 도그'>아메리칸 에스키모 도그</option><option value='아키다'>아키다</option><option value='아프간하운드'>아프간하운드</option><option value='에어데일테리어'>에어데일테리어</option><option value='올드 잉글리쉬 쉽독'>올드 잉글리쉬 쉽독</option><option value='와이어폭스테리어 '>와이어폭스테리어 </option><option value='요크셔테리어'>요크셔테리어</option><option value='잉글리쉬 세터'>잉글리쉬 세터</option><option value='진돗개'>진돗개</option><option value='치와와'>치와와</option><option value='친'>친</option><option value='카디건웰시코기'>카디건웰시코기</option><option value='캐리블루 테리어 '>캐리블루 테리어 </option><option value='코커스파니엘'>코커스파니엘</option><option value='콜리'>콜리</option><option value='퍼그'>퍼그</option><option value='페키니스'>페키니스</option><option value='펨브록 웰시 코기'>펨브록 웰시 코기</option><option value='포메라니언'>포메라니언</option><option value='포인터'>포인터</option><option value='폼피츠'>폼피츠</option><option value='푸들'>푸들</option><option value='푸들(토이)'>푸들(토이)</option><option value='풍산개'>풍산개</option><option value='핀셔'>핀셔</option><option value='기타'>기타</option>";
		
		$(".dog_type_sel").html(html);
		
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
		
		
		<%-- 아이디 중복확인 ( 팝업창에서 결과 확인하고 중복되지 않으면 hidden 창에 입력시키기) --%>
		$("#idCheck").click(function(){
				
				var user_idCheck = $("#user_idCheck").val();
				
				// 아이디 유효성 검사
				var regExp = /^[A-za-z0-9]{5,15}/g;
				var bool = regExp.test(user_idCheck);
				
				if( bool == false) {
					alert("아이디는 영문자, 숫자를 조합하여 5~15자로 입력해주세요.");
					$("#user_idCheck").focus();
					return false;
				}
				
				$.ajax ({
					
					url:"<%= request.getContextPath()%>/register/idDuplicateCheck.dog",
					type: "POST",
					data: {'user_id' : $("#user_idCheck").val()  },
					dataType: "json",
					success: function(json) {
						
						var dupResult = json.dupResult;
						var message = json.message;
						
						alert(message);
						if(dupResult != 1){
						
							$("#user_id").val($("#user_idCheck").val());
						}
						
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
					
				});
				
		}); // end of 아이디 중복확인 ----------------------------------------------
		
		
		<%-- 이메일 중복확인 ( 팝업창에서 결과 확인하고 중복되지 않으면 hidden 창에 입력시키기) --%>
		
		$("#emailCheck").click(function(){
			
			var email = $("#email1").val()+"@"+$("#email2").val();
			
			// 이메일 유효성 검사
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;			
			var bool = regExp.test(email);
			
			if( bool == false){
				
				alert("이메일을 정확히 입력해주세요.");
				$("#email1").focus();
				
				return false;
			}
			
			$.ajax ({
				
				url:"<%= request.getContextPath()%>/register/emailDuplicateCheck.dog",
				type: "POST",
				data: {'email' : $("#email1").val()+"@"+$("#email2").val()  },
				dataType: "json",
				success: function(json) {
					
					var dupResult = json.dupResult;
					var message = json.message;
					
					alert(message);
					if(dupResult != 1){
					
						$("#email").val($("#email1").val()+"@"+$("#email2").val());
					}
					
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
				
			});
			
			
		}); // end of 이메일 중복확인 -----------------------------------------------

		
		
		
		
		
		/*======================================= 유효성 검사하기 ============================= */
		
		$("#submitBtn").click(function(){  
			
		
			
		/* 사람  생년월일 히든창에 넣기 */	
			
			var user_birthday = $("#birthdayInput").val().replace(/ /g, '');
			user_birthday = user_birthday.substring(0,4)+user_birthday.substring(5,7)+user_birthday.substring(8,10);
		
			$("#user_birthday").val(user_birthday);
		
		
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
			
			if( user_id == "" || user_id != user_idCheck ){
				
				alert("아이디 중복확인을 다시 해주세요.");
				$("#user_idCheck").focus();
				
				return false;
			}
			
		
		//비밀번호 검사하기 
		
			var user_pw = $("#user_pw").val();
			
			var regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
			
			var bool = regExp.test(user_pw);
			
			if(bool == false){
				alert("비밀번호를 다시 입력해주세요.");
				$("#user_pw").val("");
				return false;
			}
			
			var user_pw2 = $("#user_pw2").val();
			
			if( user_pw2 != user_pw){
				alert("비밀번호를 다시 입력해주세요.");
				$("#user_pw").val("");
				$("#user_pw2").val("");
				
				$("#user_pw").focus();
				
				return false;
			}
		
		// 유저_성별 검사하기
			
			var gender1 = $("#gender1").prop("checked");
			var gender2 = $("#gender2").prop("checked");
			
			if( !(gender1 || gender2)){
				alert("성별을 선택해주세요.");
				$("#gender1").focus();
				
				return false;
			}	
			
			
		// 주소 검사하기 
		
			var postcode = $("#postcode").val();
			var addr1 = $("#addr1").val();
			var addr2 = $("#addr2").val();

			if ( postcode == null || addr1 == null || addr2 == null){
				
				alert("주소를 정확히 입력해주세요.");
				$("#addr2").focus();
				return false;
			}
			
		// 휴대폰 숫자 검사하기
			var phone = $("#phone").val();
		
			var regExp = /^[0-9]{10,11}$/; 
			var bool = regExp.test($("#phone").val().trim())
			
			if(bool == false){
				alert("휴대폰 번호를 -를 제외하여 다시 입력해주세요.");
				$("#phone").focus();
				return;
			}
			
		
		/* 이메일 중복검사 */
			var emailInput = $("#email1").val()+"@"+$("#email2").val();
			var email = $("#email").val();
		
			if( email == "" || emailInput != email ){
				
				alert("이메일 중복확인을 다시 해주세요.");
				$("#email1").focus();
				
				return false;
			}
	
			
			
		// 반려동물 유효성 검사		
		/* 동물 생년월일 히든창에 넣기 */	
			
			for( var i=1; i< 6 ; i++ ){
				
				var pet_birthdaycopy = $("#pet_birthdaycopy"+i).val().replace(/ /g, '');
				
				if( pet_birthdaycopy !=""){
					
					pet_birthdaycopy = pet_birthdaycopy.substring(0,4)
								+pet_birthdaycopy.substring(5,7)
								+pet_birthdaycopy.substring(8,10);
					
					$("#pet_birthday"+i).val(pet_birthdaycopy);
					
				}
			}		
			
		// 동물 체중에 숫자만 들어오게 	
			
			for( var i=1 ; i<6 ; i++){
				
				var pet_weight = $("#pet_weight"+i).val().trim();
								
				if(pet_weight != ""){
					
					var regExp =/^[0-9]/g;
					var bool = regExp.test(pet_weight);
					
					if( bool == false){
						alert("반려동물 체중에 숫자를 입력하세요.");
						$("#pet_weight"+i).focus();
						return false;
					}
					
					if((pet_weight > 200) || (pet_weight <1) ){
						
						alert("반려동물 체중을 정확히 입력해주세요");
						$("#pet_weight"+i).focus();
						return false;
					}
				}
			}
		
		// 동물 이름에 한글 혹은 영문만 들어오게
			for( var i=1 ; i<6 ; i++){
				
				var pet_name = $("#pet_name"+i).val().trim();
				
				if(pet_name != ""){
					
					var regExp = /^[가-힣]+$/;
					var bool1 = regExp.test(pet_name);
					regExp = /[a-zA-Z]/;
					var bool2 = regExp.test(pet_name);
					
					if( bool1 == false && bool2 == false){
						alert("반려동물 이름에 한글 혹은 영문자만 입력하세요.");
						$("#pet_name"+i).focus();
						return false;
					}
				}
			}
			
		
		
		
		// 이용약관, 개인정보 수집에 체크했는지 검사 !
			var agree2 = $("#agree2").prop("checked");
			var agree3 = $("#agree3").prop("checked");
		
			if(!(agree2==true && agree3==true)){
				
				alert("이용약관 및 개인정보 수집 및 이용안내에 체크를 해야 합니다.");
				return false;
			}	
		
			
		/* 제출하기 */	
			var frm = document.memberRegisterForm ;
			frm.action = "<%= request.getContextPath() %>/register/joinEnd.dog";
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
			
				<form name="memberRegisterForm" method="POST" enctype="multipart/form-data"
					style="border-bottom:solid 1px #e6e6e6;">
				
				<!-- 필수 사항 -->
				
					<div id="joinNecessary">
						<table>
							<tr>	
								<td>이름</td>
								<td>
									<input name="user_name" id="user_name" type="text" size="30" maxlength="17" autocomplete="off" />
								</td>
							</tr>
							
							<tr>	
								<td>아이디</td>
								<td>
									<input id="user_idCheck"  type="text" size="30" maxlength="15" autocomplete="off"  />
									<button id="idCheck" type="button">중복확인</button>
								</td>
							</tr>
							
							<tr>	
								<td>비밀번호</td>
								<td>
									<input name="user_pw" id="user_pw"  type="password" size="30" maxlength="30"/>
									<br><span style="font-size:80%;">비밀번호는 최소 8자리에 숫자,영문자,특수문자가 각 1개씩 포함되어야 합니다.</span>
								</td>
							</tr>
							
							<tr>	
								<td>비밀번호 확인</td>
								<td>
									<input id="user_pw2"  type="password" size="30" maxlength="30" />
								</td>
							</tr>
							
							<tr>	
								<td>생년월일</td>
								<td>
									<input type="text" class="DatePicker" id="birthdayInput" readonly />
									
									
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
									<input name="addr2" id="addr2" type="text" size="60" maxlength="80" autocomplete="off">
								</td>
							</tr>
							
							<tr>	
								<td>휴대폰</td>
								<td>
									<input name="phone" id="phone"  type="text" size="30" maxlength="11" autocomplete="off" placeholder="-는 제외하고 입력해주세요.">
								</td>
							</tr>
							
							<tr>	
								<td>이메일</td>
								<td>
									<input id="email1" type="text" size="20" maxlength="50" autocomplete="off">@<input id="email2" type="text" size="30" maxlength="30"><br>
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
				
				<!-- 생년월일 , 이메일 하나로 통합, 중복확인 여부 검사 -->	
					<input type="text" name="user_id" id="user_id" size="30" readonly />
					<input type="text" name="user_birthday" id="user_birthday" readonly>
					<input type="text" name="email" id="email" readonly>
					
				<!-- 옵션 사항 -->	
				
					<div style="text-align: left; font-weight:bold;font-size: 16pt;">나의 반려동물 등록</div>
					<div style="font-size: 90%; text-align: right;font-weight:bold;">
						아래사항은 선택사항입니다.<br>
						<span style="color:red;">반려동물을 등록하시려면 사진을 제외한 아래 사항은 필수로 입력해주셔야 합니다.</span>
					</div>
					<div> 
						<table id="joinOption1" class="joinOption">
							<tr>
								<td>이름</td>
								<td style="width:40%;">
									<input name="pet_name1" id="pet_name1"  type="text" size="30" autocomplete="off" maxlength="10" style="height:30;">
								</td>
								<td>출생일</td>
								<td>
									<input type="text" class="DatePicker" id="pet_birthdaycopy1" readonly/>
									
									
									<input type="hidden" name="pet_birthday1" id="pet_birthday1">
								</td>
							</tr>
							
							<tr>
								<td>견종</td>
								<td style="width:40%;">
									<select class="dog_type_sel" name="pet_type1" id="pet_type1">
										
									</select>
								</td>	
								<td>	
									중성화 여부
								</td>	
								<td>
									<select name="pet_neutral1" id="pet_neutral1" style="width:40%;" >
										<option value="none">선택</option>
										<option value="1">유</option>
										<option value="0">무</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>체중</td>
								<td><input  name="pet_weight1" id="pet_weight1"  type="text"  autocomplete="off" size="15" maxlength="3" style="height:30;">&nbsp;Kg</td>
								<td>성별</td>
								<td>
									<select name="pet_gender1" id="pet_gender1"  style="width:40%;">
										<option value="none">선택</option>
										<option value="1">남아</option>
										<option value="2">여아</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>사진등록<br><br>&lt;선택사항&gt;</td>
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
									<input name="pet_name2" id="pet_name2"  type="text" size="30" autocomplete="off" maxlength="10" style="height:30;">
								</td>
								<td>출생일</td>
								<td>
									<input type="text" class="DatePicker" id="pet_birthdaycopy2" readonly />
									
									<input type="hidden" name="pet_birthday2" id="pet_birthday2">
								</td>
							</tr>
							
							<tr>
								<td>견종</td>
								<td style="width:40%;">
									<select class="dog_type_sel" name="pet_type2" id="pet_type2">
										
									</select>
								</td>	
								<td>	
									중성화 여부
								</td>	
								<td>
									<select name="pet_neutral2" id="pet_neutral2" style="width:40%;" >
										<option value="none">선택</option>
										<option value="1">유</option>
										<option value="0">무</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>체중</td>
								<td><input name="pet_weight2" id="pet_weight2"  type="text"  autocomplete="off" size="15" maxlength="3" style="height:30;">&nbsp;Kg</td>
								<td>성별</td>
								<td>
									<select name="pet_gender2" id="pet_gender2"  style="width:40%;">
										<option value="none">선택</option>
										<option value="1">남아</option>
										<option value="2">여아</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>사진등록<br><br>&lt;선택사항&gt;</td>
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
									<input name="pet_name3" id="pet_name3"  type="text" size="30" maxlength="10" autocomplete="off" style="height:30;">
								</td>
								<td>출생일</td>
								<td>
									<input type="text" class="DatePicker" id="pet_birthdaycopy3" readonly />
									
									<input type="hidden" name="pet_birthday3" id="pet_birthday3">
								</td>
							</tr>
							
							<tr>
								<td>견종</td>
								<td style="width:40%;">
									<select class="dog_type_sel"  name="pet_type3" id="pet_type3">
										
									</select>
								</td>	
								<td>	
									중성화 여부
								</td>	
								<td>
									<select name="pet_neutral3" id="pet_neutral3" style="width:40%;" >
										<option value="none">선택</option>
										<option value="1">유</option>
										<option value="0">무</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>체중</td>
								<td><input name="pet_weight3" id="pet_weight3"  type="text"  size="15" autocomplete="off" maxlength="3" style="height:30;">&nbsp;Kg</td>
								<td>성별</td>
								<td>
									<select name="pet_gender3" id="pet_gender3"  style="width:40%;">
										<option value="none">선택</option>
										<option value="1">남아</option>
										<option value="2">여아</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>사진등록<br><br>&lt;선택사항&gt;</td>
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
									<input name="pet_name4" id="pet_name4"  type="text" size="30" autocomplete="off" maxlength="10" style="height:30;">
								</td>
								<td>출생일</td>
								<td>
									<input type="text" class="DatePicker" id="pet_birthdaycopy4" readonly />
									
									<input type="hidden" name="pet_birthday4" id="pet_birthday4">
								</td>
							</tr>
							
							<tr>
								<td>견종</td>
								<td style="width:40%;">
									<select class="dog_type_sel"  name="pet_type4" id="pet_type4">
										
									</select>
								</td>	
								<td>	
									중성화 여부
								</td>	
								<td>
									<select name="pet_neutral4" id="pet_neutral4" style="width:40%;" >
										<option value="none">선택</option>
										<option value="1">유</option>
										<option value="0">무</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>체중</td>
								<td><input name="pet_weight4" id="pet_weight4"  type="text"  autocomplete="off" size="15" maxlength="3" style="height:30;">&nbsp;Kg</td>
								<td>성별</td>
								<td>
									<select name="pet_gender4" id="pet_gender4"  style="width:40%;">
										<option value="none">선택</option>
										<option value="1">남아</option>
										<option value="2">여아</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>사진등록<br><br>&lt;선택사항&gt;</td>
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
									<input name="pet_name5" id="pet_name5"  type="text" size="30" autocomplete="off" maxlength="10" style="height:30;">
								</td>
								<td>출생일</td>
								<td>
									<input type="text" class="DatePicker" id="pet_birthdaycopy5" readonly />
									
									<input type="hidden" name="pet_birthday5" id="pet_birthday5">
								</td>
							</tr>
							
							<tr>
								<td>견종</td>
								<td style="width:40%;">
									<select class="dog_type_sel" name="pet_type5" id="pet_type5">
										
									</select>
								</td>	
								<td>	
									중성화 여부
								</td>	
								<td>
									<select name="pet_neutral5" id="pet_neutral5" style="width:40%;" >
										<option value="none">선택</option>
										<option value="1">유</option>
										<option value="0">무</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>체중</td>
								<td><input name="pet_weight5" id="pet_weight5"  type="text"  size="15" autocomplete="off" maxlength="3" style="height:30;">&nbsp;Kg</td>
								<td>성별</td>
								<td>
									<select name="pet_gender5" id="pet_gender5"  style="width:40%;">
										<option value="none">선택</option>
										<option value="1">남아</option>
										<option value="2">여아</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<td>사진등록<br><br>&lt;선택사항&gt;</td>
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
				<%-- 반려동물 옵션 넘어가는 갯수 --%>	
					<input type="text" name="optionPetCount" id="optionPetCount" style="display:none;" >
					
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
									(&nbsp;<input name="alert_email" id="agree5" value="1" class="agreeCB" type="checkbox"><label for="agree5">이메일</label>
									&nbsp;&nbsp;&nbsp;<input name="alert_sms" value="1" id="agree6" class="agreeCB" type="checkbox"><label for="agree6">SMS</label>&nbsp;)<br>
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