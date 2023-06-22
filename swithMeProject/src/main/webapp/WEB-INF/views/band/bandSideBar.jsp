 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    
    <!-- sideCss -->
    <link rel="stylesheet" href="/swithme/resources/css/band/bandSideBar.css">
</head>
<body>

   
    <!-- 밴드 사이드메뉴  -->
    <aside id="stbInfo">
        <div class="sideCover">
            <div class="stbLogo">
				<img src="" alt="" id="bandCover">
            </div>
            <div class="stbTitle">
                <P id="detailSbtTitle"></P>
            </div>
        </div>
        <div class="stbBtn">
        	<button type="submit" class="enrollBtn" data-toggle="modal" data-target="#enrollBandMember">가입하기</button>
        	<input type="hidden" class="readerId" value="">	
        </div>
        <div>
            <ul id="mainSideMenu" class="clear">
                <li><a id="li1" href="">최 신 글</a></li>
                <li><a id="li2" href="">밴드 정보</a></li>
                <li><a href="#" data-toggle="modal" data-target="#reportBand">신고 하기</a></li>
			</ul>
			<c:if test="${ !empty loginMember }">
				<ul id="mainSideMenu" class="clear1">
	                <li><a id="li3" href="">공지 사항</a></li>
	                <li><a id="li4" href="">밴드 일정</a></li>
	                <li><a id="li5" href="">밴드 멤버</a></li>
	                <li><a href="#" id="deleteMem1" data-toggle="modal" data-target="#deleteBandMember" >밴드 탈퇴</a></li>

	            </ul>
			</c:if>
        </div>
        <div>

        </div>
        <br><br>	
    </aside>
    
        <!--밴드 가입창-->
        <div class="modal" id="enrollBandMember">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">밴드 가입</h4>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <form action="bandEnroll.sb" method="post">
	                 		<br>
	                        <div class="form-group">
	                        	<input type="hidden" class="sno" name="sbNo" value="">
	                        	<input type="hidden" class="memberId" name="memberId" value="">
	                        	<p class="textModal">밴드에 가입하시겠습니까?</p>
	                        </div>
	                        <br>
	                        <div class="btnGroup">
		                        <button class="enrollConfirm" id="enrollMember" type="submit">가입</button>
		                        <button class="enrollDismiss" type="button" data-dismiss="modal">취소</button>
	                    	</div>
	                    </form>
	                </div>
	            </div>
	        </div>
		</div>
		
		<!--밴드 게시글 작성 창-->
       	<div class="modal" id="insertBandBoard">
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
		
		<!--밴드 탈퇴창-->
        <div class="modal" id="deleteBandMember">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">밴드 탈퇴</h4>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <form action="deleteBandMem.sb" method="post">
	                 		<br>
	                        <div class="form-group">
	                        	<input type="hidden" class="sno" name="sbNo" value="">
	                        	<p class="textModal">밴드에 탈퇴하시겠습니까?</p>
	                        </div>
	                        <br>
	                        <div class="btnGroup">
		                        <button class="enrollConfirm" id="deleteMember" type="submit">탈퇴</button>
		                        <button class="enrollDismiss" type="button" data-dismiss="modal">취소</button>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
		</div>
		
		<!--리더 변경창-->
       	<div class="modal" id="updaetBandReader">
        	<div class="modal-dialog">
            	<div class="modal-content">
            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">리더 변경</h4>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <form action="changeReader.sb" method="post">
	                 		<br>
	                        <div class="form-group">
	                        	<div id="bandSearchBox">
				                    <input type="text" id="searchBar" onkeyup="nickSearch(this);">
				                </div>
				                <input type="hidden" id="sNo" class="sno" name="sbNo" value="">
				                <div class="readerPass">
								
				                </div>
	                        </div>
	                        <br><br>
	                        <div class="btnGroup">
		                        <button id="finishReader" class="enrollConfirm" type="submit">변경</button>
		                        <button class="enrollDismiss" type="button" data-dismiss="modal">취소</button>
	                        </div>
	                    </form>
	                </div>
            	</div>
        	</div>
		</div>
		
		<!-- 밴드신고 창 -->
       	<div class="modal" id="reportBand">
        	<div class="modal-dialog">
            	<div class="modal-content">
            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">밴드 신고</h4>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <form action="reportBand.sb" method="post">
	                        <div class="form-group">
	                        	<div class="title">
	                        		
				                	밴드 이름 : <input type="text" class="reportBandName" readonly style="border : none;" name="reportBandName" value="">
				                	<input type="hidden" id="totalNo" name="totalNo" value="">
				                </div>
		                		<hr>
		                		<div>
		                			신고 사유 <br>
		                			
		                			<input class="formCheck" type="radio" name="reportReason" id="report1" value="광고/ 홍보성" checked>
			                            <label class="form-check-label" for="report1">
			                            		광고/ 홍보성 
		                            </label> 
		                            <input class="formCheck" type="radio" name="reportReason" id="report2" value="비난/ 욕설">
			                            <label class="form-check-label" for="report2">
			                                	비난/ 욕설
		                            </label>
		                            <input class="formCheck" type="radio" name="reportReason" id="report3" value="음란성">
			                            <label class="form-check-label" for="report3">
			                                	음란성 
		                            </label>
		                            <input class="formCheck" type="radio" name="reportReason" id="report4" value="기타">
			                            <label class="form-check-label" for="report4">
			                                	기타
		                            </label>
		                		</div>
		                		<div>
		                			신고 상세 사유 <br>
		                			<textarea class="reportContent" name="reportContent" rows="" cols="" required placeholder="신고 상세 사유를 기재해주시면 빠른 신고처리에 도움이 됩니다."></textarea>
		                			
		                		</div>
		                		<div>
		                			* 의미없는 반복적 신고 등 악의적인 활동은 추후 활동 정지 등의 대응이 있을 수 있습니다.
		                		</div>
	                        </div>
	                        <br><br>
	                        <div class="btnGroup">
		                        <button class="enrollDismiss" type="button" data-dismiss="modal">취소</button>
		                        <button id="reportBandBtn" class="enrollConfirm" type="submit">신고</button>
	                        </div>
	                    </form>
	                </div>
            	</div>
        	</div>
		</div>
		
	<script>
		// 로딩됐을 때
		$(function(){
			
			var query = window.location.search;     
			var param = new URLSearchParams(query);
			var sno = param.get('sno');
			
			if(${ !empty loginMember }){
				$.ajax({
					url : 'memberTotal.sb',
					data : {
							sno  : sno,
							memberId : '${loginMember.memberId}'
					},
					success : function(bandMem){
						
						var value = "";
						
						value += "<button type='submit' id='writerStrat' class='enrollBtn' data-toggle='modal' data-target='#insertBandBoard'>글쓰기</button>"
							  + "<input type='hidden' class='readerId' value=''>"

						if(bandMem != null){
							if(bandMem.sbNo == sno && bandMem.memId == '${loginMember.memberId}'){
								
								$('.clear1').css('display', 'block');
								$('.stbBtn').html(value);
							} else {
								$('.clear1').css('display', 'none');
							}						
						} else {
							$('.clear1').css('display', 'none');
						}
					},
					error : function(){
						console.log('실패');
					}
				});
				
				$.ajax({
					url : 'memberTotal.me',
					data : { 
							sbNo : sno,
							memberId : '${loginMember.memberId}'
					
					},
					success : function(memTotalTotal){
						console.log('강제탈퇴 멤버 조회 성공');						
					},
					error : function(){
						console.log('전체 리스트 조회 실패');
					}
					
				})
			};
			
			$.ajax({
				url : 'side.sb',
				data : { sno : sno },
				success : function(bandInfomation){
					// console.log(result);
					$('#detailSbtTitle').text(bandInfomation.sbTitle);
					$('#bandCover').attr('src', bandInfomation.sbChangeName);					
					$('#li1').attr('href',"detail.bo?sno="+sno);
					$('#li2').attr('href',"bandInfo.sb?sno="+sno);
					$('#li3').attr('href',"bandNotice.sb?sno="+sno);
					$('#li4').attr('href',"bandSchedule.sb?sno="+sno);
					$('#li5').attr('href',"bandMember.sb?sno="+sno);
					$('.sno').attr('value', sno);
					$('.memberId').attr('value', '${sessionScope.loginMember.memberId}');
					$('.reportBandName').attr('value', bandInfomation.sbTitle);
					$('#totalNo').attr('value', sno);
					
					
					if(bandInfomation.sbRecruitMem == bandInfomation.sbNowMem){
						var value1 = "";
						
						value1 += "<button type='submit' id='writerStrat' class='enrollBtn' data-toggle='modal' data-target='#insertBandBoard'>글쓰기</button>"
							  + "<input type='hidden' class='readerId' value=''>"
						
						if('${bandMem.sbNo}' == sno && '${bandMem.memId}' == '${loginMember.memberId}'){
							$('.clear1').css('display', 'block');
							$('.stbBtn').html(value1);
						} else {
							$('.clear1').css('display', 'none');
							$('.stbBtn').css('display', 'none');
						}						
					};
					
					$('.readerId').attr('value', bandInfomation.memberIdId);

					if(bandInfomation.memberIdId == '${loginMember.memberId}'){
						$(".clear1").append("<li><a href='#' data-toggle='modal' data-target='#updaetBandReader'>리더 위임</a></li>");	
						$("#sbCategory").append("<option value='N'>공지사항</option>");
						$('#deleteMem1').css('display','none');
		
					};
					

					// $('#bandCover').attr('src', result)
					
				},
				error : function(){
					console.log('실패');
				}
			});
			
			
			$.ajax({
				url : 'reader.sb',
				data : { sno : sno },
				success : function(memList){
					
					var value = "";
					
					for(var i in memList){
						
						value += "<label id='listMem'><input TYPE='radio' class='mem' name='memberId' value='" + memList[i].memId + "' />" + memList[i].memberId + "</label><br>"
					}
					$('.readerPass').html(value);
					$('.mem').eq(0).attr('checked', true);
					$('#sNo').attr('value', sno);

				},
				error : function(){
					console.log('실패');
				}
			});

			
			alarmMessage();
			
		});
		// 로딩됐을 때 끝
		
		// 게시글 작성 클릭
		$(document).on('click', '#writerStrat', function(){
			$('#summernote').summernote({
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
			
		});

		
		// 게시글 이미지 영역
		function setImage(inputFile) {
			var imgSrc1 = $('#img1').attr('src');

			if(inputFile.files.length == 1){
	
				let reader = new FileReader();
	
	            reader.readAsDataURL(inputFile.files[0]);
	
	            reader.onload = function(e){
	    				
	                $('#img1').attr('src', e.target.result);

					$('#disMissBoard').click(function(){
							$('.img_container>#img1').attr('src', "");
							$('.note-editable').empty();

					})					
				} 
			}
		};		
					
		// 게시글 작성 영역
		$(document).on('click','#bandBoardEnroll', function(){
			var query = window.location.search;     
			var param = new URLSearchParams(query);
			var sno = param.get('sno');
			
			// 글
			$.ajax({
				url : 'binsert.sb',
				type : 'POST',
				data : {
						sbNo : sno,
						memberId : '${ sessionScope.loginMember.memberId }',
						sbCategory : $("select[name=sbCategory]").val(),
						sbContent : $('.note-editable').html()	
				},
				success : function(result){
					if(result === 'success'){
						if($("select[name=sbCategory]").val() == 'Y'){
							location.href="detail.bo?sno="+sno;
						} else {
							location.href="bandNotice.sb?sno="+sno;
						};
						
						// 사진
						var form = $('#photoForm')[0];
						var formData = new FormData(form);
						
						if($('#file1').val() != ""){
							$.ajax({
								url : 'photoInsert.sb',
								type : 'POST',
								contentType : false,
						        processData : false,
								data : formData ,
								success : function(photoList){
									console.log(photoList);
								},
								error : function(){
									console.log('사진 작성 실패');
								}
							})
						}
					}
					alert('글작성 성공');
				},
				error : function(){
					console.log('게시글 작성 실패');
				}
			})
			
		});
		
		function alarmMessage(){
			
			var query = window.location.search;     
			var param = new URLSearchParams(query);
			var sno = param.get('sno');
			
			$(document).on('click', '#listMem', function(){
				var mem = $(this).children(0).val();
				$('.mem').attr('value', mem);
				
			});
			
			$(document).on('click', '#finishReader', function(){
				alert('리더가 변경되었습니다.');
			});
			
	
			$(document).on('click', '#enrollMember', function(){
				if(${empty loginMember}){
					alert('로그인 후 이용해주세요');
				} else {
					if('${memTotalTotal.sbNo}' == sno && '${memTotalTotal.memId}' == '${loginMember.memberId}' && '${memTotalTotal.banish}' == 'N'){
						alert('밴드에 재가입 할 수 없습니다.');
					} else {
						alert('밴드 가입이 완료되었습니다.');					
					}											
				};

			});
			
			$(document).on('click', '#deleteMember', function(){
				alert('밴드 탈퇴가 완료되었습니다.');
			});
			
			$(document).on('click', '#reportBandBtn', function(){
				alert('밴드 신고가 완료되었습니다.');
			});
		}
		
		
		function nickSearch(e){
			
			var query = window.location.search;     
			var param = new URLSearchParams(query);
			var sno = param.get('sno');
	        
	        $.ajax({
	            url : 'nickSearch.sb',
	            data : {
	            	sbNo : sno,
	                key : $(e).val()
	            },
	            success : function(result){
	                console.log(result);
	                var searchList = '';

	                for(var i in result){
	                   if($(e).val() != ''){
	                        searchList += "<label id='listMem'><input TYPE='radio' class='mem' name='memberId' value='" + result[i].memId + "' />" + result[i].memberId + "</label><br>"

	                    }
	                }
	                console.log(searchList)
	                if($(e).val() == '' || list.length == 0){
	                	$('.readerPass').html('검색결과가 없습니다.');
	                }else{
	                	$('.readerPass').html(searchList);
	                }
	            },
	            error : function(){
	                console.log('닉네임 검색 실패');
	            }
	        });
		}
    </script>
    
    

    
    
</body>
</html>