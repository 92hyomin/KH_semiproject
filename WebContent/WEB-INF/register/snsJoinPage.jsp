<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/header_dog.jsp"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<% 
	String user_sns = request.getParameter("user_sns");
	String email = request.getParameter("email");
%>

<title>SNS 간편가입</title>
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
	
	#snsJoinNecessary {
	
		margin: 20px 0 ;
	}
	
	#snsJoinNecessary input {
		font-weight: bold;
		padding: 10px 0 10px 15px;
		font-size: 110%;
	}
	
	
	#joinAgree table tr {
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
		
		// 넘어온 SNS 정보를 받아서 email input 창에 넣기 
		var emailInput = "<%= email%>";
		$("#email").val(emailInput);
		
		var snsInput = "<%= user_sns %>";
		$("#user_sns").val(snsInput);
		
		
		
		/* 내용보기 클릭하면 이용약관 탭 이동 */
		
		$('.agreeBtn').click(function(){

			var offset = $('#agreeContent').offset(); 

	        $('html').animate({scrollTop : offset.top}, 400);

		});
		/* 끝 */
		
		
		/* 약관 체크박스들 */
		
		/* 마케팅 수신동의 */
		$("#agree4").click(function(){
			
			var agree4 = $("#agree4").prop("checked");
			
			if(agree4 == true){
				$("#agree5").prop("checked",true);
				
			}
			else{
				$("#agree5").prop("checked",false);
				$("#agree1").prop("checked",false);
			}
			
		}); 
		
		$("#agree5").click(function(){
			
			var agree5 = $("#agree5").prop("checked");
			
			if(agree5 ) $("#agree4").prop("checked",true);
			else  $("#agree4").prop("checked",false);
			
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
			
		});
		
		/* 끝 */
		
		
		
		
		/*======================================= 유효성 검사하기 ============================= */
		
		$("#submitBtn").click(function(){  
		
			var user_name = $("#user_name").val().trim();
			var email = $("#email").val().trim();
			
			if(!(user_name != "" && email !="")){
				
				alert("이름과 이메일은 필수 사항입니다.");
				$("#user_name").focus();
				
				return false;
			}
			
			// 이름에 특수문자 기입하지 않도록 하기
			var regExp = /^[가-힣]+$/;
			var bool1 = regExp.test(user_name);
			regExp = /[a-zA-Z]/;
			var bool2 = regExp.test(user_name);
			
			if(bool1 == false && bool2 == false){
				
				alert("이름은 한글 혹은 영문자만 가능합니다.");
				$("#user_name").focus();
				
				return false;
			}
			
			// 동의 사항에 체크 받기
			var agreeAge = $("#agreeAge").prop("checked");
			var agree2 = $("#agree2").prop("checked");
			var agree3 = $("#agree3").prop("checked");
		
			if( !(agreeAge && agree2 && agree3) ){
				
				alert("동의 사항에 체크를 해주셔야 합니다.");
				
				return false;
			}
			
			var frm = document.snsMemberRegisterForm;
			frm.submit();
			
		});
		
		
	}); // end of $(document).ready ----------------------------------------------------------------------

	
	
	function goChangeAll(){
		
		var agree1 = $("#agree1").prop("checked");
		
		
		if(agree1 == true){
			
			$("#agree2").prop("checked", true);
			$("#agree3").prop("checked", true);
			$("#agree4").prop("checked", true);
			$("#agree5").prop("checked", true);
			
		}
		else {
			$("#agree2").prop("checked", false);
			$("#agree3").prop("checked", false);
			$("#agree4").prop("checked", false);
			$("#agree5").prop("checked", false);
			
		}
			
		
	} // end of goChangeAll ----------------------------------------
	
	
	
	
</script>


<div id="body_container">
	<div class="col-xs-9 col-md-2"></div>
	<div class="col-xs-9 col-md-8">
		<div id="body_navi">Home &gt; Mypage &gt; 회원 정보 입력</div>
		<div id="body_body">
			<div id="body_title">회원정보입력</div>
			
			
			<div id="body_joinbody">
			
				<form name="snsMemberRegisterForm" method="POST" 
					action="<%= request.getContextPath() %>/register/joinEnd.dog" 
					style="border-bottom:solid 1px #e6e6e6; ">
				
				<!-- SNS 에서 받아온 이름, 이메일 정보 -->
					<div style="font-size: 150%; font-weight: bold;margin-top:30px;">SNS 간편 가입</div>
					<div style="font-weight:bold; text-align: right;color:red;">이름과 이메일은 필수 항목입니다.</div>
					<div id="snsJoinNecessary">
						<table>
							<tr>
								<td><input name="user_name" id="user_name" style="width:100%" placeholder="이름"/></td>
							</tr>
							
							<tr>
								<td><input name="email" id="email" style="width:100%" placeholder="이메일 주소" readonly/></td>
							</tr>
							
						</table>
						
					</div>
					
				<%-- hidden 창 --%>	
					<input type="hidden" name="user_id" id="user_id">
					<input type="hidden" name="user_sns" id="user_sns">
				<!-- 14세 이상입니다. -->
					<div style="margin-bottom: 20px;">
						<input id="agreeAge" type="checkbox"> <span><label for="agreeAge" style="font-size:110%;color: blue;">14세 이상입니다. (필수)</label></span>
						<br><span style="font-size:90%;">회원가입에 필요한 최소한의 정보만 입력받음으로써, 고객님의 개인정보 수집을 최소화하고 편리한 회원가입을 제공합니다.</span>
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
									(&nbsp;<input name="alert_email" id="agree5" class="agreeCB" type="checkbox"><label for="agree5">이메일</label>)<br>
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