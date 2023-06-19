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
     
     #admemBoardChkDel, #admemBandChkDel{
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
		margin-left:540px;
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
      
      .selectBtn{
          border-color:rgb(3, 195, 115)  !important;
       	  outline: none;
          color:#03c373;
          border : 1.5px solid #03c373;
      
      }
      
      .noBoardMessage{
      
 		 align-items: center;
  		justify-content: center;
  		text-align: center;
  		border:1px;
  		border-color:red;
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
               
               
                              
                    
         	<div style="margin-left:480px;">
                     <input type="hidden" name="currentPage" value="1">
         
                     <select name="condition" id="adminMemberSelect" >
                         <option value="boardTitle">게시글 제목</option>
                         <option value="boardContent">게시글 내용</option>
                     </select>
         
                     <input type="text" name="keyword">
                     <button type="submit" id="adminMemberBtn">검색</button>
            </div>
                 <br><br><br>
           
            <div class="memAdDetailBtn">
                     <button onclick="memberBoardList();" class="memberBoardList" style="margin-left:50px;">게시판</button>
                     <button onclick="memberBandList();" class="memberBandList">스터디밴드</button>
                     <button id="detailDeleteBtn">선택삭제</button>
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
            
            
            
            
            
			<!-- 회원 게시글 조회 -->
            <script>
            	
            	//게시판 버튼이 눌린채로 load
             	$(function() {
             		$('.memberBoardList').click();
             	});
             	
             	//회원이 작성한 게시판 글 조회
               function memberBoardList() {
                  
                     $.ajax({
                        url: 'memberDetailBoardList.ad',
                        data:{memberId : '${m.memberId}'},
                        success: function(listArr) {
                         	let value = "";
	                         $('.memberBandList').removeClass('selectBtn');
	                         $('.memberBoardList').addClass('selectBtn');
                         
                        	 	if(listArr.length != 0) {
                        			for(let i in listArr) {
			                        	let list = listArr[i];
			                        	let boardNo = listArr[i].boardNo;
					                        	value 	+= '<tr>' 
					                           		  	 +'<td>' + list.boardNo + '</td>'
						                           		 +'<td>' + list.boardTitle + '</td>'
						                           		 +'<td>' + list.boardContent + '</td>'
						                           		 +'<td>' + list.createDate + '</td>'
					                        			 +'<td>' + '<input type="checkbox" value="' + boardNo + '" name="BoardChkDel" id="admemBoardChkDel"></input>' + '</td>' 
					                        			 +'</tr>' //value값에 원하는 값을 담아서 체크되면 넘기기 
                        						}
                       					 $('#adminMemberTable tbody').html(value);
                        			 }else{
                        	  			$('#adminMemberTable tbody').html('작성된 게시물이 존재하지 않습니다.');
                         				}
                        		},error:() => {console.log('실패');}
                     		  })
                            };

                   
               //회원이 작성한 밴드 글 조회            
               function memberBandList() {
            	   
            	   $.ajax({
            		   	url : 'memberBandList.ad',
            		   	data:{memberId : '${m.memberId}'},
            		   	success : function(listArr) {
            		   		let	value = "";	
            		   		$('.memberBoardList').removeClass('selectBtn');
            		   		$('.memberBandList').addClass('selectBtn');
            		   		
            		   			if(listArr.length != 0) {
            		   				for(let i in listArr) {
		            		   			let list = listArr[i];
		            		   			let sbNo = listArr[i].sbNo;
			            		   			  value  += '<tr>' 
				                          		  	 +'<td>' + list.sbNo + '</td>'
					                           		 +'<td>' + list.sbTitle + '</td>'
					                           		 +'<td>' + list.sbIntroduce + '</td>'
					                           		 +'<td>' + list.createDate + '</td>'
				                       				 //+'<td>' + '<input type="checkbox" value="' + list.sbNo + '" name="BandChkDel" id="admemBandChkDel"></input>' + '</td>'
				                       				 +'<td>' + '<input type="checkbox" value="' + sbNo + '" name="BandChkDel" id="admemBandChkDel"></input>' + '</td>'
				                       				 +'</tr>'
            		   							}
            		   					 $('#adminMemberTable tbody').html(value);
            		   				}else{
            		   					$('#adminMemberTable tbody').html('작성된 게시물이 존재하지 않습니다.');
            		   					}
            		   			},error: () => {console.log('실패');}
            	     		  });
                            };
                  </script>
                  
                  
                  
                  <!-- 회원이 작성한 게시글 삭제 -->
                  <script>
                  
                  
				        	//삭제 ajax 
				             $(function() {
				            	 $('#detailDeleteBtn').on('click',function() {
					            	var boardChk = $('#adminMemberTable input[name=BoardChkDel]:checked'); //게시판에서 체크된 체크박스
					            	var bandChk =$('#adminMemberTable input[name=BandChkDel]:checked');    //밴드에서 체크된 체크박스 	
					            		if(boardChk.length == 0 && bandChk.length == 0) {
					                 	 		alert('선택된 글이 없습니다.');
					                 	 		return;
					            		}else{
						            			 let boardChkArr = [];
						            			 let bandChkArr = [];
						            			 let yes = confirm('선택된 글을 삭제하시겠습니까?');
				            						if(yes) {
							            				if(boardChk.each(function(index, i){
							            					boardChkArr[index] = $(this).val(); // 체크박스에서 band 혹은 board의 no값을 넘겼음. 
							            				}));
				            					    if(bandChk.each(function(index,i){
				            							bandChkArr[index] = $(this).val();  
				            							}));
								            					$.ajax({
								        	 						url :'deleteBoardDetail.ad',
								        	 						data : {boardNo : boardChkArr},
								        	 						traditional: true,                       // 이거 트랜잭션 해줘야지 오류가 안뜸 . ..! 왜 ?????????????
								        	 						success: function(result){
								        	 							
								        	 							if(result > 0) {
								        	 								alert('삭제되었습니다.');
								        	 								location.reload();
								        	 							}else{
								        	 								alert('삭제에 실패하였습니다.');
								        	 								}
								        	 							},error: () => {console.log('실패');}
								        	 						});
								            					
								            					$.ajax({
								        	 						url :'deleteBandDetail.ad',
								        	 						data : {bandNo : bandChkArr},
								        	 						traditional: true,
								        	 						success: function(result){
								        	 							
								        	 							if(result > 0) {
								        	 								alert('삭제되었습니다.');
								        	 								location.reload();
								        	 							}else{
								        	 								alert('삭제에 실패하였습니다.');
								        	 								}
								        	 							},error: () => {console.log('실패');}
								        	 						});
				            							}
				            						}
				            		 			}) 
				            	 			});
           		 </script>
            
            
            
             <!-- 회원 글 keyword로 검색하기 -->
           		<script>
           
           		//카테고리별 검색 내용 결과 
           		$(function() {
           			$('#adminMemberBtn').on('click',function() {	//검색 버튼을 눌렀을 때 
           			
           				var bandColor = $('.memberBandList').css('border-color'); // 스터디밴드의 색
           				var boardColor = $('.memberBoardList').css('border-color');
           				var boardTitle = $(this).parent().children().children().val(); //condition = 게시글 제목
           				var boardContent = $(this).parent().children().children().next().val();//condition = 게시글 내용
           				var memberId = $(this).parent().parent().children().find('pre').eq(0).text(); 
           				var keyword = $(this).prev('input').val();
           				
           				//게시글 + 제목 검색조회 목록 
           				if(boardColor === 'rgb(3, 195, 115)' && $('#adminMemberSelect').val() === boardTitle) { 
           					
           					$.ajax({
           						url : 'memBoardSearchTitle.ad',
           						data: {memberId : memberId,
           								keyword : keyword},
           						success : function(list){
           							
           							if(list.length != 0){   
           								let value = "";
           									for(let i in list) {
           										let boardNo = list[i].boardNo;
		           									value 	+= '<tr>' 
			                                      		  	 +'<td>' + list[i].boardNo + '</td>'
			           	                           			 +'<td>' + list[i].boardTitle + '</td>'
			           	                           			 +'<td>' + list[i].boardContent + '</td>'
			           	                           			 +'<td>' + list[i].createDate + '</td>'
			           	                           		 	 +'<td>' + '<input type="checkbox" value="' + boardNo + '" name="BoardChkDel" id="admemBoardChkDel"></input>' + '</td>'
			                                   				 +'</tr>'
           									}
           								 $('#adminMemberTable tbody').html(value);
           						    }else{
                                  	  	$('#adminMemberTable tbody').html('작성된 게시글이 존재하지 않습니다.');
                                   		}
           							},error : () => {console.log('실패');}		
           					      });
           			
           				
           				} // 게시글 + 내용
           				else if(boardColor === 'rgb(3, 195, 115)' && $('#adminMemberSelect').val() === boardContent){ 
           					
           					$.ajax({
           						url : 'memBoardSearchContent.ad',
           						data: {memberId : memberId,
           							   keyword : keyword},
           						success : function(list){
           							
           							if(list.length != 0){
           								let value = "";
           									for(let i in list){
           										let boardNo = list[i].boardNo;
		           									value 	+= '<tr>' 
			                                     		  	 +'<td>' + list[i].boardNo + '</td>'
			          	                           			 +'<td>' + list[i].boardTitle + '</td>'
			          	                           			 +'<td>' + list[i].boardContent + '</td>'
			          	                           			 +'<td>' + list[i].createDate + '</td>'
			          	                           		   	 +'<td>' + '<input type="checkbox" value="' + boardNo + '" name="BoardChkDel" id="admemBoardChkDel"></input>' + '</td>'
			                                  				 +'</tr>'
           								  }
           								$('#adminMemberTable tbody').html(value);
           							}else{
           							    $('#adminMemberTable tbody').html('작성된 게시물이 존재하지 않습니다.');
           							  }
           						   },error: () => {console.log('실패');}	   
           					     });
           					
           					
           				// 스터디밴드 + 제목	
           				}else if(bandColor === 'rgb(3, 195, 115)' && $('#adminMemberSelect').val() === boardTitle){ 
           					
           					 $.ajax({
           						 url : 'memBandSearchTitle.ad',
           						 data : {memberId : memberId,
           							 	keyword : keyword},
           						success : function(list) {
           							
           							if(list.length != 0) {
           								let value = "";
           								for(let i in list) {
           									let sbNo = list[i].sbNo; 
			       									value 	+= '<tr>' 
			                                     		  	 +'<td>' + list[i].sbNO + '</td>'
			          	                           			 +'<td>' + list[i].sbTitle + '</td>'
			          	                           			 +'<td>' + list[i].sbIntroduce + '</td>'
			          	                           			 +'<td>' + list[i].createDate + '</td>'
			          	                           		   	 +'<td>' + '<input type="checkbox" value="' + sbNo + '" name="BandChkDel" id="admemBandChkDel"></input>' + '</td>'
			                                  				 +'</tr>'
           							  }
           								$('#adminMemberTable tbody').html(value);
           							}else{
           							  	$('#adminMemberTable tbody').html('작성된 게시물이 존재하지 않습니다.');
           							  }
           						   },error : () => {console.log('실패');}
           					    });
           					
           					
           				  // 스터디밴드 + 내용
           				}else if(bandColor === 'rgb(3, 195, 115)' && $('#adminMemberSelect').val() === boardContent){
           					
           					$.ajax({
           						url : 'memBandSearchContent.ad',
           						data : {memberId : memberId,
           								keyword : keyword},
           						success : function(list) {
           							
           							if(list.length != 0) {
           								value = "";
           									for(let i in list) {
           										let sbNo = list[i].sbNo; 
		           									value 	+= '<tr>' 
		                                         		  	 +'<td>' + list[i].sbNO + '</td>'
		              	                           			 +'<td>' + list[i].sbTitle + '</td>'
		              	                           			 +'<td>' + list[i].sbIntroduce + '</td>'
		              	                           			 +'<td>' + list[i].createDate + '</td>'
		              	                           		   	 +'<td>' + '<input type="checkbox" value="' + sbNo + '" name="BandChkDel" id="admemBandChkDel"></input>' + '</td>'
		                                      				 +'</tr>'
           								}
           								$('#adminMemberTable tbody').html(value);
           							}else{
           							    $('#adminMemberTable tbody').html('작성된 게시물이 존재하지 않습니다.');
           							   }
           							},error : () => {console.log('실패');}	
           						  });
           					    };
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