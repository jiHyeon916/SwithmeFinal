<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
 <html lang="ko">
  <head>
    <meta charset="UTF-8">
    <title>without bootstrap</title>
    <link rel="stylesheet" href="resources/css/board/freeBoardWrite.css">
  </head>
  <body>

    <jsp:include page="../common/header.jsp" />



    <div id="F_writer_content">
        <div class="wrap clear">
            
            <h3>게시글 작성</h3>
                
            <!-- 제목, 컨텐츠 입력 칸 -->
            <div class="left">
                <p>제목</p>
                <input type="text" id="title">
                <p>내용</p>
                <textarea name="" id="summernote"></textarea>
            </div>

            <!-- 카테고리,태그,파일첨부 -->
            <div class="right">
                <div id="freeCategory">
                    <p>카테고리</p>
                    <c:choose>
                        <c:when test="${Btype eq 'free'}">
                            <div id="freeCategory" class="cont-select">
                                <button class="btn-select">전체보기</button>
                                <ul class="list-member">
                                <li><button type="button">전체보기</button></li>
                                <li><button type="button">공부꿀팁</button></li>
                                <li><button type="button">자유잡담</button></li>
                                <li><button type="button">이슈정보</button></li>
                                </ul>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div id="freeCategory" class="cont-select">
                                <button class="btn-select">전체보기</button>
                                <ul class="list-member">
                                <li><button type="button">질문</button></li>
                                <li><button type="button">IT</button></li>
                                <li><button type="button">고시공부</button></li>
                                <li><button type="button">취업준비</button></li>
                                </ul>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <p>태그</p>
                <div id="tagBox" class="clear">
                    <ul id="tagList">
                    </ul>
                    <div>
                        <input type="text" onkeypress="tagtext(this);">
                    </div>
                </div>
                
                
                <!-- <input type="text" id="tag" onkeyup="tagtext(this)"> -->

                <div class="uploadBtnArea clear">
                    <p>파일</p>
                    <button>업로드</button>
                </div>
                <div class="fileArea"></div>
                <input type="file" name="" id="">

                <c:choose>
                    <c:when test="${Btype eq 'free'}">
                    <div class="uploadBtnArea clear">
                        <p>썸네일</p>
                        <button>업로드</button>
                    </div>
                    <div class="thumbnailArea"></div>
                    <input type="file">
                    </c:when>   
                </c:choose>
                <button onclick="test();">취소하기</button>
                <button id="submit" onclick="text();">작성하기</button>
            </div>
        </div>
    </div>



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


    // 섬머노트 변경사항
    $('#summernote').summernote({
        placeholder: '내용을 입력해주세요.',
        tabsize: 2,
        height: 480,
        toolbar: [
          // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture','video']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
        // callbacks: {
        //   onImageUpload : function(files, editor, welEditable){

        //         // 파일 업로드(다중업로드를 위해 반복문 사용)
        //         for (var i = files.length - 1; i >= 0; i--) {
        //             uploadSummernoteImageFile(files[i],
        //         this);
        //             }
        //         }
        //     } 
      });



      // 글 작성하기
      function text(){
        
        // 태그 문자열로 만들기 
        var tag = document.getElementsByClassName('tag')
        tagAtrr = '';
        $(tag).each(function(index, item){
            let tata = $(item).text();
            tagAtrr += (tata + ',')
        });

        $.ajax({
            
            url : 'test.bo',
            type : 'post',
            data : {
                memberId : '${ sessionScope.loginMember.memberId }',
                bCon : $('.note-editable').html(),
                summary : $('.note-editable').text(),
                title : $('#title').val(),
                category : $('.btn-select').text(),
                tagList : tagAtrr,
                Btype : '${ Btype }'
            },
            success : function(r){
                if(r == 'success'){
                    alert('글 작성 성공');
                    location.href="freeBoardListView.bo?boardType=1";
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


    // 태그지우기 
    function removeTag(e){
        $(e).parent().remove('');
    }
    
    // 중복태그 자동으로 없애기
    function tagCheck(e){
        
        var tag = document.getElementsByClassName('tag');
        //var lastTag = $('.tag').last();
        var result = '';

        if(tag.length > 0){
            $(tag).each(function(index, item){
                if($(item).text() === e){
                    result = 1;
                }else{
                    result = 2;
                }
            });
        }

        return result;
    }
    
    </script>



    <jsp:include page="../common/footer.jsp" />

  </body>
</html>
