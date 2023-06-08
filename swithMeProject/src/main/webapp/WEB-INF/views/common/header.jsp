<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
   
   <!-- jQuery 라이브러리 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <!-- 부트스트랩에서 제공하고 있는 스타일 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
   

    <script src="resources/summernote/summernote-lite.js"></script>
    <script src="resources/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="resources/summernote/summernote-lite.css">
   
   <link rel="stylesheet" href="resources/css/common/header.css">
   
   
<title>Insert title here</title>
</head>
<body>
 
 <c:if test = "${not empty alertMsg }">
    <script>
       alert('${alertMsg }');
    
    </script>
    </c:if>
 <c:remove var = "alertMsg" scope="session"/> 


   
   


<header>
    <div class="wrap clear">
        <h1 id="logo"><a href="index.jsp">스터디윗미</a></h1>
        <ul id="mainMenu" class="clear">
            <li><a href="freeBoardListView.bo?boardType=1">커뮤니티</a></li>
            <li><a href="freeBoardListView.bo?boardType=2">질문정보</a></li>
            <li><a href="studyBandListView.bo">스터디밴드</a></li>
            <li><a href="studyRoomMainView.bo">스터디룸</a></li>
            <li><a href="#">아이템 상점</a></li>
        </ul>
        
        
        	<!-- 회원이 가입했을 때 마이페이지 -->
	        <ul id="userMenu">
	      	  <c:if test="${!empty loginMember && !loginMember.memberId.equals('admin')}">
		            <li>
		                <a href="alarm.me">
		                    <img src="resources/images/common/notice.png">
		                    <div id="noRead"></div>
		                </a>
		            </li>
         	 </c:if>  
         	 
         	 <!-- 관리자가 가입했을 때 마이페이지 -->
       	 	<c:if test="${!empty loginMember &&  loginMember.memberId eq 'admin'}">
		            <li>
		                <a href="adPage.ad">
		                    <img src="resources/images/common/notice.png">
		                    <div id="noRead"></div>
		                </a>
		            </li>
       		 </c:if>  
         	 
         	 
            <!-- 로그인 전 / 후 -->
            <c:choose>
               <c:when test="${empty loginMember }">
                  <li><a href="loginForm.me">로그인</a></li>
                  <li><a href="memberEnrollForm.me">회원가입</a></li>
               </c:when>
               <c:otherwise>
                  <li><label>${loginMember.nickName }님 환영합니다.</label></li>
                  <li><a href="logout.me">로그아웃</a></li>
               </c:otherwise>
            </c:choose>
            
         
            
            
            
            
            
        </ul>
    </div>
</header>

<div class="headerblank"></div>
        
</body>
</html>