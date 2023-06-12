<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/member/myPageMain.css">
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
				<p id="mNick">최애의아이</p>
				<p id="mMail">mail@naver.com</p>
				<button onclick="location.href='profil.me'">수정하기</button>
			</div><!-- 
		 --><div class="balance" id="mb2">
				<h1 id="totalP">500P</h1>
				<p>출석 +20 point</p>
				<p>출석 +20 point</p>
				<p>출석 +20 point</p>
				<button onclick="location.href='point.me'">포인트내역</button>
			</div><!-- 
		 --><div class="balance" id="mb3">
				<h5>알림</h5>
				<p>게시글에 댓글이 달렸습니다</p>
				<p>게시글에 댓글이 달렸습니다</p>
				<p>게시글에 댓글이 달렸습니다</p>
				<p>게시글에 댓글이 달렸습니다</p>
				<p>게시글에 댓글이 달렸습니다</p>
				<button onclick="location.href='alarm.me'">자세히보기</button>
			</div><!-- 
		 --><div id="grass">
				<h5>목표 달성</h5>
				<div id="grassBox">
					
				</div>
			</div><!-- 
		 --><div class="balance">
				달력
			</div>
		</div>
	</div>

</body>
</html>