<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/adminPageMain.css">
<link rel="stylesheet" href="resources/css/member/myPoint.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

</head>
<style>
 
    #adminMemberBtn{
        border: none;
        border-radius: 5px;
        width: 50px;
        height: 29px;
        background-color: rgb(3, 195, 115);  
        color : white;      
    }

    #adminMemberBtn:hover{
        cursor: pointer;
    }

 
    #adminMemberTable th{
        width: 150px;
        padding-right: 10px;
    }
    
    #adminMemberTable th, td{
        border: 1px solid rgb(205, 203, 203);
    }
    
     #adminMemberTable > thead{
        text-align: center;
    }
    
    #adminMemberForm input:focus{
       border-color:rgb(3, 195, 115);
       outline: none;
       height:29px;
    }
    
      #adminMemberForm input{
         height:29px;
         border-radius : 5px;
         border-color : lightgray;
     }
    
    #adminMemberForm select:focus{
        border-color:rgb(3, 195, 115);
        outline: none;
        border-radius : 5px;
    }
    
    #adminMemberForm  > select {
          border-radius : 5px;
    }
     #adminMemberForm{
        margin-left:260px;
     }
     
     #adminStopBtn{
       border: none;
        border-radius: 5px;
        width: 50px;
        height: 29px;
        background-color : red;
        color : white;    
     }
     #adminFreeBtn{
        border: none;
        border-radius: 5px;
        width: 50px;
        height: 29px;
        background-color : gray;
        color : white;   
     }
     
     #adminMemberTable > tbody > tr:hover{
        cursor:pointer;
        background-color:rgb(238, 238, 238);
     }
   
