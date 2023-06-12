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
                <span>게시글</span>
                <span>댓글</span>
            </div>

            <div class="block"> 
            	<!-- 카테고리 영역 -->
                <div class="post_Btn">
                    <button class="commu">커뮤니티</button>
                    <button class="question">질문정보</button>
                    <span>전체 게시글 수 : ${ pi.listCount }개</span>
                    <button class="deleteBtn_yj">선택삭제</button>
                </div>


				<!-- 리스트 출력 -->
                <div class="postList">
                
                	<c:if test="${ not empty list }">
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
		                            <li>댓글수 16</li>
		                            <li>좋아요 10</li>
		                            <li>조회수 ${ b.boardCount }</li>
		                            <li class="post_date">${ b.createDate }</li>
		                        </ul>
		                    </div>
                		</c:forEach>
                	</c:if>
                	<c:if test="${ empty list }">
                		<span class="emptyList">등록된 게시글이 없습니다.</span>
                	</c:if>
                	
                </div>

                <!-- 페이징버튼 -->
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

            </div>
			
		</div>
        
	</div>
	
	<script>
	$(function(){
		
	}); // $function
	
	function boardType(){
		let type = '${ b.boardType }';
		
		if(type === 'free'){
			
		}
	};
	
	
	
	
	
	
	
	
	
	</script>
</body>
</html>