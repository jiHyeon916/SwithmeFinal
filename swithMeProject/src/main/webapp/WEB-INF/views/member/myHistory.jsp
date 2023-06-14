<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/myHistory.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<jsp:include page="myMenuBar.jsp" />
		</div>
		
        <!-- 컨텐츠 영역 -->
		<div class="content">
            <!-- 게시글 -->
			<div class="topBlock">
                <span class="myPost selectSpan" onclick="selectItem('board');">게시글</span>
                <span class="myReply noneSpan" onclick="selectItem('reply');">댓글</span>
            </div>

            <div class="block"> 
            	<!-- 카테고리 영역 -->
                <div class="post_Btn">
                    <button class="freeBtn selectBtn" onclick="selectBoard('free');">커뮤니티</button>
                    <button class="infoBtn noneBtn" onclick="selectBoard('info');">질문정보</button>
                    <span></span>
                    <button class="deleteBtn_yj" onclick="deleteArr();">선택삭제</button>
                </div>
				
				<div id="test"></div>

				<!-- 리스트 출력 -->
                <div class="postList">
                	<%-- <c:if test="${ not empty list }">
                		<c:forEach items="${ list }" var="b">
	                        <input type="checkbox" name="boardCheck">
                			<div class="post_block">
        						<input type="hidden" name="bno" value="${ b.boardNo }" />
		                        <div class="post_top">
		                            <div class="post_cate">${ b.category }</div>
		                            <p class="post_title">${ b.boardTitle }</p>
		                        </div>
		                        <p class="post_con">${ b.boardContent }</p>
		                        <ul id="post_etc">
		                            <li>댓글수 ${ b.commentCount }</li>
		                            <li>좋아요 ${ b.likeCount }</li>
		                            <li>조회수 ${ b.count }</li>
		                            <li class="post_date">${ b.createDate }</li>
		                        </ul>
		                    </div>
                		</c:forEach>
                	</c:if>
                	<c:if test="${ empty list }">
                		<span class="emptyList">등록된 게시글이 없습니다.</span>
                	</c:if> --%>
                </div>
				 
                <!-- 페이징버튼 -->
                <!-- 
                <c:if test="${ not empty list }">
	                <div class="paBtn">
		            	<c:choose>
		                    <c:when test="${ pi.currentPage eq 1 }">
		                    	<button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">&lt;</button>
		                    </c:when>
		                    <c:otherwise>
		                        <button onclick="location.href='history.me?cPage=${ pi.currentPage -1 }'">&lt;</button>
		                    </c:otherwise>
	                	</c:choose>
		                   
	                   <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
		                   <c:choose>
			                   <c:when test="${ p eq pi.currentPage }">
				           			<button disabled style="background-color : rgb(3, 195, 115); color : white; " onclick="location.href='history.me?cPage=${ p }'">${ p }</button>
			                   </c:when>
			                   <c:otherwise>
				               		<button onclick="location.href='history.me?cPage=${ p }'">${ p }</button>
			                   </c:otherwise>
		                   </c:choose>
	                   </c:forEach>
		                   
	                   <c:choose>
		                   <c:when test="${ pi.currentPage eq pi.maxPage }">
		                   		<button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">&gt;</button>
		                   </c:when>
	                       <c:otherwise>
	                       		<button onclick="location.href='history.me?cPage=${ pi.currentPage + 1 }'">&gt;</button>
	                   	   </c:otherwise>
	                   </c:choose>
					</div>
                </c:if>
                 -->
            </div>
		</div>
        
	</div>
	
		<script>
		
			$(function(){

				selectItem('board');
				
			});
			
		
			// 커뮤니티 / 질문정보 버튼 표시
			function boardType(typeBtn){
				if(typeBtn == 'free'){
					$('.freeBtn').removeClass('noneBtn').addClass('selectBtn');
					$('.infoBtn').removeClass('selectBtn').addClass('noneBtn');
				} else {
					$('.infoBtn').removeClass('noneBtn').addClass('selectBtn');
					$('.freeBtn').removeClass('selectBtn').addClass('noneBtn');
				}
			};
			
			// 게시판 / 댓글 버튼 표시
			function itemType(items){
				if(items == 'board'){
					$('.myPost').removeClass('noneSpan').addClass('selectSpan');
					$('.myReply').removeClass('selectSpan').addClass('noneSpan');
				} else {
					$('.myReply').removeClass('noneSpan').addClass('selectSpan');
					$('.myPost').removeClass('selectSpan').addClass('noneSpan');
				}
			};
			
			// 게시판 / 댓글 선택
			let items = '';
			function selectItem(itemtest){
				items = itemtest; // 변수 대입
				itemType(items); // 버튼 표시
				selectBoard('free'); // 리스트 뽑기
			};
			
			
			let cp = 1;
			let chooseBoard = '';
			
			// 커뮤니티 / 질문정보 선택
			function selectBoard(board){
				
				boardType(board); 
				chooseBoard = board;
				
				$.ajax({
					url : 'historySelectBoard',
					data : {
						cPage : cp, // 현재페이지
						boardType : board, // 게시판유형구분
						item : items // 게시판, 댓글 구분
					},
					success : jObj => {
						// 필요 변수 선언
						let jList = jObj.list;
						let jItem = jObj.item;
						cp = jObj.pi.currentPage;
						
						let value = '';
						
						if(jList.length == 0){
							value = '<span class="emptyList">등록된 게시글이 없습니다.</span>';
						} else {
							let typeBtn = jList[0].boardType;
							
							if(jItem === 'board'){
								
								for(let i in jList){
									value += '<input type="checkbox" name="boardCheck">'
										   + '<div class="post_block">'
										   	   + '<input type="hidden" name="bno" value="' + jList[i].boardNo + '"/>'
										   	   + '<div class="post_top">'
												   + '<div class="post_cate">' + jList[i].category +'</div>'
												   + '<p class="post_title">' + jList[i].boardTitle + '</p>'
										  	   + '</div>'
											   + '<p class="post_con">' + jList[i].summary + '</p>'
						                       + '<ul id="post_etc">'
							                       + '<li><img src="resources/images/board/reply.png">' + jList[i].commentCount + '</li>'
						                           + '<li><img src="resources/images/board/heart.png">' + jList[i].likeCount + '</li>'
						                           + '<li><img src="resources/images/board/views.png">' + jList[i].count + '</li>'
						                           + '<li class="post_date">' + jList[i].createDate + '</li>'
					                       	   + '</ul>'
										   + '</div>';
								};
							} else {
								
								for(let i in jList){
									value += '<input type="checkbox" name="boardCheck">'
										   + '<div class="post_block">'
										   	   + '<input type="hidden" name="bno" value="' + jList[i].boardNo + '"/>'
										   	   + '<input type="hidden" name="rno" value="' + jList[i].boardReplyNo + '"/>'
										   	   + '<div class="post_top">'
												   + '<p class="post_title">' + jList[i].boardReplyContent + '</p>'
										  	   + '</div>'
											   + '<p class="post_con">' + jList[i].boardTitle + '</p>'
						                       + '<ul id="post_etc">'
							                       + '<li></li>'
							                       + '<li></li>'
							                       + '<li></li>'
						                           + '<li class="post_date">' + jList[i].createDate + '</li>'
					                       	   + '</ul>'
										   + '</div>';
								};
								
							};
						
						};
						
						$('.postList').html(value);
						$('.post_Btn > span').html('전체 게시글 수 : ' + jObj.pi.listCount + '개');
						
					},
					error : () => {
						console.log('없어');
					}
				});
			}; //selectBoard
			
			// 해당 게시글 상세 페이지로 이동
			$(document).on('click', '.post_block', function(){
				let boardNo = $(this).children().eq(0).val();
				location.href = 'freeBoardDetail.bo?boardNo=' + boardNo;
			});
			
			// 선택삭제
			function deleteArr(){
				console.log(items);
				console.log(chooseBoard);
				
				if($('input[name=boardCheck]:checked').length == 0){
					alert('삭제할 문의글을 선택해주세요.');
				} else {
					let deleteYes = confirm('삭제 후 복구가 불가능합니다. 삭제하시겠습니까?');
					
					if(deleteYes){
						let bnoArr = [];
						
						if(items === "board"){
							$('input[name=boardCheck]:checked').each(function(index, i){
								bnoArr[index] = $(this).next().children().eq(0).val();
							});
						} else {
							$('input[name=boardCheck]:checked').each(function(index, i){
								bnoArr[index] = $(this).next().children().eq(1).val();
							});
						}			
						
						
						$.ajax({
							url : 'historyDelete',
							traditional: true,
							data : {
								bnoArr : bnoArr,
								item : items
							},
							success : result => {
								if(result > 0){
									selectBoard(chooseBoard);
								} else {
									alert('게시글 삭제에 실패하였습니다.');
								}
							},
							error : () => {
								console.log('실패');
							}
						
						});
						
					}
					
				}
				
			};
			
		</script>
</body>
</html>