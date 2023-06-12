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
						<tr>
							<td>'안녕하세요'게시물에 댓글이 달렸습니다.</td>
							<td>안읽음</td>
							<td>2023-05-05</td>
						</tr>
						<tr>
							<td>'내가가입한밴드이름'게시물에 댓글이 작성되었습니다.</td>
							<td>읽음</td>
							<td>2023-05-05</td>
						</tr>
						<tr>
							<td>'안녕하세요'게시물에 댓글이 달렸습니다.</td>
							<td>안읽음</td>
							<td>2023-05-05</td>
						</tr>
						<tr>
							<td>'안녕하세요'게시물에 댓글이 달렸습니다.</td>
							<td>읽음</td>
							<td>2023-05-05</td>
						</tr>
					</tbody>
				</table>
				<br><br>
				<div class="paBtn">
					<button>1</button>
					<button>2</button>
					<button>3</button>
					<button>4</button>
					<button>5</button>
				</div>
				
			</div>
			
		
		</div>
	</div>
 <br><br><br><br><br><br><br><br><br><br><br><br>
 					<jsp:include page="../common/footer.jsp"/>

</body>
</html>