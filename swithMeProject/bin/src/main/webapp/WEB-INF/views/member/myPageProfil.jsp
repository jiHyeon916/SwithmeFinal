<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            
            
                    <button type="button" data-toggle="modal" data-target="#basicExampleModal" style="background-color:rgb(210, 59, 59);">
                        회원탈퇴
                    </button>
            
            
                    <button  type="button" data-toggle="modal" data-target="#basicExampleModal2"  style="background-color: rgb(3, 195, 115); margin-left: 80px;">
                        정보수정
                    </button>
                        
                        
                     
            
         </div>
    
    <!-- Button trigger modal -->

<!-- 회원탈퇴 Modal -->
<div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">탈퇴하기</button>
                 </div>
            </form>
       </div>
     </div>
   </div>
    
    
    <!-- 정보수정 Modal -->
<div class="modal fade" id="basicExampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
     </div>
         <form action="updateEnrollForm.mem" method="post">
               <div class="modal-body">
                 <div align="center">
                               정보수정을 원하시면 현재 비밀번호를 입력해주세요. <br><br>
                   </div><br>
                      <label for="userPwd" class="mr-sm-2">Password : </label>
                      <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="memberPwdUpdate"> <br>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <button type="submit" class="btn btn-danger">수정하기</button>
                 </div>
            </form>
       </div>
     </div>
   </div>
         
         <br><br><br>
      </div>
   </div>


</body>
</html>