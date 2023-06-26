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
        </div>
    </div>

    <div class="wrap">

        <div id="sort" class="clear">
            <div id="freeCategory" class="cont-select" >
                <button class="btn-select" >전체보기</button>
                <ul class="list-member">
                    <li><button type="button" onclick="categorySearch(this.innerText, 1);">전체보기</button></li>
                    <li><button type="button" onclick="categorySearch(this.innerText, 1);">배경</button></li>
                    <li><button type="button" onclick="categorySearch(this.innerText, 1);">캐릭터</button></li>
                </ul>
            </div>
            <div id="searchBox" class="clear">
                <input type="text" id="searchBar" placeholder="키워드 검색" onkeyup="textSearch(this)"><img id="searchImg" src="resources/images/board/search.png" alt="">
            </div>
        </div>
    </div>

    <!--  -->
    <div id="itemCon">
        <div class="wrap clear itemlistupdate">
            <c:forEach items="${ item }" var="i">
            <div class="itemList btn-open-popup">
                <input type="hidden" id="itemNo" value="${ i.itemNo }">
                <input type="hidden" id="itemcon" value="${ i.itemContent }">
                <input type="hidden" id="itemCategory" value="${ i.itemCategory }">
                <div class="itemImg"><img src="${ i.itemPhoto }" alt=""></div>
                <p class="itemTitle">${ i.itemName }</p>
                <p class="itemPrice">${ i.itemPrice }</p>
            </div>
            </c:forEach>
            

        </div>
        
    </div>


    <!-- 아이템 모달 -->
    <div class="modal msg1">
                
    </div>
    <div class="modal_body msg1_body">
        <input type="hidden" name="msgNo" class="msgNo1">
            <div id="itemImg">
                <img src="" alt="">
            </div>
            <div id="itemIntro">
                <p class="itemType"></p>
                <div class="mainInfo clear">
                    <h5 class="itemnamemodal"></h5>
                    <p class="itempricemodal"></p>
                </div>
                <p class="itemText"></p>
                
                <c:if test="${ sessionScope.loginMember ne null }">
                    <div class="totalPoint clear">
                        <p>현재 보유 포인트</p>
                        <p id="totalPoint">50,0000 point</p>
                    </div>
                </c:if>

                
                <div class="itemBtn clear">
                    <button class="cloesBtn">닫기</button>
                    <input type="hidden" name="itemNo" value="">
                    <button id="buyBtn">구매하기</button>
                </div>
            </div>
            
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


            // 로그인 유저의 포인트 뽑아오기
            $.ajax({
                url : 'getTotalPoint.bo',
                data : {
                    memberId : '${loginMember.memberId}'
                },
                success : function(r){
                    $('#totalPoint').html(r);
                },
                error : function(){

                }

            })
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

            // 검색 이미지 클릭 
            $('#searchImg').click(function(){
                var searchText = $(this).prev().val();
                location.href="tagSearch.bo?key=" + searchText + '&boardType=' + $('#bType').val() + '&keyType=text';
                
            })




            // 아이템 모달 띄우기
            let btnOpenPopup = document.getElementsByClassName('btn-open-popup');
            const modal = document.querySelector('.msg1');
           
            for(var i = 0; i < btnOpenPopup.length; i++){
                btnOpenPopup[i].addEventListener("click", click);
                function click(e) {

                    

	                $('.msg1_body').show().css('z-index','7777');
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
                    

                    // 모달에 해당 하는 값 넣기
                    var selector = event.currentTarget;

                    console.log(selector.querySelector('.itemImg > img').getAttribute('src'));

                    $('.itemText').html(selector.querySelector('#itemcon').value);
                    $('.itemType').html(selector.querySelector('#itemCategory').value);
                    $('.itempricemodal').html(selector.querySelector('.itemPrice').innerText);
                    $('.itemnamemodal').html(selector.querySelector('.itemTitle').innerText);
                    $('#itemImg > img').attr('src', selector.querySelector('.itemImg > img').getAttribute('src'));
                    $('input[name=itemNo]').attr('value', selector.querySelector('#itemNo').value);

                    
                    
                    
                };


                
            }
            
            // 모달 닫기
            $('.cloesBtn3').click(function(){
                $('.send').hide();
                $('.send_body').hide();
                $('body').css('overflow','auto');
            })
            

            $('#buyBtn').click(function(){
                if($('.itempricemodal').text() < $('#totalPoint').text()){
                    $.ajax({
                        url : 'itemGet',
                        data : {
                            itemNo : $('input[name=itemNo]').val(),
                            point : $('.itempricemodal').text()
                        },
                        success : function(r){
                            if(r > 0){
                                if(confirm('아이템 구매에 성공하셨습니다. 마이페이지로 이동하겠습니까?')){
                                    location.href="item.me";
                                }else{
                                    location.href="itemBoard";
                                }
                            }else if(r == 0){
                                alert('본 서비스는 로그인 후 이용 가능합니다.');
                            }else if(r < 0){
                                if(confirm('이미 보유중인 아이템 입니다. 마이페이지로 이동하겠습니까?')){
                                    location.href="item.me";
                                }else{
                                    location.href="itemBoard";
                                }
                            };
                        },
                        error : function(){
                            alert('통신실패');
                        }
                    })
                }else{
                    alert('포인트가 부족합니다.');
                }
            });
            
            


            
        })

        function categorySearch(e){

                $.ajax({
                    url : 'itemListUpdate',
                    data : {
                        category : e
                    },
                    success : (r) => {

                        var result = '';
                        for(var i in r.list){
                            result += '<div class="itemList btn-open-popup">'
                                        + '<input type="hidden" id="itemNo" value="' + r.list[i].itemNo + '">'
                                        + '<input type="hidden" id="itemcon" value="' + r.list[i].itemContent + '">'
                                        + '<input type="hidden" id="itemCategory" value="' + r.list[i].itemCategory + '">'
                                        + '<div class="itemImg"><img src="' + r.list[i].itemPhoto + '" alt=""></div>'
                                        + '<p class="itemTitle">'+ r.list[i].itemName +'</p>'
                                        + '<p class="itemPrice">' + r.list[i].itemPrice + '</p>'
                                    + '</div>'
                        }

                        $('.itemlistupdate').html(result);

                        // 아이템 모달 띄우기
                        let btnOpenPopup = document.getElementsByClassName('btn-open-popup');
                        const modal = document.querySelector('.msg1');
                    
                        for(var i = 0; i < btnOpenPopup.length; i++){
                            btnOpenPopup[i].addEventListener("click", click);
                            function click(e) {

                                

                                $('.msg1_body').show().css('z-index','7777');
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
                                

                                // 모달에 해당 하는 값 넣기
                                var selector = event.currentTarget;

                                console.log(selector.querySelector('.itemImg > img').getAttribute('src'));

                                $('.itemText').html(selector.querySelector('#itemcon').value);
                                $('.itemType').html(selector.querySelector('#itemCategory').value);
                                $('.itempricemodal').html(selector.querySelector('.itemPrice').innerText);
                                $('.itemnamemodal').html(selector.querySelector('.itemTitle').innerText);
                                $('#itemImg > img').attr('src', selector.querySelector('.itemImg > img').getAttribute('src'));
                                $('input[name=itemNo]').attr('value', selector.querySelector('#itemNo').value);

                                
                                
                                
                            };


                            
                        }
                        
                        // 모달 닫기
                        $('.cloesBtn3').click(function(){
                            $('.send').hide();
                            $('.send_body').hide();
                            $('body').css('overflow','auto');
                        })
                        

                        $('#buyBtn').click(function(){
                            if($('.itempricemodal').text() < $('#totalPoint').text()){
                                $.ajax({
                                    url : 'itemGet',
                                    data : {
                                        itemNo : $('input[name=itemNo]').val(),
                                        point : $('.itempricemodal').text()
                                    },
                                    success : function(r){
                                        if(r > 0){
                                            if(confirm('아이템 구매에 성공하셨습니다. 마이페이지로 이동하겠습니까?')){
                                                location.href="item.me";
                                            }else{
                                                location.href="itemBoard";
                                            }
                                        }else if(r == 0){
                                            alert('본 서비스는 로그인 후 이용 가능합니다.');
                                        }else if(r < 0){
                                            if(confirm('이미 보유중인 아이템 입니다. 마이페이지로 이동하겠습니까?')){
                                                location.href="item.me";
                                            }else{
                                                location.href="itemBoard";
                                            }
                                        };
                                    },
                                    error : function(){
                                        alert('통신실패');
                                    }
                                })
                            }else{
                                alert('포인트가 부족합니다.');
                            }
                        });
                        

                        
                    }

                })
        }

         // 검색창 
        function textSearch(e){
            if(window.event.keyCode == 13){
                location.href="itemSearch.bo?key=" + $(e).val();
            }
        }

        

        

    </script>
    <jsp:include page="../common/sideBtn.jsp" />

</body>
</html>