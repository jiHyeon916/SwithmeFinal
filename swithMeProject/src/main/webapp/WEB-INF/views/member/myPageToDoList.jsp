<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
    max-width: 1100px;
    margin: 0 auto;
	margin-top : 50px;
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
.page-blank2 {
	margin-top: 50px;
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
	height: 800px;
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
.todoOuter>div{height:100%;float:left;}
#todoCalendar{width:65%; height:600px;}
#todoList{width:35%; height:600px; }
#todoDate{height:30%;margin-left: 20px; margin-top:10px;text-align: center;line-height:320%;}
#checkTodoList{height: 70%; margin-left: 20px;}
#todoContent{margin-top: 10px;}
#date2-font{font-size:20px;}
#date3-font{font-size:95px;}
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
					<button onclick="location.href='calendar.me'">일정 </button>
					<button onclick="location.href='toDoList.me'">오늘의 할 일</button>
				</div>
				<div class="page-blank2"></div>
				<div class="todoOuter">
					<div id="todoCalendar">
						<div id='calendar'></div>
					</div>
					<div id="todoList">
						<div id="todoDate"></div>
						<div id="checkTodoList">
							<div id="todoHead">
								<h4>오늘의 할일</h4> <br>
								<input type="text" id="task">
								<button id="addTask">추가</button>
							</div>
							<div id="todoContent">

							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<br>
			<br>
		</div>
	</div>
	
	<script>

		document.addEventListener('DOMContentLoaded', function() {
		  var calendarEl = document.getElementById('calendar');
			var now = moment();
		  var calendar = new FullCalendar.Calendar(calendarEl, {
			initialDate: now.format('YYYY-MM-DD'),
			selectable: true,
			events: function(info, successCallback, failureCallback) {
	    	  //캘린더 조회
			  $.ajax({
				url:'todoCalendarList.me',
				data:{
					memberId : '${ loginMember.memberId }'
				},
				success : function(result){
					console.log(result);
					var events=[];
					if(result!=null){
						$.each(result, function(index, item) {
							events.push({
								calendarNo : item.calendarNo
								,start : item.startDay
								,color : item.color
							});
						});
					}
					successCallback(events); 
				},
				error : function(){
					console.log('실패');
				}
			  })

	      },
		  select: function(arg) {
			//task 조회
			var date =  moment(arg.startStr).format('YYYY-MM-DD');
			var date2 = moment(arg.startStr).format('DD');
			var date3 = moment(arg.startStr).day();
			console.log(date3);
			switch(date3){
				case 0 : date3='SUNDAY';break;
				case 1 : date3='MONDAY';break;
				case 2 : date3='TUESDAY';break;
				case 3 : date3='WEDNESDAY';break;
				case 4 : date3='THURSDAY';break;
				case 5 : date3='FRIDAY';break;
				case 6 : date3='SATURDAY';break;
			}
			console.log(date3);
			$('#todoDate').html('<span id="date2-font">'+date3+'</span><br><span id="date3-font">'+date2+'</span>');
	    	$.ajax({
				url : 'selectTodoList',
				data : {
					todoDate : date,
					memberId : '${ loginMember.memberId }'
				},
				success : function(result){
					var value='';
					for(let i in result){
						value += '<input type="hidden" value='+result[i].todoNo+'>';
						if(result[i].todoStatus === 'N'){
							value +='<input type="checkbox" name="checkboxName" checked>&nbsp;';
						} else {
							value +='<input type="checkbox" name="checkboxName">&nbsp;';
						}
						value += '<label for="check">'+result[i].todoContent+'</label>&nbsp;'
								+'<button class="deleteTask">삭제</button>&nbsp;<br>';	
					}
					$('#todoContent').html(value);

					//task 체크(완료)
					$('input:checkbox[name=checkboxName]').change(function(){
						if($('input:checkbox[name=checkboxName]').is(':checked')){
							console.log('체크박스');
							$.ajax({
								url : 'checkTodoList.me',
								data : {
									todoNo : $(this).prev().val(),
								},
								success : function(){
									console.log('완료');
								},
								error : function(){
									console.log('실패');
								}
							});
						} else{
						//task 체크해제
							console.log('체크박스 해제');
							$.ajax({
								url : 'uncheckTodoList.me',
								data : {
									todoNo : $(this).prev().val(),
								},
								success : function(){
									console.log('완료 안함');
								},
								error : function(){
									console.log('실패');
								}
							});
						}
					});
						
				},
				error : function(){
					console.log('실패');
				}
			}) 

			// task 추가
			$('#addTask').click(function(){
				var value="";
				var task =$('#task').val();
				if(task!=""){
					value += '<input type="checkbox" name="checkboxName">&nbsp;'
							+ '<label for="check">' + task + '</label>&nbsp;'
							+'<button class="deleteTask">삭제</button>&nbsp;<br>';
					$('#todoContent').append(value);
					addTask(task);
				} else{
					alert('할 일을 입력하세요.');
				}
				$('#task').val("");
			
			})

			function addTask(task){
				console.log(task);
				$.ajax({
					url : 'insertTodoList',
					data : {
						todoDate : date,
						memberId : '${loginMember.memberId}',
						todoContent : task
					},
					success : function(list){
						console.log(list);
					},
					error : function(){
						console.log('실패');
					}
				});
			};



				





	        
			}
	    });
	
	    calendar.render();
	  });




	  
	  </script>

</body>
</html>