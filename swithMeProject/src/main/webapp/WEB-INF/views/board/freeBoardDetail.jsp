<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDtail</title>
<link rel="stylesheet" href="resources/css/board/freeBoardDetail.css"> 
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div id="detail">
        <div class="wrap">
            <!-- 스티키 영역 -->
            <div id="contentBox" class="clear">
                <!-- 글 보이는 곳 -->
                <div>
                    <!-- 썸네일 사진 -->
                    <div class="thumbnail">
                        <img src="resources/images/board/thumbnail8.jpg">
                    </div>
                    <!-- 글쓴 정보 : 제목, 날짜, 작성자 -->
                    <div class="writerInfo clear">
                        <img src="" alt="" id="character">
                        <div class="clear">
                            <h6 class="title">${ b.boardTitle }</h6>
                            <div class="clear">
                                <p class="writerId">${ b.memberId }</p>
                                <p class="writerDate">${ b.createDate }</p>
                                <c:if test="${ sessionScope.loginMember.nickName eq b.memberId}">
                                    <div id="modifyBoard">
                                        <p onclick="modifyWirte();">수정</p>
                                        <p onclick="deleteBoard();">삭제</p>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- 컨텐츠 내용 -->
                    <div id="content_text">
                        <p>${ b.boardContent }</p>
                    </div>
                    <!-- 글 정보 영역 : 카테고리, 태그 -->
                    <div class="categoryBox">
                        <div class="clear d_category">
                            <span class="categoryTitle">Category</span>
                            <span>${ b.category }</span>
                        </div>

                        <c:if test="${ not empty tag }">
                        <div class="clear d_tag">
                            <span class="categoryTitle">Tag</span>
                            <c:forEach items="${ tag }" var="t">
                                <span class="tagBtn" onclick="tagSearch(this)">#${ t }</span>
                            </c:forEach>
                        </div>
                        </c:if>
                        
                    </div>

                   
                    <div class="reblank">
    
                    </div>


                    <div class="replyArea">
                        <c:if test="${ sessionScope.loginMember != null }">
                        <textarea name="" id="replyContent" placeholder="댓글 내용을 입력해주세요."></textarea>
                        </c:if>
                        <c:if test="${ sessionScope.loginMember == null }">
                        <textarea name="" id="replyContent" placeholder="로그인 후 이용해주세요." disabled></textarea>
                        </c:if>
                        <button id="replyBtn" onclick="insertReply();">등록</button>
                        <div class="blank"></div>
    
                        <div class="replyWrap">
                            <!-- 댓글 컨텐츠 영역 -->
                        </div>
                    </div>
                    
                </div>



                
                <!-- 사이드바 메뉴 -->
                <div class="sideBtn">
                    <div onclick="likeBoard();">
                        <img src="resources/images/board/heart.png" alt="">
                    </div>
                    <p class="likeCount"></p>

                    <div onclick="bookBoard();"><img src="resources/images/board/bookmark.png" alt=""></div>
                    <p class="bookCount"></p>

                    <div><img src="resources/images/board/reply.png" alt=""></div>
                    <p class="replyCount"></p>
                    <hr>
                    <div class="btn-open-popup">
                        <img src="resources/images/board/emergency.png" alt="">
                    </div>
                </div>
            </div>

            <!-- 댓글 영역 -->
            <div>
                
            </div>


            <!-- 아이템 모달 -->
            <div class="modal msg1">
                        
            </div>
            <div class="modal_body msg1_body">
                <div class="clear">
                    <h4>신고하기</h4>
                    <img src="" alt="">
                </div>
                <hr>
                <p class="writer">작성자 | ${sessionScope.loginMember.nickName}</p>
                <p class="reportTitle">게시글 | ${b.boardTitle}</p>
                <hr>
                <h5>사유선택</h5>
                <div id="resonBox">
                    <p class="reason"><input type="radio" name="" id=""> 스팸홍보/도배글입니다.</p>
                    <p class="reason"><input type="radio" name="" id=""> 음란물입니다.</p>
                    <p class="reason"><input type="radio" name="" id=""> 불법정보를 포함하고 있습니다.</p>
                    <p class="reason"><input type="radio" name="" id=""> 청소년에게 유해한 내용 입니다.</p>
                    <p class="reason"><input type="radio" name="" id=""> 청소년에게 유해한 내용 입니다.</p>
                    <p class="reason"><input type="radio" name="" id=""> 욕설/생명경시/혐오/차별적 표현입니다.</p>
                    <p class="reason"><input type="radio" name="" id=""> 개인정보 노출 게시물 입니다.</p>
                </div>
                <hr>
                <h5>추가내용</h5>
                <textarea name="" id="" cols="30" rows="10" placeholder="추가로 기재할 내용을 적어주세요."></textarea>
                <p class="ment">* 허위 기재 및 무분별한 신고시 불이익이 있을 수 있습니다.</p>
                <button>신고하기</button>

        </div>
    </div>


    <jsp:include page="../common/footer.jsp" />


    <script>
        $(function(){
            reply(); //댓글 불러오기
            replyCount(); //댓글 수 불러오기 
            likeStatusCheck(); //좋아요 상태 표시
            bookStatusCheck(); //북마크 상태 표시
            //reReplyList(); //대댓글 리스트 불러오기

            let btnOpenPopup = document.getElementsByClassName('btn-open-popup');
            const modal = document.querySelector('.msg1');
           
            for(var i = 0; i < btnOpenPopup.length; i++){
                btnOpenPopup[i].addEventListener("click", click);
                function click(e) {
	                $('.msg1_body').show().css('z-index','999999');
                    $('header').css('z-index', '88888');
	                $('.msg1').show();
	                $('body').css('overflow','hidden');
	                $('.msg1').click(function(){
	                    $('.msg1_body').hide();
	                    $('.msg1').hide();
	                    $('body').css('overflow','auto');
	                });
	                $('.cloesBtn').click(function(){
	                    $('.msg1_body').hide();
	                    $('.msg1').hide();
	                    $('body').css('overflow','auto');
	                });
                    
                };

            }
            
            // 모달 닫기
            $('.cloesBtn3').click(function(){
                $('.send').hide();
                $('.send_body').hide();
                $('body').css('overflow','auto');
            })
            


            
        })


        
        // 좋아요 누르기
        function likeStatusCheck(){
            $.ajax({
                url: 'likeStatus.ck',
                data : {
                    boardNo : '${ b.boardNo }'
                },
                success : function(r){

                    if(r > 0){
                        $('.likeCount').css('color','red');
                    }else{
                        $('.likeCount').css('color','black');
                    }

                    likeCount();
                },
                error : function(){

                }
            })
        }

        // 북마크 상태 확인 
        function bookStatusCheck(){
            $.ajax({
                url: 'bookStatus.ck',
                data : {
                    boardNo : '${ b.boardNo }'
                },
                success : function(r){
                    
                    if(r > 0){
                        $('.bookCount').css('color','red');
                    }else{
                        $('.bookCount').css('color','black');
                    }

                    bookCount();
                },
                error : function(){

                }
            })
        }

        // 좋아요 카운트
        function likeCount(){
            $.ajax({
                url : 'likeCount.bo',
                data : {
                    boardNo : '${ b.boardNo }'
                },
                success : function(r){
                    $('.likeCount').html(r);
                },
                error : function(){

                }
            });
        }

        // 북마크 카운트
        function bookCount(){
            $.ajax({
                url : 'bookCount.bo',
                data : {
                    boardNo : '${ b.boardNo }'
                },
                success : function(r){
                    $('.bookCount').html(r);
                },
                error : function(){

                }
            });
        }

        // 댓글 불러오기
        function reply(){
            $.ajax({
                url : "replyList.bo",
                data : {
                    boardNo : '${ b.boardNo }'
                },
                success : function(list){

                    var loginMember = '${ sessionScope.loginMember}';
                    let result = '';
                    let loginCheck = '';
                    let modifyBtn = '';
                    if(loginMember != '' ){
                        loginCheck = '<textarea cols="30" rows="10"></textarea>';
                    }else{
                        loginCheck = '<textarea cols="30" rows="10" placeholder="로그인 후 이용해주세요." disabled></textarea>';
                    }

                    

                    
                    for(var i in list){

                        if('${ sessionScope.loginMember.nickName}' == list[i].memberId){
                            modifyBtn = '<div><p class="modiCheck" onclick="replyModify(this,' + list[i].boardReplyNo + ');">수정</p><p>삭제</p></div>';
                        };

                        result += '<div class="replyList">'
                                    + '<div class="rInfo clear">'
                                        + '<p>' + list[i].memberId + '</p>'
                                        + '<p>' + list[i].createDate + '</p>'
                                        + modifyBtn
                                    + '</div>'
                                    + '<p class="rCon replyCon' + list[i].boardReplyNo + '">' + list[i].boardReplyContent + '</p>'
                                    + '<div class="rrInfo clear">'
                                        + '<p class="rereplyCount">답글 숨기기</p>'
                                        + '<p class="rereplyWrite">답글 작성</p>'
                                    + '</div>'
                                    
                                    + '<div class="clear reReArea reReplyArea'+ list[i].boardReplyNo + '"></div>'
                                    + '<div class="replyWrite">'
                                        + loginCheck
                                        + '<button id="replyBtn" onclick="reReply(' + list[i].boardReplyNo + ',this);">답글 등록</button>'
                                    + '</div>'

                                + '</div>'
                        
                            reReplyList(list[i].boardReplyNo);

                    }
                    $('.replyWrap').html(result);

                    $('.rereplyWrite').on('click', function(e){
                
                        let box = $(e.target).parent().next()
                        if($(box).next().css('display') == 'none'){
                            $(box).next().css('display', 'block');
                            $(box).css('display', 'block');
                        }else{
                            $(box).next().css('display', 'none');
                        }
                    });

                    
                   
        
                },
                error : function(){

                }
            })
        }

        // 댓글 달기
        function insertReply(){

            $.ajax({
                url : 'insertReply.bo',
                data : {
                    boardNo : '${ b.boardNo }',
                    rCon : $('#replyContent').val(),
                    memberId : '${ sessionScope.loginMember.memberId }'
                },
                type : 'post',
                success : function(result){
                    if(result == 'success'){
                        $('#replyContent').val('');
                        reply();
                        replyCount();
                    }
                },
                result : function(){
                    console.log('댓글작성 실패');
                }

            })
        }

        // 댓글 수 가져오기
        function replyCount(){
            $.ajax({
                url : 'replyCount.bo',
                data : {
                    boardNo : '${ b.boardNo }'
                },
                success : function(r) {
                    $('.replyCount').html(r);
                },
                else : function() {
                    console.log('통신실패');
                }
            })
        }

        //댓글 수정 하기
        function replyModify(e, num){
            
            $.ajax({
                url : 'replyModifyView.bo',
                data : {
                    replyNo : num
                },
                success : function(r){
                    
                    $(".modiCheck").attr('onclick', null);

                    var modifyArea = '<textarea class="replayModify">' + r.boardReplyContent + '</textarea>'
                                   + '<button class="modify">수정</button>'
                                   + '<button class="reset">취소</button>'
                    
                    $('.replyCon' + num ).html(modifyArea);

                    $('.modify').click(function(){
                        $.ajax({
                            url : 'replyModify.bo',
                            data : {
                                replyNo : num,
                                replyCon : $('.replayModify').val()
                            },
                            success : function(r){
                                reply();
                            },
                            error : function(){

                            }

                        })
                    });

                    $('.reset').click(function(){
                        reply();
                    })
                    
                },
                error : function(){

                }
            })

        }

        // 좋아요 하기
        function likeBoard(){

            $.ajax({
                url : 'like.bo',
                data : {
                    boardNo : '${ b.boardNo }'
                },
                success : function(r){
                    likeStatusCheck();
                },
                error : function(){

                }

            })
        }

        // 북마크 하기
        function bookBoard(){
            $.ajax({
                url : 'book.bo',
                data : {
                    boardNo : '${ b.boardNo }'
                },
                success : function(r){
                    if(r > 0){
                        bookStatusCheck();
                    }
                },
                error : function(){
                    console.log('북마크 실패');
                }

            })
        }

        //대댓글 달기 
        function reReply(reReplyNo, e){

            $.ajax({
                url : 'reReply.bo',
                data : {
                    boardNo : '${ b.boardNo }',
                    replyNo : reReplyNo,
                    reReplyCon : $(e).prev().val(),
                    memberId : '${ sessionScope.loginMember.memberId }'
                },
                success : function(r) {
                    $('.replyWrite > textarea').val('');
                    reReplyList(reReplyNo);
                    
                },
                error : function(){

                }

            })
        }

        // 대댓글 리스트 가져오기
        function reReplyList(replyNo) {
            $.ajax({
                url: 'reReplyList.bo',
                data: {
                    replyNo: replyNo
                },
                success: function(r) {
                    
                    let result = '';
                    for (var i in r) {
                        result += '<div class="clear">'
                                    +  '<img src="resources/images/board/rereplyimg.png">'
                                    + '<div class="rRL">'
                                        +  '<div class="clear">'
                                            + '<p>' + r[i].memberId + '</p>'
                                            + '<p>' + r[i].createDate + '</p>' 
                                            + '<div>'
                                                + '<p>수정</p>'
                                                + '<p>삭제</p>'
                                            + '</div>'
                                        + '</div>'
                                        +  '<p>' + r[i].reReplyContent + '</p>'
                                    + '</div>'
                                + '</div>'
                    }   
                    
                    $('.replyList').find('.reReplyArea' + replyNo).html(result);
                },
                error: function() {
                    console.log('대댓글 불러오기 실패');
                }
            }); 
        }

        //태그 검색 
        function tagSearch(e){
            var keyword = $(e).text();
            var keyword2 = keyword.replace('#', '');
            var boardType = '${ b.boardType }'

            location.href="tagSearch.bo?key=" + keyword2 + '&boardType=' + boardType + '&keyType=tag';
        }


        // 글 수정하기 버튼
        function modifyWirte(){
            var boardNo = '${ b.boardNo }';
            location.href='boardModifyView.bo?boardNo=' + boardNo;

        }

        //글 삭제하기 버튼
        function deleteBoard(){
            var boardNo = '${ b.boardNo }';
            location.href='boardDelete.bo?boardNo=' + boardNo;
        }

        // 글 신고하기 
        function report(){
            
        }

    </script>
</body>
</html>