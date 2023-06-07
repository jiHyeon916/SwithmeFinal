<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <div class="clear d_tag">
                            <span class="categoryTitle">Tag</span>
                            <span class="tagBtn">#스윗미</span>
                            <span class="tagBtn">#자기개발</span>
                            <span class="tagBtn">#책</span>
                            <span class="tagBtn">#명언</span>
                            <span class="tagBtn">#안녕하세요</span>
                        </div>
                    </div>

                   
                    <div class="reblank">
    
                    </div>


                    <div class="replyArea">
                        <textarea name="" id="replyContent" placeholder="댓글 내용을 입력해주세요."></textarea>
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
                    <div><img src="resources/images/board/emergency.png" alt=""></div>
                </div>
            </div>

            <!-- 댓글 영역 -->
            <div>
                
            </div>

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

                    let result = '';
                    for(var i in list){
                        result += '<div class="replyList">'
                                    + '<div class="rInfo clear">'
                                        + '<p>' + list[i].memberId + '</p>'
                                        + '<p>' + list[i].createDate + '</p>'
                                        + '<p>댓글 삭제</p>'
                                        + '</div>'
                                    + '<p class="rCon">' + list[i].boardReplyContent + '</p>'
                                    + '<div class="rrInfo clear">'
                                        + '<p class="rereplyCount">답글 숨기기</p>'
                                        + '<p class="rereplyWrite">답글 작성</p>'
                                    + '</div>'
                                    
                                    + '<div class="clear reReArea reReplyArea'+ list[i].boardReplyNo + '"></div>'
                                    + '<div class="replyWrite">'
                                        + '<textarea name="" id="" cols="30" rows="10"></textarea>'
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
                    rCon : $('#replyContent').val()
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
                    console.log(r);
                    if(r > 0){
                        bookStatusCheck();
                    }
                },
                error : function(){
                    console.log('북마크 실패');
                }

            })
        }

        //reReply
        function reReply(reReplyNo, e){

            $.ajax({
                url : 'reReply.bo',
                data : {
                    replyNo : reReplyNo,
                    reReplyCon : $(e).prev().val()
                },
                success : function(r) {
                    $('.replyWrite > textarea').val('');
                    reReplyList(reReplyNo);

                },
                error : function(){

                }

            })
        }

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
                                            +  '<p>' + r[i].memberId + '</p>'
                                            +  '<p>' + r[i].createDate + '</p>' 
                                            +  '<p>답글 삭제</p>'
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


    </script>
</body>
</html>