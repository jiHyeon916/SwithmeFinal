<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	 <!-- bootstrap 4 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- fullcalendar -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
	
	<!-- moment js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style>
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	width: 100%;
	height: 750px;
}

p {
	margin: 0;
}

h1 {
	padding: 0;
	margin: 0;
}

a {
	text-decoration: none;
	color: #292929;
	list-style: none;
}

a:hover {
	text-decoration: none;
	color: #292929;
}

.page-blank {
	margin-top: 80px;
	background-color: pink;
}

.mySide {
	position: fixed;
}

.content {
	width: 100%;
	height: 800px;
	float: left;
	padding-left: 250px;
}

.block {
	padding: 25px;
	border: 1.5px solid rgb(175, 175, 175);
	border-radius: 10px;
	box-sizing: border-box;
	margin: auto;
}

.myBtn>button {
	display: inline-block;
	width: 100px;
	height: 38px;
	background-color: white;
	border-radius: 5px;
	margin-right: 10px;
}

/* 일요일 날짜 빨간색 */
.fc-day-sun a {
  color: red;
  text-decoration: none;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
  color: blue;
  text-decoration: none;
}
</style>


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
			<div class="block">
				<div class="myBtn">
					<button>일정 </button>
					<button>오늘의 할 일</button>
				</div>
				<div id='calendar'></div>
			</div>
			<br>
			<br>
			<br>
		</div>
	</div>
	
	<!-- 일정 입력 modal -->
    <div class="modal fade" id="calendarModal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">일정 제목</label>
                        <input type="text" class="form-control" id="calendar_title" name="calendar_title">
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
		                <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_day" >
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_day">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button"  id="addCalendar">추가</button>
                    <button type="button" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
        </div>
    </div>
    
    <!-- 일정 상세보기 modal -->
        <div class="modal fade" id="calendarModalDetail">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">일정 제목</label>
                        <input type="text" class="form-control" id="detail_calendar_title" name="detail_calendar_title"  disabled >
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <input type="text" class="form-control" id="detail_calendar_content" name="detail_calendar_content" disabled>
                        <label for="taskId" class="col-form-label">시작 날짜</label>
		                <input type="date" class="form-control" id="detail_calendar_start_date" name="detail_calendar_start_day" disabled >
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="detail_calendar_end_date" name="detail_calendar_end_day" disabled>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="updateSchedule">수정하기</button>
                    <button type="button" id="deleteSchedule">삭제하기</button>
                    <button type="button" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
                </div>
    
            </div>
        </div>
    </div>
    
    
    

	


	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	
	    	headerToolbar : {
	            left: 'prev',
	            center: 'title',
	            right: 'next today'
	    	},
	
	      initialDate: new Date().toISOString().substring(0, 10),
	      navLinks: true, // can click day/week names to navigate views
	      selectable: true,
	      selectMirror: true,
	      select: function(arg) {
	    	  //캘린더 일정 추가
	    	  var date =  moment(arg.startStr).format('YYYY-MM-DD');
	    	  document.getElementById('calendar_start_date').value = date;
	    	  $("#calendarModal").modal("show"); // modal 나타내기
	    	  $('#addCalendar').on('click', function(){
	        	  $.ajax({
	            	  url:'addSchedule.me',
	            	  data : {
	            		  calendarTitle : $('#calendar_title').val(),
	            		  memberId : '${ loginMember.memberId }',
	            		  calendarContent : $('#calendar_content').val(),
	            		  startDay : $('#calendar_start_date').val(),
	            		  endDay : $('#calendar_end_date').val()
	            	  },
	            	  success : function(result){
	            		  alert('일정이 추가되었습니다.');
	            		  location.reload();
	            	  },
	            	  error : function(){
	            		  console.log('실패');
	            	  }
	              });
	        	  calendar.unselect()
	    	  })
	        },
	      eventClick: function(arg) {
	    	  //캘린더 수정
	    	  $("#calendarModalDetail").modal("show"); // modal 나타내기
	    	  var title = arg.event._def.title;
	    	  var calendarNo = arg.event._def.extendedProps.calendarNo;
	    	  var calendarContent = arg.event._def.extendedProps.calendarContent;
	    	  
	    	  var startDay =  moment(arg.event._instance.range.start).format('YYYY-MM-DD');
	    	  var endDay =  moment(arg.event._instance.range.end).format('YYYY-MM-DD');
	    	  
	    	  document.getElementById('detail_calendar_title').value = title;
	    	  document.getElementById('detail_calendar_content').value = calendarContent;
	    	  document.getElementById('detail_calendar_start_date').value = startDay;
	    	  document.getElementById('detail_calendar_end_date').value = endDay;
	     		
	    	  $('#updateSchedule').on('click', function(){
	    		  $('#detail_calendar_title').removeAttr('disabled');
	    		  $('#detail_calendar_content').removeAttr('disabled');
	    		  $('#detail_calendar_start_date').removeAttr('disabled');
	    		  $('#detail_calendar_end_date').removeAttr('disabled');
	    		  
	    		  let updateBtn=document.getElementById('updateSchedule');
	    		  updateBtn.innerText='확인';
	    		  $('#deleteSchedule').remove();
	    		  
	    		  $(updateBtn).on('click',function(){
	    			  console.log(calendarNo);
	    			  $.ajax({
	    				  url : 'updateSchedule.me',
	    				  data : {
	    					  calendarNo : calendarNo,
		            		  calendarTitle : $('#detail_calendar_title').val(),
		            		  memberId : '${ loginMember.memberId }',
		            		  calendarContent : $('#detail_calendar_content').val(),
		            		  startDay : $('#detail_calendar_start_date').val(),
		            		  endDay : $('#detail_calendar_end_date').val()
	    				  },
	    				  success: function(){
	    					  console.log('성공');
	    					  location.reload();
	    				  },
	    				  error : function(){
	    					  console.log('실패');
	    				  }
	    			  })
	    		  })
	    		  
	    	  });
	    	  
	    	  $('#deleteSchedule').on('click', function(){
	    		 if(confirm('일정을 삭제하시겠습니까?')){
	    			 $.ajax({
	    		        	url : 'deleteSchedule.me',
	    		        	data : {
	    						calendarNo : calendarNo
	    						, memberId : '${ loginMember.memberId }'
	    		        	},
	    		        	success : function(){
	    		        		alert('일정이 삭제되었습니다.');
	    		        		location.reload();
	    		        	},
	    		        	error : function(){
	    		        		console.log('실패');
	    		        	}
	    		        })
	    			 atg.event.remove();
	    		 }
	    	  });
	    	  
	      },
	      editable: true,
	      dayMaxEvents: true, // allow "more" link when too many events
	      events: function(info, successCallback, failureCallback) {
	    	  //캘린더 조회
	    		$.ajax({
	    			  url : 'calendarList.me',
	    			  data : {
	    				  memberId : '${ loginMember.memberId }'
	    			  },
	    			  success : function(result){
	    		            var events = [];
	    		            if(result!=null){
	    		            	 $.each(result, function(index, item) {
	                                 var enddate=item.endDay;
	                                  if(enddate==null){
	                                      enddate=item.startdate;
	                                  }  
	    		                events.push({
	    		                	calendarNo : item.calendarNo
	    		                    ,title : item.calendarTitle
	    		                    ,calendarContent : item.calendarContent
	    		                    ,start : item.startDay
	    		                    ,end : enddate
	    		                    ,rendering:'background'
	    		            	});
	    		            });
	    		         }
	    		            console.log(events);
	    		            successCallback(events); 
	    			  },
	    			  error : function(){
	    				  console.log('실패');
	    			  }
	    		})	  
	      }
	    });
	
	    calendar.render();
	  });
	  


</script>

</body>
</html>