<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- SetCss -->
    <link rel="stylesheet" href="/swithme/resources/css/band/bandSet.css">
</head>
<body>

	<jsp:include page="bandHeader.jsp"/>
	
	<div class="wrap">
		<jsp:include page="bandSideBar.jsp"/>
		    <div id="blank">.</div>

	    <div class="mainDiv" >
	    <br><br>
	    	<div>
		        <span class="Writer">
	       			<strong class="menuInfo">밴드 설정</strong>
	       		</span>
	    	</div>
	    	<br><br><br>
	    	
	    	<div class="bandSetList">
	    		<ul>
	    			<li class="bandSetTitle">
	    				<div class="bSet">
	    					<span class="bandSetting">밴드정보</span>
	    					
		    				<span><button class="bSetBtn" data-toggle="modal" data-target="#updateIntroduceBandMember">변경</button></span>			
	    				</div>
	    			</li>
	    			
	    			<li class="bandSetTitle">
	    				<div class="bSet">
	    					<span class="bandSetting">밴드사진</span>
	    					
		    				<span><button class="bSetBtn" data-toggle="modal" data-target="#updateProfileBandMember">변경</button></span>			
	    				</div>
	    			</li>
	    			
	    			<li class="bandSetTitle">
	    				<div class="bSet">
	    					<span class="bandSetting" >리더위임</span>
	    					
		    				<span><button class="bSetBtn" data-toggle="modal" data-target="#updaetBandReader">변경</button></span>			
	    				</div>
	    			</li>
	    			
	    		</ul>
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
	                    <form action="delete.me" method="post">
	                 		<br>
	                        <div class="form-group">
	                        	<input type="hidden" name="bandNo" value="밴드번호">
	                       		º 모집인원 <br> 
	                        	<p id="personP">1 /</p><input type="number" value="10" class="personNum" required> <p id="personP">명</p> <br> 
	                        	º 밴드 이름 <br>
	                        	<input type="text" id="introudceName" value="밴드이름을 기재해주세요">
	                        	º 소개 <br>  
	                        	<textarea id="introduceText">밴드소개영역입니다.</textarea> <br>
	                        	º 개설일 <br> 
	                        	<p id="personC">2023년05월31일</p> 
	                        	º 카테고리 <br> 
	                        	<p id="personC">토익</p>
	                        	º 방장 <br> 
	                        	<p id="personC">방장닉네임</p>
	                        	
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
	                    <form action="" method="post" enctype="multipart/form-data">
                
	                 		<br>
	                        <div class="form-group">
	                        	<input type="hidden" name="bandNo" value="밴드번호">
	                        	
	                        	 <div class="thumnail">
						         	<div class="ptchange">
							        	<label for="image">
							        		<p>첨부</p>
							       		</label>
								     </div>
							        <div id="image_container">
							     	</div>
								        <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" />
								 </div>
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
			function setThumbnail(event) {
				var reader = new FileReader();
				reader.onload = function(event) {
					var img = document.createElement("img");
					document.querySelector("div#image_container").innerText = '';
					
					img.setAttribute("src", event.target.result);
					document.querySelector("div#image_container").appendChild(img);
				
				};
				reader.readAsDataURL(event.target.files[0]);
			};
		</script>
			
			

		
		
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
	                    <form action="" method="post">
	                 		<br>
	                        <div class="form-group">
	                        	<div id="bandSearchBox">
				                    <input type="text" id="searchBar">
				                    <img src="/swithme/resources/images/band/search.png" alt="" id="searchImg">
				                </div>
				                <div class="readerPass">
				                	<input type="hidden" name="bandNo" value="밴드번호">
				                	
				                	<label for="닉네임" class="nickNameMem"> 닉네임</label><input type="radio" name="member" value="닉네임"><br>
				                	<input type="radio" name="member" value="안녕"><label for="안녕"> 안녕</label><br>
				                	<input type="radio" name="member" value="반가워"><label for="반가워"> 반가워</label><br>
				                </div>
	                        </div>
	                        <br><br>
	                        <div class="btnGroup">
		                        <button class="enrollConfirm" type="submit">변경</button>
		                        <button class="enrollDismiss" type="button" data-dismiss="modal">취소</button>
	                        </div>
	                    </form>
	                </div>
            	</div>
        	</div>
		</div>
	
</body>
</html>