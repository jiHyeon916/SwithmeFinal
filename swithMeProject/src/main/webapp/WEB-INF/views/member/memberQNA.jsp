<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/memberQNA.css">
</head>
<body>

	<c:if test="${ not empty failMsg }">
		<script>
			alert('${failMsg}');
		</script>
	</c:if>

	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<c:choose>
				<c:when test="${ loginMember.memberId eq 'admin' }">
					<jsp:include page="../admin/adminMenuBar.jsp" />
				</c:when>
				<c:otherwise>
					<jsp:include page="myMenuBar.jsp" />
				</c:otherwise>
			</c:choose>
		</div>
		
        <!-- 컨텐츠 영역 -->
		<div class="content">
            <!-- 게시글 -->
			<div class="topBlock">문의글</div>

            <div class="block">
                <!-- 상단버튼 -->
                <div class="post_Btn">
                    <div id="qna_left">
                        <button class="qna_all" onclick="location.href='qna.me'">전체</button>
                        <button class="answer" onclick="qnaCategory(this);" >답변완료</button>
                        <button class="unAnswer" onclick="qnaCategory(this);">미답변</button>
                    </div>
                    

                    <div id="qna_right">
                    	<c:if test="${ loginMember.memberId ne 'admin' }">
	                        <button class="qnaCreate" onclick="location.href='qnaEnroll.me'">문의글작성</button>
                    	</c:if>
                        <button class="deleteBtn_yj" onclick="qnaDeleteArr();">선택삭제</button>
                    </div>
                </div>

                <!-- 목록 -->
                <div class="postList">
                
                	<c:choose>
                		<c:when test="${ not empty list }">
	                		<c:forEach items="${ list }" var="q">
	                            <input type="checkbox" name="qnaCheck">
		                		<div class="post_block">
		                			<input type="hidden" name="qno" value="${ q.qnaNo }" />
			                        <div class="post_top">
			                            <c:choose>
			                            	<c:when test="${ q.qnaStatus eq 'Y'}">
			                            		<div class="post_cate">미답변</div>
			                            	</c:when>
			                            	<c:otherwise>
			                            		<div class="post_cate">답변완료</div>
			                            	</c:otherwise>
			                            </c:choose>
			                            <p class="post_title">${ q.qnaTitle }</p>
			                        </div>
			                        <p class="post_con">${ q.qnaContent }</p>
			                        <span class="post_date">${ q.qnaDate }</span>
			                    </div>
	                		</c:forEach>
	                		
	                		
			                <div class="paBtn">
			                	<c:choose>
			                      <c:when test="${ pi.currentPage eq 1 }">
			                          <button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">&lt;</button>
			                       </c:when>
			                       <c:otherwise>
			                           <button onclick="location.href='qna.me?cPage=${ pi.currentPage -1 }&qnaStatus=${ qnaStatus }'">&lt;</button>
			                       </c:otherwise>
			                    </c:choose>
			                    
			                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			                    	<c:choose>
			                    		<c:when test="${ p eq pi.currentPage }">
					                       <button disabled style="background-color : rgb(3, 195, 115); color : white; " onclick="location.href='qna.me?cPage=${ p }&qnaStatus=${ qnaStatus }'">${ p }</button>
			                    		</c:when>
			                    		<c:otherwise>
					                       <button onclick="location.href='qna.me?cPage=${ p }&qnaStatus=${ qnaStatus }'">${ p }</button>
			                    		</c:otherwise>
			                    	</c:choose>
			                    </c:forEach>
			                    
			                    <c:choose>
			                      <c:when test="${ pi.currentPage eq pi.maxPage }">
			                          <button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">&gt;</button>
			                       </c:when>
			                       <c:otherwise>
			                          <button onclick="location.href='qna.me?cPage=${ pi.currentPage + 1 }&qnaStatus=${ qnaStatus }'">&gt;</button>
			                       </c:otherwise>
			                    </c:choose>
							</div>
                		</c:when>
                		<c:otherwise>
                            <span class="emptyList">등록된 게시글이 없습니다.</span>
                		</c:otherwise>
                	</c:choose>
                	
                </div>

            </div>
			
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<script>
		
		$(function(){
			
			qnaStatus(); // 문의글 답변여부 표시
			btnColor(); // 문의글 답변여부 버튼 표시
			
		}); // $function
		
		
		// 선택삭제
		function qnaDeleteArr(){
			
			if($('input[name=qnaCheck]:checked').length == 0){
				alert('삭제할 문의글을 선택해주세요.');
			} else {
				
				let deleteYes = confirm('삭제 후 복구가 불가능합니다. 삭제하시겠습니까?');
				
				if(deleteYes){
					
					let qnoArr = [];
					$('input[name=qnaCheck]:checked').each(function(index, i){
						qnoArr[index] = $(this).next().children().eq(0).val();
						
					})
					
					//console.log(test);
					
					$.ajax({
						url : 'qnaDeleteArr',
						traditional: true,
						data : {
							qnoArr : qnoArr
						},
						success : result => {
							//console.log('성공');
							if(result > 0){
								location.reload();
							} else {
								alert('게시글 삭제에 실패하였습니다.');
							}
						},
						error : () => {
							console.log('실패');
						}
						
					}); // ajax
					
				};
				
			};
			
		};
		
		
		
		// 답변여부 표시
		function qnaStatus(){
			let cateArr = $('.post_cate');
			
			cateArr.each(function(index, item){

				if(item.innerText == '미답변'){
					$(this).css('background-color', 'white')
						   .css('color', '#03c373')
						   .css('border', '1.5px solid #03c373');
				}
				
			})
		};
		
		
		// 문의글 상세페이지로 이동
		$(document).on('click', '.post_block', function(){
			//console.log($(this).prev().val());
			location.href = 'qnaDetail.me?qno=' + $(this).children().eq(0).val();
		});
		
		
		// 답변여부 버튼 클릭
		function qnaCategory(e){
			
			let qnaStatus = '';
			
			if(e.innerText == '미답변'){ 
				qnaStatus = 'Y';
				location.href = "qna.me?qnaStatus=" + qnaStatus;
			} else { 
				qnaStatus ='N'; 
				location.href = "qna.me?qnaStatus=" + qnaStatus;
			}
			
		};
		
		
		// 답변여부 버튼 표시
		function btnColor(){
			let qnaStatus = '${ qnaStatus }';
			
			if(qnaStatus == 'N'){
				$('.answer').addClass('selectBtn');
			} else if(qnaStatus == 'Y'){
				$('.unAnswer').addClass('selectBtn');
			} else {
				$('.qna_all').addClass('selectBtn');
			}
		};
		
		
	</script>
</body>
</html>