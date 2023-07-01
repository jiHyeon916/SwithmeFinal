<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸</title>
<!--카카오 맵-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8188ba557a9044b5d922513c971fc6ac"></script>
<style>
    .content>div{height:100%;float:left;}
    #sRoom{width:65%; border: solid 0.5px lightgrey;}
    #sRoomMap{width:35%;}
	#map{
		margin-left: 20px;
		width:90%;
		height:450px;
	}
	.sRoomListTables td{
		padding-left: 20px; 
		width: 500px;
		font-size: 20px;
	}
	.studyRoomimg{
		width:200px;
		height:200px;
		border-radius: 10%;
	}
	span{
		font-size: 15px;
		color: grey;
	}
	.sRoomListTables{
		margin-top: 15px;
		margin-left:10px;
	}
	.sRoomListTables:hover{
		background-color: rgb(207, 254, 227);
	}


    /*검색*/
    .searchTable {
		width: 40%;
		margin-left:auto; 
    	margin-right:auto;
	}

    .search {text-align: center;}

	.searchSelect{
    width : 100%;
    border: 1.5px solid #cecece;
    border-radius: 5px;
    padding: 10px;
	}

	#sRoomSearchInput{
	width : 70%;
    border: 1.5px solid #cecece;
    border-radius: 5px;
	height: 45px;
	padding: 10px;
	}
	#sRoomBtnSearch{
	background-color: rgb(3, 195, 115);
    color: white;
    width : 90px;
    height: 45px;
	border-radius : 5px;
    border: none;
	}
    #sRoomBtnSearch:hover {
        transform: scale(1.1);
    }


	/*페이징*/
