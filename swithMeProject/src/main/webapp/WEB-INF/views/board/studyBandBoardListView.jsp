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
            <p>마음에 맞는 사람과 같이 공부해요!</p>
        </div>
    </div>

    <!-- 자유게시판 컨텐츠 영역 -->
    <div id="content" class="clear">
        <div class="wrap clear">

            <div id="searchBox" class="clear">
                <p>전체게시글 300건</p>
                <div>
                    <input type="text" placeholder="키워드 검색" onkeyup="textSearch(this)"><img src="resources/search.png" alt="">
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
            	<p onclick="category(this);">고시공부</p>
                <p onclick="category(this);">진로</p>
                <p onclick="category(this);">프론트엔드</p>
                <p onclick="category(this);">백엔드</p>
                <p onclick="category(this);">모바일 앱 개발</p>
                <p onclick="category(this);">프로그래밍 언어</p>
                <p onclick="category(this);">보안</p>
                <p onclick="category(this);">네트워크</p>
                <p onclick="category(this);">클라우드</p>
                <p onclick="category(this);">인공지능</p>
                <p onclick="category(this);">CAD / 3D모델링</p>
                <p onclick="category(this);">UI / UX</p>
                <p onclick="category(this);">사진 · 영상</p>
                <p onclick="category(this);">그래픽 디자인</p>
                <p onclick="category(this);">마케팅 · 기획</p>
                <p onclick="category(this);">외국어</p>
                <p onclick="category(this);">취업 · 이직</p>
                <p onclick="category(this);">창업</p>
                <p onclick="category(this);">재테크</p>
            </div>
	
            <div class="clear test">
                <c:forEach var="b" items="${ list }">
                <div class="listinsert">
                    <div class="studyBandList clear">
                        <div class="studyBandId">${ b.memberId }</div>
                        <div class="studyBandInfo">
                            <img src="${ b.sbChangeName }" alt="dd">
                            <div>
                                <p class="studyBandName">${b.sbTitle}</p>
                                <p class="studyBandIntro">
                                    ${ b.sbIntroduce }
                                </p>
                            </div>
                            <ul class="clear">
                                <li>${ b.sbNowMem } / ${ b.sbRecruitMem }</li>
                                <li class="PostList">참여하기</li>
                            </ul>
                            <input id="sNo" type="hidden" value="${ b.sbNo }" >
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>

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
        
        
        });

        $(document).on('click', '.PostList', function(){
            var inputNo = $(this).parent().next().val();
            
            location.href = 'studyBand.bo/detail.bo?sno='+inputNo;
        
        });

        function category(e){
            var category = $(e).html();
            $.ajax({
                url : 'bandCateogory',
                data : {
                    category : category
                },
                success : function(r){
                    console.log(r);

                    var result = ''
                    for(var i in r.list){
                        result += '<div class="studyBandList clear">'
                                    + '<div class="studyBandId">' + r.list[i].memberId + '</div>'
                                    + '<div class="studyBandInfo">'
                                        + '<img src="resources/images/board/test.png" alt="dd">'
                                        + '<div>'
                                            + '<p class="studyBandName">'+ r.list[i].sbTitle + '</p>'
                                            + '<p class="studyBandIntro">' + r.list[i].sbIntroduce + '</p>'
                                        + '</div>'
                                        + '<ul class="clear">'
                                            + '<li>' + r.list[i].sbNowMem + ' / ' + r.list[i].sbRecruitMem + '</li>'
                                            + '<li class="PostList">참여하기</li>'
                                        + '</ul>'
                                        + '<input id="sNo" type="hidden" value="'+ r.list[i].boardNo + '" >'
                                    + '</div>'
                                + '</div>'
                        
                    }

                    $('.test').html(result);

                    console.log(result);

                },
                error : function(){

                }
            })
        }



        // 검색창 
        function textSearch(e){
            if(window.event.keyCode == 13){
                location.href="bandSearch?key=" + $(e).val();
            }
        }
        
    </script>