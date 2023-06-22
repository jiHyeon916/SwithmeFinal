<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/qnaDetailView.css">

</head>
<body>

	<c:if test="${ not empty failMsg }">
		<script>
			alert('${ failMsg }');
		</script>
	</c:if>
	
	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<!-- 로그인멤버에 따라 그에 맞는 사이드바 보여주기 -->
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
			<div class="topBlock">문의글</div>

			<div class="block"> 
				<!-- 답변여부 카테고리 -->
				<c:choose>
					<c:when test="${ qna.qnaStatus eq 'Y' }">
						<button class="post_Btn_Y" disabled>미답변</button>
					</c:when>
					<c:otherwise>
						<button class="post_Btn_N" disabled>답변완료</button>
					</c:otherwise>
				</c:choose>
				
				
				<!-- 글쓴 정보 : 제목, 날짜, 작성자 -->
				<div class="writerInfo clear">
					<div class="character">
						<!-- 
						<img id="wearItem0" class="wearItem" src="" alt="도구" name="0"/>
						<img id="wearItem1" class="wearItem" src="" alt="모자" name="0"/>
						 -->
						<img id="wearItem2" class="wearItem" src="" alt="배경" name="0"/>
						<img id="wearItem3" class="wearItem" src="" alt="캐릭터" name="0"/>
					</div>
					<div class="clear">
						<h6 class="title">${ qna.qnaTitle }</h6>
						<div class="clear">
							<p class="writerId">${ qna.memberId }</p>
							<p class="writerDate">${ qna.qnaDate }</p>
						</div>
					</div>
				</div>

				<!-- 컨텐츠 내용 -->
				<div id="content_text">
					<p>${ qna.qnaContent }</p>
				</div>

				<!-- 답변영역 -->
				<div class="replyArea">
					<c:choose>
						<c:when test="${ loginMember.memberId eq 'admin' }">
							<textarea name="" id="replyContent" placeholder="답변을 등록해주세요."></textarea>
							<button id="replyBtn" onclick="insertReply();" required>등록</button>
						</c:when>
						<c:otherwise>
							<textarea name="" id="replyContent" placeholder="관리자만 작성 가능합니다." readonly disabled></textarea>
						</c:otherwise>
					</c:choose>
					<div class="blank"></div>

					<div class="replyWrap">
						<!-- 답변 내용 영역 -->
					</div>
				</div>

				<div id="myQnaBtn">
					<button class="deleteBtn_yj" onclick="qnaDelete();">문의글삭제</button>
					<button class="qnaBack" onclick="location.href='qna.me'">목록으로</button>
				</div>

			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />
	
	<script>
		$(function(){
			myCharacter(); // 문의글 작성자 캐릭터
			selectQnaReply(); // 답변 목록 불러오기
		})

		// 문의글 작성자 캐릭터
		function myCharacter(){
			let wearItemArr = $('.wearItem');
			
			$.ajax({
				url : 'myCharacter.me',
				data : {
					memberId : '${ qna.memberId }'
				},
				success : list => {
					value = '';
					for(let i in list){
						// 순서 : 도구 > 모자 > 배경 > 캐릭터
						$('.wearItem').each(function(){
							let imgAlt = $(this).attr('alt');
							
							if(list[i].itemCategory == imgAlt){
								$(this).attr('src', list[i].itemPhoto);
								$(this).attr('name', list[i].itemNo);
								$(this).css('display', 'inline');
							};
						});
					};
				},
				error : () => {
				}
			});
		};
	
		// 문의글 삭제
		function qnaDelete(){
			let deleteYes = confirm('삭제 후 복구가 불가능합니다. 삭제하시겠습니까?');

			if(deleteYes){
				location.href = "qnaDelete?qno=${ qna.qnaNo }";
			}
		}
		
		
		// 답변 등록
		function insertReply(){

			// adminController
			$.ajax({
				url : 'qnaAnswer',
				data : {
					qnaNo : ${ qna.qnaNo },
					qnaReplyContent : $('#replyContent').val()
				},
				success : result => {
					console.log(result);
					
					if(result === 'success'){
						$('#replyContent').val('');
					} else {
						alert(result);
					}
					
					selectQnaReply(); // 답변 목록 불러오기
					answerUpdate(); // 답변여부 상태변화
					
				},
				error : () => {
					console.log('작성실패');
				}
			});
		}; //insertReply
		
		
		// 답변 출력
		function selectQnaReply(){
			 // adminController
			$.ajax({
				url : 'qnaAnswerList',
				data : {
					qnaNo : ${ qna.qnaNo }
				},
				success : list => {
					let value = '';
					if(list.length > 0){
						for(let i in list){
							value += '<div class="replyList">'
									   + '<p>관리자</p>'
									   + '<p>' + list[i].qnaReplyCreateDate +'</p>'
									   + '<p>' + list[i].qnaReplyContent +'</p>'
								   + '</div>'
								   + '<hr/>'
						}
						
					}
					$('.replyWrap').html(value);
					
				},
				error : () => {
					console.log('댓글 불러오기 실패');
				}
			});
		}; //selectQnaReply
		
		
		// 답변여부 상태변화
		function answerUpdate(){
			
			//adminController
			$.ajax({
				url : 'qnaAnswerUpdate',
				data : {
					qnaNo : ${ qna.qnaNo }
				},
				success : result => {
					console.log('연결성공');
					
					value ='';
					if(result === "success"){
						$('.post_Btn_Y').addClass('post_Btn_N').html('답변완료');
						$('.post_Btn_Y').removeClass('post_Btn_Y');
					}

				},
				error : () => {
					console.log('업데이트 실패');	
				}
			});
			
		}; //answerUpdate
		
		
	</script>
	
</body>
</html>