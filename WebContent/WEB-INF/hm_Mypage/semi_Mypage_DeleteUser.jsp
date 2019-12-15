<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header_dog.jsp"/>
<link rel="stylesheet" type="text/css" href="/Semi_Team1/css/hm/style.css" /> 
<% String ctxPath = request.getContextPath(); %>
<script type="text/javascript">
$(document).ready(function(){
	$(".delUserBtn").hover(
			function(){
				$(this).removeClass("delUserBtn");
				$(this).addClass("cancelBtn");
			},
			function(){
				$(this).removeClass("cancelBtn");
				$(this).addClass("delUserBtn");
			});
		
	$(".cancelBtn").hover(
		function(){
			$(this).removeClass("cancelBtn");
			$(this).addClass("delUserBtn");
			$(this).css("color","white");
		},
		function(){
			$(this).removeClass("delUserBtn");
			$(this).addClass("cancelBtn");
			$(this).css("color","#231f20");
		});
	
	$("#delUserBtn").click(function(){
		delMember();		
	});
	
	$("#input_text").on('keyup', function() {
		if($(this).val().length > 300) {
			alert("300자 이내로 입력하세요");
			$(this).val($(this).val().substring(0, 300));
		}
	});

});

function delMember(){
	if(confirm("회원을 탈퇴하시겠습니까?") == true){
		var frm = document.textAreaFrm;
		
		frm.method = "POST";
		frm.action = "deleteUser.dog";
		frm.submit();
	}
}

</script>
<div id="login_container">
<h1 class="hm_h1">마이페이지</h1>
<jsp:include page="semi_Mypage_Submenu.jsp"/>

<script type="text/javascript">
	$("#subtabli11 > a").addClass('subtabClick');
	$(".subTab").hide();
	$("#tab3").addClass("tabClick")
	$(".subTab:eq(2)").show();
	$("#top_comment").html("Home>Mypage>회원탈퇴");
</script>


<h1 class="hm_h1" style="margin-bottom: 20px; margin-top: 100px;">회원정보 탈퇴신청</h1>
<p class="ptxt">
저희 쇼핑몰의 부족했던 점과 아쉬웠던 점을 적어주십시오. 더 좋은 모습으로 발전하도록 최선을 다하겠습니다. <br/>
앞으로 더 나은 모습으로 고객님을 다시 만날 수 있도록 노력하겠습니다. 그동안 이용해주신 것을 진심으로 감사드립니다. <br />
</p>
<form name="textAreaFrm">
	<p class="ptxt" style="color: black;">탈퇴 사유를 적어주시면 쇼핑몰 운영에 적극 반영하겠습니다.</p>
	<textarea class="input_textarea" id="input_text" name="input_text" rows="10" cols="70" ></textarea>
</form>
<div id="btnArea">
	<a class="btn delUserBtn" id="delUserBtn">회원탈퇴</a>
	<a class="btn cancelBtn" id="cancelBtn" href="javascript:history.back()">취소하기</a>
</div>
</div>
<jsp:include page="../footer_dog.jsp"/>