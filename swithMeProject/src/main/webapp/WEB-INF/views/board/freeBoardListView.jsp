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
                    <ul id="topList">
                        <!-- 인기글 리스트 들어갈 곳 -->
                    </ul>
                    
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
                <c:choose>
                <c:when test="${ empty searchTotal }">
                    <p class="totalListCount"><!-- 전체 게시글 수 카운팅 --></p>
                    <p>${searchTotal}</p>
                </c:when>
                <c:otherwise>
                    <p>'${searchTotal[0]}'로 검색한 결과 총 ${searchTotal[1]}건</p>
                </c:otherwise>
                </c:choose>
                
                <div>
                    <input type="text" id="searchBar" placeholder="키워드 검색" onkeyup="textSearch(this)"><img id="searchImg" src="resources/images/board/search.png" alt="">
                </div>
            </div>

            <div id="sort" class="clear">
                <div id="freeCategory">
                    <div id="freeCategory" class="cont-select" >
                        <button class="btn-select" >전체보기</button>
                        <ul class="list-member">
                          <li><button type="button" onclick="categorySearch(this.innerText, 1);">전체보기</button></li>
                          <li><button type="button" onclick="categorySearch(this.innerText, 1);">공부꿀팁</button></li>
                          <li><button type="button" onclick="categorySearch(this.innerText, 1);">자유잡담</button></li>
                          <li><button type="button" onclick="categorySearch(this.innerText, 1);">이슈정보</button></li>
                        </ul>
                    </div>
                    
                </div>
                <div id="freeRankSort" class="clear">
                    <input type="radio" name="sort" value="createDate" id="default" checked onclick="boardSort(this.value, 1);"><p>최신 순</p>
                    <input type="radio" name="sort" value="count" onclick="boardSort(this.value, 1);"><p>인기 순</p>
                    <input type="radio" name="sort" value="comment" onclick="boardSort(this.value, 1);"><p>댓글 많은 순</p>
                    <input type="radio" name="sort" value="like" onclick="boardSort(this.value, 1);"><p>좋아요 순</p>
                </div>
                <button id="freeWrite"><a href="freeBoardWrite.bo?boardType=1">글 작성하기</a></button>
            </div>
            
            
            <div id="ajaxList">
                <!-- 리스트 영역 -->
                <input type="hidden" value="free" id="bType">
                <c:forEach items="${ list }" var="b">
                <div class="freeBoardList" onclick="location.href='freeBoardDetail.bo?boardNo=${ b.boardNo }'">
                    <div class="freelist">
                        <div class="clear">
                            <div id="F_category">${ b.category }</div>
                            <p id="F_title">${ b.boardTitle }</p>
                            <p id="F_date">${ b.createDate }</p>
                        </div>
                        <p id="F_content" class="over">${ b.summary }</p>
                        <ul id="F_like" class="clear">
                            <li><img src="resources/images/board/reply.png">${ b.commentCount }</li>
                            <li><img src="resources/images/board/heart.png">${ b.likeCount }</li>
                            <li><img src="resources/images/board/views.png">${ b.count }</li>
                            <p>${ b.memberId }</p>
                        </ul>
                        
                    </div>
                </div>
                </c:forEach>
            </div>
            <script>

                $(function(){

                    boardTop();

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

                    // $(".freeBoardList").each(function() {
                    //     var $textEncoder = $(this).find(".textEncoder"); // .textEncoder 클래스를 가진 요소 선택
                    //     $textEncoder.find("p").empty(); // .textEncoder 하위의 <p> 요소 내용을 비움
                    //     var html = $textEncoder.html(); // .textEncoder 내용 가져오기
                    //     var strippedText = stripHtmlTags(html); // HTML 태그 제거
                    //     $textEncoder.text(strippedText); // 제거된 HTML 태그가 적용된 텍스트로 설정

                    // });


                    // 검색 이미지 클릭 
                    $('#searchImg').click(function(){
                        var searchText = $(this).prev().val();
                        location.href="tagSearch.bo?key=" + searchText + '&boardType=' + $('#bType').val() + '&keyType=text';
                    })
                })

                
                // 게시판 게시글 수 카운팅 
                function freeBoardCount(){
                    $.ajax({
                        url : 'boardCount.bo',
                        data : {
                            boardType : 1
                        },
                        success : function(r) {
                            $('.totalListCount').html('전체 게시글 ' + r + '건');
                        },
                        error : function(){

                        }
                    })
                }

                // 카테고리 필터
                function categorySearch(e, pageNo){
                    var keyVal = '${key}';
                    var keyTypeVal = '${keyType}'
                    var boardType = '${ list[1].boardType }'

                    $.ajax({
                        url : 'categorySearch.bo',
                        data : {
                            boardType : boardType,
                            keyValue : keyVal,
                            keyType : keyTypeVal,
                            category : e,
                            cPage : pageNo
                        },
                        success : function(r){

                            $('#default').prop('checked', true);
                            
                            var value = '';
                            var paging = '';
                            
                            for(var i in r.list){
                                value += '<div class="freeBoardList" onclick="location.href=\'freeBoardDetail.bo?boardNo=' + r.list[i].boardNo + '\'">'
                                        + '<div class="freelist">'
                                            +'<div class="clear">'
                                                +'<input type="hidden" id="bType" value="' + r.list[i].boardType + '">'
                                                +'<div id="F_category">' + r.list[i].category + '</div>'
                                                +'<p id="F_title">' + r.list[i].boardTitle + '</p>'
                                                +'<p id="F_date">' + r.list[i].createDate + '</p>'
                                            +'</div>'
                                            +'<p id="F_content" class="over">' + r.list[i].summary + '</p>'
                                            +'<ul id="F_like" class="clear">'
                                                +'<li><img src="resources/images/board/reply.png">' + r.list[i].commentCount + '</li>'
                                                +'<li><img src="resources/images/board/heart.png">' + r.list[i].likeCount +'</li>'
                                                +'<li><img src="resources/images/board/views.png">' + r.list[i].count + '</li>'
                                                +'<p>' + r.list[i].memberId + '</p>'
                                            +'</ul>'
                                        + '</div>'
                                      + '</div>'
                            }

                            $('#ajaxList').html(value);


                            // ajax 페이징
                            var paging = '';

                            var p = '';
                            for(var i = 0; i < r.pi.endPage; i++){
                                p += '<li onclick="categorySearch(\''+ r.list[i].category + '\',' +  (i+1) + ')">' + (i + 1) + '</li>';
                            }      

                            paging += '<div>'
                                        + '<p><img src="resources/images/common/pre.png">pre</p>'
                                        + '<p>next<img src="resources/images/common/next.png"></p>'
                                    + '</div>'
                                    + '<ul>'
                                        + p
                                    + '</ul>';
                                    
                            $('#pagingBar > div').html(paging);

                            $('html').scrollTop(0);
                        
                        },
                        error : function(){
                        }
                    })
                }

                // 글 정렬
                function boardSort(e, pageNum){
                    $.ajax({
                        url : 'sort.bo',
                        data : {
                            boardType : '${ list[1].boardType }',
                            keyValue : '${key}',
                            keyType : '${keyType}',
                            category : $('.btn-select').text(),
                            sort : e,
                            cPage : pageNum
                        },
                        success : function(r){

                            var value = '';
                            
                            for(var i in r.list){
                                value += '<div class="freeBoardList" onclick="location.href=\'freeBoardDetail.bo?boardNo=' + r.list[i].boardNo + '\'">'
                                        + '<div class="freelist">'
                                            +'<div class="clear">'
                                                +'<input type="hidden" id="bType" value="' + r.list[i].boardType + '">'
                                                +'<div id="F_category">' + r.list[i].category + '</div>'
                                                +'<p id="F_title">' + r.list[i].boardTitle + '</p>'
                                                +'<p id="F_date">' + r.list[i].createDate + '</p>'
                                            +'</div>'
                                            +'<p id="F_content" class="over">' + r.list[i].summary + '</p>'
                                            +'<ul id="F_like" class="clear">'
                                                +'<li><img src="resources/images/board/reply.png">' + r.list[i].commentCount + '</li>'
                                                +'<li><img src="resources/images/board/heart.png">' + r.list[i].likeCount +'</li>'
                                                +'<li><img src="resources/images/board/views.png">' + r.list[i].count + '</li>'
                                                +'<p>' + r.list[i].memberId + '</p>'
                                            +'</ul>'
                                        + '</div>'
                                      + '</div>'
                            }

                            $('#ajaxList').html(value);

                            // ajax 페이징
                            var paging = '';

                            var p = '';
                            for(var i = 0; i < r.pi.endPage; i++){
                                p += '<li onclick="boardSort(\''+ r.list[i].category + '\',' +  (i+1) + ')">' + (i + 1) + '</li>';
                            }      

                            paging += '<div>'
                                        + '<p><img src="resources/images/common/pre.png">pre</p>'
                                        + '<p>next<img src="resources/images/common/next.png"></p>'
                                    + '</div>'
                                    + '<ul>'
                                        + p
                                    + '</ul>';
                                    
                            $('#pagingBar > div').html(paging);

                            if(cPage != 1){
                                $('html').scrollTop(0);
                            }

                        },
                        error : function(){
                        }
                    })
                }



                // 검색창 
                function textSearch(e){
                    if(window.event.keyCode == 13){
                        location.href="tagSearch.bo?key=" + $(e).val() + '&boardType=' + $('#bType').val() + '&keyType=text';
                    }
                }





                // 페이징 처리 
                function paging(e){

                    var str = document.location.href;
                    var link = str.split('&cPage=');
                    var rLink = link[0] + "&cPage=" + $(e).text();

                    location.href=rLink;
                }
                
                // 인기글 5개 조회
                function boardTop(){

                    $.ajax({
                        url : "topBoard.bo",
                        success : function(list){

                            var listTop = '';
                            for(var i in list){
                                listTop += '<li class="F_sm_smr hotBod" onclick="location.href=\'freeBoardDetail.bo?boardNo=' + list[i].boardNo + '\'">' + list[i].boardTitle  + '</li>';
                            }

                            $('#topList').html(listTop);
                        },
                        error : function(){
                            console.log('실패');
                        }
                    });

                }

                


                
            </script>
			<!-- 페이징 바 -->
			<div id="pagingBar" class="clear">
                <div class="wrap">
                    <div>
                        
                        <p><img src="resources/images/common/pre.png">pre</p>
                        <c:if test="${pi.currentPage ne endPage}">
                        <p onclick="paging();">next<img src="resources/images/common/next.png"></p>
                        </c:if>
                    </div>
                    <ul>
                        <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                        <li onclick="paging(this);">${ p }</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
       
         

        </div>
    </div>



    <jsp:include page="../common/sideBtn.jsp" />
    <jsp:include page="../common/footer.jsp" />

</body>
</html>