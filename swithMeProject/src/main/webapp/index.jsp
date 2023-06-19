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

	.main1{
		background: url('resources/images/common/main3.png');
		background-size: cover;
	}
	.main2{
		background: url('resources/images/common/main2.png');
		background-size: cover;
	}
	.main3{
		background: url('resources/images/common/mainBanner1.png');
		background-size: cover;
	}


	#studyBandArea{
		margin-bottom: 150px;
	}
	#studyBandArea > div > p{
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
		background-color: rgb(250, 250, 250);
		border-radius: 50%;
		width: 100px;
		height: 100px;
		margin-right: 56px;
		margin-bottom: 40px;
		border: 1px solid rgb(214, 214, 214);
		cursor: pointer;

	}
	#studyBandArea ul li:hover{
		background-color: rgb(233, 250, 228);
		border: 1px solid rgb(152, 212, 140);
	}
	#studyBandArea ul li:last-child{
		margin-right: 0;
	}
	#studyBandArea ul li img{
		width: 40px;
		margin: 0 auto;
		line-height: 100px;
		display: block;
		margin-top: 20px;
		margin-bottom: 10px;
	}
	#studyBandArea ul li p {
		text-align: center;
		font-size: 13px;
	}


	#study6 > div{
		width: 380px;
		margin: 10px 10px 10px 10px;
		background-color: rgb(255, 255, 255);
		border-radius: 5px;
		float: left;
		border: 1px solid rgb(223,223,223);
		padding: 20px;
	}
	#study6 > div > div > .category,
	#study6 > div > div > .userId{
		font-size: 14px;
		border-radius: 20px;
		border: 1px solid #7cb980;
		display: inline-block;
		padding: 3px 10px 3px;
		margin-bottom: 30px;
		float: left;
		color: #7cb980;
		margin-right: 10px;
	}
	#study6 > div > div > .userId{
		border: 1px solid rgb(170, 170, 170);
		color: rgb(170, 170, 170);
	}
	
	#study6 > div > .studyName{
		font-size: 17px;
		font-weight: bold;
		margin-bottom: 20px;
	}
	#study6 > div > .intro{
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	#study6 > div > div > .per{
		float: left;
		font-size: 14px;
	}
	#study6 > div > div > .enter{
		float: right;
		margin-bottom: 10px;
		font-size: 14px;
	}

	#study6 > #more{
		width: 380px;
		height: 235px;
		margin: 10px 10px 10px 10px;
		background-color: rgb(255, 255, 255);
		border-radius: 5px;
		float: left;
		border: 1px solid rgb(223,223,223);
		padding: 0;
		overflow: hidden;
	}
	#more > img{
		width: 100%;
		height: 100%;
		object-fit: cover;
	}



	#add{
		width: 1200px;
		height: 200px;
		border-radius: 10px;
		background-color: #e6e6e6;
		margin-bottom: 150px;
		background: url(resources/images/common/middlebanner.png);
		background-size: cover;
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
	#faq .left img{
		width: 90px;
		margin-bottom: 30px;
	}
	#faq .right{
		width: 1000px;
	}
	#faq .right ul li{
		padding: 20px 10px 20px 10px;
		border-top: 1px solid rgb(223, 223,223);
		font-size: 17px;
		font-weight: bold;
		cursor: pointer;
	}
	#faq .right ul li p{
		padding: 20px;
		font-weight: 400 !important;
		font-size: 15px;
		line-height: 30px;
	}

