<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--카카오 우편번호 서비스-->
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8188ba557a9044b5d922513c971fc6ac&libraries=services"></script>
</head>
<style>
/*공통*/
.adSide{
	position : fixed;
}
.content{
	width : 100%;
	float:left;
	padding-left : 250px;
}
 
.page-blank{
	margin-top : 80px;
}
.mySide{
	position : fixed;
}
.content{
	width : 100%;
	float:left;
	padding-left : 250px;
    margin-bottom: 50px;
}

/* 상단 블럭 */
.topBlock{
	height : 55px;
	padding : 13px 20px;
	border : 1.5px solid rgb(175, 175, 175);
	border-radius: 10px;
	box-sizing : border-box;
	font-size : 16px;
	font-weight : 500;
	margin-bottom : 30px;
}
.topBlock>span{
    margin-right: 10px;
    cursor: pointer;
    color :rgb(136, 136, 136);
}
.topBlock>span:nth-of-type(1){
    margin-right: 10px;
    color : rgb(3, 195, 115);
    cursor: pointer;
}

/* 내역블록 */
.block{
	padding : 25px;
	border : 1.5px solid rgb(175, 175, 175);
	border-radius: 10px;
	box-sizing : border-box;
	margin : auto;
}

/* 게시글 리스트 */
.postList{
    display: block;
}

.post_block{
    margin-bottom: 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid rgb(227, 227, 227);
    /* background-color: antiquewhite; */
}
.post_block:last-child{
    border-bottom: none;
    margin-bottom: 0;
}
.post_top{
    height: 50px;
}


/* 카테고리 버튼 */
.post_head{
    /* background-color: pink; */
    width: 100%;
    height : 50px;
    margin-bottom: 10px;
}
#sRoom_left, #sRoom_right{
    display: inline-block;
}
#sRoom_right{
    float: right;
}
#insertBtn{
    background-color: rgb(3, 195, 115);
    color: white;
    width : 90px;
    height: 38px;
	border-radius : 5px;
    border: none;
    margin-left: 10px;
}
#backBtn{
    background-color: lightgray;
    color: black;
    width : 90px;
    height: 38px;
	border-radius : 5px;
    border: none;
    margin-left: 10px;
}
.uploadBtn{
padding: 6px 25px;
background-color:rgb(233, 233, 233);
border-radius: 4px;
color: black;
cursor: pointer;

}

/*input*/
table{
    width:80%;
    border:none;
    margin: auto;
}
tr{
    height : 60px;
}
.post_content > p{
    margin-bottom: 20px;
    color : #292929;
}
#studyRoomName{
    width : 100%;
    height: 40px;
    border: 1.5px solid #cecece;
    border-radius: 5px;
    padding: 10px;
}
#studyRoomLocation{
    width : 35%;
    border: 1.5px solid #cecece;
    border-radius: 5px;
    padding: 10px;

}
#studyRoomAddress{
    width : 100%;
    height: 40px;
    border: 1.5px solid #cecece;
    border-radius: 5px;
    padding: 10px;
}
#studyRoomPhone{
    width : 100%;
    height: 40px;
    border: 1.5px solid #cecece;
    border-radius: 5px;
    padding: 10px;
}
#studyRoomIntroduce{
    width : 100%;
    border: 1.5px solid #cecece;
    border-radius: 5px;
    padding: 10px;
}
#studyRoomImg{
    width : 400px;
    height: 300px;
}
#studyRoomView{
    width : 400px;
    height: 300px;
}

