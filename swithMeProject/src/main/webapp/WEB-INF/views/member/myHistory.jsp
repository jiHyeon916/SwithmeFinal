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
                    <button class="deleteBtn_yj">선택삭제</button>
                </div>
				
				<div id="test"></div>

				<!-- 리스트 출력 -->
                <div class="postList">
                	<c:if test="${ not empty list }">
                		<%-- <c:forEach items="${ list }" var="b">
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
                		</c:forEach> --%>
                	</c:if>
                	<c:if test="${ empty list }">
                		<span class="emptyList">등록된 게시글이 없습니다.</span>
                	</c:if>
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
	
	<%-- <c:if test="${ not empty list }">  --%>
		<script>
		
			$(function(){

				selectItem('board');
				
			}); // $function
			
		
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
		
			
			// 게시판 / 댓글 선택
			let items = '';
			function selectItem(itemtest){
				items = itemtest;
				selectBoard('free');
			};
			
			
			let cp = 1;
			
			// 커뮤니티 / 질문정보 선택
			function selectBoard(board){
				
				
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
						let typeBtn = jList[0].boardType;
						cp = jObj.pi.currentPage;
						
						console.log(cp);
						
						let value = '';
						
							if(jItem === 'board'){
								
								// 게시판 / 댓글 버튼 표시
								$('.myPost').removeClass('noneSpan').addClass('selectSpan');
								$('.myReply').removeClass('selectSpan').addClass('noneSpan');
								
								// 커뮤니티 / 질문정보 버튼 표시
								boardType(typeBtn);
								
								for(let i in jList){
									console.log(jList[i].boardNo);
									
									value += '<input type="checkbox" name="boardCheck">'
										   + '<div class="post_block">'
										   	   + '<input type="hidden" name="bno" value="' + jList[i].boardNo + '"/>'
										   	   + '<div class="post_top">'
												   + '<div class="post_cate">' + jList[i].category +'</div>'
												   + '<p class="post_title">' + jList[i].boardTitle + '</p>'
										  	   + '</div>'
											   + '<p class="post_con">' + jList[i].boardContent + '</p>'
						                       + '<ul id="post_etc">'
							                       + '<li>댓글수' + jList[i].commentCount + '</li>'
						                           + '<li>좋아요' + jList[i].likeCount + '</li>'
						                           + '<li>조회수' + jList[i].count + '</li>'
						                           + '<li class="post_date">' + jList[i].createDate + '</li>'
					                       	   + '</ul>'
										   + '</div>';
								}
								
							} else {
								
								// 게시판 / 댓글 버튼 표시
								$('.myReply').removeClass('noneSpan').addClass('selectSpan');
								$('.myPost').removeClass('selectSpan').addClass('noneSpan');
								
								// 커뮤니티 / 질문정보 버튼 표시
								boardType(typeBtn);
								
								for(let i in jList){
									console.log(jList[i].boardNo);
									
									value += '<input type="checkbox" name="boardCheck">'
										   + '<div class="post_block">'
										   	   + '<input type="hidden" name="bno" value="' + jList[i].boardNo + '"/>'
										   	   + '<div class="post_top">'
												   + '<p class="post_title">' + jList[i].boardReplyContent + '</p>'
										  	   + '</div>'
											   + '<p class="post_con">' + jList[i].boardTitle + '</p>'
						                       + '<ul id="post_etc">'
						                           + '<li class="post_date">' + jList[i].createDate + '</li>'
					                       	   + '</ul>'
										   + '</div>';
								}
								
							}
						
						$('.postList').html(value);
						$('.post_Btn > span').html('전체 게시글 수 : ' + jObj.pi.listCount + '개');
						
					},
					error : () => {
						
					}
				});
			}; //selectBoard
			
		</script>
	<%-- </c:if>  --%>
</body>
</html>