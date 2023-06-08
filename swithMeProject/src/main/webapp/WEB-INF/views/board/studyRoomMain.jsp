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
                <form action="sRoomSearch.bo">
				<table>
					<tr>
						<td><select name="searchSelect" id="sRoomSearchSelect">
							<option value="0">지역</option>
						</select></td>
						<td><input id="sRoomSearchInput" type="text" placeholder="검색어 입력" name="searchText" maxlength="200">&nbsp;
							<button type="submit" id="sRoomBtnSearch">검색</button></td>
					</tr>
				</table>
			</form>
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
			                                <th rowspan="4" style="width:250px;height:250px;">이미지</th>
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
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = { 
							center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					        level: 3 // 지도의 확대 레벨
					    };
					
					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					
					// 마커를 표시할 위치와 title 객체 배열입니다 
					var positions = [
					    {
					        title: '카카오', 
					        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
					    },
					    {
					        title: '생태연못', 
					        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
					    },
					    {
					        title: '텃밭', 
					        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
					    },
					    {
					        title: '근린공원',
					        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
					    }
					];

					// 마커 이미지의 이미지 주소입니다
					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
					    
					for (var i = 0; i < positions.length; i ++) {
					    
					    // 마커 이미지의 이미지 크기 입니다
					    var imageSize = new kakao.maps.Size(24, 35); 
					    
					    // 마커 이미지를 생성합니다    
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					    
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng, // 마커를 표시할 위치
					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					        image : markerImage // 마커 이미지 
					    });
					}
					</script>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />     
</body>
</html>