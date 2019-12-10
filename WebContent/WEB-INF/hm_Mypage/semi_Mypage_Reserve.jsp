<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="../header_dog.jsp"/>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/hm/style.css" /> 

<style>
.center {
  text-align: center;
}

.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
  margin: 0 4px;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
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
				<th width="20%">날짜</th>
				<th width="20%">적립금</th>
				<th width="60%">내용</th>
			</tr>
		</thead>
		<tbody class="hm_tbody" id="hm_tbody">
		
		<c:if test="${empty requestScope.reserveList}">
			<tr>
				<td colspan="5">적립금 내역이 없습니다.</td>
			</tr>
		</c:if>
	
		<c:if test="${!empty requestScope.reserveList}">
			<c:forEach var="rvo" items="${requestScope.reserveList}">
				<tr>
					<td>${rvo.usedate }</td>
					<td>${rvo.reserve }</td>
					<td>${rvo.content }</td>
				</tr>
			</c:forEach>
		</c:if>
		
		</tbody>
	</table>
	
	<div class="center">
		<div style="text-align: center;" class="pagination">
			${pageBar}
		</div>
	</div>
</div>

<jsp:include page="../footer_dog.jsp"/>