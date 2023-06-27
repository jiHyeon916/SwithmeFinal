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
		                        <!-- <button class="enrollConfirm" type="button" onclick="test1()" data-toggle="modal" data-target="#updateBandBoard" >수정하기</button> -->		                        
		                        <button class="enrollDismiss" id="deleteBoard" type="button">삭제하기</button>
		                        <input type="hidden" class="sBoardNoModal" name="bandNo" value="">
	                        </div>
	                    </form>
	                </div>
            	</div>
        	</div>
		</div>
		
		
		<!--밴드 게시글 수정 창-->
       	<div class="modal" id="updateBandBoard">
        	<div class="modal-dialog modal-lg">
            	<div class="modal-content">
            
	                <!-- Modal body -->
           		<form method="POST" enctype="multipart/form-data" id="photoFormTest">
	                <div class="modal-body1">
                 		<br>
                        <div class="form-group">
                        	<div>
                        		<div class="selectType">
                        			<select id="sbCategory" name="sbCategory">
										<option value="Y" selected>일반글</option>

									</select>
                        		</div>
			           		<div>
                        		<div class="totalDetail1">
									<textarea id="updateText" class="summernote" name="editordata"></textarea>
                        		</div>
	                        		<div class="totalPhoto">
		                        		<div class="img_box">
		                        			<label class="labetPhoto" for="file1">첨부</label>
		                        			<label class="labetPhoto" onclick="photoReset();">삭제</label>
		                        			<div class="img_container">
		                        				<img class="img2Test" id="img2" src="">
		                        			</div>
		                        		</div>
		                        	
		                        		<div class="fileType">
		                        			<input type="text" name="test" value="test">
		                        			<input type="text" class="sBoardNoModal" name="refNo" value="">
		                        			<input type="text" name="photoSrc" id="photoSrc" value="">
		                        			<input type="file" id="file1" accept="image/*" name="refile" value="" onchange="setImage2(this);" />
		                        		</div>
	                        		</div>
	                        </div>
                        	</div>
                        </div>
                        <br>
                        
                        <div class="btnGroupMain">
	                        <button class="enrollConfirm" id="bandBoardEnroll1" onclick="plzzz();" type="button">수정하기</button>
	                        <button class="enrollDismiss" id="disMissBoard" type="button" data-dismiss="modal">취소하기</button>
                        </div>
	                </div>
                </form>
            	</div>
        	</div>
		</div>
		
		<script>
		
			$('.img_container').click(function(){
				$('#file1').click();					
			})
			
		    // 게시글 수정 영역 사진 삭제 버튼
			function photoReset(){
				$('.img2Test').attr('src','/swithme/resources/none.jpeg');
				$('#file1').val("");
				
				// console.log($('#img2').attr('src'));
				// console.log($('#file1').val());
			}
		    // 게시글 수정 버튼 누를 때
			function test1(){
				$('#originModal').click();
				// console.log($(target).parent().siblings('.form-group1').find('#photoImg1').attr('src'));
				// $('#photoSrc').val($('#photoImg1').attr('src'));
				
				$('.summernote').summernote({
					dialogsInBody: true,
					height: 200,							// 에디터 높이
					disableResizeEditor: true,
					minHeight: null,						// 최소 높이
					maxHeight: null,						// 최대 높이
					focus: true,							// 에디터 로딩후 포커스를 맞출지 여부
					lang: "ko-KR",							// 한글 설정
					placeholder: '내용을 작성하여 주십시요',	//placeholder 설정
					tabsize: 2,
					toolbar: [
						['fontname', ['fontname']],
			            ['fontsize', ['fontsize']],
			            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			            ['color', ['forecolor','color']],
			            ['para', ['ul', 'ol', 'paragraph']],
			            ['height', ['height']],
					],
					callbacks: {
						onImageUpload : function(files){
							sendFile(files[0],this);
						}
					}
				});
				
				var sbBoardNo = $('.sBoardNoModal').val();
				var sbContent = $('#detailContent').html();
				var sbPhoto = $('#photoImg1').attr('src');

				// 게시글 수정하기 뷰 
				$.ajax({
					url : 'updateSelect.sb',
					data : {
							sbBoardNo : sbBoardNo,
							sbContent : sbContent,
							sbPhoto : sbPhoto
					},
					success : function(BandSelect){
						
						$('.note-placeholder').html("");
						$('.note-editable').html(BandSelect.sbContent);
						$('.img2Test').attr("src", BandSelect.changeName);
						
						// console.log($('#img2').attr('src'));
						// console.log($('#file1').val());
					},
					error : function(){
						console.log('밴드 내용 조회 실패');
					}
				})
			};
			
			// 게시글 이미지 영역
			function setImage2(inputFile) {

				if(inputFile.files.length == 1){
		
					let reader = new FileReader();
		
		            reader.readAsDataURL(inputFile.files[0]);
		
		            reader.onload = function(e){
		    			var img2Test = $('.img2Test');
		    			
		                $(img2Test).attr("src", e.target.result);

					} 
					$('#disMissBoard').click(function(){
							
						$('.note-editable').empty();

					})					
				}
				// console.log($('#img2').attr('src'));
				// console.log($('#file1').val());
			};	
			
			// 게시글 글 수정 영역
			$(document).on('click', '#bandBoardEnroll1', function(){
					
				let sbBoardNo1 = $('.sBoardNoModal').val();
				let sbContent1 = $(this).parent().siblings('.form-group').find('.note-editable').html();
				let sbPhotoSrc = $(this).parent().siblings('.form-group').find('.img2Test').attr('src');
				let sbPhotoInput = $('#file1');
				
				$('#photoSrc').val(sbPhotoSrc);

				jQuery.ajax({
					url : 'updateBoardText.sb',
					data : {
							sbBoardNo : sbBoardNo1,
							sbContent : sbContent1 
					},
					success : ()=>{
						console.log('게시글 글 수정 성공');
						
					},
					error : ()=>{
						console.log('게시글 글 영역 수정 실패');
					}
				});
				
				var form = $('#photoFormTest')[0];
			    var formData = new FormData(form);

			    // formData.append('refile', sbPhotoInput);
				console.log($('.sBoardNoModal').val());
				console.log($('#photoSrc').val());
				console.log($('#file1').val());
			    
				/*
				<input type="text" class="sBoardNoModal" name="bandNo" value="">
		       <input type="text" name="photoSrc" id="photoSrc" value="">
		       <input type="file" id="file1" accept="image/*" name="refile" value="" onchange="setImage(this);" />
				*/

				
			    $.ajax({
					
			        url : 'updatePhoto.sb',
					processData: false,
			        contentType: false,
			        type : 'POST',
			        data : formData,
					success : ()=>{
						console.log('게시글 전체 수정 성공');
					},
					error : ()=>{
						console.log('게시글 사진 영역 수정 실패');
					}
				});
				
			});
			
			// 게시글 사진 영역 수정
			function plzzz(){
				
				

			}
		</script>

		<script>
			// 게시글 클릭
			$(document).on('click', '.bPostList', function(){
				var query = window.location.search;     
				var param = new URLSearchParams(query);
				var sno = param.get('sno');
				
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
						let valueText1 = "";
						valueText1 += '<textarea class="replyContent" readonly>밴드 가입 후 작성이 가능합니다.</textarea><br>'
		        				   + '<button type="button" class="replyEnroll">등록</button> <br>'
		        				   + '<input type="hidden" class="sBoardNoModal" name="bandNo" value="">'
		        				   + '<input type="hidden" class="writerBoard" value="">'
		        				   + '<input type="hidden" class="sBoardNoModal" name="bandNo" value="">';

		        		$('.replyBtn').html(valueText1);
					}
				}
				
				var sbBoardNo = $(this).children().eq(0).val();
				
				
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
						
						if('${loginMember.memberId}' == list.memId){
							$('#deleteBoard').css('display', 'show');
						} else {
							$('#deleteBoard').css('display', 'none');					
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
						error : function(){
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