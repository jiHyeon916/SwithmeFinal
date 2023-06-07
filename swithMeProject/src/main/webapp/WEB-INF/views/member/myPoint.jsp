<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/myPoint.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<jsp:include page="myMenuBar.jsp" />
		</div>
		
		<div class="content">
			<div class="topBlock">포인트</div>
			
			<div id="todayPoint">
				<div>오늘 얻은 포인트</div>
				<p>25</p>
				<span>point</span>
			</div><!-- 
		 --><div id="totalPoint">
		 		<div>사용 가능한 포인트</div>
				<p>500</p>
				<span>point</span>
			</div>
			
			<div class="block">
				<div class="myBtn">
					<button>적립내역</button>
					<button>사용내역</button>
				</div>
				
				<table id="pointList">
					<thead>
						<tr>
							<th>날짜</th>
							<th>적립</th>
							<th>내용</th>
							<th>포인트</th>
						</tr>
					</thead>				
					<tbody>
						<tr>
							<td>2023-05-05</td>
							<td>+20</td>
							<td>출석체크 포인트 지급</td>
							<td>300p</td>
						</tr>
						<tr>
							<td>2023-05-05</td>
							<td>+20</td>
							<td>출석체크 포인트 지급</td>
							<td>300p</td>
						</tr>
						<tr>
							<td>2023-05-05</td>
							<td>+20</td>
							<td>출석체크 포인트 지급</td>
							<td>300p</td>
						</tr>
						<tr>
							<td>2023-05-05</td>
							<td>+20</td>
							<td>출석체크 포인트 지급</td>
							<td>300p</td>
						</tr>
					</tbody>
				</table>
				
				<div class="paBtn">
					<button>1</button>
					<button>2</button>
					<button>3</button>
					<button>4</button>
					<button>5</button>
				</div>
				
			</div>
			
			<br><br><br>
		</div>
	</div>


</body>
</html>