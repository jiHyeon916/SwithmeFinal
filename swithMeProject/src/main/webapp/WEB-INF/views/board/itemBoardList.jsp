<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/board/freeBoardListView.css">
<title>Insert title here</title>
</head>
<body>
	
	<!-- 헤더 영역 -->
	<jsp:include page="../common/header.jsp" />

	<!-- 자유게시판 Banner 영역 -->
    <div id="freeBanner">
        <div class="wrap">
            <h3>아이템</h3>
            <p>나의 캐릭터를 꾸미고 자랑해요!</p>
            <p>${ sessionScope.loginMember.memberId }</p>
        </div>
    </div>

    



    <div id="mainButton">
        <div>
            <a href="#">
                <img src="resources/question.png" alt="">
                <p>글 작성하기</p>
            </a>
        </div>
        <div>
            <a id="top_btn">
                <img src="resources/top.png" alt="">
                <p>TOP</p>
            </a>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>