</style>
<body>

   <jsp:include page="../common/header.jsp" />
   
   <div class="page-blank"></div>
      
   <div class="wrap clear">
      <div class="adSide">
         <jsp:include page="adminMenuBar.jsp" />
      </div>
      
      <div class="content">
         <div class="topBlock">스터디룸 관리</div>
         	 <div class="block">
            	<!-- 상단버튼 -->
                <div class="post_head">
                    <div id="sRoom_left">
                        <h4>스터디룸 등록</h4>
                    </div>
	         	</div>
	         	
	         	<div class="post_middle">
                    <form id="studyRoomUpdateForm" action="updateStudyRoom.ad" method="post" enctype="multipart/form-data">
                        <input type="hidden" value="${studyRoom.studyRoomNo}" name="studyRoomNo">
                        <div class="post_content" >
                            <table>
                                <tr>
                                    <td><p>스터디룸 이름</p></td>
                                    <td><input type="text" name="studyRoomName" id="studyRoomName" required value="${studyRoom.studyRoomName}"></td>
                                </tr>
                                <tr>
                                    <td><p>지역</p></td>
                                    <td>
                                        <select name="studyRoomLocation" id="studyRoomLocation">
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
                                </tr>
                                <tr>
                                    <td><p>주소</p></td>
                                    <td>
                                        <input type="text" name="studyRoomAddress" id="studyRoomAddress" placeholder="주소" onclick="sample5_execDaumPostcode()" required value="${studyRoom.studyRoomAddress}">
                                        <input type="hidden" id="studyRoomLat" name="studyRoomLat" value="${studyRoom.studyRoomLat}">
                                        <input type="hidden" id="studyRoomLng" name="studyRoomLng" value="${studyRoom.studyRoomLng}">
                                    </td>
                                </tr>
                                <tr>
                                    <td><p>전화번호</p></td>
                                    <td><input type="text" id="studyRoomPhone" name="studyRoomPhone" value="${studyRoom.studyRoomPhone}" required></td>
                                </tr>
                                <tr>
                                    <td><p>소개글</p></td>
                                    <td><textarea name="studyRoomIntroduce" id="studyRoomIntroduce" cols="40" rows="8" style="resize:none;" required>${studyRoom.studyRoomIntroduce}</textarea></td>
                                </tr>
                                <tr>
                                    <td><p>사진</p></td>
                                    <td>
                                        <label class="uploadBtn" for="upfile">업로드</label> 
                                        <input type="file" id="upfile" name="reUpFile" onchange="preview(this);" style="display:none;">
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <div id="studyRoomImg">
                                            <img id="studyRoomView" src="${change}" /></div>
                                            <input type="hidden" name="changeName" value="${change}" />
                                    </td>
                                </tr>
                                <tr></tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;"> 
                                        <button id="backBtn" type="button" onclick="back();">취소</button>
                                        <button id="insertBtn">등록</button>
                                    </td>
                                </tr>
                            </table>              
                    </form>

                </div>
	      </div>
	   </div>
    <script>
        // 카카오 주소
        function sample5_execDaumPostcode() {
            //주소-좌표 변환 객체를 생성
            var geocoder = new daum.maps.services.Geocoder();
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = data.address; // 최종 주소 변수
    
                    // 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("studyRoomAddress").value = addr;
                    // 주소로 상세 정보를 검색
                    geocoder.addressSearch(data.address, function(results, status) {
                        // 정상적으로 검색이 완료됐으면
                        if (status === daum.maps.services.Status.OK) {
                            var result = results[0]; //첫번째 결과의 값을 활용
                            // 해당 주소에 대한 좌표
                            console.log(result);
                            var coordsLat = result.y;
                            var coordsLng = result.x;
                            
                            $('#studyRoomLat').val(coordsLat);
                            $('#studyRoomLng').val(coordsLng);

                            console.log($('#studyRoomLat').val());
                        }
                    });
                }
            }).open();
        }

        // 이미지 미리보기
        function preview(image){
            // 파일이 첨부되었는지 확인
            if(image.files.length == 1){
                let reader = new FileReader();
                reader.readAsDataURL(image.files[0]);
                reader.onload = e => {
                    $('#studyRoomView').attr('src', e.target.result);
                };
            } else {
                $('#studyRoomView').attr('src', noneImg);
            };
        };

        // 뒤로 가기
        function back(){
            if(confirm('작성된 내용은 저장되지 않습니다. 취소하시겠습니까?')){
                location.herf="adminStudyRoom.ad";
            };
            
        };


    </script>
     

<br><br><br><br><br><br><br><br><br>
</body>
</html>