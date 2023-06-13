<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/board/freeBoardListView.css">
<link rel="stylesheet" href="resources/css/board/itemBoardView.css">
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

    <div class="wrap">

        <div id="sort" class="clear">
            <div id="freeCategory" class="cont-select" >
                <button class="btn-select" >전체보기</button>
                <ul class="list-member">
                    <li><button type="button" onclick="categorySearch(this.innerText, 1);">전체보기</button></li>
                    <li><button type="button" onclick="categorySearch(this.innerText, 1);">배경</button></li>
                    <li><button type="button" onclick="categorySearch(this.innerText, 1);">도구</button></li>
                    <li><button type="button" onclick="categorySearch(this.innerText, 1);">캐릭터</button></li>
                    <li><button type="button" onclick="categorySearch(this.innerText, 1);">모자</button></li>
                </ul>
            </div>
            <div id="searchBox" class="clear">
                <input type="text" id="searchBar" placeholder="키워드 검색" onkeyup="textSearch(this)"><img src="resources/search.png" alt="">
            </div>
        </div>
    </div>

    <!--  -->
    <div id="itemCon">
        <div class="wrap clear">
            <div class="itemList">
                <div class="itemImg"></div>
                <p class="itemTitle">보라보라룸</p>
                <p class="itemPrice">300 point</p>
            </div>
            <div class="itemList">
                <div class="itemImg"></div>
                <p class="itemTitle">보라보라룸</p>
                <p class="itemPrice">300 point</p>
            </div>
            <div class="itemList">
                <div class="itemImg"></div>
                <p class="itemTitle">보라보라룸</p>
                <p class="itemPrice">300 point</p>
            </div>
            <div class="itemList">
                <div class="itemImg"></div>
                <p class="itemTitle">보라보라룸</p>
                <p class="itemPrice">300 point</p>
            </div>
            <div class="itemList">
                <div class="itemImg"></div>
                <p class="itemTitle">보라보라룸</p>
                <p class="itemPrice">300 point</p>
            </div>
            <div class="itemList">
                <div class="itemImg"></div>
                <p class="itemTitle">보라보라룸</p>
                <p class="itemPrice">300 point</p>
            </div>
            <div class="itemList">
                <div class="itemImg"></div>
                <p class="itemTitle">보라보라룸</p>
                <p class="itemPrice">300 point</p>
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


    <!-- 페이징 바 -->
    <div id="pagingBar" class="clear">
        <div class="wrap">
            <div>
                
                <p><img src="resources/images/common/pre.png">pre</p>
                <p onclick="paging();">next<img src="resources/images/common/next.png"></p>
            </div>
            <ul>
                <li onclick="paging(this);">1</li>
            </ul>
        </div>
    </div>

        
    <jsp:include page="../common/footer.jsp" />



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
        })

    </script>
</body>
</html>