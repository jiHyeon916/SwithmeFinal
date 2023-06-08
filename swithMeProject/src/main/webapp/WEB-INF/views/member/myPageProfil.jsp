<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/myPoint.css">
</head>
<style>

	.block button{

        border: none;
        height: 40px;
        width: 125px;
        border-radius: 5px;
        color: white;
        margin-top: 270px;
        margin-left: 280px;
                
    }
	


</style>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<jsp:include page="myMenuBar.jsp" />
		</div>
		
		<div class="content">
			<div class="topBlock">프로필</div>
			
			
			
			<div class="block">
			
				<div align="center">
					  <div>
				            프로필 사진
				        </div>
				        <div>
				            닉네임
				        </div>
				        <div>
				            아이디
				        </div>
				        <div>
				            이메일
				        </div>
				</div>
				        <button style="background-color:rgb(210, 59, 59);">
				            회원탈퇴
				        </button>
				
				
				        <button  onclick="location.href='###'" style="background-color: rgb(3, 195, 115); margin-left: 80px;">
				            정보수정
				        </button>
								
								
							
				
			</div>
			
			<br><br><br>
		</div>
	</div>


</body>
</html>