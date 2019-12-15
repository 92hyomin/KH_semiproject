<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../header_dog.jsp"/>

<style type="text/css">
	.purchaseMenu {

		 display: inline-block;
		
    	 
	}
	
	.cate2 {
		display: inline-block;
		font-family: 'Notokr', sans-serif;
  		color: #b3b3b3;
  		font-size: 13px;
	}
	
	.cate3 {
		border: solid 1px gray;
		width: 2%;
		text-align: center;
		height: 50px;
		font-family: 'Notokr';
		font-size: 15px;
    	color: #777;
	}
	
	.pageBar {
		clear: both;
		margin: 4% 0;
	}
	
	.Ha_img {
		width:100%;
	}
	
	.Ha_content {
		display: inline-block;
		width: 50%;
		border: 1px solid #ebebeb;
		margin-bottom: 5%;
		padding-bottom: 3%;
	}
		
	.prd_name {
		font-family: 'Notokr', sans-serif;
 	    font-size: 15px;
        color: #1c1c1c;
	}
	
	.prd_price {
		 color: #000;
   		 font-size: 15px;
  	 	 font-family: 'Lato', sans-serif;
  	 	 margin-top: 10%;
  	 	 margin-bottom: 10%;
	}
	
	.Ha_inline {
		display: inline-block; 
		font-size: 12px; 
		font-family: 'Notokr';
		color: #858585; 
	}
	
	.Ha_content_container {
		margin-bottom: 3%;
	}
	
	.Ha_mabo2 {
		margin-bottom: 2%;
	}
	
	.td_left {
		text-align: left;
	}
	
	.ha_weight { 
		font-weight: 100;
	}
	
	.error {
		color: red;
	}
	
</style>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.11.4.custom/jquery-ui.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.11.4.custom/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$(".error").hide();
		
		if("${requestScope.insert}"!=""){
			alert("${requestScope.insert}");
		}
		
		$(".spinner").spinner();
		
		$(".spinnerAttach").bind("spinstop", function(){
			var html = "";
			var cnt = $(this).val();
			
			if(cnt == "0") {
				$("#divfileattach").empty();
				$("#attachCount").val("");
				return;
			}
			else {
				for(var i=0; i<parseInt(cnt); i++) {
					html += "<br><input type='file' name='attach"+i+"'/>";
				}
				$("#divfileattach").empty();
				$("#divfileattach").append(html);
				$("#attachCount").val(cnt);
			}
		
			
		});// spinstop
		
		$(".Ha_price").keydown(function(event){
			if(event.keyCode==13){
				$("#Ha_writeBtn").click();
				
				//return false 다른 명령 없이 위의 명령만 실행함 
			}
		}); 
		
	$("#Ha_writeBtn").click(function(){
		
		var flag = false;
		
		$(".regiData").each(function(){
			var val = $(this).val().trim();
			if(val==""||val==0) {
				$(this).next().show();
				flag = true;
				return;
			}// if
		}); // each

		if(!flag) {
			var frm = document.contentWritefrm;
			frm.method="POST";
			frm.action="<%= ctxPath %>/purchase/purchaseInsert.dog";
			frm.submit();
		}
				
		}); // click
	}); // ready
</script>

<div style="width:80%; margin: 0 auto;">
	<div>
		<a href="#">
			<img style="width: 100%;" src="http://harimpetfood.godohosting.com/event/princecogi/PC_prince.jpg">
		</a>
	</div>
	<div style="margin: 20px 0px;">
		<div style="text-align: right;">
			<div class="Ha_inline" id="prd_write">글쓰기 ></div>
			<div class="Ha_inline">홈 ></div>
			<div class="Ha_inline">브랜드별</div>
		</div>
		<div style="font-family: 'Notokr'; font-size: 46px; text-align: center; font-weight: bold;">
			제품등록
		</div>
	</div>
	
	<div style="text-align: center;">
		<div class='Ha_content'> 
			<div> 			 
				<img class='Ha_img' src='http://www.harimpetfood.com/shopimages/harimpet/0010020000032.jpg?1560151945'>  												<!-- 기본이미지와 파일첨부 -->	
			</div> 
			<form name="contentWritefrm" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th>브랜드</th>
					<td class="td_left">
						<select name="Ha_brand">
							<option value="1">네추럴 발란스</option>
							<option value="2">아미오</option>
							<option value="3">바우와우</option>
							<option value="4">이즈칸</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>고기</th>
					<td class="td_left">
						<select name="Ha_meat">
							<option value="1">닭</option>
							<option value="2">소</option>
							<option value="3">연어</option>
							<option value="4">양</option>
							<option value="5">오리</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>수량</th>
					<td class="td_left">
						<input class="spinner regiData" value="0" name="quantity" style="width: 30px; height: 20px;" min="0" max="1000">
						<span class="error">필수입력!!</span>
					</td>
				</tr>
				<tr>
					<th>식감</th>
					<td class="td_left">
						<input id="wet" type="radio" value="1" name="texture" class="regiData"><label class="ha_weight" for="wet">습식</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="dry" type="radio" value="2" name="texture" class="regiData"><label class="ha_weight" for="dry">건식</label>
						<span class="error">필수입력!!</span>
					</td>
				</tr>
				<tr>
					<th>연령</th>
					<td class="td_left">
						<input id="ha_puppy" type="radio" value="1" name="age" class="regiData"><label class="ha_weight" for="ha_puppy">퍼피</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="ha_adult" type="radio" value="2" name="age" class="regiData"><label class="ha_weight" for="ha_adult">어덜트</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="ha_senior" type="radio" value="3" name="age" class="regiData"><label class="ha_weight" for="ha_senior">시니어</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input id="ha_dry" type="radio" value="4" name="age" class="regiData"><label class="ha_weight" for="ha_allage">전연령</label>
						<span class="error">필수입력!!</span>
					</td>
				</tr>
				<tr>
					<th>용량(g)</th>
					<td class="td_left">
						<input class="regiData" type="text" name="capacity" placeholder="ex)300" size="40">
						<span class="error">필수입력!!</span>
					</td>
				</tr>
				<tr>
					<th>썸네일 사진</th>
					<td class="td_left">
						<input class="regiData" type="file" name="mainImg" />
						<span class="error">필수입력!!</span>
					</td>
				</tr>
				<tr>
					<th>내용 사진</th>
					<td class="td_left">
						<input class="spinner spinnerAttach regiData" value="0" style="width: 30px; height: 20px;" min="0" max="1000">
						<span class="error">필수입력!!</span>
						<div id="divfileattach"></div>
       					<input type="hidden" name="attachCount" id="attachCount"/> 
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td class="td_left">
						<input class="regiData" name="Ha_title" type="text" placeholder="ex)더리얼  레시피 캐롭바나나케이크 300g" size="40" />
						<span class="error">필수입력!!</span>
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td class="td_left">
						<input class="regiData" name="Ha_price" type="text" placeholder="ex)11000" size="40" />
						<span class="error">필수입력!!</span>
					</td>
				</tr>
				<tr>
					<th>제품이 샘플일시 체크해제</th>
					<td class="td_left"><input type="checkbox" name="sample" value="1" checked="checked"></td>
				</tr>
				<tr>
					<td colspan="2"><span id="Ha_writeBtn" style="display: inline-block; width: 50px; border: solid 1px black; text-align: center; border-radius: 15px; color: white; background-color: black; font-size: 9pt; cursor: pointer; margin-left: 20px;">확인</span></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</div>
					
<jsp:include page="../footer_dog.jsp"/>