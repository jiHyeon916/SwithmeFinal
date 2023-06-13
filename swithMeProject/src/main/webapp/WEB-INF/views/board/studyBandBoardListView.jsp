<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/board/studyBandBoardListView.css">
<title>스터디윗미-스터디밴드</title>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />

	<!-- 자유게시판 Banner 영역 -->
    <div id="freeBanner">
        <div class="wrap">
            <h3>스터디밴드</h3>
            <p>제한 없이, 자유롭게 얘기해요!dddddd  </p>
        </div>
    </div>

    <!-- 자유게시판 컨텐츠 영역 -->
    <div id="content" class="clear">
        <div class="wrap clear">

            <div id="searchBox" class="clear">
                <p>전체게시글 300건</p>
                <div>
                    <input type="text" placeholder="키워드 검색"><img src="resources/search.png" alt="">
                </div>
            </div>

            <div id="sort" class="clear">
                <div id="freeCategory">
                    <div id="freeCategory" class="cont-select" >
                        <button class="btn-select" >모집중</button>
                        <ul class="list-member">
                          <li><button type="button">모집중</button></li>
                          <li><button type="button">모집마감</button></li>
                        </ul>
                    </div>
                    
                </div>
                
                <button id="freeWrite"><a href="studyWrite.bo">모집하기</a></button>
            </div>

            <div id="studyCategory" class="clear">
            	<p>고시공부</p>
                <p>프론트엔드</p>
                <p>백엔드</p>
                <p>모바일 앱 개발</p>
                <p>프로그래밍 언어</p>
                <p>보안</p>
                <p>네트워크</p>
                <p>클라우드</p>
                <p>인공지능</p>
                <p>CAD / 3D모델링</p>
                <p>UI / UX</p>
                <p>사진 · 영상</p>
                <p>그래픽 디자인</p>
                <p>마케팅 · 기획</p>
                <p>외국어</p>
                <p>취업 · 이직</p>
                <p>창업</p>
                <p>재테크</p>
            </div>

            <div class="studyBandList clear">
                <div class="studyBandId">아이디</div>
                <div class="studyBandInfo">
                    <img src="" alt="dd">
                    <p class="studyBandName">매일 책 읽는 방</p>
                    <p class="studyBandIntro">매일 책 읽는 습관을 만들기 위한 스터디
                        원을 모집중입니다. 관심 있으신 분들은
                        부담없이 참여해주시면 감사하겠습니다!
                    </p>
                    <ul class="clear">
                        <li>모집인원</li>
                        <li>참여하기</li>
                    </ul>
                </div>
            </div>
            <div class="studyBandList clear">
                <div class="studyBandId">아이디</div>
                <div class="studyBandInfo">
                    <img src="" alt="dd">
                    <p class="studyBandName">매일 책 읽는 방</p>
                    <p class="studyBandIntro">매일 책 읽는 습관을 만들기 위한 스터디
                        원을 모집중입니다. 관심 있으신 분들은
                        부담없이 참여해주시면 감사하겠습니다!
                    </p>
                    <ul class="clear">
                        <li>모집인원</li>
                        <li>참여하기</li>
                    </ul>
                </div>
            </div>
            <div class="studyBandList clear">
                <div class="studyBandId">아이디</div>
                <div class="studyBandInfo">
                    <img src="" alt="dd">
                    <p class="studyBandName">매일 책 읽는 방</p>
                    <p class="studyBandIntro">매일 책 읽는 습관을 만들기 위한 스터디
                        원을 모집중입니다. 관심 있으신 분들은
                        부담없이 참여해주시면 감사하겠습니다!
                    </p>
                    <ul class="clear">
                        <li>모집인원</li>
                        <li>참여하기</li>
                    </ul>
                </div>
            </div>
            <div class="studyBandList clear">
                <div class="studyBandId">아이디</div>
                <div class="studyBandInfo">
                    <img src="" alt="dd">
                    <p class="studyBandName">매일 책 읽는 방</p>
                    <p class="studyBandIntro">매일 책 읽는 습관을 만들기 위한 스터디
                        원을 모집중입니다. 관심 있으신 분들은
                        부담없이 참여해주시면 감사하겠습니다!
                    </p>
                    <ul class="clear">
                        <li>모집인원</li>
                        <li>참여하기</li>
                    </ul>
                </div>
            </div>




        
            
            
            
            
            
            
            
            
        

            <!-- 페이징 바 -->
			<!-- <div id="pagingBar" class="clear">
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
            </div> -->


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


                });

            </script>


        </div>
    </div>
