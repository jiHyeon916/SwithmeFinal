<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- MainCss -->
    <link rel="stylesheet" href="/swithme/resources/css/band/bandMain.css">
    <link rel="stylesheet" href="/swithme/resources/css/band/bandNotice.css">
</head>
<body>
	<jsp:include page="bandHeader.jsp"/>
		
	<div class="wrap">
			<jsp:include page="bandSideBar.jsp"/>
			    <div id="blank">.</div>
	
		    <div class="mainDiv" >
	    <br><br>
	    	<div>
		        <span class="Writer">
	       			<strong class="menuInfo">밴드 공지</strong>
	       		</span>
	    	</div>
	   		<br>
	   		
	   		<br><br>
	    	<c:forEach var="bb" items="${ list }">
		        <div class="bPostList" data-toggle="modal" data-target="#detailBandNotice">
		        	<input id="sBoardNo" type="hidden" value="${ bb.sbBoardNo }">
		        	<br>
		        	<div class="postWriterInfo">
		        		<span class="writer">
		        			<strong>${ bb.memberId }</strong>
		        		</span>
		        	</div>
		        	<div class="postWriterInfo">
		        		<span class="writer">${ bb.sbCreateDate }</span>
		        	</div>
		        	<hr>
		        	<div class="postBody">
		        		<p class="writer">
							${ bb.sbContent }
		        		</p>
		        	</div>
		        	<br>
		        	<c:if test="${ not empty bb.changeName }">
		        		<div class="photoBody">
							<img id="photoImg" src="${ bb.changeName }">
		        		</div>
		        	</c:if>
		        	<br>
		        	
		        	<div class="postFooter">
		        		<div class="hitsBody">조회수(${ bb.sbCount })</div>
		        	</div>
		        	<br><br>
		        </div>
	        </c:forEach>
	    </div>
		<div class="mainButton">
	    	<div class="toptop"><img src="/swithme/resources/images/band/inventory.png" alt=""></div>
	    </div>
	</div>

    <script>
        $('.mainButton > .toptop').click(function(){
        	location.href="/swithme/studyBand.bo";
        })

    </script>
	
	<!--밴드 게시글 디테일창-->
       	<div class="modal" id="detailBandNotice">
        	<div class="modal-dialog modal-lg">
            	<div class="modal-content">
            
	                <!-- Modal body -->
	                <div class="modal-body">
	                <button type="button" class="close" data-dismiss="modal">&times;</button>
	                    <form action="delete.me" method="post">
	                 		<br>
	                        <div class="form-group1">
	                        	<div>
	                        		<div class="totalDetail">
	                        		<!-- 닉네임, 날짜, 조회수 시작 -->
	                        			<div class="middleDiv">
		                        			<div class="nicknameDiv">
					                        	<p id="detailNickName"></p>
		                        			</div>
	                        				<div class="dateDiv">
				                        		<P id="detailDate"></P>
	                        				</div>
	                        				<div class="countDiv">
					                        	<p id="detailCount"></p> 
	                        				</div>
	                        			</div>
	                        			<br>	
	                        			<hr>
	                        		<!-- 닉네임, 날짜, 조회수 끝 -->
	                        			<div class="ContentDiv">
	                        				<p id="detailContent"></p>
	                        			</div>
	                        			<br>
	                        			<div class="photoBody">
											<img id="photoImg1" src="">
						        		</div>
	                        			<hr>
	                        			<br>
		                        	
	                        		</div>
	                        	</div>
	                        </div>
	                        <br>
	                        <div class="btnGroupMain">
		                        <button class="enrollConfirm" type="submit">수정하기</button>
		                        <button class="enrollDismiss" type="button" id="deleteBoard" data-dismiss="modal">삭제하기</button>
	                        	<input type="hidden" class="sBoardNoModal" name="bandNo" value="">
	                        </div>
	                    </form>
	                </div>
            	</div>
        	</div>
		</div>
		
		<script>
			$(document).on('click', '.bPostList', function(){
				var inputNo = $(this).children().eq(0).val();
				$('.sBoardNoModal').attr('value', inputNo);
				// console.log(inputNo);

				$.ajax({
					url : 'noticeDetail.sb',
					data : { sbBoardNo : inputNo },
					success : function(list){
						// console.log(list);
						$('#detailNickName').text("닉네임 : " + list.memberId);
						$('#detailDate').text("날짜 : " + list.sbCreateDate);
						$('#detailCount').text("조회 수 : " + list.sbCount);
						$('#detailContent').html(list.sbContent);
						$('#sbContent').text(list.sbContent);
						if(list.changeName == 0){
							$('.photoBody').css('display', 'none');
							
						} else {
							$('#photoImg1').attr('src', list.changeName);
							
						}
						
					},
					error : function(){
						console.log('실패');
					}
				})	
			});

			// 게시글 삭제 영역
			$(document).on('click', '#deleteBoard', function(){
				var sbBoardNo = $(this).next().val();
				
				var query = window.location.search;     
				var param = new URLSearchParams(query);
				var sno = param.get('sno');

				$.ajax({
					url : 'deleteBoard.sb',
					data : { sbBoardNo : sbBoardNo },
					success : function(list){
						alert('공지사항 삭제 성공');
						location.href = 'bandNotice.sb?sno='+sno;
					},
					error : function(){
						console.log('게시글 삭제 실패');
					}
				})	
			});
		</script>
	    
</body>
</html>