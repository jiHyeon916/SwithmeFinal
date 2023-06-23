<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밴드 정보</title>
	<!-- InfoCss -->
    <link rel="stylesheet" href="/swithme/resources/css/band/bandInfo.css">
</head>
<body>

	<jsp:include page="bandHeader.jsp"/>
	
	<div class="wrap">
		<jsp:include page="bandSideBar.jsp"/>
		    <div id="blank">.</div>

	    <div class="mainDiv">
	    	<br><br>
	    	<div>
		        <span class="Writer">
	       			<strong class="menuInfo">밴드 정보</strong>
	       		</span>
	    	</div>
	    	<br><br><br>
	    	
	    	
	    	<div class="bandInfoList">
	    		<c:if test="${bandInfomation.memberIdId eq loginMember.memberId}">
		    		<div class="readerInfo">
		    			<button class="bInfoReader" data-toggle="modal" data-target="#updateProfileBandMember">사진 변경</button>
		    			<button class="bInfoReader" data-toggle="modal" data-target="#updateIntroduceBandMember">정보 변경</button>
		    		</div>
	    		</c:if>
	    		<div class="writer">
	    			<span>
	       				<strong class="InfoTitle">밴드 소개</strong>
	       			</span>
	    		</div>
	    		<div class="InfoContent">
	    			<p>${ info.sbIntroduce }</p>
	    		</div>
	    		
	    		<br><br><br>
	    		
	    		<div class="writer">
	    			<span>
	       				<strong class="InfoTitle">밴드 활동 정보</strong>
	       			</span>
	    		</div>
	    		<div class="InfoContent">
	    			<input type="hidden" value="${ info.sbNo }">
	    			<input type="hidden" value="${ info.sbTitle }">
	    			개설일 : ${ info.createDate } <br>
					<br>
					카테고리 : ${ info.sbCategory }  <br>
					<br>
					모집인원 : ${ info.sbNowMem } / ${ info.sbRecruitMem } <br>
					<br>
					방장 : ${ info.memberId } <br>
	    		</div>
	    	</div>
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
	<br><br><br>
	
	<!--밴드 사진 변경창-->
       	<div class="modal" id="updateProfileBandMember">
        	<div class="modal-dialog">
            	<div class="modal-content">
            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">밴드 사진 변경</h4>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <form action="updateProfileBand.sb" method="post" enctype="multipart/form-data">
                
	                 		<br>
	                        <div class="form-group">
	                        	<input type="hidden" name="sbNo" value="${ info.sbNo }">
	                        	
	                        	 <div class="thumnail">
						         	<div class="ptchange">
							        	<label for="image">
							        		<p>첨부</p>
							       		</label>
								     </div>
							        <div id="image_container">
							        	<img id="imgProfile" src="${ info.sbChangeName }">
							     	</div>
								        <input type="file" id="image" name="reUpfile" accept="image/*" onchange="setThumbnail(this);" />
								 </div>
		                    </div>
		                        <br>
	                        <div class="btnGroup1">
		                        <button class="enrollConfirm" id="photoChange"  type="submit">변경</button>
		                        <button class="profileDismiss" id="pass1" type="button" data-dismiss="modal">취소</button>
	                        </div>
	                    </form>
	                </div>
            	</div>
        	</div>
		</div>
	
	<!--밴드 정보 변경창-->
       	<div class="modal" id="updateIntroduceBandMember">
        	<div class="modal-dialog">
            	<div class="modal-content">
            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">밴드 정보 변경</h4>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <form action="updateInfoBand.sb" method="post">
	                 		<br>
	                        <div class="form-group">
	                        	<input type="hidden" name="sbNo" value="${ info.sbNo }">

	                       		º 모집인원 <br> 
	                        	<p id="personP">${ info.sbNowMem } /</p><input type="number" name="sbRecruitMem" value="${ info.sbRecruitMem }" class="personNum" required min="1" max="30"> <p id="personP">명</p> <br> 
	                        	º 밴드 이름 <br>
	                        	<input type="text" id="bandName" name="sbTitle" maxlength="16" value="${ info.sbTitle }" required><br>
	                        	º 소개 <br>  
	                        	<textarea id="introduceText" maxlength="333" name="sbIntroduce" required>${ info.sbIntroduce }</textarea> <br>
	                        	º 개설일 <br> 
	                        	<p id="personC">${ info.createDate }</p> 
	                        	º 카테고리 <br> 
	                        	<p id="personC">${ info.sbCategory } </p>
	                        	º 방장 <br> 
	                        	<p id="personC">${ info.memberId }</p>
	                        	
	                        </div>
	                        <br>
	                        <div class="btnGroup">
		                        <button class="enrollConfirm" type="submit">변경</button>
		                        <button class="enrollDismiss" type="button" data-dismiss="modal">취소</button>
	                        </div>
	                    </form>
	                </div>
            	</div>
        	</div>
		</div>
	
	<script>
	//이미지
	function setThumbnail(inputFile) {
		var imgSrc = $('#imgProfile').attr('src');
	
		
		if(inputFile.files.length == 1){

			let reader = new FileReader();

            reader.readAsDataURL(inputFile.files[0]);

            reader.onload = function(event){
            var img = $('#imgProfile');
    				
    		$(img).attr("src", event.target.result);
    				
			};
                
			$('.profileDismiss').click(function(){
					$('#image_container>img').attr('src', imgSrc);
			})
		};
	};	
	
	$(document).ready(function(){ 
		$('#photoChange').css('display','none');
		var fileTarget = $('#image'); 
		
		console.log(fileTarget);
		
		fileTarget.change(function(){
			alert('dd');
			$('#photoChange').css('display','inline');
		}); 
		
		
	}); 
	
	/*
	if(isImageFile(file)) {
	      var reader = new FileReader(); 
	      reader.onload = function(e) {
	        $("#preview").attr("src", e.target.result);
	      }
	      reader.readAsDataURL(file);
	    } else {
	      alert("이미지 파일만 첨부 가능합니다.");
	      $("#form_file").val("");
	      $("#preview").attr("src", "");
	    }
	// 업로드 파일 이미지 파일인지 확인
	function isImageFile(file) {
	  // 파일명에서 확장자를 가져옴
	  var ext = file.name.split(".").pop().toLowerCase(); 
	  return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
	}

	function form_chk() {
	  var file_val = $("#image").val();

	  if(file_val) {
	    //db에 파일 첨부 처리
	    alert("이미지가 첨부되었습니다");
	  } else {
	    alert("첨부된 이미지가 없습니다.");
	  }
	}
*/
	</script>
</body>
</html>