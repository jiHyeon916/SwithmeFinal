<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/member/myItem.css">
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
			<div id="character"></div>
			<div class="block">
				<div class="myBtn">
					<button>배경</button>
					<button>캐릭터</button>
					<button>모자</button>
					<button>도구</button>
				</div>
				<div id="myItem">
					<table>
						<tr>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button id="testBtn">미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
						</tr>
						<tr>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
						</tr>
					</table>
				</div>
			</div>
			<br><br><br>
		</div>
	</div>

</body>
</html>