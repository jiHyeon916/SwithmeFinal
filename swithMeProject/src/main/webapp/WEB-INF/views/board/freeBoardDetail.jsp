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
                
                <div id="boardList">
                    
                    <div id="nextList" class="clear">
                        <!-- 다음글 목록 -->
                    </div>
                    <div id="prevList" class="clear">
                        <!-- 이전글 목록  -->
                    </div>
                    <button onclick="location.href='freeBoardListView.bo?boardType=1'">목록으로</button>
                </div>
                <script>
                    $(function(){
                        $.ajax({
                            url : 'boardlist',
                            data : {
                                boardNo : '${ b.boardNo }'
                            },
                            success : (r) => {

                                var prev = '';
                                var next = '';
                                var lastprev = '';
                                var lastnext = '';

                                if(r.prevNo == ''){
                                    lastprev += '<p onclick="alert(\'맨 처음 글 입니다.\');>이전글<p>'
                                    $('#prevList').html(lastprev);
                                }else{
                                    prev += '<p onclick="location.href=\'freeBoardDetail.bo?boardNo=' + r.prevNo + '\'">'
                                        + '이전글'
                                        + '</p>'
                                    $('#prevList').html(prev);
                                }
                                
                                if(r.nextNo == ''){
                                    lastnext += '<p onclick="alert(\'마지막글입니다.\');">다음글<p>'
                                    $('#nextList').html(lastnext);
                                }else{
                                    next += '<p onclick="location.href=\'freeBoardDetail.bo?boardNo=' + r.nextNo + '\'">다음글</p>'
                                     //+ '<p class="title">' + r.next + '</p>'
                                     + '<input type="hidden" value=' + r.nextNo + '>';
                                    $('#nextList').html(next);
                                }
                            
                            },
                            error : () => {

                            }
                        })
                    })
                </script>

                <!-- 글 보이는 곳 -->
                <div>
                    
                    <!-- 썸네일 사진 -->
                    <div class="thumbnail">
                        <img src="resources/images/board/freeDetailBg.png">
                    </div>
                    <!-- 글쓴 정보 : 제목, 날짜, 작성자 -->
                    <div class="writerInfo clear">
                        <div id="memberTumb">
                            <img src="" alt="" id="character">
                            <img src="" alt="" id="bg">
                        </div>
                        <div class="divBox" class="clear">
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
                    <div onclick="likeBoard();" class="likeBox">
                        <img class="likeImg" src="resources/images/board/heart.png" alt="">
                    </div>
                    <p class="likeCount"></p>

                    <div onclick="bookBoard();" class="bookBox">
                        <img class="bookImg" src="resources/images/board/bookmark.png" alt=""></div>
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


           

            <!-- 신고 모달 -->
            <div class="modal msg1">
                        
            </div>
            <div class="modal_body msg1_body">
                <div class="clear">
                    <h4>신고하기</h4>
                    <img class="cloesBtn" src="resources/images/common/closeBtn.png" alt="">
                </div>
                <div id="reportInfo">
                <c:choose>
                    <c:when test="${sessionScope.loginMember eq null}">
                        <p class="writer">작성자 : 신고는 로그인 후 이용 해주세요.</p>
                    </c:when>
                    <c:otherwise>
                        <p class="writer">작성자 : ${sessionScope.loginMember.nickName}</p>
                    </c:otherwise>
                </c:choose>
                <p class="reportTitle">게시글 : ${b.boardTitle}</p>
                </div>

                <h5>사유선택</h5>
                <div id="resonBox">
                    <p class="reason"><input type="radio" name="reson" value="스팸/홍보"> 스팸홍보/도배글입니다.</p>
                    <p class="reason"><input type="radio" name="reson" value="음란물"> 음란물입니다.</p>
                    <p class="reason"><input type="radio" name="reson" value="불법"> 불법정보를 포함하고 있습니다.</p>
                    <p class="reason"><input type="radio" name="reson" value="청소년유해콘텐츠"> 청소년에게 유해한 내용 입니다.</p>
                    <p class="reason"><input type="radio" name="reson" value="욕설/혐오/차별"> 욕설/생명경시/혐오/차별적 표현입니다.</p>
                    <p class="reason"><input type="radio" name="reson" value="개인정보노출"> 개인정보 노출 게시물 입니다.</p>
                </div>
                <hr>
                <h5>추가내용</h5>
                <textarea id="reportCon" cols="30" rows="10" placeholder="추가로 기재할 내용을 적어주세요." required></textarea>
                <p class="ment">* 허위 기재 및 무분별한 신고시 불이익이 있을 수 있습니다.</p>
                <button onclick="report();">신고하기</button>
            </div>



    </div>


    <jsp:include page="../common/footer.jsp" />

    <script>

        $(function(){
            reply(); //댓글 불러오기
            replyCount(); //댓글 수 불러오기 
            likeStatusCheck(); //좋아요 상태 표시
            bookStatusCheck(); //북마크 상태 표시
            memberImg(); //작성자 썸네일 불러오기 
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
            
            
            
            $('#resonBox > p').click(function(e){
                $(e.target).children().prop('checked', true);
            })

            
        })



        // 좋아요 누르기
        function likeStatusCheck(){
            $.ajax({
                url: 'likeStatus.ck',
                data : {
                    boardNo : '${ b.boardNo }',
                    memberId : '${ loginMember.memberId }'
                },
                success : function(r){

                    if(r > 0){
                        $('.likeImg').prop('src','resources/images/board/heartStatus.png');
                        $('.likeBox').css('border', '1px solid #58bf7a')
                    }else{
                        $('.likeImg').prop('src','resources/images/board/heart.png');
                        $('.likeBox').css('border', '1px solid rgb(223,223,223)')
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
                    boardNo : '${ b.boardNo }',
                    memberId : '${ loginMember.memberId }'
                },
                success : function(r){
                    if(r > 0){
                        $('.bookImg').prop('src','resources/images/board/bookmarkStatus.png');
                        $('.bookBox').css('border', '1px solid #58bf7a')
                    }else{
                        $('.bookImg').prop('src','resources/images/board/bookmark.png');
                        $('.bookBox').css('border', '1px solid rgb(223,223,223)')
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
                    boardNo : '${ b.boardNo }',
                    memberId : '${ loginMember.memberId }'
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
                    boardNo : '${ b.boardNo }',
                    memberId : '${ loginMember.memberId }'
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

                        if('${ loginMember.nickName }' == list[i].memberId ){
                            modifyBtn = '<div><p class="modiCheck" onclick="replyModify(this,' + list[i].boardReplyNo + ');">수정</p><p onclick="deleteRe(1, ' + list[i].boardReplyNo + ')">삭제</p></div>';
                        };

                        result += '<div class="replyList">'
                                    + '<div class="rInfo clear">'
                                        + '<p>' + list[i].memberId + '</p>'
                                        + '<p>' + list[i].createDate + '</p>'
                                        + modifyBtn
                                    + '</div>'
                                    + '<p class="rCon replyCon' + list[i].boardReplyNo + '">' + list[i].boardReplyContent + '</p>'
                                    + '<div class="rrInfo clear">'
                                        + '<p class="rereplyWrite">답글 작성</p>'
                                    + '</div>'
                                    
                                    + '<div class="clear reReArea reReplyArea'+ list[i].boardReplyNo + '"></div>'
                                    + '<div class="replyWrite">'
                                        + loginCheck
                                        + '<button id="replyBtn" onclick="reReply(' + list[i].boardReplyNo + ',this);">답글 등록</button>'
                                    + '</div>'

                                + '</div>'
                        
                            reReplyList(list[i].boardReplyNo);
                        
                            modifyBtn = '';

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
            if($('#replyContent').val() != ''){

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
            }else{
                alert('작성한 내용이 없어 등록되지 않았습니다.');
            }
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

            if('${ loginMember }' != '' ){
                $.ajax({
                    url : 'like.bo',
                    data : {
                        boardNo : '${ b.boardNo }',
                        memberId : '${ loginMember.memberId }'
                    },
                    success : function(r){
                        likeStatusCheck();
                    },
                    error : function(){

                    }

                })
            }else{
                alert('로그인 후 이용해주세요.');
            }
        }

        // 북마크 하기
        function bookBoard(){

            if('${ loginMember }' != '' ){
                $.ajax({
                url : 'book.bo',
                data : {
                    boardNo : '${ b.boardNo }',
                    memberId : '${ loginMember.memberId }'
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
            }else{
                alert('로그인 후 이용해주세요.');
            }
            
        }

        //대댓글 달기 
        function reReply(reReplyNo, e){

            if($(e).prev().val() != ''){
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
                        $('.replyWrite').css('display', 'none');
                        reReplyList(reReplyNo);
                        
                    },
                    error : function(){

                    }

                })
            }else{
                alert('작성한 내용이 없어 등록되지 않았습니다.');
            }
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
                    let modifyBtn = '';
                    
                    
                    for (var i in r) {

                        if('${ sessionScope.loginMember.nickName }' == r[i].memberId){
                            modifyBtn  = '<div>'
                                            + '<p class="reReplyModify" onclick=reReplyModify(this,' + r[i].reReplyNo + ')>수정</p>'
                                            + '<p onclick="deleteRe(2,' + r[i].reReplyNo + ')">삭제</p>'
                                        + '</div>'
                        }

                        result += '<div class="clear">'
                                    +  '<img src="resources/images/board/rereplyimg.png">'
                                    + '<div class="rRL">'
                                        +  '<div class="clear">'
                                            + '<p>' + r[i].memberId + '</p>'
                                            + '<p>' + r[i].createDate + '</p>' 
                                            + modifyBtn
                                        + '</div>'
                                        +  '<p class="reReplyCon' + r[i].reReplyNo + '">' + r[i].reReplyContent + '</p>'
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

        // 대댓글 수정하기 
        function reReplyModify(e, num){
            
            var textdata = $(e).parent().parent().next().text();

            $(".modiCheck").attr('onclick', null);
            $('.reReplyModify').attr('onclick', null);

            var modifyArea = '<textarea class="reReplayModify">' + textdata + '</textarea>'
                            + '<button class="reReplyMBtn">수정</button>'
                            + '<button class="reset reReplyRBtn">취소</button>'

            $('.reReplyCon' + num ).html(modifyArea);

            $('.reReplyMBtn').click(function(){
                $.ajax({
                    url : 'reReplyModify.bo',
                    data : {
                        reReplyNo : num,
                        reReplyContent : $('.reReplayModify').val()
                    },
                    success : function(r){
                        reply();
                    },
                    error : function(){

                    }

                });
            });

            $('.reset').click(function(){
                reply();
            })
            
        }

        // 댓글 대댓글 삭제하기
        function deleteRe(num, replyNo){
            $.ajax({
                url : 'deleteRe.bo',
                data : {
                    reType : num,
                    replyNo : replyNo
                },
                success: () =>{
                    alert('삭제되었습니다.');
                    reply();
                },
                error : () =>{

                }
            })
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

        // 신고하기
        function report(){

            if('${ sessionScope.loginMember}' == ''){
                alert('신고는 회원만 이용 가능합니다. 로그인 후 이용해주세요.');
                location.href='loginForm.me';
            }else{

                if($('#reportCon').val() != ''){
                    $.ajax({
                        url : 'boardReport.bo',
                        type : 'post',
                        data : {
                            reportMemberId : '${ sessionScope.loginMember.memberId }',
                            totalNo : '${ b.boardNo }',
                            reportReason : $('input[name=reson]:checked').val(),
                            reportContent : $('#reportCon').val()
                        },
                        success : (r) => {
                            if(r > 0){
                                alert('신고 접수가 정상적으로 완료 되었습니다. 관리자 확인 까지 시간이 소요될 수 있으니 기다려주세요.');
                                $('.cloesBtn').click();
                            }
                        },
                        error : () => {

                        }
                    });
                }else{
                    alert('신고 상세 사유를 입력해주세요.');
                }
                
            }
            
        }


        // 멤버 캐릭터 이미지 가져오기
        function memberImg(){
            $.ajax({
                url : 'memberImg',
                data : {
                    memberId : '${ b.memberId }'
                },
                success : (r) => {
                    console.log(r);

                    for(var i in r){
                        if(r[i].itemCategory == '캐릭터'){
                            $('#character').prop('src', r[i].itemPhoto );
                        }
                        if(r[i].itemCategory == '배경'){
                            $('#bg').prop('src', r[i].itemPhoto);
                        }
                    }
                    
                    
                },
                error : () => {

                }
            })
        }

    </script>

    <jsp:include page="../common/sideBtn.jsp" />

    
</body>
</html>