.paBtn{
	width : 320px;
	height : 60px;
	margin : auto;
}
.paBtn > button{
	width : 40px;
	height : 40px;
	background-color : white;
	border : 1px solid rgb(3, 195, 115);
	border-radius : 3px;
	color : rgb(3, 195, 115);
	margin : 5px;
	box-sizing : border-box;
	text-align : center;
	
}


        
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <br>
        <div class="wrap clear">
            <div class="search">
                <br><br>
				<table class="searchTable">
						<tr>
							<td>
								<select class="searchSelect" name="searchSelect" id="sRoomSearchSelect">
								<option  value="10">강원</option>
								<option  value="20">경기</option>
								<option  value="30">경남</option>
								<option  value="40">경북</option>
								<option  value="50">광주</option>
								<option  value="60">대구</option>
								<option  value="70">대전</option>
								<option  value="80">부산</option>
								<option  value="90">서울</option>
								<option  value="11">세종</option>
								<option  value="12">울산</option>
								<option  value="13">인천</option>
								<option  value="14">전남</option>
								<option  value="15">전북</option>
								<option  value="16">제주</option>
								<option  value="17">충남</option>
								<option  value="18">충북</option>
								</select>
							</td>
							<td>
								<input id="sRoomSearchInput" type="text" placeholder="검색어 입력" name="searchText" value="${ searchText }" maxlength="200">&nbsp;
								<button type="submit" id="sRoomBtnSearch" onclick="search($('#sRoomSearchSelect option:selected').val(), $('#sRoomSearchInput').val());">검색</button>
							</td>
						</tr>
				</table>
            </div>
            <br><br>
            <div class="content">
                <div id="sRoom">
					<div id="sRoomList">
						<c:choose>
							<c:when test="${ empty sRoomList }">
								조회 결과가 없습니다.
							</c:when>
							<c:otherwise>
								<c:forEach items="${sRoomList}" var="sRoom">
									<table class="sRoomListTables">
									<input type="hidden" value="${sRoom.studyRoomNo }">
										<tbody>
											<tr>
												<th rowspan="6">
												<img class="studyRoomimg" src="${sRoom.titleImg}" style="width:250px;height:250px;">
												</th>
											</tr>
											<tr>
												<td>
													<span>${sRoom.studyRoomLocation}</span>
													<h3>${sRoom.studyRoomName}</h3>
												</td>
											</tr>
											<tr>
												<td>${sRoom.studyRoomAddress}</td>
											</tr>
											<tr>
												<td>${sRoom.studyRoomPhone}</td>
											</tr>
											<tr>
												<td>리뷰(${sRoom.reviewCnt}) </td>
											</tr>
											<tr><td>&nbsp;</td></tr>
										</tbody>
									</table>
									<hr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!--
						페이징버튼 
						<div class="paBtn">
						<c:choose>
							<c:when test="${pi.currentPage eq 1}">
								 <button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);"><a href="#"></a>&lt;</button>
							</c:when>
							<c:otherwise>
								<button onclick="location.href='studyRoomMainView.bo?cPage=${ pi.currentPage -1 }'">&lt;</button>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:choose>
								<c:when test="${ p eq pi.currentPage }">
									<button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">${p}</button>
								</c:when>
								<c:otherwise>
									<button style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);" onclick="location.href='studyRoomMainView.bo?cPage=${p}'">${p}</button>
								</c:otherwise>
							</c:choose>
						</c:forEach>					
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">&gt;</button>
							</c:when>
							<c:otherwise>
								<button onclick="location.href='studyRoomMainView.bo?cPage=${ pi.currentPage + 1 }'">&gt;</button>
							</c:otherwise>
						</c:choose>
						</div>
						
					-->
				</div>

                
                <div id="sRoomMap">
	                <!-- 지도를 표시할 div 입니다 -->
					<div id="map"></div>
                </div>
            </div>
        </div>
        
        
        
    <jsp:include page="../common/footer.jsp" /> 

	<script>
		$(function(){
			allMap();
			studyRoomDetail();
		});

		function allMap(){
			$.ajax({
					url : "allMap.bo",
					success : function(data){
						// 마커를 표시할 위치, title 객체 배열
						var positions=[];
						var all = data.all;
						for (let i = 0; i < all.length; i++) {
							 positions.push({title: all[i].studyRoomName, latlng: new kakao.maps.LatLng(all[i].studyRoomLat, all[i].studyRoomLng)});
						 }
						console.log(positions);
						mapView(positions);
					}, 
					error : function(){
							console.log('실패');
						}
					});
		}

		// 지도 나타내기
		function mapView(positions){
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = { 
					center: new kakao.maps.LatLng(37.2984025, 127.0698292), // 지도의 중심좌표
					level: 14 // 지도의 확대 레벨
				 };
				
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			console.log(positions);
			for (var i = 0; i < positions.length; i ++) {
							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
							map: map, // 마커를 표시할 지도
							position: positions[i].latlng, // 마커를 표시할 위치
							title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							});
						}
		}

		// 지도 검색항목만 조회
		function search(location, keyword){
			$.ajax({
					url : "search.bo",
					data : {
						searchSelect : location,
						searchText : keyword
					},
					success : function(data){
						// 마커를 표시할 위치, title 객체 배열
						var positions=[];
						var value='';
						var search = data.search;
						var searchList = data.searchList;

							for (let i = 0; i < search.length; i++) {
								 positions.push({title: search[i].studyRoomName, latlng: new kakao.maps.LatLng(search[i].studyRoomLat, search[i].studyRoomLng)});
							 }
	
							 // 검색 결과 스터디룸 리스트
							for(let i = 0; i < searchList.length; i++){
								value += '<table class="sRoomListTables">'
										+'<input type="hidden" value="' + searchList[i].studyRoomNo+ '">'
										+'<tbody>'
										+'<tr>'
										+'<th rowspan="6">'
										+'<img class="studyRoomimg" src="'+ searchList[i].titleImg +'" style="width:250px;height:250px;">'
										+'</th>'
										+'</tr>'
										+'<tr>'
										+'<td>'
										+'<span>'+ searchList[i].studyRoomLocation +'</span>'
										+'<h3>'+ searchList[i].studyRoomName+'</h3>'
										+'</td>'
										+'</tr>'
										+'<tr>'
										+'<td>'+searchList[i].studyRoomAddress+'</td>'
										+'</tr>'
										+'<tr>'
										+'<td>'+searchList[i].studyRoomPhone+'</td>'
										+'</tr>'
										+'<tr><td>&nbsp;</td></tr>'
										+'</tbody>'
										+'</table>';
							}
						

						if(searchList.length > 0){
							$('#sRoomList').html(value);
						} else{
							$('#sRoomList').html('조회 결과가 없습니다.');
						}
						
						mapView(positions);
						studyRoomDetail();
						
					}, 
					error : function(){
							console.log('실패');
						}
					});
		}

		// 스터디룸 상세보기 페이지 이동
		function studyRoomDetail(){
			$('.sRoomListTables').click(function(){
				location.href="studyRoomDetail.bo?studyRoomNo=" + $(this).children().eq(0).val();
			});
		}
		</script>    
</body>
</html>