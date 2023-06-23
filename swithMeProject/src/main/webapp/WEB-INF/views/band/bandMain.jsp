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
		        		<div class="writer" id="summary">
							${ bb.sbContent }
		        		</div>
		        	</div>
		        	<br>
		        	<c:if test="${ not empty bb.changeName }">
		        		<div class="photoBody">
							<img id="photoImg" src="${ bb.changeName }">
		        		</div>
		        	</c:if>
		        	<br>
		        	
		        	<div class="postFooter">
		        		<div class="replyBody">댓글(${ bb.count })</div>
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
       	<div class="modal" id="detailBandBoard">
        	<div class="modal-dialog modal-lg">
            	<div class="modal-content">
            
	                <!-- Modal body -->
	                <div class="modal-body">
	                <button type="button" id="originModal" class="close" data-dismiss="modal">&times;</button>
	                    <form action="" method="post">
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
					                        	<div id="detailCount"></div> 
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
		                        	<!-- 댓글영역 -->
		                        		<div class="totalReply">
				                        	<div class="replyBtn">
		                        				<c:if test="${ empty loginMember }">
									        		<textarea class="replyContent" readonly>로그인 후 이용가능합니다.</textarea><br>
									        		<button type="button" class="replyEnroll">등록</button> <br>
		                        				</c:if>
				                        	<input type="hidden" class="sBoardNoModal" name="bandNo" value="">
								        	<input type="hidden" class="writerBoard" value="">
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
		                        <button class="enrollConfirm" type="button" onclick="test1()" data-toggle="modal" data-target="#updateBandBoard" >수정하기</button>
		                        <button class="enrollDismiss" id="deleteBoard" type="button">삭제하기</button>
		                        <input type="hidden" class="sBoardNoModal" name="bandNo" value="">
	                        </div>
	                    </form>
	                </div>
            	</div>
        	</div>
		</div>
		
		<script>
			function test1(){
				$('#originModal').click();
				$('#originModal').click(function(){
					$('#originModal').click();					
				});
			}
		</script>
		
		<!--밴드 게시글 수정 창-->
       	<div class="modal" id="updateBandBoard">
        	<div class="modal-dialog modal-lg">
            	<div class="modal-content">
            
	                <!-- Modal body -->
	                <div class="modal-body1">
                 		<br>
                        <div class="form-group">
                        	<div>
                        		<div class="selectType">
                        			<select id="sbCategory" name="sbCategory">
										<option value="Y" selected>일반글</option>

									</select>
                        		</div>
                        		<div class="totalDetail1">
									<textarea id="summernote" name="editordata"></textarea>
                        		</div>
                        		<form method="post" enctype="multipart/form-data" id="photoForm">
	                        		<div class="totalPhoto">
		                        		<div class="img_box">
		                        			<label class="labetPhoto" for="file1">첨부</label>
		                        			<div class="img_container">
		                        				<img id="img1" src="">
		                        			</div>
		                        		</div>
		                        	
	
		                        		<div class="fileType">
		                        			<input type="hidden" name="sbBoardNo" >
		                        			<input type="file" id="file1" accept="image/*" name="file" onchange="setImage(this);" />
		                        		</div>
	                        		</div>
                        		</form>
                        	</div>
                        </div>
                        <br>
                        <div class="btnGroupMain">
	                        <button class="enrollConfirm" id="bandBoardEnroll" type="button">등록하기</button>
	                        <button class="enrollDismiss" id="disMissBoard" type="button" data-dismiss="modal">취소하기</button>
                        </div>
	                </div>
            	</div>
        	</div>
		</div>
		
		<script>
		
			$(document).on('click', '.bPostList', function(){
				var query = window.location.search;     
				var param = new URLSearchParams(query);
				var sno = param.get('sno');
				
				var sbBoardNo = $(this).children().eq(0).val();
				
				if(${ !empty loginMember }){							
					if('${bandMem.sbNo}' == sno && '${bandMem.memId}' == '${loginMember.memberId}' && '${bandMem.banish}' == 'Y'){
						var valueText = "";
						
						valueText += '<textarea class="replyContent"></textarea><br>'
			        		       + '<button type="button" id="plzBtn" class="replyEnroll">등록</button>'
			        		       + '<input type="hidden" class="sBoardNoModal" name="bandNo" value="">'
			        		       + '<input type="hidden" class="writerBoard" value="">'
			        		       + '<input type="hidden" class="sBoardNoModal" name="bandNo" value="">';
			        	$('.replyBtn').html(valueText);
					} else {
						var valueText1 = "";
						valueText1 += '<textarea class="replyContent" readonly>밴드 가입 후 작성이 가능합니다.</textarea><br>'
		        				   + '<button type="button" class="replyEnroll">등록</button> <br>'
		        				   + '<input type="hidden" class="sBoardNoModal" name="bandNo" value="">'
		        				   + '<input type="hidden" class="writerBoard" value="">'
		        				   + '<input type="hidden" class="sBoardNoModal" name="bandNo" value="">';

		        		$('.replyBtn').html(valueText1);
					}
				}
				$('.sBoardNoModal').attr('value', sbBoardNo);
				
				// console.log(sbBoardNo);
				selectReplyList(sbBoardNo);
				$.ajax({
					url : 'detail.sb',
					data : { sbBoardNo : sbBoardNo },
					success : function(list){
						
						// console.log(list.changeName);
						$('#detailNickName').text("닉네임 : " + list.memberId);
						$('#detailDate').text("날짜 : " + list.sbCreateDate);
						$('#detailCount').text("조회 수 : " + list.sbCount);
						$('#detailContent').html(list.sbContent);
						$('#sbContent').text(list.sbContent);
						$('.writerBoard').attr('value', list.memId);
						$('.bandNo').attr('value', list.sbNo);
						if(list.changeName == 0){
							$('.photoBody').css('display', 'none');
							
						} else {
							$('#photoImg1').attr('src', list.changeName);
							
						}		
					},
					error : function(){
						console.log('실패');
					}
				});
				
				
			});

		</script>
	
		<script>
			
			$(document).ready(function() {
				
		        $('#summernote').summernote();
		        $('button').not('#updateRe').attr('disabled',false);
		        var PostList = $('.bPostList');

		        var target = document.getElementById('summary');
		        
		        $.each(PostList, function(index, item){
					
					var PostText = item.children[5].children[0];
					
					if(PostText != null){
			        	const extractTextPattern = /(<([^>]+)>)/gi;
			        	
			        	var src = PostText.innerHTML;

			        	var extractedText = src.replace(extractTextPattern, '');
			        
			        	PostText.innerHTML = extractedText;	
				        
			        };
				});	   
			});
			
				
			function photoSelect(sbBoardNo){
				
				// sbBoardNo = $('#sBoardNo').val();
		        $.ajax({
		        	url : 'photoSelect.sb',
		        	data : { sbBoardNo : sbBoardNo },
		        	success : function(photo){
		        		console.log(photo);
		        	},
		        	error : function(){
		        		console.log('사진 불러오기 실패');
		        	}
		        })
			}
			
			/*// 게시글 사진 영역
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
			}*/
			
			// 댓글 영역
			
			// 댓글 쓰기 영역
			$(document).on('click', '#plzBtn', function(){
				var plzNo = $(this).next().val();
				var writer = $(this).next().next().val();
				
				var query = window.location.search;     
				var param = new URLSearchParams(query);
				var sno = param.get('sno');

				
				// console.log(plzNo);
				// console.log(writer);

				if($('.replyContent').val().trim() != ''){
					$.ajax({
						url : 'rinsert.sb',
						type : 'POST',
						data : { 
								sbBoardNo: plzNo,
								sbReplyContent : $('.replyContent').val(),
								memberId : '${loginMember.memberId}',
								writerId : writer,
								sbNo : sno
						},
						success : function(result){
							
							if(result === 'success'){
								selectReplyList(plzNo);
								$('.replyContent').val('');
							}
						},
						error : function(){cl
							console.log('실패');
						}
					})
				} else {
					alert('댓글 작성 실패');
				}
			});
		
			// 댓글 리스트 영역
			function selectReplyList(sbBoardNo){

				var loginMem1 = '${loginMember.nickName}';
				
				var query = window.location.search;     
				var param = new URLSearchParams(query);
				var sno = param.get('sno');
				
				$.ajax({
					url : 'rlist.sb',
					data : { sbBoardNo : sbBoardNo },
					success : function(result){
						//console.log(sBoardNo);
						
						let value="";
						for(var i in result){
							value += '<div class="replyContent2">' 
								   + '<div class="replyMem" id="replyMem">' 
								   + result[i].memberId +'</div>'
								   + '<div id="replyDate">' + result[i].sbDate + '</div><br>'
								   + '<div id="replyContent1">' + result[i].sbReplyContent + '</div>'									   
								   + '<div class="replyDetailBtn" id="replyDetailBtn"><input id="replyNo" type="hidden" value="' + result[i].sbReplyNo + '">'
								   + '<button class="replyEnroll1" type="button">삭제</button>'
								   + '<button class="replyEnroll2" type="button" id="updateRe">수정</button><br></div>'
								   + '</div><hr>';
						};
						$('.replyBodyDetail').html(value);
						var replyTest = $('.replyContent2');
						
						$.each(replyTest, function(index, item){
							// console.log(item.children[4]);
							// console.log(item.children[0].innerHTML);
							
							var btnItems = item.children[4];
							var idItems = item.children[0].innerHTML;
							
							if(idItems == '${loginMember.nickName}' ){
								if('${bandMem.sbNo}' == sno && '${bandMem.memId}' == '${loginMember.memberId}'){
									$(btnItems).css('display','show');									
								} else {
									$(btnItems).css('display','none');															
								}
							} else {
								$(btnItems).css('display','none');						
							}
						});
					},
					error : function(){
						console.log('실패');
					}
				});
			}
			
			//댓글 수정 뷰 영역
			$(document).on('click', '#updateRe', function(){
				var sbBoardNo = $(this).parent().parent().siblings('.replyBtn').children().last().val();
				var sbReplyNo = $(this).prev().prev().val();
				var content = $(this).parent().prev();
				var totalBtn = $(this).parent();
				var realThis = $(this);

	        	$.ajax({
	                url : 'replyModifyView.sb',
	                data : {
	                	sbReplyNo : sbReplyNo
	                },
	                success : function(result){
	                    // console.log(result);
	                    $('button').not(realThis).attr('disabled',true);
	                    
	                    var modifyArea = '<textarea class="replayModify">' + result.sbReplyContent + '</textarea>'
	                    			   + '<input id="replyNo" type="hidden" value="' + sbReplyNo + '">'
	                                   + '<button class="reset" type="button">취소</button>'
	                                   + '<button class="modify" id="updateRee" type="button">저장</button><br>'
	                   	content.html(modifyArea);
	                    totalBtn.css('display','none');
						
	                },
	                error : function(){
						console.log('댓글 수정 실패');
	                }
	            })
	        });
			
			// 댓글 수정 영역
            $(document).on('click', '.modify', function(){
            	var sbBoardNo = $(this).parent().parent().parent().siblings('.replyBtn').children().last().val();
            	var sbReplyNo = $(this).prev().prev().val();
            	
            	// console.log(sbBoardNo);
                $.ajax({
                    url : 'replyModify.sb',
                    data : {
                    	sbReplyNo : sbReplyNo,
                    	sbReplyContent : $('.replayModify').val()
                    },
                    success : function(result){
                    	if(result === 'success'){
                    		// console.log(result);
                     	$('button').not('#updateRe').attr('disabled',false);
                     	$('#replyDetailBtn').css('display','show');
						}
                     	selectReplyList(sbBoardNo);
                    },
                    error : function(){
						console.log('댓글 수정영역 불러오기 실패');
                    }
                })
            });
			// 댓글 수정 취소 버튼
			$(document).on('click', '.reset', function(){
				var sbBoardNo = $(this).parent().parent().parent().siblings('.replyBtn').children().last().val();
				$('button').not('#updateRe').attr('disabled',false);
             	selectReplyList(sbBoardNo);
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
				var sbBoardNo = $(this).parent().parent().parent().siblings('.replyBtn').children().last().val();
				var sbReplyNo = $(this).prev().val();
				
				console.log(sbBoardNo);
				// console.log(sbReplyNo);

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