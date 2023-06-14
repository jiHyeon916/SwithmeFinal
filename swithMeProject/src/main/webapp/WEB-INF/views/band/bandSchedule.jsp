<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- schedule  -->
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
    <script>
		document.addEventListener('DOMContentLoaded', function() {
        	var calendarEl = document.getElementById('calendar');
        	var calendar = new FullCalendar.Calendar(calendarEl, {
          		initialView: 'dayGridMonth'
        	});
        	calendar.render();
      	});
    </script>
	<!-- MainCss -->
    <link rel="stylesheet" href="/swithme/resources/css/band/bandSchedule.css">
</head>
<body>

	<jsp:include page="bandHeader.jsp"/>
	
	<div class="wrap">
		<jsp:include page="bandSideBar.jsp"/>
		    <div id="blank">.</div>

	    <div class="mainDiv" >
	    <br><br>
	    	<div>
		        <span class="Writer">
	       			<strong class="menuInfo">밴드 일정</strong>
	       		</span>
	    	</div>
	    	<br><br><br>
	    	<div id='calendar'></div>
	    </div>
	</div>
	
</body>
</html>