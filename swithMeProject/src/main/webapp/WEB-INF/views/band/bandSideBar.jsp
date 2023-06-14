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
           
        </div>
        <div>
            <ul id="mainSideMenu" class="clear">
                <li><a id="li1" href="">최 신 글</a></li>
                <li><a id="li2" href="">밴드 정보</a></li>
                <li><a href="#" data-toggle="modal" data-target="#reportBand">신고 하기</a></li>
                <li><a id="li3" href="">공지 사항</a></li>
                <li><a id="li4" href="">밴드 일정</a></li>
                <li><a id="li5" href="">밴드 멤버</a></li>
                <li><a href="#" data-toggle="modal" data-target="#deleteBandMember" >밴드 탈퇴</a></li>
                <li><a href="#" data-toggle="modal" data-target="#updaetBandReader">리더 위임</a></li>
            </ul>
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
				                    <input type="text" id="searchBar">
				                    <img src="/swithme/resources/images/band/search.png" alt="" id="searchImg">
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
		$(function(){
			
			var query = window.location.search;     
			var param = new URLSearchParams(query);
			var sno = param.get('sno');
			

			
			$.ajax({
				url : 'side.sb',
				data : { sno : sno },
				success : function(result){
					// console.log(result);
					$('#detailSbtTitle').text(result.sbTitle);
					$('#bandCover').attr('src', result.sbChangeName);					
					$('#li1').attr('href',"detail.bo?sno="+sno);
					$('#li2').attr('href',"bandInfo.sb?sno="+sno);
					$('#li3').attr('href',"bandNotice.sb?sno="+sno);
					$('#li4').attr('href',"bandSchedule.sb?sno="+sno);
					$('#li5').attr('href',"bandMember.sb?sno="+sno);
					$('.sno').attr('value', sno);
					$('.memberId').attr('value', '${sessionScope.loginMember.memberId}');
					$('.reportBandName').attr('value', result.sbTitle);
					$('#totalNo').attr('value', sno);
					
					

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
						
						value += "<label id='listMem'><input TYPE='radio' id='mem' name='memberId' value='" + memList[i].memId + "' />" + memList[i].memberId + "</label><br>"
					}
					$('.readerPass').html(value);
					$('#mem').eq(0).attr('checked', true);
					$('#sNo').attr('value', sno);

				},
				error : function(){
					console.log('실패');
				}
			})
		});
		
		$(document).on('click', '#listMem', function(){
			var mem = $(this).children(0).val();
			$('#mem').attr('value', mem);
			console.log($('#mem').val());
			
		});
		
		$(document).on('click', '#finishReader', function(){
			var message = '${sessionScope.finishMsg}';
			alert(message);
			
		});
		

		$(document).on('click', '#enrollMember', function(){
			var message = '${sessionScope.alertBand}';
			alert(message);
			
		});
		
		$(document).on('click', '#deleteMember', function(){
			var message = '${sessionScope.alertDeleteBand}';
			alert(message);
		});
		
		$(document).on('click', '#reportBandBtn', function(){
			var message = '${sessionScope.reportMsg}';
			alert(message);
		});
    </script>
    
    

    
    
</body>
</html>