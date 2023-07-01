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
.topBlock{
	height : 55px;
	padding : 13px 20px;
	border : 1.5px solid rgb(175, 175, 175);
	border-radius: 10px;
	box-sizing : border-box;
	color : rgb(3, 195, 115);
	font-size : 16px;
	font-weight : 500;
	margin-bottom : 30px;
}

.block {
	height: 800px;
	padding: 25px;
	border: 1.5px solid rgb(175, 175, 175);
	border-radius: 10px;
	box-sizing: border-box;
	margin: auto;
}

.selectBtn {
	background-color: white;
    width : 100px;
    height: 38px;
	border : 1.5px solid #03c373;
	border-radius : 5px;
	color : #03c373;
	margin-right : 10px;
}

.noneBtn{
	background-color: white;
    width : 100px;
    height: 38px;
    border : 1.5px solid #cecece;
	border-radius : 5px;
	color : #cecece;
	margin-right : 10px;
}

.myBtn>button:hover{
	background-color: white;
    width : 100px;
    height: 38px;
	border : 1.5px solid #03c373;
	border-radius : 5px;
	color : #03c373;
	margin-right : 10px;
}

#todoHead>button{
	display: inline-block;
	width: 65px;
	height: 30px;
	background-color: white;
	border-radius: 5px;
	margin-right: 5px;
	font-size: smaller;
	text-align: center;
	border : 1px solid rgb(3, 195, 115);
	color : rgb(3, 195, 115);
}

#todoHead>button:hover{
	background-color: #03c373;
    color: #fff;
}

.headBtn.hover{
	background-color: #03c373;
    color: #fff;
}

.todoInput>input{
    width : 70%;
    height: 30px;
    border: 1.5px solid #cecece;
    border-radius: 5px;
	margin-top: 10px;
	margin-right: 5px;
    padding: 10px;
}

.todoInput>button{
	padding: 3px 5px;
	font-size: smaller;
    background-color:rgb(233, 233, 233);
    border-radius: 5px;
    color: black;
    cursor: pointer;
}

.deleteTodo{
	padding: 3px 5px;
	font-size: smaller;
    background-color:rgb(233, 233, 233);
    border-radius: 5px;
	float:right;
	margin-right: 25px;
    color: black;
    cursor: pointer;
}

