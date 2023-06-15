<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/member/myPageMain.css">
<link rel="stylesheet" href="resources/css/member/grass.css">
	<!-- fullcalendar -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<jsp:include page="myMenuBar.jsp" />
		</div>
		
		<div class="content">
		
			<div id="mb1">
				<div id="mainChar">캐릭터</div>
				<p id="mNick">${ loginMember.nickName }</p>
				<p id="mMail">${ loginMember.memberEmail }</p>
				<button onclick="location.href='profil.me'">수정하기</button>
			</div><!-- 
		 --><div class="balance" id="mb2">
				<h1 id="totalP"></h1>
				<div id="PminiList"></div>
				<button onclick="location.href='point.me'">포인트내역</button>
			</div><!-- 
		 --><div class="balance" id="mb3">
				<h5>알림</h5>
				<div id="AminiList"></div>
				<button onclick="location.href='alarm.me'">자세히보기</button>
			</div><!-- 
		 --><div id="grass">
				<h5>목표 달성(미완)</h5>
				<div id="grassBox">
					<div id="calendar"></div>
				</div>
			</div><!-- 
		 --><div class="balance">
				달력
			</div>
		</div>
	</div>
	
	<script>
		let sortType = '';
		let sort = ''; // 게시판 or 스터디밴드 구분용 빈문자열 선언 
	
		$(function(){
			totalPoint(); // 총 포인트 불러오기
			miniPointList(); // 포인트내역 최신3개
			miniAlarmList(); // 알림내역 최신 5개
			dateFormat();
		}); 
		
		
		// 토탈포인트
		function totalPoint(){
			$.ajax({
				url : 'miniPoint',
				data : { memberId : '${loginMember.memberId}' },
				success : (tp) => {
					$('#totalP').html(tp + 'P');
				},
				error : () => { console.log('연결실패'); }
			}); 
		}
		
		// 포인트 내역 
		function miniPointList(){
			$.ajax({
				url : 'miniPointList',
				data : { memberId : '${loginMember.memberId}' },
				success : (list) => {
					
					let value= '';
					for(let i in list){
						
						let symbol = '';
						if(list[i].pointStatus === 'Y'){ symbol = '+';} 
						else { symbol = '-'; }
						
						value += '<p>'
							   + list[i].pointDetail + '  ' + symbol + list[i].pointScore + '  point'
							   + '</p>';
					}
					
					$('#PminiList').html(value);
					
				},
				error : () => { console.log('연결실패'); }
			});
		}
		
		
		
		// 알림 내역
		function miniAlarmList(){

			$.ajax({
				url : 'miniAlarmList',
				data : { memberId : '${loginMember.memberId}' },
				success : (list) => {
					
					if(list.length == 0){
						console.log('sdjkhffsd');
						
						let result = '<span class="emptyList">등록된 알림이 없습니다.</span>';
						
						$('#AminiList').html(result);
						
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
							
							let category = '';
							for(var key in comment){
								if(list[i].alarmCategory == key){
									category = comment[key];
									break;
								}
							}
							
							value += '<p>'
								   + '<input type="hidden" name="sortType" value="' + list[i].alarmSort + '" />'
								   // + '<input type="hidden" name="testType" value="' + list[i].boardType + '" />'
								   + '<input type="hidden" name="locationBoard" value="' + list[i].alarmBoardNo + '" />'
								   + sort + ' ' + category
								   + '</p>'	
							
						};
						
						$('#AminiList').html(value);
					}
					
				},
				error : () => { console.log('연결실패'); }
			});
		}
		
		// 알림내역 클릭시 해당하는 게시글로 이동
		$(document).on('click', '#AminiList>p', function(){
			let board = $(this).children().eq(0).val(); // 게시판인지 밴드인지
			//let boardType = $(this).children().eq(1).val(); // 커뮤니티인지 질문정보인지
			let bNo = $(this).children().eq(1).val(); // 보드넘버
			//console.log(test);

			
			if(board == 's'){ // 일반게시판일 경우
				location.href = 'freeBoardDetail.bo?boardNo=' + bNo;
				/* if(boardType == 'free'){
				} else {
					location.href = 'freeBoardDetail.bo?boardNo=' + bNo;
				} */
			} else { // 스터디밴드인경우
				location.href = '/studyBand.bo/detail.bo?sno=' + bNo;
			}
		});
		
		// 잔디가 가능하냐?
		function test(){
			
		};
		
		
		function dateFormat(){
			var date = new Date();
			console.log(date.getFullYear());
		};
		
		document.addEventListener('DOMContentLoaded', function() {
			  var calendarEl = document.getElementById('calendar');

			  var calendar = new FullCalendar.Calendar(calendarEl, {
			    headerToolbar: {
			      left: 'prev,next today',
			      center: 'title',
			      right: 'dayGridMonth,timeGridWeek'
			    },
			    initialDate: '2023-05-12',
			    events: [
					      {
					        start: '2023-05-11T10:00:00',
					        end: '2023-05-11T16:00:00',
					        display: 'background',
					        color: '#ff9f89'
					      },
					      {
					        start: '2023-05-13T10:00:00',
					        end: '2023-05-13T16:00:00',
					        display: 'background',
					        color: '#ff9f89'
					      },
					      {
					        start: '2023-05-24',
					        end: '2023-05-28',
					        overlap: false,
					        display: 'background'
					      },
					      {
					        start: '2023-05-06',
					        end: '2023-05-08',
					        overlap: false,
					        display: 'background'
					      }
					    ]
			  });

			  calendar.render();
			});
	</script>
	

</body>
</html>