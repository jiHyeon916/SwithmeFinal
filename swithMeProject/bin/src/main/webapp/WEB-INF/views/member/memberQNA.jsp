<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/memberQNA.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<jsp:include page="myMenuBar.jsp" />
		</div>
		
        <!-- 컨텐츠 영역 -->
		<div class="content">
            <!-- 게시글 -->
			<div class="topBlock">문의글</div>

            <div class="block">
                <!-- 상단버튼 -->
                <div class="post_Btn">
                    <div id="qna_left">
                        <button class="qna_all">전체</button>
                        <button class="answer">답변완료</button>
                        <button class="unAnswer">미답변</button>
                    </div>

                    <div id="qna_right">
                        <button class="qnaCreate" onclick="location.href='qnaEnroll.me'">문의글작성</button>
                        <button class="deleteBtn_yj">선택삭제</button>
                    </div>
                </div>

                <!-- 목록 -->
                <div class="postList">
                    <div class="post_block">
                        <div class="post_top">
                            <input type="checkbox">
                            <div class="post_cate">답변완료</div>
                            <p class="post_title">문의글 제목</p>
                        </div>
                        <p class="post_con">목숨이 얼마나 우리 품었기 튼튼하며, 보내는 힘있다. 있음으로써 남는 인류의 않는 것은 목숨을 유소년에게서 불러 바이며, 것이다. 대중을 우리의 풍부하게 그와 부패뿐이다. 굳세게 위하여 봄날의 뜨거운지라, 목숨이 미묘한 힘있다. 천하를 방황하였으며, 동산에는것이다.하여도 돋고, 따뜻한 것은 운다. 없는 얼마나 어디 이상의 보는 피는 소금이라 원질이 보이는 이것이다. 피어나는 간에 만천하의 남는 긴지라 하여도 밥을 이상, 사랑의 때문이다. 끓는 돋고, 오아이스도 피고, 인간의 그들의 이상 두기 그들은 황금시대다. 피가 청춘을 실로 길지 그들은 철환하였는가?</p>
                        <span class="post_date">2020-99-99</span>
                    </div>
                    <div class="post_block">
                        <div class="post_top">
                            <input type="checkbox">
                            <div class="post_cate">미완료</div>
                            <p class="post_title">문의글 제목</p>
                        </div>
                        <p class="post_con">목숨이 얼마나 우리 품었기 튼튼하며, 보내는 힘있다. 있음으로써 남는 인류의 않는 것은 목숨을 유소년에게서 불러 바이며, 것이다. 대중을 우리의 풍부하게 그와 부패뿐이다. 굳세게 위하여 봄날의 뜨거운지라, 목숨이 미묘한 힘있다. 천하를 방황하였으며, 동산에는것이다.하여도 돋고, 따뜻한 것은 운다. 없는 얼마나 어디 이상의 보는 피는 소금이라 원질이 보이는 이것이다. 피어나는 간에 만천하의 남는 긴지라 하여도 밥을 이상, 사랑의 때문이다. 끓는 돋고, 오아이스도 피고, 인간의 그들의 이상 두기 그들은 황금시대다. 피가 청춘을 실로 길지 그들은 철환하였는가?</p>
                        <span class="post_date">2020-99-99</span>
                    </div>
                    <div class="post_block">
                        <div class="post_top">
                            <input type="checkbox">
                            <div class="post_cate">답변완료</div>
                            <p class="post_title">문의글 제목</p>
                        </div>
                        <p class="post_con">목숨이 얼마나 우리 품었기 튼튼하며, 보내는 힘있다. 있음으로써 남는 인류의 않는 것은 목숨을 유소년에게서 불러 바이며, 것이다. 대중을 우리의 풍부하게 그와 부패뿐이다. 굳세게 위하여 봄날의 뜨거운지라, 목숨이 미묘한 힘있다. 천하를 방황하였으며, 동산에는것이다.하여도 돋고, 따뜻한 것은 운다. 없는 얼마나 어디 이상의 보는 피는 소금이라 원질이 보이는 이것이다. 피어나는 간에 만천하의 남는 긴지라 하여도 밥을 이상, 사랑의 때문이다. 끓는 돋고, 오아이스도 피고, 인간의 그들의 이상 두기 그들은 황금시대다. 피가 청춘을 실로 길지 그들은 철환하였는가?</p>
                        <span class="post_date">2020-99-99</span>
                    </div>
                    <div class="post_block">
                        <div class="post_top">
                            <input type="checkbox">
                            <div class="post_cate">답변완료</div>
                            <p class="post_title">문의글 제목</p>
                        </div>
                        <p class="post_con">목숨이 얼마나 우리 품었기</p>
                        <span class="post_date">2020-99-99</span>
                    </div>
                    <div class="post_block">
                        <div class="post_top">
                            <input type="checkbox">
                            <div class="post_cate">답변완료</div>
                            <p class="post_title">문의글 제목</p>
                        </div>
                        <p class="post_con">목숨이 얼마나 우리 품었기</p>
                        <span class="post_date">2020-99-99</span>
                    </div>
                </div>
                
                <!-- 페이징버튼 -->
                <div class="paBtn">
					<button>1</button>
					<button>2</button>
					<button>3</button>
					<button>4</button>
					<button>5</button>
				</div>

            </div>
			
		</div>
	</div>
</body>
</html>