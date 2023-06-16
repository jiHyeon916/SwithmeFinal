<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스윗미</title>
<link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"
/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<style>
	.swiper {
		width: 100%;
		height: 300px;
		background-color: yellow;
		margin-bottom: 100px;
	}



	#studyBandArea{
		margin-bottom: 150px;
	}
	#studyBandArea div > p{
		font-size: 20px;
		font-weight: bold;
		margin-bottom: 50px;
	}
	#studyBandArea ul{
		width: 1200px;
		margin: 0 auto;
	}
	#studyBandArea ul li{
		float: left;
		background-color: rgb(231, 231, 231);
		border-radius: 50%;
		width: 100px;
		height: 100px;
		margin-right: 56px;
	}
	#studyBandArea ul li:last-child{
		margin-right: 0;
	}

	#study6 > div{
		width: 380px;
		height: 200px;
		margin: 20px 10px 20px 10px;
		background-color: rgb(255, 255, 255);
		border-radius: 5px;
		float: left;
		border: 1px solid rgb(223,223,223);
	}



	#mainBanner{
		width: 1200px;
		height: 200px;
		border-radius: 10px;
		background-color: #e6e6e6;
		margin-bottom: 150px;
	}




	#faq{
		margin-bottom: 150px;
	}
	#faq .left, #faq .right{
		float: left;
	}
	#faq .left{
		width: 200px;
	}
	#faq .left h1{
		margin-bottom: 20px;
	}
	#faq .right{
		width: 1000px;
	}
	#faq .right ul li{
		padding: 20px 10px 20px 10px;
		border-top: 1px solid rgb(223, 223,223);
		font-size: 18px;
		font-weight: bold;
	}
	#faq .right ul li p{
		padding: 20px;
		font-weight: 400 !important;
	}

</style>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/header.jsp"></jsp:include>
	


	<div class="swiper" dir="ltr">
	<div class="swiper-wrapper">
	  <div class="swiper-slide">1</div>
	  <div class="swiper-slide">2</div>
	  <div class="swiper-slide">3</div>
	  ...
	</div>
	<div class="swiper-pagination"></div>
  
	
  
	<!-- If we need scrollbar -->
	<div class="swiper-scrollbar"></div>
  </div>



  <div id="studyBandArea">
	<div class="wrap">
		<p>스윗미에서 만나 볼 수 있는 Study 미리 보기</p>
		<ul class="celar">
			<li>전체</li>
			<li>진로</li>
			<li>취업</li>
			<li>ㅇㅇ</li>
			<li>ㅇㅇ</li>
			<li>ㅇㅇ</li>
			<li>ㅇㅇ</li>
			<li>ㅇㅇ</li>
		</ul>
		<div id="study6" class="clear">
			<div>d</div>
			<div>d</div>
			<div>d</div>
			<div>d</div>
			<div>d</div>
			<div>d</div>
		</div>
	</div>
  </div>

  <!-- mainBanner -->
  <div>
	<div class="wrap">
		<div id="mainBanner"></div>
	</div>
  </div>


  <!-- FnQ -->
  <div id="faq">
	<div class="wrap clear">
		<div class="left">
			<h1>FAQ</h1>
			<p>자주묻는 질문 정리!</p>
		</div>
		<div class="right">
			<ul>
				<li onclick="listShow(this);">1. 위치도 중요하긴 한데 깃발 위치
					<p>우리 식별이 안될 때 합을 맞출 수 있어요 합구호가 되잖아요 그런 방법도 있고 소리를 지르자고? 외쳐주셔야 만약에 그너에 오더라도 스턴트 쪽에 오고 있구나 라고알고 있는데 함 해봅시다.
						일단 저희는 기지를 안전하게 지키는 것부터 할 예정입니다. 내 생각에 경호원은 우리 여기 확 내려오는 여기 헷갈리잖아요 옆에 숨어이쓴거에요. 뒤에 있다가 그냥 깃발 뺏는게 나을 것 같
						아 가까운 여기서부터 하나씩 떨궈가지고 멀리 가서 굉장히 길다는걸 알고 있었거든요.
					</p>
				</li>
				<li onclick="listShow(this);">1. 위치도 중요하긴 한데 깃발 위치</li>
				<li onclick="listShow(this);">2. 경찰은 캐비넷 위에 있다</li>
				<li onclick="listShow(this);">3. 누구를 첫번째로 치느냐 이거넫</li>
				<li onclick="listShow(this);">4. 운동선수랑 소방관이 있거든요</li>
			</ul>
		</div>
	</div>
  </div>


  <script>
	const swiper = new Swiper('.swiper', {
		direction: 'horizontal',
		loop: true,

		pagination: {
			el: '.promotion .swiper-pagination',
			clickable: true,
		},
		autoplay: {
			delay: 3000, // 시작시간 설정
		},
		loop: true,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		scrollbar: {
			el: '.swiper-scrollbar',
		},
	});

	$(function(){
		//$('#faq .right ul li p').css('display', 'none');
		
	})

  </script>
	

	<jsp:include page="WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>