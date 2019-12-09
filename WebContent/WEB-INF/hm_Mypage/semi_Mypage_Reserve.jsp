<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="../header_dog.jsp"/>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/hm/style.css" /> 
<script>
$(document).ready(function(){
	func_reserveList();
});

function func_reserveList(){
	$.ajax({
		url: "/Semi_Team1/mypage/reserveDisplayJSON.dog",
		dataType: "json",
		success: function(json){
			var html = "";
			
			if(json.length == 0){
				html += "적립금 내역이 없습니다.";
				$("#hm_tbody").html(html);
			}
			
			$.each(json, function(index, item){
				
				html += "<tr>"
					 + "<td>"+item.usedate+"</td>"
					 + "<td>"+item.content+"</td>"
					 + "<td>"+item.reserve+"</td>"
					 + "</tr>";	
			});
			
			$("#hm_tbody").html(html);
			
		},
		error: function(request, status, error){
			alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		}
	});
}

</script>


<div id="login_container">
	<h1 class="hm_h1">마이페이지</h1>
	<jsp:include page="semi_Mypage_Submenu.jsp"/>
	
	<script type="text/javascript">
	
	$("#subtabli2 > a").addClass('subtabClick');
	$(".subTab").hide();
	$("#tab1").addClass("tabClick")
	$(".subTab:first").show();
	$("#top_comment").html("Home>Mypage>적립금 내역");
	
	</script>
	
	<h4 style="font-weight: bold; margin-top: 40px;">적립금 내역</h4>
	<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
		<thead class="hm_thead">
			<tr>
				<th>날짜</th>
				<th>내용</th>
				<th>적립금</th>
			</tr>
		</thead>
		<tbody class="hm_tbody" id="hm_tbody">
			<%-- <tr>
				<td>2019-11-21</td>
				<td>사료1000개 구입</td>
				<td>+50,000원</td>
			</tr> --%>
		</tbody>
	</table>
</div>

<jsp:include page="../footer_dog.jsp"/>