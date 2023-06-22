<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDtail</title>
<link rel="stylesheet" href="resources/css/board/freeBoardDetail.css"> 
<link rel="stylesheet" href="resources/css/board/infoBoardDetail.css"> 
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
                        <textarea name="" id="replyContent" placeholder="답변을 달아주세요."></textarea>
                        </c:if>
                        <c:if test="${ sessionScope.loginMember == null }">
                        <textarea name="" id="replyContent" placeholder="로그인 후 이용해주세요." disabled></textarea>
                        </c:if>
                        <button id="replyBtn" onclick="insertReply();">등록</button>
                        <div class="blank"></div>
                    </div>
                    <div id="selectReply" class="clear">
                        
                    </div>
                    <div class="replyWrap clear">
                        <!-- 댓글 컨텐츠 영역 -->
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

        </div>
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



    <jsp:include page="../common/footer.jsp" />


    <script>
        $(function(){
            reply(); //댓글 불러오기
            replyCount(); //댓글 수 불러오기 
            likeStatusCheck(); //좋아요 상태 표시
            bookStatusCheck(); //북마크 상태 표시
            selectioncheck(); //채택 여부 확인 
            memberImg(); //멤버 캐릭터 이미지 가져오기 

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
                    let selectBtn = '';

                    if(loginMember != '' ){
                        loginCheck = '<textarea cols="30" rows="10"></textarea>';
                    }else{
                        loginCheck = '<textarea cols="30" rows="10" placeholder="로그인 후 이용해주세요." disabled></textarea>';
                    }

                    

                    
                    for(var i in list){

                        if('${ sessionScope.loginMember.nickName}' == list[i].memberId){
                            modifyBtn = '<div><p class="modiCheck" onclick="replyModify(this,' + list[i].boardReplyNo + ');">수정</p><p>삭제</p></div>';
                        };

                        if('${ b.memberId }' == '${ loginMember.nickName }'){
                            selectBtn = '<p class="oneTime" onclick="wantSelect(this)">채택<input type="hidden" value="'+ list[i].boardReplyNo + '"></p>'
                        }

                        result += '<div class="qNoSelect clear">'
                                    + '<div id="QImg">'
                                        + '<img src="" alt="">'
                                        + selectBtn
                                    + '</div>'
                                    + '<div id="Qcon">'
                                        +'<div class="replyList">'
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
                                    + '<div id="rrCon"><img src=""></div>'
                                    + '<div id="rrList" class="clear">'
                                        + '<div class="clear">'
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


        // 답변 채택 여부 확인 하기 
        function selectioncheck(){
            $.ajax({
                url : 'selectioncheck',
                data : {
                    boardNo : '${ b.boardNo }'
                },
                success : function(r){
                    
                    result = '';

                    if(r != 'NO'){
                        $('.oneTime').css('display', 'none');
                        console.log(r);

                        result += '<p>채택된 답변</p>'
                                + '<div id="QImg"><img src="" alt=""></div>'
                                + '<div id="Qcon">'
                                    + '<div class="replyList">'
                                        + '<div class="rInfo clear" style="margin-bottom:10px;">'
                                            + '<p>' + r.memberId +'</p>'
                                            + '<p>' + r.createDate + '</p>'
                                        + '</div>'
                                        + '<p class="rCon replyCon">' + r.boardReplyContent + '</p>'
                                    + '</div>'
                                + '</div>'
                    }

                    $('#selectReply').html(result);

                },
                error : function(){
                    console.log('채택여부 확인 실패');
                }
            })
        }

        // 답변 채택 하기
        function wantSelect(e){

            if(confirm('채택 하시겠습니까? 한번 채택 후 변경 불가능 합니다.')){
                
                var selectNum = $(e).children().val();

                $.ajax({
                    url : 'selectInsert',
                    data : {
                        replyNo : selectNum
                    },
                    success : function(r){
                        selectioncheck();                 
                    },
                    error : function(){
                        console.log('통신 실패');
                    }

                })
            }

        }

        // 신고하기
        function report(){

            if('${ sessionScope.loginMember}' == ''){
                alert('신고는 회원만 이용 가능합니다. 로그인 후 이용해주세요.');
                location.href='loginForm.me';
            }else{
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