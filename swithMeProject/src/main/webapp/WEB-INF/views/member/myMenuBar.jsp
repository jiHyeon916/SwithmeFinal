<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="resources/css/member/myMenuBar.css">
	<title>Insert title here</title>
</head>
<style>
 #deleteMem{
 	cursor:pointer;
 
 }
 .modalContent{
 	z-index:90000;
 	opacity:1;
}
</style>
<body>
		
	<div id="myMenuBar-area">
		<ul id="mySide1">
			<li><a href="mypage.me">마이페이지</a></li>
			<!-- <li><a href="profil.me">프로필</a></li> -->
			<li><a href="alarm.me">알림</a></li>
			<li><a href="item.me">캐릭터</a></li>
			<li><a href="point.me">포인트</a></li>
			<!-- <li><a href="mail.me">메일</a></li> -->
			<!-- <li><a href="chat.me">채팅</a></li> -->
		</ul>
		<ul id="mySide2">
			<li><a href="calendar.me">일정관리</a></li>
			<li><a href="studyBand.me">스터디밴드</a></li>
		</ul>
		<ul id="mySide3"> 	
			<li><a href="history.me">활동정보</a></li>
			<li><a href="bookmark.me">북마크</a></li>
			<li><a href="qna.me">문의글</a></li>
			<li><a data-toggle="modal" data-target="#basicExampleModal" id="deleteMem">회원탈퇴</a></li>
			
		</ul>
    <!-- Button trigger modal -->

    
	</div>
	
<!-- 회원탈퇴 Modal -->
<!--  <div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
     </div>
         <form action="delete.mem" method="post">
               <div class="modal-body">
                 <div align="center">
                               탈퇴 후 복구가 불가능합니다. <br>
                               정말로 탈퇴 하시겠습니까? <br>
                   </div><br>
                      <label for="userPwd" class="mr-sm-2">Password : </label>
                      <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="memberPwd"> <br>
                    </div>
                   
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                 </div>
            </form>
       	</div>
     </div>
   </div> 
	 -->
	
	    
    
    
   
	
	
	
	
</body>
</html>