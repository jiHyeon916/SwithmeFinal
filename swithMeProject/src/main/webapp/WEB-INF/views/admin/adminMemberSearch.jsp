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
                                   <td class="memId">${m.memberId }</td>
                                   <td>${m.memberName }</td>
                                   <td>${m.nickName }</td>
                                   <td>${m.memberEnrollDate }</td>
                                   <td>${m.memberStatus }</td>
                                   <td><button id="adminStopBtn" 
                                   		style="background-color:${m.memberStatus == 'Y'?'red':'gray'}" >정지</button></td>
                                  </tr>
                                 </c:forEach>
                              </c:otherwise>   
                           </c:choose>
                       </tbody>
                    
                    <script>
                    
                    	
                    
                    	$(function() {
                    		
                    		
                    		//adminStopBtn을 클릭했을 때 빨간색이면 알럿창을 띄운 후 확인 누르면 탈퇴.
                    	
                    			if($('#adminStopBtn').click(function() {
                    				$('#adminStopBtn').css('background-color')
                    					console.log('성공');
                    				}));
                    			});
                    		
                    
                    	
                    	
                    	
                    	$(function() {
                    		$('#adminMemberTable').click(function() {
                    			
                    		  var memberId = $('#adminMemberTable').children('.memId').html();
                    		  alert(memberId);
                    		});
                    	});
                    	
                    	
                    	/*
                    	
                    	function memberInfo(e){
                    		var memberId= $(e).children('.memId').html();
                    		alert(memberId);
                    	}
                    	
                    	
                    	*/
                    	
                    	
                    	
			/*
                        $(function() {
                      	  
                      	  $('#adminMemberTable > tbody > tr').click(function() {
                      		 
                      		  	location.href="memberDetailInfo.ad"; // +++ 사용자의 아이디와 함께 넘기기
                      	  });
                           
                        })
                 */
                             
                    
                    
                
                          
                             
                          //여기서 정지버튼 누른회원의 아이디값을 넘거야하는데 어떻게 넘길 것인지 ? 
                                               
                                         
                                         
                                         
                                         
                                         
                                   
                                      
                                   
                    
                          //'Y'의 정지버튼을 눌렀을 때 'N'으로 바뀌게 
                          
                              
                    
                    </script>
                    
                    
                 </table>
                    
                    
                    
               
                 
                 
                 
                 
                 
                 
            <br><br>
            
            <!-- 페이징 처리 --> 
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