<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
 
	
    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>  
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>  
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	

	<!-- summernote 추가할 부분 -->
	<script src="/swithme/resources/summernote/summernote-lite.js"></script>
	<script src="/swithme/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/swithme/resources/summernote/summernote-lite.css">
	<!-- summernote 끝 -->
	    
    <!-- headerCss -->
    <link rel="stylesheet" href="/swithme/resources/css/band/bandHeader.css">
    
</head>
<body>
    <header>
        <div class="wrap clear">
            <h1 id="logo"><a href="/swithme">스터디윗미</a></h1>
           
            <div id="mainMenu" class="clear">
				<div id="bandSearchBox">
                    <input type="text" id="searchBar" onkeyup="textSearch(this)">
                    <img src="/swithme/resources/images/band/search.png" alt="" id="searchImg">
                </div>
            </div>
            
            <!-- 회원이 가입했을 때 마이페이지 -->
	        <ul id="userMenu">
	      		<c:if test="${!empty loginMember && !loginMember.memberId.equals('admin')}">
		            <li>
		                <a href="/swithme/alarm.me">
		                    <img src="/swithme/resources/images/common/notice.png">
		                    <div id="noRead"></div>
		                </a>
		            </li>
         		</c:if>  
         	 
	         	 <!-- 관리자가 가입했을 때 마이페이지 -->
	       	 	<c:if test="${!empty loginMember &&  loginMember.memberId eq 'admin'}">
			            <li>
			                <a href="/swithme/adPage.ad">
			                    <img src="/swithme/resources/images/common/notice.png">
			                    <div id="noRead"></div>
			                </a>
			            </li>
	       		 </c:if>  
	         	 
	         	 
	            <!-- 로그인 전 / 후 -->
	            <c:choose>
	               <c:when test="${empty loginMember }">
	                  <li><a href="/swithme/loginForm.me">로그인</a></li>
	                  <li><a href="/swithme/memberEnrollForm.me">회원가입</a></li>
	               </c:when>
	               <c:otherwise>
		            	<li><label id="loginName" onclick="myPage();">${ loginMember.memberName }</label>님 환영합니다.</li>
	                  <li><a href="/swithme/logout.me">로그아웃</a></li>
	               </c:otherwise>
	            </c:choose>
        	</ul>
        </div>
    </header>

    <div class="headerblank"></div>
    
    <script>
	    $(document).on('click', '#searchImg', function(){
	    	keyword = $('#searchBar').val();
	    	
	    	var query = window.location.search;     
			var param = new URLSearchParams(query);
			var sbNo = param.get('sno');
			console.log(sbNo);
			
	    	location.href = "search.sb?sno=" + sbNo + "&keyword=" + keyword;
	
	    });
	    
	    // 검색창 
	    function textSearch(e){
	        if(window.event.keyCode == 13){
				keyword = $('#searchBar').val();
	        	
	        	var query = window.location.search;     
	    		var param = new URLSearchParams(query);
	    		var sbNo = param.get('sno');
	
	            location.href="search.sb?sno=" + sbNo + "&keyword=" + keyword;
	        }
	        
	        if($(document).on('click','#searchImg', function(){
	        	keyword = $('#searchBar').val();
	        	
	        	var query = window.location.search;     
	    		var param = new URLSearchParams(query);
	    		var sbNo = param.get('sno');
	    		
	        	location.href = "search.sb?sno=" + sbNo + "&keyword=" + keyword;
	        }));
	    }
	    
	    // 마이페이지로 이동
		function myPage(){
			
			var user = '${ loginMember.memberId }';
			
			if(user == 'admin'){
				location.href = '/swithme/adPage.ad';
			}
			else {
				location.href = '/swithme/mypage.me';
			}
			
		}

    </script>

</body>
</html>