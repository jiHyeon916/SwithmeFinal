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
            <h3>질문게시판</h3>
            <p>공부하면서 궁금한점이 있으신가요?</p>
        </div>
    </div>

    <!-- 자유게시판 컨텐츠 영역 -->
    <div id="content">
        <div class="wrap clear">
        
        	

		
            <div id="searchBox" class="clear">
                <c:choose>
                <c:when test="${ empty selectTotal }">
                    <p>전체게시글 300건</p>
                    <p>${selectTotal}</p>
                </c:when>
                <c:otherwise>
                    <p>300건</p>
                </c:otherwise>
                </c:choose>
                <div>
                    <input type="text" placeholder="키워드 검색"><img src="resources/search.png" alt="">
                </div>
            </div>

            <div id="sort" class="clear">
                <div id="freeCategory">
                    <div id="freeCategory" class="cont-select">
                        <button class="btn-select">전체보기</button>
                        <ul class="list-member">
                          <li><button type="button">전체보기</button></li>
                          <li><button type="button">공부꿀팁</button></li>
                          <li><button type="button">자유잡담</button></li>
                          <li><button type="button">이슈정보</button></li>
                        </ul>
                    </div>
                    <script>
                        $(function(){
                            const btn = document.querySelector('.btn-select');
                            const list = document.querySelector('.list-member');
                            btn.addEventListener('click', () => {
                                btn.classList.toggle('on');
                            });
                            list.addEventListener('click', (event) => {
                                if (event.target.nodeName === "BUTTON") {
                                    btn.innerText = event.target.innerText;
                                    btn.classList.remove('on');
                                }
                            });
                        })
                    </script>
                </div>
                <div id="freeRankSort" class="clear">
                    <input type="radio" name="dd" id="" checked><p>최신 순</p>
                    <input type="radio" name="dd" id=""><p>인기 순</p>
                    <input type="radio" name="dd" id=""><p>댓글 많은 순</p>
                    <input type="radio" name="dd" id=""><p>좋아요 순</p>
                </div>
                <button id="freeWrite"><a href="freeBoardWrite.bo?boardType=2">글 작성하기</a></button>
            </div>
            
            
            
            <!-- 리스트 영역 -->
			<c:forEach items="${ list }" var="b">
                <div class="freeBoardList" onclick="location.href='freeBoardDetail.bo?boardNo=${ b.boardNo }'">
                    <div class="freelist">
                        <div class="clear">
                            <div id="F_category">${ b.category }</div>
                            <p id="F_title">${ b.boardTitle }</p>
                            <p id="F_date">${ b.createDate }</p>
                        </div>
                        <p id="F_content">${ b.summary }</p>
                        <ul id="F_like" class="clear">
                            <li><img src="resources/images/board/reply.png">16</li>
                            <li><img src="resources/images/board/heart.png">${ b.boardNo }</li>
                            <li><img src="resources/images/board/views.png">${ b.count }</li>
                            <p>${ b.memberId }</p>
                        </ul>
                        
                    </div>
                </div>
            </c:forEach>
			
			<!-- 페이징 바 -->
			<div id="pagingBar" class="clear">
                <div class="wrap">
                    <div>
                        <p><img src="resources/images/common/pre.png">pre</p>
                        <p>next<img src="resources/images/common/next.png"></p>
                    </div>
                    <ul>
                        <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                        <li><a href="freeBoardListView.bo?boardType=1&cPage=${ p }">${ p }</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
       
         

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