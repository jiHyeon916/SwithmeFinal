<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- MainCss -->
    <link rel="stylesheet" href="/swithme/resources/css/band/bandMain.css">
</head>
<body>

	<jsp:include page="bandHeader.jsp"/>
	
	<div class="wrap">
		<jsp:include page="bandSideBar.jsp"/>
		    <div id="blank">.</div>

	    <div class="mainDiv">
	    	<div class="writeStart"><button class="writeBtn" data-toggle="modal" data-target="#insertBandBoard">글작성</button></div>
	    	<br><br>
	    	<c:forEach var="bb" items="${ list }">
		        <div class="bPostList" data-toggle="modal" data-target="#detailBandBoard">
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
		        	<div class="photoBody">
						<p class="writer">이곳은 사진 영역입니다.</p>
		        	</div>
		        	<br>
		        	
		        	<div class="postFooter">
		        		<div class="replyBody">댓글(${ bb.count })</div>
		        		<div class="hitsBody">조회수(${ bb.sbCount })</div>
		        	</div>
		        	<br><br>
		        </div>
	        </c:forEach>
	    </div>
	</div>
	
	<!--밴드 게시글 디테일창-->
       	<div class="modal" id="detailBandBoard">
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
	                        			<div class="photoDiv">
	                        				<p>사진영역</p>
	                        			</div>
	                        			<hr>
	                        			<br>
		                        	<!-- 댓글영역 -->
		                        		<div class="totalReply">
				                        	<div class="replyBtn">
			                        			<c:choose>
			                        				<c:when test="${ empty loginMember }">
											        		<textarea class="replyContent" readonly>로그인 후 이용가능합니다.</textarea><br>
											        		<button type="button" class="replyEnroll">등록</button>
			                        				</c:when>
											     	<c:otherwise>
											        		<textarea class="replyContent"></textarea><br>
											        		<button type="button" id="plzBtn" class="replyEnroll">등록</button>
											     	</c:otherwise>	
			                        			</c:choose>
				                        	<input type="hidden" class="sBoardNoModal" name="bandNo" value="">
										    </div> <br>
								        	<div class="replyBodyDetail">
								        	
								        	</div>
		                        		</div>
	                        		</div>
	                        	</div>
	                        </div>
	                        <br>
	                        <div class="btnGroupMain">
		                        <button class="enrollConfirm" type="submit">수정하기</button>
		                        <button class="enrollDismiss" id="deleteBoard" type="button">삭제하기</button>
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
				selectReplyList(inputNo);
				$.ajax({
					url : 'detail.sb',
					data : { sbBoardNo : inputNo },
					success : function(list){
						// console.log(list);
						$('#detailNickName').text("닉네임 : " + list.memberId);
						$('#detailDate').text("날짜 : " + list.sbCreateDate);
						$('#detailCount').text("조회 수 : " + list.sbCount);
						$('#detailContent').text(list.sbContent);
						$('#sbContent').text(list.sbContent);
						
					},
					error : function(){
						console.log('실패');
					}
				})	
			});

		</script>
		
		<!--밴드 게시글 작성 창-->
       	<div class="modal" id="insertBandBoard">
        	<div class="modal-dialog modal-lg">
            	<div class="modal-content">
            
	                <!-- Modal body -->
	                <div class="modal-body1">
	                    <form action="delete.me" method="post">
	                 		<br>
	                        <div class="form-group">
	                        	<div>
	                        		<div class="selectType">
	                        			<select id="">
											<option value="Y">일반글</option>
											<option value="N">공지사항</option>
										</select>
	                        		</div>
	                        		<div class="totalDetail1">
										<textarea id="summernote" name="editordata"></textarea>
	                        		</div>
	                        		<div class="fileType">
	                        			<input type="file" name="file1">
	                        			<input type="file" name="file2">
	                        			<input type="file" name="file3">
	                        			<input type="file" name="file4">
	                        		</div>
	                        	</div>
	                        </div>
	                        <br>
	                        <div class="btnGroupMain">
		                        <button class="enrollConfirm" type="submit">등록하기</button>
		                        <button class="enrollDismiss" type="button" data-dismiss="modal">취소하기</button>
	                        </div>
	                    </form>
	                </div>
            	</div>
        	</div>
		</div>
	
		<script>
			// 썸머노트
			$(document).ready(function() {
		        $('#summernote').summernote();
		    });
			
			$(document).on('click', '.writeStart > button', function(){
				$('#summernote').summernote({
					dialogsInBody: true,
					height: 400,							// 에디터 높이
					disableResizeEditor: true,
					minHeight: null,						// 최소 높이
					maxHeight: null,						// 최대 높이
					focus: true,							// 에디터 로딩후 포커스를 맞출지 여부
					lang: "ko-KR",							// 한글 설정
					placeholder: '내용을 작성하여 주십시요',	//placeholder 설정
					tabsize: 2,
					toolbar: [
						['style', ['style']],
						['font', ['bold', 'underline', 'clear']],
						['color', ['color']],
						['para', ['ul', 'ol', 'paragraph']],
						['table', ['table']],
						['insert', ['link', 'picture', 'video']],
						['view', ['fullscreen', 'codeview', 'help']]
							],
					callbacks: {
						onImageUpload : function(files){
							sendFile(files[0],this);
						}
					}
				});
			});
			
			// 게시글 사진 영역
			function sendFile(file, editor){
				var data = new FormData();
				data.append("file", file);
				console.log(file);
				$.ajax({
					data : data,
					type : "POST",
					url : "SummerNoteImageFile",
					contentType : false,
					processData : false,
					success : function(data){
						console.log(data);
						console.log(editor);
						$(editor).summernote("insertImage",data.url);
					}
				});
			}
			
			// 댓글 영역
			
			// 댓글 쓰기 영역
			$(document).on('click', '#plzBtn', function(){
				var plzNo = $(this).next().val();

				if($('.replyContent').val().trim() != ''){
					$.ajax({
						url : 'rinsert.sb',
						type : 'POST',
						data : { 
								sbBoardNo: plzNo,
								sbReplyContent : $('.replyContent').val(),
								memberId : '${loginMember.memberId}'
						},
						success : function(result){
							
							if(result === 'success'){
								selectReplyList(plzNo);
								$('.replyContent').val('');
							}
						},
						error : function(){
							console.log('실패');
						}
					})
				} else {
					alert('댓글 작성 실패');
				}
			});

			// 댓글 리스트 영역
			function selectReplyList(inputNo){

				$.ajax({
					url : 'rlist.sb',
					data : { sbBoardNo : inputNo },
					success : function(result){
						//console.log(sBoardNo);
						
						let value="";
						for(let i in result){
							value += '<div id="replyMem">' 
								   + result[i].memberId +'</div>'
								   + '<div id="replyDate">' + result[i].sbDate + '</div><br>'
								   + '<div id="replyContent1">' + result[i].sbReplyContent + '</div>'
								   + '<div id="replyDetailBtn"><input id="replyNo" type="hidden" value="' + result[i].sbReplyNo + '">'
								   + '<button class="replyEnroll1" type="button">삭제</button>'
								   + '<button class="replyEnroll2" type="button" id="updateRe">수정</button><br><hr></div>';
						};
						$('.replyBodyDetail').html(value);

					},
					error : function(){
						console.log('실패');
					}
				});
			}
			
			//댓글 수정 영역
			$(document).on('click', '#updateRe', function(){
				var sbBoardNo = $(this).parent().parent().siblings('.replyBtn').children().last().val();
				var sbReplyNo = $(this).prev().prev().val();
				var content = $(this).parent().prev();
				var totalBtn = $(this).parent();
	            console.log(content);
	            console.log(sbBoardNo);
	            console.log(sbReplyNo);

	        	$.ajax({
	                url : 'replyModifyView.sb',
	                data : {
	                	sbReplyNo : sbReplyNo
	                },
	                success : function(result){
	                    // console.log(result);
	                    var modifyArea = '<textarea class="replayModify">' + result.sbReplyContent + '</textarea>'
	                                   + '<button class="reset" type="button">취소</button>'
	                                   + '<button class="modify" id="updateRee" type="button">저장</button><br><hr>'
	                   	content.html(modifyArea);
	                    totalBtn.css('display','none');
						
	                    $(document).on('click', '.modify', function(){
	                        $.ajax({
	                            url : 'replyModify.sb',
	                            data : {
	                            	sbReplyNo : sbReplyNo,
	                            	sbReplyContent : $('.replayModify').val()
	                            },
	                            success : function(result){
	                            	if(result === 'success'){
	                            		console.log(result);
		                            	$('#replyDetailBtn').css('display','show');
		                            	selectReplyList(sbBoardNo);
	    							}
	                            },
	                            error : function(){
									console.log('댓글 수정영역 불러오기 실패');
	                            }
	                        })
	                    });

	                    $(document).on('click', '.reset', function(){
	                    	$('#replyDetailBtn').css('display','show');
	                    	selectReplyList(sbBoardNo);
	                    })
	                },
	                error : function(){
						console.log('댓글 수정 실패');
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
						alert('게시글 삭제 성공');
						location.href = 'detail.bo?sno='+sno;
					},
					error : function(){
						console.log('게시글 삭제 실패');
					}
				})	
			});
			
			// 댓글 삭제 영역
			$(document).on('click', '.replyEnroll1', function(){
				var sbBoardNo = $(this).parent().parent().siblings('.replyBtn').children().last().val();
				var sbReplyNo = $(this).prev().val();
				
				console.log(sbBoardNo);
				console.log(sbReplyNo);

				$.ajax({
					url : 'deleteReply.sb',
					data : { sbReplyNo : sbReplyNo },
					success : function(list){
						alert('댓글 삭제 성공');
						selectReplyList(sbBoardNo);
					},
					error : function(){
						console.log('댓글 삭제 실패');
					}
				})	
			});
		</script>
</body>
</html>