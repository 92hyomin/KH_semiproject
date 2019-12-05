<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<style type="text/css">
#tab_menu{
	margin-bottom: 25px;
}

td.tab{
	border: solid 1px silver;
	width: 50%;
	margin: 0 auto;
	text-align: center;
	height: 50px;
	cursor: pointer;
	color: silver;
}

.orderTabTbl, .orderTbl{
	width: 100%;
	border-spacing: 0;
	border-collapse: collapse;
}

.orderTbl tr td{
	border: solid 1px gray;
	padding-left: 10px;
	font-size: 9pt;
}
.orderTbl tr th{
	border: solid 1px gray;
	width: 15%;
	background-color: #e6e6e6;
	font-size: 10pt;
	padding-left: 10px;
}

td.active{
	color: black;
	border-bottom: solid 3px black;
}

.tblText{
	font-weight: bold;
	font-size: 11pt;
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#menu2").hide();
	$(".tab").click(function(){
		$(".tab").removeClass("active");
		$(this).addClass("active");
		$(".tabContent").hide();
		var menubar = ("#menu"+($(this).index()+1));
		$(menubar).show();
	});
});

</script>
<head>
<meta charset="EUC-KR">
<title>�ֹ���ȸ</title>
</head>
<body>
<div id="topArea" style="margin-bottom: 10px;">
	<div style="float: left;">
		<span style="font-weight: bold; font-size: 16pt;">�ֹ�����</span>
	</div>
		<div style="text-align: right; padding-top: 10px;">
		<span style="font-size: 9pt;"><strong id="name">[�̸�]</strong>�Բ��� <strong id="date">[��¥]</strong>�� �ֹ��Ͻ� �����Դϴ�</span>
	</div>
</div>

	<div id="tab_menu">
		<table class="orderTabTbl">
		<tr style="border: solid 1px red;">
			<td class="tab active" >�ֹ��󼼳���</td>
			<td class="tab" >��ǰ�ı���</td>
		</tr>
		</table>
	</div>
	
	<div class="tabContent" id="menu1" >
	
		<span class="tblText">�ֹ���</span>
		<table class="orderTbl" style="text-align: left;">
			<tr>
				<th>�ֹ���ȣ</th>
				<td>201912040001</td>
				<th>�ֹ�����</th>
				<td>2019.12.04</td>
			</tr>
			<tr>
				<th>�ֹ���</th>
				<td>[�̸�]</td>
				<th>�ֹ��� �Ա���Ȳ</th>
				<td>�ԱݿϷ�</td>
			</tr>
			<tr>
				<th>�ֹ��޸�</th>
				<td colspan="4">[�޸�]</td>
			</tr>
		</table>
		<br/><br/>
		
		<span class="tblText">�����</span>
		<table class="orderTbl" style="text-align: left;">
			<tr>
				<th>��۹�ȣ</th>
				<td>S-191204-0001</td>
				<th>�����ȣ</th>
				<td>1234-5678</td>
			</tr>
			<tr>
				<th>������</th>
				<td>[�������̸�]</td>
				<th>����ó</th>
				<td>[����ó]</td>
			</tr>
			<tr>
				<th>�ּ�</th>
				<td colspan="4">[�ּ�]</td>
			</tr>
			<tr>
				<th>��۸޼���</th>
				<td colspan="4">[�޼���]</td>
			</tr>
		</table>
		<br/><br/>
		
		<span class="tblText">�ֹ���ǰ</span>
		<table class="orderTbl">
		
		<thead>
			<tr>
				<th colspan="2" style="width:40%">�ֹ���ǰ����</th>
				<th style="width:15%">��ǰ���ֹ���ȣ</th>
				<th style="width:6%">����</th>
				<th style="width:8%">����</th>
				<th style="width:8%">����</th>
				<th style="width:10%">ó������</th>
				<th style="width:12%">��۹�ȣ</th>
			</tr>
		</thead>
			<tr>
				<td><img alt="img" src="../hm_img/product.png" width="50px" height="50px"></td>
				<td width="290px">������ �׷������� ���캣��ũ�� ���Ʈ 50g X 3��</td>
				<td>201912040001</td>
				<td>[����]</td>
				<td>[����]</td>
				<td>[�����ݾ�]</td>
				<td>��ǰ�غ�</td>
				<td>S-191204-0001</td>
			</tr>
		</table>
	</div>
	
	<div class="tabContent" id="menu2" >
		��ǰ�ı��ǰ�ı��ǰ�ı��ǰ�ı��ǰ�ı��ǰ�ı��ǰ�ı��ǰ�ı��ǰ�ı�
	</div>
</body>
</html>