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
            <div id="BtnBox" class="clear">
                <div id="thumb"></div>
                <p>${sessionScope.loginMember.nickName}</p>
                <div class="mypagegoing clear">
                    <button><a href="mypage.me">마이페이지</a></button>
                    <button><a href="">로그아웃</a></button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('#mainButton > .toptop').click(function(){
            $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
        })

        $('.setting').click(function(){
            $('#BtnBox').toggle();
        })
    </script>
    
</body>
</html>