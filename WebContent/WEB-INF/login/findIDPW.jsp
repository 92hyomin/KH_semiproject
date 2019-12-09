<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@include file="/WEB-INF/header_dog.jsp" %>


<style>

	#find_mainBody {
		width: 90%;
		margin: 0 auto;
		padding: 100px 0 ;
	}
	
	#find_mainBody div form table tr td {
		padding: 7px;
	}
	
	#find_idBody , #find_pwBody {
		display: inline-block;
		width: 49%;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	
	#find_idBody { padding-right:  70px; }
	#find_pwBody { padding-left:  70px; }
	
	#find_pwBody {
		border-left: solid 1px #cccccc;
	}
	
	.find_div1 {
		font-size: 18pt;
		font-weight: bold;
		letter-spacing: -1px;
	}
	
	.find_div2 {
		font-size: 90%;
		color: #a6a6a6;
		letter-spacing: 0.3px;
	}
	
	
	.find_div4 {
		width: 100%;
		height: 50px;
		padding-left: 20px;
		border: solid 1px #a6a6a6;
	}
	
	.find_div4::placeholder {
		color: #a6a6a6;
	}
	
	.find_div5 {
		width: 100%;
		height: 50px;
		padding-left: 20px;
		border: solid 1px #a6a6a6;
	}
	
	.find_div5::placeholder {
		color: #a6a6a6;
	}
	
	.find_div6 {
		width: 100%;
		height: 50px;
		background-color: white;
		border: solid 1px black;
		font-size:13pt;
		letter-spacing: -1.0px;
		transition: 0.2s;
	}
	
	.find_div6:hover {
		background-color: black;
		color: white;
	}
	
	.find_div7 {
		width: 100%;
		height: 50px;
		background-color: black;
		color: white;
		border: solid 1px black;
		font-size:13pt;
		letter-spacing: -1.0px;
		transition: 0.2s;
	}

	.find_div7:hover {
		background-color: white;
		color: black;
	}

</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		
		// 라디오 버튼 누르면 해당 input 탭만 남아있게 하기
			$("#findByEmail1").attr("checked", true);
			$("#phone1").hide();
			
			$("#findByEmail2").attr("checked", true);
			$("#phone2").hide();
			
			$("#find_idBody .find_div3 input:radio").click(function(){
				
				var value = $(this).val();
				
				$("#tdBy1 input").hide();
				$("#tdBy1 input").val("");
				$("#tdBy1 input:text[name="+value+"]").show();
			});
			
			$("#find_pwBody .find_div3 input:radio").click(function(){
				
				var value = $(this).val();
				
				$("#tdBy2 input").hide();
				$("#tdBy2 input").val("");
				$("#tdBy2 input:text[name="+value+"]").show();
			});
			// end of 라디오 버튼 ----------------------------
		
		
		// 아이디 찾기 버튼 ( submit )
			$("#findId").click(function(){
				
				var user_name = $("#user_name").val().trim();
				
				if(user_name == ""){
					alert("이름을 입력해주세요");
					$("#user_name").focus();
					return;
				}
				
				if($("#findByEmail1").prop("checked") == true ){
					
					var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;  
					var bool = regExp.test($("#email1").val().trim());
					
					if( bool == false){
						alert("이메일 형식에 맞지 않습니다. \n다시 입력해주세요.");
						$("#email1").focus();
						return;
					}
					
				} else if($("#findByPhone1").prop("checked") == true ){
					
					var regExp = /^[0-9]{10,11}$/; 
					var bool = regExp.test($("#phone1").val().trim())
					
					if(bool == false){
						alert("휴대폰 번호를 -를 제외하여 다시 입력해주세요.");
						$("#phone1").focus();
						return;
					}
					
				}
				
				var frm = document.findIdForm;
				frm.action="";
				frm.method = "POST";
				// frm.submit();
				
			}); // end of 아이디 찾기 버튼 --------------
		
		
		// 임시 비밀번호 버튼 ( submit )
			$("#findPw").click(function(){
				
				var user_id = $("#user_id").val().trim();
				
				if(user_id == ""){
					alert("아이디를 입력해주세요");
					$("#user_id").focus();
					return;
				}
				
				if($("#findByEmail2").prop("checked") == true ){
					
					var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					var bool = regExp.test($("#email2").val().trim());
					
					if( bool == false){
						alert("이메일 형식에 맞지 않습니다. \n다시 입력해주세요.");
						$("#email2").focus();
						return;
					}
					
				} else if($("#findByPhone2").prop("checked") == true ){
					
					var regExp = /^[0-9]{10,11}$/; 
					var bool = regExp.test($("#phone2").val().trim())
					
					if(bool == false){
						alert("휴대폰 번호를 -를 제외하여 다시 입력해주세요.");
						$("#phone2").focus();
						return;
					}
					
				}
				
				var frm = document.findPwForm;
				frm.action="";
				frm.method = "POST";
				// frm.submit();
				
			}); // end of 임시 비밀번호 버튼 --------------
		
		
	}); // end of $(document).ready -------------------------------------------------

	
	
	
