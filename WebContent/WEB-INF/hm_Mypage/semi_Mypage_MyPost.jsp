<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<jsp:include page="../header_dog.jsp"/>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/hm/style.css" /> 
<div id="login_container">
<h1 class="hm_h1">마이페이지</h1>
<jsp:include page="semi_Mypage_Submenu.jsp"/>

<script type="text/javascript">
	$("#subtabli8 > a").addClass('subtabClick');
	$(".subTab").hide();
	$("#tab2").addClass("tabClick")
	$(".subTab:eq(1)").show();
	$("#top_comment").html("Home>Mypage>내 게시글");
</script>

<table class="table" style="border-top: solid 2px gray; border-bottom: solid 1px gray;">
<h4 style="font-weight: bold; margin-top: 40px;">내 게시글</h4>
	<thead class="hm_thead">
		<tr>
			<th>NO.</th>
			<th>BOARD</th>
			<th>SUBJECT</th>
			<th>DATE</th>
			<th>HITS</th>
		</tr>
	</thead>
	<tbody class="hm_tbody">
		<tr>
			<td>1</td>
			<td>게시판</td>
			<td>제목제목제목제목</td>
			<td>2019-11-19</td>
			<td>19</td>
		</tr>
	</tbody>
</table>
</div>
<jsp:include page="../footer_dog.jsp"/>