</style>
<body>

   <jsp:include page="../common/header.jsp" />
   
   <div class="page-blank"></div>
      
   <div class="wrap clear">
      <div class="adSide">
         <jsp:include page="adminMenuBar.jsp" />
      </div>
      
      <div class="content">
         <div class="topBlock">회원 검색결과</div>
         
         
                  <div class="block">
                     
                     
               <form action="adminMemberSearch.ad" method="post" id="adminMemberForm">
         
                     <input type="hidden" name="currentPage" value="1">
         
                     <select name="condition" id="adminMemberSelect">
                         <option value="memberId">아이디</option>
                         <option value="nickName">닉네임</option>
                     </select>
         
                     <input type="text" name="keyword" value="${keyword}">
                     <button type="submit" id="adminMemberBtn" >검색</button>
         
                 </form>
                 
                 <c:if test="${ !empty condition }">
                    <script>
                       $(function() {
                          $('#adminMemberSelect option[value=${condition}]').attr('selected',true);
                       });
                    </script>
                 </c:if>
                 
                 
                 <br><br><br>
                 <table id="adminMemberTable">
                    <thead>
                         <tr>
                             <th>NO</th>
                             <th>아이디</th>
                             <th>이름</th>
                             <th>닉네임</th>
                             <th>가입날짜</th>
                             <th>가입상태</th>
                             <th> </th>
                         </tr>
                    </thead>
                    
                    <tbody>
                       <c:choose>
                          <c:when test="${empty searchList }">
                             <tr>
                                <td colspan="7">조회된 결과가 없습니다.</td>
                             </tr>
                          </c:when>
                      <c:otherwise>
                             <c:forEach items="${searchList }" var="m">
                               <tr id="#adminMemberTable">
                                   <td>#no</td>
                                   <td><a href="memberDetailInfo.ad?memberId=${m.memberId }">${m.memberId }</a></td>
                                   <td>${m.memberName }</td>
                                   <td>${m.nickName }</td>
                                   <td>${m.memberEnrollDate }</td>
                                   <td class="memberStatus">${m.memberStatus }</td>
                                   <td><button onclick="adminStopBtn(this);" id="adminStopBtn"
                                         style="background-color:${m.memberStatus == 'Y'?'red':'gray'}" 
                                         data-member-id="${m.memberId}">정지</button></td>
                                  </tr>
                                 </c:forEach>
                              </c:otherwise>   
                           </c:choose>
                       </tbody>
                    </table>
                    
                 <script>

                 
                  //원래 색깔로 조건주려했는데 안됨. 
                  
                    function adminStopBtn(button) { 
                       
                     
                       //var memberId = $(button).closest('tr').children('.memberId').text();
                       var memberId = $(button).data('memberId');
                       //var memberId = $(button).children('.memberId').text(); 
                    console.log(memberId);
                       
                       //memberStatus의 값 뽑아내기 접근하기. 
                      // var memberStatus = $(button).closest('tr').children('.memberStatus').text();
                       
                       
                   // console.log(memberStatus);
                       
                          $.ajax({
                             url : 'memberStatusSelect.ad',
                             data :{memberId : memberId},
                             success : function(result){
                                
                                if(result == 'N'){ // 회원 조회 
                                   
                                   if(confirm('회원을 정지 해제시키겠습니까?')) {
                                      
                                      $.ajax({ // 회원 정지 해제
                                         
                                         url : 'adminMemberStopFree.ad',
                                         data : {memberId : memberId},
                                         success : function(result) {
                                            if(result == 'Y') {//성공
                                               $(button).css('background-color','red');
            //memberStatus선택해서 N으로 바꾸기 안되는지 ? . .                            
                                    location.reload();
                                            
                                               alert('정지 해제되었습니다.');
                                            }
                                         },error : function() {alert('정지해제 실패 ');}
                                       });
                                        }
                                }else{
                                   if(confirm('회원을 정지시키겠습니까?')) {
                                      
                                       $.ajax({ // 회원 정지 
                                         url : 'adminMemberStop.ad',
                                         data : {memberId : memberId},
                                         success : function(result) {
                                            if(result == 'Y') {//성공
                                               $(button).css('background-color','gray');
                                               //memberStatus.text('Y');
                                               
                                    location.reload();
                                               
                                               alert('정지되었습니다.');
                                            }
                                         },error : function(){alert('정지 실패');}
                                        });
                                       }
                                      }
                                    }
                                   });
                                  }
                  
                  
                  
                 
                     
                 /*
                        
                   
               //버튼눌러도 넘어가는 부분 해결하기 . . ! 아니면 아이디를 눌러야 넘어가게 할건지 ?  / NO게시판 번호 매기기 
                 
                     $(function() {
                        
                           $('#adminMemberTable > tbody > tr').click(function() {
                          
                             var memberId = $(this).children('.memberId').text(); //memberId값 
                             console.log(memberId);
                         
                             
                              location.href="memberDetailInfo.ad?memberId=" + memberId;
                        });
                }); 
                         
                   */
                   
                   
                   
                   
                   
                   
                   
                   
                   
                   
          
                   
                               
              
                 </script>
                    
                    
                    
                    
                    
               
                 
                 
                 
                 
                 
                 
            <br><br>
            
            <!-- 페이징 처리 --> <!-- 매핑값으로 다시 가기 때문에 키값과 컨디션값을 같이 넘겨줘야함.!  -->
            <div class="paBtn">
            
               <!-- 현재페이지가 1이면 이전버튼 작동 x 아니면 현재페이지 -1 작동 -->
                  <c:choose>
                     <c:when test="${pi.currentPage eq 1 }">
                        <button disabled><a href="#">이전</a></button>
                     </c:when>
                     <c:otherwise>
                        
                        <button><a href="adminMemberSearch.ad?amPage=${pi.currentPage - 1 }&keyword=${keyword}&condition=${condition}">이전</a></button>
                     </c:otherwise>
                  </c:choose>
                  
                  
                  <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                     <button><a href="adminMemberSearch.ad?amPage=${p }&keyword=${keyword}&condition=${condition}">${p }</a></button>
                  
                  </c:forEach>
                  
                  
                  <!-- 다음 버튼 만들기 -->
                  <c:choose>
                     <c:when test="${pi.currentPage eq pi.maxPage }">
                        <button disabled><a href="#">다음</a></button>
                     </c:when>
                     <c:otherwise>
                        <button><a href="adminMemberSearch.ad?amPage=${pi.currentPage + 1 }&keyword=${keyword}&condition=${condition}">다음</a></button>
                     </c:otherwise>
                  </c:choose>
               </div>
               </div>
         </div>
      </div>
<br><br><br><br><br><br>
</body>
</html>