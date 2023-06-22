<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 상세</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- swiper.js 라이브러리추가 -->
   <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
   <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

   <!--카카오맵-->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8188ba557a9044b5d922513c971fc6ac"></script>

    <style> 
    .buttonArea{
        height: 100px;
    }
    #sRoomList{width:65%;border: solid 0.5px lightgrey;}
    .info{height: 150px;}
    .info2{
        height: 50px;
    }
    #sRoomMap{width:35%;}
    .swiper {
        float : left;
        width: 100%;
        height: 400px;
    }
    #map{
		margin-left: 20px;
		width:100%;
		height:600px;
	}
    .content>div{height:100%;float:left;}
​
    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }
    .content {
        background-color:rgb(247, 245, 245);
        width:100%;
        height: 600%;
    }
    .content>div{height:100%;float:left;}
    
    table{
        width: 100%;
        margin-left: 10px;
    }
    th, td{
        padding: 10px;
    }
    .insertBtn{    
        background-color: rgb(3, 195, 115);
        color: white;
        width : 90px;
        height: 60px;
        border-radius : 5px;
        border: none;
        margin-left: 10px;
        vertical-align: center;
}
    .reviewStar input[type=radio]{display:none;}
    .reviewStar label:hover{color:red;}
    .reviewStar label.hover{color:red;}
    .reviewStarUpdate input[type=radio]{display:none;}
    .reviewStarUpdate label:hover{color:red;}
    .reviewStarUpdate label.hover{color:red;}

        
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
	<div class="wrap clear">
        <div class="buttonArea">
            <br>
            <a class="btn btn-secondary" style="float:left;" href="studyRoomMainView.bo">목록으로</a>
            <c:if test="${loginMember.memberId == 'admin'}">
                <a class="btn btn-secondary" style="float:right;" href="updateStudyRoomForm.ad?studyRoomNo=${sRoomDetail.studyRoomNo}">수정하기</a> 
                <a class="btn btn-secondary" style="float:right;" href="deleteStudyRoomForm.ad?studyRoomNo=${sRoomDetail.studyRoomNo}">삭제하기</a> 
            </c:if>
            <br>
        </div>
        <div class="content">
            <div id="sRoomList">
                <div class="info">
                    ${sRoomDetail.studyRoomName}<br>
                    ${sRoomDetail.studyRoomAddress}<br>
                    <span>전화</span>
                    ${sRoomDetail.studyRoomPhone}
                    <span>웹</span>
                    <a href=" ${sRoomDetail.studyRoomWebsite}"></a>
                </div>
                <div class="swiper">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                    <!-- Slides -->
                    <c:forEach items="${sRoomAttachList}" var="attach">  
                        <div class="swiper-slide"><img src="${attach.changeName}"></div>
                    </c:forEach>
                    </div>

                    <!-- If we need pagination -->
                    <div class="swiper-pagination"></div>

                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>

                    <!-- If we need scrollbar -->
                    <div class="swiper-scrollbar"></div>
                </div>
                <div class="info2">
                    ${sRoomDetail.studyRoomIntroduce}

                </div>
            </div>
            <div id="sRoomMap">
                <div id="map"></div>
            </div>
        </div>
        <div>&nbsp;</div>
        <table id="reviewArea" align="center">
            <thead>
                <tr>
                    <th colspan="4" style="font-size: larger;">이용후기(<span id="rcount"></span>)</th>
                </tr>
                <tr>
                    <th colspan="4" class="reviewStar">
                        <input type="radio" name="reviewStar" value="1" id="rate1">
                        <label for="rate1">★</label>
                        <input type="radio" name="reviewStar" value="2" id="rate2">
                        <label for="rate2">★</label>
                        <input type="radio" name="reviewStar" value="3" id="rate3">
                        <label for="rate3">★</label>
                        <input type="radio" name="reviewStar" value="4" id="rate4">
                        <label for="rate4">★</label>
                        <input type="radio" name="reviewStar" value="5" id="rate5">
                        <label for="rate5">★</label>
                    </th>
                </tr>
                <tr>
                    <th colspan="4"> <textarea class="form-control" name="" id="content" cols="55" rows="2" style="resize:none; width:90%; float:left;"></textarea>
                        <button class="insertBtn" onclick="insertReview();">등록하기</button>
                    </th>
                </tr>
            </thead>
            <tbody>
               
            </tbody>
        </table>
    </div>

    <br><br>
    <jsp:include page="../common/footer.jsp" />

    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(${sRoomDetail.studyRoomLat}, ${sRoomDetail.studyRoomLng}), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
        
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        
        // 마커가 표시될 위치입니다 
        var markerPosition  = new kakao.maps.LatLng(${sRoomDetail.studyRoomLat}, ${sRoomDetail.studyRoomLng}); 
        
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        
        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);
        
        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);    
        </script>
    <script>
        $(function(){
            selectReviewList();
        });

        // 이용후기 조회
    	function selectReviewList(){
    		$.ajax({
    			url : 'selectStudyRoomReviewList.bo',
    			data : {
    				studyRoomNo : ${sRoomDetail.studyRoomNo}
    			},
    			success : function(result){
    				var value='';
    				for(let i in result){
    					value += '<tr>' 
							+ '<th>' + result[i].memberId+ '</th>'
							+ '<td class=rating><input type="hidden" id="hideStar"value="'+result[i].reviewStar+'" <b>' + result[i].reviewStar + '</b>/5 &nbsp;';
                        for(let j=1; j <= result[i].reviewStar; j++){
                            value += '<label style="color:red;">★</label>';
                        }
                        for(let j=1; j <= 5-result[i].reviewStar; j++){
                            value += '<label style="color:lightgrey;">★</label>';
                        }        
                        value += '</td>'
                            + '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>'
                            + '<td style="text-align:right;">' + result[i].reviewDate+'&nbsp;&nbsp;'
                            + '<button class="updateBtn">수정</button>&nbsp;'
                            + '<input type="hidden" value="' +  result[i].reviewNo + '">'
                            + '<button class="deleteBtn">삭제</button>'
                            + '</td>'
                            + '</tr>' 
                            + '<tr style="border-bottom:solid 0.3px lightgrey;">'
                            + '<td colspan="4" style="height:100px; vertical-align:top;" class="reviewContent">' + result[i].reviewContent + '</td>'
                            + '</tr>';
                        
    				}
    				$('#reviewArea tbody').html(value);
    				$('#rcount').text(result.length);
    			},
    			error : function(){
    				console.log('실패');
    			}
    		});
    	}
    
        // 이용후기 등록
    	function insertReview(){
    		$.ajax({
    			url : 'insertstudyRoomReview.bo',
    			data : {
    				memberId : '${ loginMember.memberId }',
    				reviewContent : $('#content').val(),
    				reviewStar : $('input:radio[name=reviewStar]').filter(':checked').val(),
    				studyRoomNo : ${sRoomDetail.studyRoomNo}
    			},
    			success : function(result){
                    if(result === 1){
                        selectReviewList();
                        $('#content').val('');
                    }
    			},
    			error : function(){
    				console.log('실패');
    			}
    		});
    	}

        // 이용후기 삭제
         $('#reviewArea').on('click','.deleteBtn',function(){
            $.ajax({
                url : 'deleteReview.bo',
                data : {
                    reviewNo : $(this).prev().val()
                },
                success : function(result){
                    console.log(result);
                    location.reload();
                },
                error : function(){
                    consoel.log('실패');
                }
            })

        })


        // 이용후기 별점 선택
        $('#reviewArea').on('click','.reviewStar label', function(){
            var value=$('input:radio[name=reviewStar]').filter(':checked').val();
            $('.reviewStar label').removeClass("hover");
            for(var i=0; i<value; i++){
                $('.reviewStar label').eq(i).addClass("hover");
            }
        })

        // 이용후기 수정 별점 선택
        $('#reviewArea').on('click','.reviewStarUpdate label', function(){
            var value=$('input:radio[name=reviewStarUpdate]').filter(':checked').val();
            $('.reviewStarUpdate label').removeClass("hover");
            for(var i=0; i<value; i++){
                $('.reviewStarUpdate label').eq(i).addClass("hover");
            }
        });

                // 이용후기 수정
        // 리뷰 불러오기
        $('#reviewArea').on('click','.updateBtn',function(){
        	var reviewNo = $(this).next().val();
        	var reviewContent = $(this).parent().parent().next().find('.reviewContent').text();
        	//console.log(reviewContent);
        	var updateForm = '<textarea class="form-control" name="" id="updateContent" cols="55" rows="2" style="resize:none; width:100%;">' + reviewContent + '</textarea>';
            $(this).parent().parent().next().find('.reviewContent').html(updateForm);

            var currentRating = $(this).parent().prev().prev().find('#hideStar').val();
            //console.log(currentRating);
            
            ratingForm ='<td class="reviewStarUpdate">'+ currentRating + '/5 &nbsp;';
            for (var i = 1; i <= currentRating; i++) {
                ratingForm += '<label><input type="radio" name="reviewStarUpdate" value="'+i+'" id="rate'+i+'">' 
                            +'★</label>';
            }
            ratingForm += '</td>';
            console.log( $(this).parent().prev().prev().text());
           $(this).parent().prev().prev().html(ratingForm);

           $(this).text('수정 완료');
            $(this).next().next().text('취소');
            $(this).removeClass('updateBtn').addClass('completeBtn');
        	$(this).next().next().removeClass('deleteBtn').addClass('backBtn');
        })

        // 리뷰 수정하기
        $('#reviewArea').on('click','.completeBtn', function(){
        	var reviewNo = $(this).next().val();
            var reviewContent = $('#updateContent').val();
            var reviewStar = $('input:radio[name=reviewStarUpdate]').filter(':checked').val();
          console.log(reviewContent);
            console.log(reviewStar);
            $.ajax({
				url: 'updateReview.bo',
		        data: {
		            reviewNo: reviewNo,
		            reviewContent: reviewContent,
                    reviewStar : reviewStar
		        },
		        success: function (result) {
		            console.log(result);
		            location.reload();
		        },
		        error: function () {
		            console.log('실패');
		        }
	
			});
        });




        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 3000 // 3초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 

    
    </script>
    
    
    
    
    
</body>
</html>