<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/myPoint.css">


<style>
#pointList > tbody > tr:hover{
	cursor:pointer;
	background-color:rgb(241, 241, 241);
}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<jsp:include page="myMenuBar.jsp" />
		</div>
		
		<div class="content">
			<div class="topBlock">알림</div>
			
			
			<div class="block">
				
				
				<table id="pointList">
					<thead>
						<tr>
							<th style="width:140px;">내용</th>
							<th style="width:50px;">확인여부</th>
							<th style="width:50px;">날짜</th>
						</tr>
					</thead>				
					<tbody>
					
					
					</tbody>
				</table>
				<br><br>
				
			</div>
			
			<script>
				
				let sortType = '';
				let sort = ''; // 게시판 or 스터디밴드 구분용 빈문자열 선언 
				let status = '';
	
				var memberId = '${loginMember.memberId}';
				console.log(memberId);
				
				$(function(){
					AlarmList(); // 알림내역
				}); 
				
				// 알림 내역
				function AlarmList(){

					$.ajax({
						url : 'alarmList.me',
						data : { memberId : '${loginMember.memberId}' },
						success : (list) => {
							
							if(list.length == 0){
								
								let result = '<span class="emptyList">등록된 알림이 없습니다.</span>';
								
								$('#pointList tbody').html(result);
								
							}
							else{
								
								comment = {
										'댓글' : '댓글이 달렸습니다.',
										'대댓글' : '대댓글이 달렸습니다.',
										'채택' : '답변이 채택되었습니다.',
										'유저태그' : '게시글에 태그되었습니다.',
										'방장양도' : '방장으로 임명되었습니다.'
								}
								
								let value = '';
								
								for(let i in list){
									//sortType = list[i].alarmSort;
									
									if(list[i].alarmSort == 's'){
										sort = '[게시판]'
									} else {
										sort = '[밴드]'
									};
									
									
									if(list[i].alarmStatus == 'Y'){
										status = '안읽음'
									}else{
										status = '읽음'
									};
									
									
									
									let category = '';
									
									for(var key in comment){ //이거 물어보기 
										if(list[i].alarmCategory == key){
											category = comment[key];
											break;
										}
									}
									value += '<tr>'
										  +	'<td>' + sort + category +  '</td>'
										  + '<td>' + status + '</td>'
										  + '<td>' + list[i].alarmDate + '</td>'
										  + '</tr>'
									
								};
								
								$('#pointList tbody').html(value);
							}
							
						},
						error : () => { console.log('연결실패'); }
					});
				}
			
				
				//알림 클릭시 해당 게시글로 이동
				$(document).on('click','#pointList > tbody > tr', function() {
					
					let board =$(this).children().eq(0).text();//게시판인지 밴드인지
					console.log(board);  //보드넘버
					
				
				
										//보드넘버
			
				});
				
				
			</script>
			
			
		
		</div>
	</div>
 <br><br><br><br><br><br><br><br><br><br><br><br>
 					<jsp:include page="../common/footer.jsp"/>

</body>
</html>