</style>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/header.jsp"></jsp:include>
	


	<div class="swiper" dir="ltr">
	<div class="swiper-wrapper">
	  <div class="swiper-slide main1"></div>
	  <div class="swiper-slide main2"></div>
	  <div class="swiper-slide main3"></div>
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
			<li onclick="mainStudyBand(this)"><img src="resources/images/common/iconAll.png" alt=""><p>전체보기</p></li>
			<li onclick="mainStudyBand(this)"><img src="resources/images/common/iconStudy.png" alt=""><p>진로</p></li>
			<li onclick="mainStudyBand(this)"><img src="resources/images/common/iconfront.png" alt=""><p>프론트엔드</p></li>
			<li onclick="mainStudyBand(this)"><img src="resources/images/common/iconback.png" alt=""><p>백엔드</p></li>
			<li onclick="mainStudyBand(this)"><img src="resources/images/common/iconphoto.png" alt=""><p>그래픽</p></li>
			<li onclick="mainStudyBand(this)"><img src="resources/images/common/iconLang.png" alt=""><p>언어</p></li>
			<li onclick="mainStudyBand(this)"><img src="resources/images/common/iconJob.png" alt=""><p>취업</p></li>
			<li onclick="mainStudyBand(this)"><img src="resources/images/common/iconbusi.png" alt=""><p>창업</p></li>
		</ul>

		<div id="study6" class="clear">
			
		</div>

	</div>
  </div>

  <!-- mainBanner -->
  <div>
	<div class="wrap">
		<div id="add"></div>
	</div>
  </div>


  <!-- FnQ -->
  <div id="faq">
	<div class="wrap clear">
		<div class="left">
			<img src="resources/images/common/question.png" alt="">
			<p>자주묻는 질문 정리</p>
		</div>
		<div class="right">
			<ul>
				<li onclick="listShow(this);">1. 위치도 중요하긴 한데 깃발 위치
					<p>우리 식별이 안될 때 합을 맞출 수 있어요 합구호가 되잖아요 그런 방법도 있고 소리를 지르자고? 외쳐주셔야 만약에 그너에 오더라도 스턴트 쪽에 오고 있구나 라고알고 있는데 함 해봅시다.
						일단 저희는 기지를 안전하게 지키는 것부터 할 예정입니다. 내 생각에 경호원은 우리 여기 확 내려오는 여기 헷갈리잖아요 옆에 숨어이쓴거에요. 뒤에 있다가 그냥 깃발 뺏는게 나을 것 같
						아 가까운 여기서부터 하나씩 떨궈가지고 멀리 가서 굉장히 길다는걸 알고 있었거든요.
					</p>
				</li>
				<li onclick="listShow(this);">1. 위치도 중요하긴 한데 깃발 위치
					<p>우리 식별이 안될 때 합을 맞출 수 있어요 합구호가 되잖아요 그런 방법도 있고 소리를 지르자고? 외쳐주셔야 만약에 그너에 오더라도 스턴트 쪽에 오고 있구나 라고알고 있는데 함 해봅시다.
						일단 저희는 기지를 안전하게 지키는 것부터 할 예정입니다. 내 생각에 경호원은 우리 여기 확 내려오는 여기 헷갈리잖아요 옆에 숨어이쓴거에요. 뒤에 있다가 그냥 깃발 뺏는게 나을 것 같
						아 가까운 여기서부터 하나씩 떨궈가지고 멀리 가서 굉장히 길다는걸 알고 있었거든요.
					</p>
				</li>
				<li onclick="listShow(this);">2. 경찰은 캐비넷 위에 있다
					<p>우리 식별이 안될 때 합을 맞출 수 있어요 합구호가 되잖아요 그런 방법도 있고 소리를 지르자고? 외쳐주셔야 만약에 그너에 오더라도 스턴트 쪽에 오고 있구나 라고알고 있는데 함 해봅시다.
						일단 저희는 기지를 안전하게 지키는 것부터 할 예정입니다. 내 생각에 경호원은 우리 여기 확 내려오는 여기 헷갈리잖아요 옆에 숨어이쓴거에요. 뒤에 있다가 그냥 깃발 뺏는게 나을 것 같
						아 가까운 여기서부터 하나씩 떨궈가지고 멀리 가서 굉장히 길다는걸 알고 있었거든요.
					</p>
				</li>
				<li onclick="listShow(this);">3. 누구를 첫번째로 치느냐 이거넫
					<p>우리 식별이 안될 때 합을 맞출 수 있어요 합구호가 되잖아요 그런 방법도 있고 소리를 지르자고? 외쳐주셔야 만약에 그너에 오더라도 스턴트 쪽에 오고 있구나 라고알고 있는데 함 해봅시다.
						일단 저희는 기지를 안전하게 지키는 것부터 할 예정입니다. 내 생각에 경호원은 우리 여기 확 내려오는 여기 헷갈리잖아요 옆에 숨어이쓴거에요. 뒤에 있다가 그냥 깃발 뺏는게 나을 것 같
						아 가까운 여기서부터 하나씩 떨궈가지고 멀리 가서 굉장히 길다는걸 알고 있었거든요.
					</p>
				</li>
				<li onclick="listShow(this);">4. 운동선수랑 소방관이 있거든요
					<p>우리 식별이 안될 때 합을 맞출 수 있어요 합구호가 되잖아요 그런 방법도 있고 소리를 지르자고? 외쳐주셔야 만약에 그너에 오더라도 스턴트 쪽에 오고 있구나 라고알고 있는데 함 해봅시다.
						일단 저희는 기지를 안전하게 지키는 것부터 할 예정입니다. 내 생각에 경호원은 우리 여기 확 내려오는 여기 헷갈리잖아요 옆에 숨어이쓴거에요. 뒤에 있다가 그냥 깃발 뺏는게 나을 것 같
						아 가까운 여기서부터 하나씩 떨궈가지고 멀리 가서 굉장히 길다는걸 알고 있었거든요.
					</p>
				</li>
			</ul>
		</div>
	</div>
  </div>


  <script>
	const swiper = new Swiper('.swiper', {
		direction: 'horizontal',
		loop: true,

		pagination: {
			//el: '.promotion .swiper-pagination',
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
			//el: '.swiper-scrollbar',
		},
	});

	$(function(){
		$('#faq .right ul li p').css('display', 'none');
		
		// 스터디 밴드 가져오기 
		$.ajax({
			url : 'mainStudy',
			data : {
				category : '전체보기'
			},
			success : (r) =>{
				console.log(r);

				var result = '';

				for(var i in r){
					result += '<div>'
								+ '<div class="clear">'
									+ '<p class="category">'+ r[i].sbCategory +'</p>'
									+ '<p class="userId">@' + r[i].memberId +'</p>'
								+ '</div>'
								+ '<p class="studyName">'+ r[i].sbTitle +'</p>'
								+ '<p class="intro">'+ r[i].sbIntroduce + '</p>'
								+ '<hr>'
								+ '<div class="clear">'
									+ '<p class="per">' + r[i].sbNowMem + '/' + r[i].sbRecruitMem + '</p>'
									+ '<p class="enter">참여</p>'
								+ '</div>'
							+ '</div>'
				}
				
				result += '<div id="more"><img src="resources/images/common/moreproject.jpg"></div>'
				
				$('#study6').html(result);
				
			},
			error : () => {

			}

		})
	})


	// 스터디 카테고리 분류 
	function mainStudyBand(e){
		$.ajax({
			url:'mainStudy',
			data : {
				category : $(e).children('p').text()
			},
			success : (r) =>{
				console.log(r);

				var result = '';

				for(var i in r){
					result += '<div>'
								+ '<div class="clear">'
									+ '<p class="category">'+ r[i].sbCategory +'</p>'
									+ '<p class="userId">@' + r[i].memberId +'</p>'
								+ '</div>'
								+ '<p class="studyName">'+ r[i].sbTitle +'</p>'
								+ '<p class="intro">'+ r[i].sbIntroduce + '</p>'
								+ '<hr>'
								+ '<div class="clear">'
									+ '<p class="per">' + r[i].sbNowMem + '/' + r[i].sbRecruitMem + '</p>'
									+ '<p class="enter">참여</p>'
								+ '</div>'
							+ '</div>'
				}
				
				result += '<div id="more"><img src="resources/images/common/moreproject.jpg"></div>'
				
				$('#study6').html(result);
				
			},
			error : () => {

			}
		})
	}

	function listShow(e){
		$($(e).children('p')).toggle();
	}

  </script>
	

	<jsp:include page="WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>