</script>


<title>아이디/비밀번호 찾기</title>
<div class="col-xs-9 col-md-2"></div>
	<div class="col-xs-9 col-md-8">
	
		<div style="color:gray; float:right; padding: 20px 0;" >Home > 아이디 비밀번호 찾기</div>
		<div style="clear:both; text-align: center; font-weight:bold; font-size: 32pt;
				padding: 40px 0; border-bottom: solid 2px #808080; ">아이디/비밀번호 찾기</div>
		<div id="find_mainBody">
		
			<div id="find_idBody">
				<form name="findIdForm">
					<table>
						<tr>
							<td>
								<span class="find_div1">아이디 찾기</span>
							</td>
						</tr>
						<tr>
							<td style="height: 100px; ">
								<span class="find_div2">회원가입 시, 입력하신 이름 + 이메일 또는 휴대폰 번호로 아이디를 확인하실 수 있습니다.</span>
							</td>
						</tr>
						<tr>
							<td>
								<div class="find_div3">
									<input name="findBy" id="findByEmail1" value="email" type="radio" >&nbsp;<label for="findByEmail1">이메일로 찾기</label>&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="findBy" id="findByPhone1" value="phone" type="radio" >&nbsp;<label for="findByPhone1">휴대폰 번호로 찾기</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input name="user_name" id="user_name" class="find_div4" type="text" placeholder="NAME" autocomplete="off">
							</td>
						</tr>
						<tr>
							<td id="tdBy1">
								<input name="email" id="email1" class="find_div5" type="text" placeholder="E-MAIL" autocomplete="off">
								<input name="phone" id="phone1" class="find_div5" type="text" placeholder="PHONE NUMBER" autocomplete="off">
							</td>
						</tr>
						<tr>
							<td>
								<button id="findId" class="find_div6" type="button">아이디 찾기</button>
							</td>
						</tr>
						<tr>
							<td>
								<button class="find_div7" type="button" onclick="javascript:location.href='<%= ctxPath %>/login/login.dog'">로그인</button>
							</td>
						</tr>
						
					</table>
				</form>
			
			</div>
			
			<div id="find_pwBody">
				<form name="findPwForm">
					<table>
						<tr>
							<td>
								<span class="find_div1">임시 비밀번호 발급</span>
							</td>
						</tr>
						<tr>
							<td style="height: 100px;">
								<span class="find_div2">가입하신 아이디+비밀번호 또는 휴대폰 번호를 입력, 본인인증을 통해 이메일 또는 휴대폰 번호로 임시 비밀번호를 보내드립니다.</span><br>
								<span class="find_div2">확인 후 로그인하셔서 반드시 비밀번호를 변경하시기 바랍니다.</span>
							</td>
						</tr>
						<tr>
							<td>
								<div class="find_div3">
									<input name="findBy" id="findByEmail2" value="email" type="radio" >&nbsp;<label for="findByEmail2">이메일로 찾기</label>&nbsp;&nbsp;&nbsp;&nbsp;
									<input name="findBy" id="findByPhone2" value="phone" type="radio" >&nbsp;<label for="findByPhone2">휴대폰 번호로 찾기</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<input name="user_id" id="user_id" class="find_div4" type="text" placeholder="ID" autocomplete="off">
							</td>
						</tr>
						<tr>
							<td id="tdBy2">
								<input name="email" id="email2" class="find_div5" type="text" placeholder="E-MAIL" autocomplete="off">
								<input name="phone" id="phone2" class="find_div5" type="text" placeholder="PHONE NUMBER" autocomplete="off">
							</td>
						</tr>
						<tr>
							<td>
								<button id="findPw" class="find_div6" type="button">임시 비밀번호 발급</button>
							</td>
						</tr>
						<tr>
							<td>
								<button class="find_div7" type="button" onclick="javascript:location.href='<%= ctxPath %>/login/login.dog'">로그인</button>
							</td>
						</tr>
						
					</table>
				</form>
			</div>
			
		
		</div>
		
	</div>




<jsp:include page="/WEB-INF/footer_dog.jsp"/>