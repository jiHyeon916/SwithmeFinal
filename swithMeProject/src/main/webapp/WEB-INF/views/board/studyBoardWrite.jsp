<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
 <html lang="ko">
  <head>
    <meta charset="UTF-8">
    <title>without bootstrap</title>
    <link rel="stylesheet" href="resources/css/board/freeBoardWrite.css">
    <link rel="stylesheet" href="resources/css/board/studyBandWrite.css">
  </head>
  <body>

    <jsp:include page="../common/header.jsp" />


    <form method="post" enctype="multipart/form-data" id="sorry">
    <div id="F_writer_content">
        <div class="wrap clear">
            
            <h3>게시글 작성</h3>
                
            <!-- 제목, 컨텐츠 입력 칸 -->
            <div class="left">
                <p>방 제목</p>
                <input type="text" id="title" name="title">
                <p>스터디 소개 내용</p>
                <textarea name="bCon" id="summernote"></textarea>
            </div>

            <!-- 카테고리,태그,파일첨부 -->
            <div class="right">
                <div id="freeCategory">
                    <p>카테고리</p>
                        <div id="freeCategory" class="cont-select">
                            <button type="button" class="btn-select">전체보기</button>
                            <ul class="list-member">
                                <li><button type="button">고시공부</button></li>
                                <li><button type="button">진로</button></li>
                                <li><button type="button">프론트엔드</button></li>
                                <li><button type="button">백엔드</button></li>
                                <li><button type="button">모바일 앱 개발</button></li>
                                <li><button type="button">프로그래밍 언어</button></li>
                                <li><button type="button">보안</button></li>
                                <li><button type="button">네트워크</button></li>
                                <li><button type="button">클라우드</button></li>
                                <li><button type="button">인공지능</button></li>
                                <li><button type="button">CAD / 3D모델링</button></li>
                                <li><button type="button">UI / UX</button></li>
                                <li><button type="button">사진 · 영상</button></li>
                                <li><button type="button">그래픽 디자인</button></li>
                                <li><button type="button">마케팅 · 기획</button></li>
                                <li><button type="button">외국어</button></li>
                                <li><button type="button">취업 · 이직</button></li>
                                <li><button type="button">창업</button></li>
                                <li><button type="button">재테크</button></li>
                            </ul>
                        </div>
                </div>
                
                <p class="perTotla">모집인원</p>
                <input type="number" name="perNum" id="perNum" required max="30" min="1">
                <div class="uploadBtnArea clear">
                    <p>썸네일</p>
                    <button type="button" onclick="thumbNail();">업로드</button>
                </div>
                <div class="thumbnailArea"></div>
                <input type="file" id="fileSelect" name="please" onchange="loadImg(this)">
                
                <input type="hidden" name="category" value="">
                <input type="hidden" name="memberId" value="${ sessionScope.loginMember.memberId }">
                <button type="button" onclick="test();">취소하기</button>
                <button id="submit" type="button" onclick="text();">작성하기</button>
            </div>
        </div>
    </div>
    </form>



    <script>

    // 로드
    $(function(){
        
        $('input[type="file"]').css('display', 'none');

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

        // 태그박스 클릭하면 포커스 맞춰주기 
        $('#tagBox').click(function(){
            $('#tagBox input').focus();
        })

 
    })





      // 글 작성하기
      function text(){

        $('input[name=category]').val($('.btn-select').text());
        alert($('#perNum').val());

        
        var form = $('#sorry')[0];

        var formData = new FormData(form);

        

        $.ajax({
            url : 'studyBandInsert.bo',
            processData: false,
		    contentType: false,
            type : 'post',
            data : formData,
            // data : {
            //     // memberId : '${ loginMember.memberId }',
            //     // bCon : $('#summernote').val(),
            //     // title : $('#title').val(),
            //     // category : $('.btn-select').text(),
            //     // perNum : $('#perNum').val(),
            //     formData : formData
            // },
            success : function(r){
                if(r == 'success'){
                    alert('글 작성 성공');
                    location.href="studyBand.bo";
                }
            },
            error : function(){
                console.log('ajax통신 실패');
            }
        })


        
    }

    
    function tagtext(e){

        var tag = document.getElementsByClassName('tag');
        var event =  window.event.keyCode
        var value = '';
        var lastTag = '';
        var realTag = '';

        if(event == 13 || event == 32 || event == 8 ){
            var tag = ($(e).val());
            value += '<li class="tag">' + tag + '<img src="resources/images/board/tagClose.png" onclick="removeTag(this)"></li>';   

            // 중복된 태그인지 확인 중복이면 지우고, 중복 아니면 추가하기
            let r = tagCheck(tag);

            if(r == 1){
                $('#tagBox input').val('');
            }else{
                $('#tagList').append(value)
                $('#tagList').css('display', 'block');
                $('#tagBox input').val('');
            }

        }

    }


    // 썸네일 올리기
    function thumbNail(){
        $('#fileSelect').click();
    }

    function loadImg(inputFile){
        if(inputFile.files.length == 1){ //파일이 첨부된 상태

            let reader = new FileReader();

            var imgName = inputFile.files[0].name;
            $('.thumbnailArea').html(imgName);

        }
    }



    </script>



    <jsp:include page="../common/footer.jsp" />

  </body>
</html>
