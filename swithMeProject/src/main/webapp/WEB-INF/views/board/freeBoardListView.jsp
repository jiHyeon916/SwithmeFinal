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
            <h3>커뮤니티</h3>
            <p>제한 없이, 자유롭게 얘기해요!</p>
        </div>
    </div>

    <!-- 자유게시판 컨텐츠 영역 -->
    <div id="content">
        <div class="wrap clear">
        
        	<!-- 상단 배너 영역 -->
            <div id="topBoard" class="clear">
                <div id="topBoard1">
                    <div>
                        <p><b>HOT</b> 여기 주목! BEST 추천 글</p>
                    </div>
                    <h4 class="F_sm_tit">
                        스윗미 픽!<br>
                        금주의 추천 글
                    </h4>
                    <p class="F_sm_smr">뭐뭐뭐 하느 글 어쩌고 저쩌고<br>
                    각자의 의견을 나누어 보아요!</p>

                    <p class="F_sm_tag">#고민 #멘토 #커리어 #커리어챗</p>
                </div>
                <div id="topBoard2">
                    <div>
                        <p><b>HOT</b> 전체 인기글</p>
                    </div>
                    <p class="F_sm_smr hotBod">가치의 고찰 - 가치가 있는 ‘나’를 가치있게 사용하자. (글 적은거 백업파일 찾았어요)</p><br>
                    <p class="F_sm_smr hotBod">2023 강원랜드 전형별 합격 가이드 (feat. 합격 스펙 정보)</p><br>
                    <p class="F_sm_smr hotBod">다른 대학 축제도 재밌나용??</p><br>
                    <p class="F_sm_smr hotBod">후기보니까 기업은행 인턴은 스펙 잘 안본대</p><br>
                    <p class="F_sm_smr hotBod">밥 먹다가 방구끼는 것도 가정 교육 잘못 받은거야??</p><br>
                </div>
                <div id="topBoard3">
                    <div>
                        <p><b>HOT</b> 여기 주목! BEST 추천 글</p>
                    </div>
                    <h4 class="F_sm_tit">
                        스윗미 픽!<br>
                        금주의 추천 글
                    </h4>
                    <p class="F_sm_smr">뭐뭐뭐 하느 글 어쩌고 저쩌고<br>
                    각자의 의견을 나누어 보아요!</p>

                    <p class="F_sm_tag">#고민 #멘토 #커리어 #커리어챗</p>
                </div>
            </div>

		
            <div id="searchBox" class="clear">
                <p class="totalListCount"><!-- 전체 게시글 수 카운팅 --></p>
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
                            // 카테고리 박스
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

                            freeBoardCount();
                            
                        })

                        function freeBoardCount(){
                            $.ajax({
                                url : 'freeCount.bo',
                                success : function(r) {
                                    $('.totalListCount').html('전체 게시글 ' + r + '건');
                                },
                                error : function(){

                                }
                            })
                        }
                    </script>
                </div>
                <div id="freeRankSort" class="clear">
                    <input type="radio" name="dd" id="" checked><p>최신 순</p>
                    <input type="radio" name="dd" id=""><p>인기 순</p>
                    <input type="radio" name="dd" id=""><p>댓글 많은 순</p>
                    <input type="radio" name="dd" id=""><p>좋아요 순</p>
                </div>
                <button id="freeWrite"><a href="freeBoardWrite.bo">글 작성하기</a></button>
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
                    <p id="F_Content">${ b.boardContent }</p>
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