.fc-day-sun a {
  color: rgb(255, 75, 75);
  text-decoration: none;
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
			<div class="topBlock">일정관리</div>
			<div class="block">
				<div class="myBtn">
					<button class="noneBtn" onclick="location.href='calendar.me'">일정 </button>
					<button class="selectBtn" onclick="location.href='toDoList.me'">오늘의 할 일</button>
				</div>
				<div class="todoOuter">
					<div id="todoCalendar">
						<div id='calendar'></div>
					</div>
					<div id="todoList">
						<div id="todoDate"></div>
						<div id="checkTodoList">
							<div id="todoHead">

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
	<br><br><br><br><br>
	<jsp:include page="../common/footer.jsp"/>
	<script>
		$(function(){
			calendarLoad();
			clickHeadBtn();
		})

		function calendarLoad(){
			  var calendarEl = document.getElementById('calendar');
				var now = moment();
			  var calendar = new FullCalendar.Calendar(calendarEl, {
				initialDate: now.format('YYYY-MM-DD'),
				selectable: true,
				events: function(info, successCallback, failureCallback) {
				  //캘린더 조회
				  $.ajax({
					url:'todoAchievementRate.me',
					method : 'POST',
					data:{
						memberId : '${ loginMember.memberId }'
					},
					success : function(result){
						var events=[];
						if(result!=null){
							$.each(result, function(index, item) {
								var backgroundColor='';
								var achievementRate=item.achievementRate;
	
								if(0 <= achievementRate && achievementRate < 20){
									backgroundColor = '#F2FFEB';
								} else if(20 <= achievementRate && achievementRate < 40){
									backgroundColor = '#BCFFB5';
								} else if(40 <= achievementRate && achievementRate < 60){
									backgroundColor = '#86E57F';
								} else if(60 <= achievementRate && achievementRate < 80){
									backgroundColor = '#50AF49';
								} else if(80 <= achievementRate && achievementRate < 100 ){
									backgroundColor = '#1A7913';
								} else {
									backgroundColor = '#004300';
								}		
								events.push({
									start: item.todoDate, 
									color: backgroundColor,
									display:'background'
								});
							});
						}
						successCallback(events); 
					},
					error : function(){
						console.log('실패');
					}
				  });
			  },
			  select: function(arg) {
				//task 조회
				var date =  moment(arg.startStr).format('YYYY-MM-DD');
				var date2 = moment(arg.startStr).format('DD');
				var date3 = moment(arg.startStr).day();
				switch(date3){
					case 0 : date3='SUNDAY';break;
					case 1 : date3='MONDAY';break;
					case 2 : date3='TUESDAY';break;
					case 3 : date3='WEDNESDAY';break;
					case 4 : date3='THURSDAY';break;
					case 5 : date3='FRIDAY';break;
					case 6 : date3='SATURDAY';break;
				}
				$('#todoDate').html('<span id="date2-font">'+date3+'</span><br><span id="date3-font">'+date2+'</span>');
				var tab='';
				tab += '<button id="all" value="'+date+'" onclick="changeBtn(0,this);" class="headBtn">전체보기</button>'
							+ '<button id="todo" value="'+date+'" onclick="changeBtn(1,this);" class="headBtn">진행 중</button>'
							+ '<button id="complete" value="'+date+'" onclick="changeBtn(2,this);" class="headBtn">완료</button>'
							+ '<button id="addBtn" value="'+date+'" onclick="addInput(this);" class="headBtn">추가</button>';
				$('#todoHead').html(tab);
				selectTodoList(date, 0);
				clickHeadBtn();
				}
	
			});
		
			calendar.render();
		}

	  // 리스트 조회
	  function selectTodoList(date, type){
		console.log(date);
		$.ajax({
				url : 'selectTodoList.me',
				method : 'POST',
				data : {
					todoDate : date,
					memberId : '${ loginMember.memberId }'
				},
				success : function(data){
					listView(type, data);
					todoCheck();
				},
				error : function(){
					console.log('실패');
				}
			}); 
		}

		function changeBtn(type,obj){
			var date = obj.value;
			selectTodoList(date, type);
		}

		// 조건별 조회
		function listView(type,data){
			var todoList;
			if(type==0){
				var todoList = data.all;
			} else if(type==1){
				var todoList = data.todo;
			} else{
				var todoList = data.complete;
			}
			$('#todoContent').empty();
			var value='';
			for(var i = 0; i < todoList.length; i++){
				if(todoList[i].todoStatus === 'N'){
					value +='<input type="checkbox" id="todoCheck'+todoList[i].todoNo+'" name="checkboxName" value="'+ todoList[i].todoNo +'" checked >&nbsp';
				} else {
					value +='<input type="checkbox" id="todoCheck'+todoList[i].todoNo+'" name="checkboxName" value="'+ todoList[i].todoNo +'">&nbsp';
				}
				value += '<label for="check">'+todoList[i].todoContent+'</label>&nbsp;'
						+'<button class="deleteTodo" onclick="deleteTodo('+todoList[i].todoNo+');">삭제</button>&nbsp;<br>';	
			}
			$('#todoContent').append(value);
		}

		//todo 입력창 생성
	  	function addInput(btn){
			date = btn.value;
			$('.todoInput').remove();
			$('#todoHead').append('<div class="todoInput"></div>');
			$('.todoInput').append('<input type="text" class="newTodoContents">');
			$(".todoInput").append('<button value="'+date+'" onclick="addTodo(this);">추가</button><button onclick="noAdd();">취소</button>');	
		}

		//todo 입력창 취소
		function noAdd(){
			if($('.newTodoContents').val().length > 0){
				if(confirm('취소하시겠습니까?')){
					$('.todoInput').remove();
				}
			} else{
				$('.todoInput').remove();
			}
		}

		//todo 추가
		function addTodo(btn){
			var value="";
			var todo =$('.newTodoContents').val();
			var date = btn.value;
			if(todo!=""){
						$.ajax({
							url : 'insertTodoList',
							method : 'POST',
							data : {
								todoDate : date,
								memberId : '${loginMember.memberId}',
								todoContent : todo
							},
							success : function(data){
								reload(data);
								$('.todoInput').remove();
								todoCheck();
								calendarLoad();
							},
							error : function(){
								console.log('추가 실패');
							}
						});
				} else{
					alert('값을 입력해주세요');
				}						
				$('.newTodoContents').val('');
			}

			// 체크 여부
			function todoCheck(){
				$('input:checkbox[name=checkboxName]').click(function(){
					var checked = $(this).prop("checked");
					var date = moment($('#todoDate').text(), 'dddd\nD').format('YYYY-MM-DD');
					var tno = $(this).val();
					if(checked){
						$.ajax({
							url : 'checkTodoList.me',
							method : 'POST',
							data : {
								todoNo : tno,
								todoDate : date,
								memberId : '${loginMember.memberId}'
							},
							success : function(data){
								reload(data);
								calendarLoad();
							},
							error : function(){
								console.log('실패');
							}
						});
					} else {
						$.ajax({
							url : 'uncheckTodoList.me',
							method : 'POST',
							data : {
								todoNo : tno,
								todoDate : date,
								memberId : '${loginMember.memberId}'
							},
							success : function(data){
								reload(data);
								calendarLoad();
							},
							error : function(){
								console.log('실패');
							}
						});
					}

				});
			}

			// 할 일 삭제
			function deleteTodo(selectTodoNo){
				var date = moment($('#todoDate').text(), 'dddd\nD').format('YYYY-MM-DD');
				$.ajax({
					url : 'deleteTodo.me',
					method : 'POST',
					data : {
						todoNo : selectTodoNo,
						todoDate : date,
						memberId : '${loginMember.memberId}'
					},
					success : function(data){
						reload(data);
						calendarLoad();
					},
					error : function(){
						console.log('실패');
					}
				});
			}

			// 새로고침
			function reload(data){
				var todoList = data.todoList;
				$('#todoContent').empty();
				var value='';
				for(var i = 0; i < todoList.length; i++){
					if(todoList[i].todoStatus === 'N'){
						value +='<input type="checkbox" id="todoCheck'+todoList[i].todoNo+'" name="checkboxName" value="'+ todoList[i].todoNo +'" checked >&nbsp';
					} else {
						value +='<input type="checkbox" id="todoCheck'+todoList[i].todoNo+'" name="checkboxName" value="'+ todoList[i].todoNo +'">&nbsp';
					}
					value += '<label for="check">'+todoList[i].todoContent+'</label>&nbsp;'
								+'<button class="deleteTodo" onclick="deleteTodo('+todoList[i].todoNo+');">삭제</button>&nbsp;<br>';	
				}
				$('#todoContent').append(value);
				todoCheck();
			}

			function clickHeadBtn(){
				$('.headBtn').on('click',function() {
					console.log(this);
					$('.headBtn').removeClass('hover');
        			$(this).addClass('hover');
				});
			}

			

	  </script>

</body>
</html>