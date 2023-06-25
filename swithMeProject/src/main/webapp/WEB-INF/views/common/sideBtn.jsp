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


    <div id="mainButton">
        <div class="toptop"><img src="resources/images/common/topBtn.png" alt=""></div>
        <div class="setting"><img src="resources/images/common/settingBtn.png" alt="">

            <c:choose>
                <c:when test="${ loginMember ne null}">
                <div id="BtnBox" class="clear">
                    <div id="thumb">
                        <img src="" alt="" id="mainCh">
                        <img src="" alt="" id="mainBg">
                    </div>
                    <p>${sessionScope.loginMember.nickName}</p>
                    <div class="mypagegoing clear">
                        <button><a href="mypage.me">마이페이지</a></button>
                        <button><a href="">로그아웃</a></button>
                    </div>
                </div>
                </c:when>
                <c:otherwise>
                    <div id="BtnBox" class="clear">
                        <p class="loginP">로그인 후 이용 가능한<br>기능 입니다.</p>
                        <div class="plzBtn clear">
                            <button class="loginPlz"><a href="loginForm.me">로그인</a></button>
                            <button class="joinPlz"><a href="memberEnrollForm.me">회원가입</a></button>
                        </div>
                    </div>

                    
                </c:otherwise>
            </c:choose>

        </div>
    </div>

    <script>

        $('#mainButton > .toptop').click(function(){
            $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
        })

        $('.setting').click(function(){

            $.ajax({
                url : 'memberImg',
                data : {
                    memberId : '${ sessionScope.loginMember.nickName }'
                },
                success : (r) => {

                    for(var i in r){
                        if(r[i].itemCategory == '캐릭터'){
                            $('#mainCh').prop('src', r[i].itemPhoto );
                        }
                        if(r[i].itemCategory == '배경'){
                            $('#mainBg').prop('src', r[i].itemPhoto);
                        }
                    }
                    
                    
                },
                error : () => {

                }
            })

            $('#BtnBox').toggle();

        })

        
    </script>
    
</body>
</html>