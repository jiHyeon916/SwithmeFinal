<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/chatting.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<jsp:include page="myMenuBar.jsp" />
		</div>
		
		<div class="content">
			<div class="topBlock">채팅</div>
				
			<div id="room">
				<p>채팅방(6)</p>
				<div class="roomBlock">
					<div></div>
					<ul>
						<li>닉네임</li>
						<li>최근대화내용최근대화내용</li>
						<li>2023-05-19</li>
					</ul>
				</div>
				<div class="roomBlock">
					<div></div>
					<ul>
						<li>닉네임</li>
						<li>최근대화내용최근대화내용</li>
						<li>2023-05-19</li>
					</ul>
				</div>
				<div class="roomBlock">
					<div></div>
					<ul>
						<li>닉네임</li>
						<li>최근대화내용최근대화내용</li>
						<li>2023-05-19</li>
					</ul>
				</div>
			</div><!--
		--> <div id="chat">
				<div id="chat-top">
					<b>송태섭</b>
					<button>> 채팅 나가기</button>
				</div>
				<div class="chat-con">
					<div class="chat-you">
						<div></div>
						<ul>
							<li>닉네임</li>
							<li>2023-11-11</li>
							<li>여기는 채팅 내용이 들어갑니다.</li>
						</ul>
					</div>	
					<div class="chat-me">
						<div></div>
						<ul>
							<li>2023-11-11</li>
							<li>여기는 채팅 내용이 들어갑니다.</li>
						</ul>
					</div>
					<div class="chat-me">
						<div></div>
						<ul>
							<li>2023-11-11</li>
							<li>여기는 채팅 내용이 들어갑니다.</li>
						</ul>
					</div>
					<div class="chat-me">
						<div></div>
						<ul>
							<li>2023-11-11</li>
							<li>여기는 채팅 내용이 들어갑니다.</li>
						</ul>
					</div>
					<div class="chat-me">
						<div></div>
						<ul>
							<li>2023-11-11</li>
							<li>여기는 채팅 내용이 들어갑니다.</li>
						</ul>
					</div>
					<div class="chat-me">
						<div></div>
						<ul>
							<li>2023-11-11</li>
							<li>여기는 채팅 내용이 들어갑니다.</li>
						</ul>
					</div>
					<div class="chat-me">
						<div></div>
						<ul>
							<li>2023-11-11</li>
							<li>여기는 채팅 내용이 들어갑니다.</li>
						</ul>
					</div>
				</div>
				<div id="chat-bottom">
					<form action="" method="">
						<input id="chat-input" type="text" name="" value="" />
						<button id="chat-btn" type="submit" value="">전송</button>
					</form>
				</div>
			</div>
		</div>
		<br><br><br>
	</div>

</body>
</html>