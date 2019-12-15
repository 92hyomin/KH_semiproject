<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	.top .title {
		padding: 33px 0 33px 0;
		font-size: 33px;
		text-align: center;
		font-weight: bold;
	}
	
	.top .nav {
		text-align: right;
	}
	
	.nav a{
		text-decoration: none;
		font-family: 'Notokr', sans-serif;
    	color: #858585;
	}
	
	.sub1 {
		width: 25%;
		height: 50px;
		border: solid 1px #eee;
		text-align: center;
		float: left;
		margin: 30px 0 30px 0;
		line-height: 50px;
	}
	
	.contentImg {
		width: 100%;
		height: 200px;
	}
	
	.item-list {
		display: inline-block;
		width: 22%;
		text-align: center;
		border: solid 1px #e5e5e5;;
		margin: 0px 10px 50px 10px;
		padding: 0;
	}
	
	.mid {
		overflow: hidden;
		width: 1200px;
	}
</style>
<jsp:include page="../header_dog.jsp"/>
	<div class="container">
		<div class="top">
			<div class="nav">
				<a href="<%= ctxPath %>/contentWrite.up">글쓰기 > </a>					
				<a href="/">홈</a>
				<a href="<%= ctxPath %>/habin.up"> > 브랜드별	</a>
			</div>
			<div class="title">상품후기</div>
		</div>
		<div class="top-sub">
			<div class="sub1">추천순</div>
			<div class="sub1">최신순</div>
			<div class="sub1">평점순</div>
			<div class="sub1">검색어</div>
		</div>
		<div class="mid">
			${contents}
		</div>
		
		<div class="bottom">
			<div class="pageBar" style="text-align: center; margin: 15px 0; ">
			${pageBar}
			</div>
		</div>
	</div>
<jsp:include page="../footer_dog.jsp"/>