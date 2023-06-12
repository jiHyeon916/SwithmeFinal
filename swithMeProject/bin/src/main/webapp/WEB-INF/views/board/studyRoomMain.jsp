<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸</title>


<style>
    .content>div{height:100%;float:left;}
    #sRoomList{width:65%;}
    #sRoomMap{width:35%;}
    /*검색*/
    table {display: inline-block;}
    .search {text-align: center;}

    #sRoomBtnSearch:hover {
        transform: scale(1.1);
    }
        
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <br>
        <div class="wrap clear">
            <div class="search">
                <br><br>
				<table>
					<tr>
						<td>
						<form action="sRoomSearch.bo" method="get">
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
                    	</select></td>
						<td><input id="sRoomSearchInput" type="text" placeholder="검색어 입력" name="searchText" value="${ searchText }" maxlength="200">&nbsp;
							<button type="submit" id="sRoomBtnSearch">검색</button></td>
					</tr>
					</form>
				</table>
            </div>
            <br><br>
            <div class="content">
                <div id="sRoomList">
                	<c:choose>
                		<c:when test="${ empty sRoomList }">
                			조회 결과가 없습니다.
                		</c:when>
                		<c:otherwise>
                			<c:forEach items="${sRoomList}" var="sRoom">
			                    <table border="1" class="sRoomListTables">
			                    <input type="hidden" value="${sRoom.studyRoomNo }">
			                        <tbody>
			                            <tr>
			                                <th rowspan="4" style="width:250px;height:250px;">
											<img src="${sRoom.titleImg}" style="width:250px;height:250px;">
											</th>
			                                <td style="width: 500px;">${sRoom.studyRoomName}</td>
			                            </tr>
			                            <tr>
			                                <td>${sRoom.studyRoomAddress}</td>
			                            </tr>
			                            <tr>
			                                <td>${sRoom.studyRoomPhone}</td>
			                            </tr>
			                        </tbody>
			                    </table>
		                    </c:forEach>
	                    </c:otherwise>
                    </c:choose>
                </div>
                <script>
                	$(function(){
                		$('.sRoomListTables').click(function(){
                			location.href="studyRoomDetail.bo?studyRoomNo=" + $(this).children().eq(0).val();
                		});
                	});
                </script>
                <div id="sRoomMap">
	                <!-- 지도를 표시할 div 입니다 -->
					<div id="map" style="width:100%;height:450px;"></div>
					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8188ba557a9044b5d922513c971fc6ac"></script>
					<script>
					$.ajax({
						url : "map.bo",
						success : function(result){
							var positions=[];
				            for (let i = 0; i < result.length; i++) {
				                positions.push({title: result[i].studyRoomName, latlng: new kakao.maps.LatLng(result[i].studyRoomLat, result[i].studyRoomLng)});
				            }
				            console.log(positions);
							for (var i = 0; i < positions.length; i ++) {

							    // 마커를 생성합니다
							    var marker = new kakao.maps.Marker({
							        map: map, // 마커를 표시할 지도
							        position: positions[i].latlng, // 마커를 표시할 위치
							        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							    });
							}
						}, 
						error : function(){
							console.log('실해');
						}
					});
					
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
							center: new kakao.maps.LatLng(37.2984025, 127.0698292), // 지도의 중심좌표
					        level: 11 // 지도의 확대 레벨
					    };
					
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					// 마커 이미지의 이미지 주소입니다
					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					    
					</script>
                </div>
            </div>
        </div>
        
        
        
        <jsp:include page="../common/footer.jsp" />     
</body>
</html>