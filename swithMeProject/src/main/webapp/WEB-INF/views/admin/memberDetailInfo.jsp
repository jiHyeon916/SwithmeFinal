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
        
    }
    #adminMemberTable{
       margin:auto;
    }
    #adminMemberTable th, td{
        border: 1px solid rgb(205, 203, 203);
    }
     #adminMemberTable > thead{
        text-align: center;
    }
    #memberDetailSearch input:focus{
       border-color:rgb(3, 195, 115);
       outline: none;
       height:29px;
    }
      #memberDetailSearch input{
         height:29px;
         border-radius : 5px;
         border-color : lightgray;
     }
    #memberDetailSearch select:focus{
        border-color:rgb(3, 195, 115);
        outline: none;
        border-radius : 5px;
    }
    #memberDetailSearch  > select {
          border-radius : 5px;
    }
     #memberDetailSearch{
        margin-left:500px;
     }
     
     #admemBoardChkDel{
        width:20px;
        height:20px;
     }
   
     .memAdDetailBtn > button{
        background-color:white;
        width:80px;
        height:40px;
        border-radius:5px;
        margin-left:10px;
        outline:none;
        border : 1.5px solid lightgray;
        color:ligthgray;
     }
     
     .memAdDetailBtn > button:focus{
        border-color:rgb(3, 195, 115);
        outline: none;
        color:#03c373;
        border : 1.5px solid #03c373;
     }
      .memAdDetailBtn > button:hover{
          border-color:rgb(3, 195, 115);
       	  outline: none;
          color:#03c373;
          border : 1.5px solid #03c373;
      }
      
      #detailDeleteBtn{
		margin-left:470px;
		inline:block;
		background-color : rgb(3, 195, 115);
		color:white;
      }
      .memberDetailInfo{
      	margin-right:300px;
      	text-align:center;
      	padding-top:50px;
      	inline:block;
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
         <div class="topBlock">회원정보</div>
         
               <div class="block">
               
               <div class="memberDetailInfo">
               		<h6>${m.nickName }</h6><br>
               		<pre>${m.memberId }</pre>
               		<pre>${m.memberEmail }</pre>
               </div>
               
               
                              
                     
               <form action="memberDetailSearch.ad" method="post" id="memberDetailSearch">
         
                     <input type="hidden" name="currentPage" value="1">
         
                     <select name="condition" id="adminMemberSelect" >
                         <option value="boardTitle">게시글 제목</option>
                         <option value="boardReply">작성 댓글</option>
                     </select>
         
                     <input type="text" name="keyword">
                     <button type="submit" id="adminMemberBtn">검색</button>
                 </form>
                 <br><br><br>
                 
                 
            <div class="memAdDetailBtn">
                     <button onclick="memberBoardList();">게시판</button>
                     <button onclick="memberBandList();">스터디밴드</button>
                     <button onclick="memberReplyList();">댓글</button>
                     <button id="detailDeleteBtn">삭제</button>
               </div>
               
                 <br><br>
                 
                 
                 <table id="adminMemberTable">
                    <thead>
                         <tr>
                             <th>NO</th>
                             <th>제목</th>
                             <th>내용</th>
                             <th style="width:200px;">날짜</th>
                             <th></th>
                         </tr>
                    </thead>
                    <tbody>
                   
                      
                    </tbody>
                 </table>
            <br><br>
            

            <script>
            
               function memberBoardList() {
                  
                     $.ajax({
                        
                        url: 'memberDetailBoardList.ad',
                        data:{memberId : '${m.memberId}'},
                        success: function(listArr) {
                        	
                        console.log(listArr);
                         let value = "";
                         
                         if(listArr != null) {
                        	 
                        for(let i in listArr) {
                        	
                        	
                        	let list = listArr[i];
                        	console.log(list);
                        	
                        	value 	+= '<tr>' 
                           		  	 +'<td>' + list.boardNo + '</td>'
	                           		 +'<td>' + list.boardTitle + '</td>'
	                           		 +'<td>' + list.boardContent + '</td>'
	                           		 +'<td>' + list.createDate + '</td>'
                        			 +'<td>' + '<input type="checkbox" name="BoardChkDel" id="admemBoardChkDel"></input>' + '</td>'
                        			 +'</tr>'
                        }
                        
                        $('#adminMemberTable tbody').html(value);
                         }else{
                        	 
                        	  $('#adminMemberTable tbody').html('작성된 게시물이 존재하지 않습니다.');
                         }
                         
                           
                        },error:() => {
                           console.log('실패');
                        }
                     })
                   }
               
               
               
               
               
               
               function memberBandList() {
            	   
            	   
            	   $.ajax({
            		   
            		   	url : 'memberBandList.ad',
            		   	data:{memberId : '${m.memberId}'},
            		   	success : function(listArr) {
            		   		
            		   		console.log(listArr);
            		   		
            		   		if(listArr != null) {
            		   			
            		   			for(let i in listArr) {
            		   			value = "";	
            		   			let list = listArr[i];
            		   			console.log(list);
            		   			
            		   			  value  += '<tr>' 
	                          		  	 +'<td>' + list.sbNo + '</td>'
		                           		 +'<td>' + list.sbTitle + '</td>'
		                           		 +'<td>' + list.sbIntroduce + '</td>'
		                           		 +'<td>' + list.createDate + '</td>'
	                       				 +'<td>' + '<input type="checkbox" name="BandChkDel" id="admemBoardChkDel"></input>' + '</td>'
	                       				 +'</tr>'
            		   			}
            		   		 $('#adminMemberTable tbody').html(value);
            		   		
            		   		}else{
            		   			
            		   		 $('#adminMemberTable tbody').html('작성된 게시물이 존재하지 않습니다.');
            		   		}
            		   		
            		   	},error: () => {console.log('실패');}
            	   });
               };
               
               
       /*         
               function memberReplyList() {
            	   
            	   	$.ajax({
            	   		
            	   		url : 'memberReplyList.ad',
            	   		data : {memberId : '${m.memberId}'},
            	   		success : function(result) {
            	   			
            	   			
            	   			
            	   			
            	   		},error: () => {console.log('실패');}
            	   	});
            	   	
            	   	
            	   
            	   
            	   
            	   
            	   
               }
             */
             
            
         
             $(function() {
            	 
            	 
            	 var boardNo = $(this).parent().next().next().next().children('tbody').children('tr').children('td').eq(0).text();
            		console.log(boardNo);
            		
            	 
            	 $('#detailDeleteBtn').on('click',function() {
            		 
            		if($('#adminMemberTable input[name=BoardChkDel]:checked')
            				.length == 0) {
            			
            				alert('선택된 글이 없습니다.');
            				
            		}else{
            			
            			if(confirm('선택된 글을 삭제하시겠습니까 ?')){
            				
            				$.ajax({
            						url :'deleteBoardDetail.ad',
            						data : {boardNo : boardNo},
            						success: function(result){
            							
            							if(result == 'Y') {
            								alert('삭제되었습니다.');
            								location.reload();
            								
            							}else{
            								alert('삭제에 실패하였습니다.');
            							}
            							
            							
            						},error: () => {console.log('실패');}
            				});
            			}            			
            			
            		}
          
            	 });
             }); 
             
             
             
 		 	$(function() {
            	 
            	 $('#detailDeleteBtn').on('click',function() {
            		 
            	 var boardNo = $(this).parent().next().next().next().children('tbody').children('tr').children('td').eq(0).text();
            		console.log(boardNo);
            		
            		if($('#adminMemberTable input[name=BandChkDel]:checked').length == 0) {
            			
            				alert('선택된 글이 없습니다.');
            				
            		}else{
            			
            			if(confirm('선택된 글을 삭제하시겠습니까 ?')) {
            				
            				$.ajax({
            						url :'deleteBoardDetail.ad',
            						data : {boardNo : boardNo},
            						success: function(result){
            							
            							if(result == 'Y') {
            								alert('삭제되었습니다.');
            								location.reload();
            							}else{
            								alert('삭제에 실패하였습니다.');
            							}
            							
            							
            						},error: () => {console.log('실패');}
            				});
            			}
            			
            			
            		}
          
            	 });
             });  
             
             
            </script>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
      <%--       <!-- 페이징처리 -->
            <div class="paBtn">
            
               <!-- 현재페이지가 1이면 이전버튼 작동 x 아니면 현재페이지 -1 작동 -->
                  <c:choose>
                     <c:when test="${pi.currentPage eq 1}" >
                        <button disabled><a href="#">이전</a></button>
                     </c:when>
                     <c:otherwise>
                        <button><a href="adminMember.ad?amPage=${pi.currentPage - 1 }">이전</a></button>
                     </c:otherwise>
                  </c:choose>
                  
                  
                  <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                     <button><a href="adminMember.ad?amPage=${p }">${p }</a></button>
                  
                  </c:forEach>
                  
                  
                  <!-- 다음 버튼 만들기 -->
                  <c:choose>
                     <c:when test="${pi.currentPage eq pi.maxPage }">
                        <button disabled><a href="#">다음</a></button>
                     </c:when>
                     <c:otherwise>
                        <button><a href="adminMember.ad?amPage=${pi.currentPage + 1 }">다음</a></button>
                     </c:otherwise>
                  </c:choose>
               </div>
                --%>
               
               
               
            </div>
         </div>
      </div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>><br>
</body>
</html>