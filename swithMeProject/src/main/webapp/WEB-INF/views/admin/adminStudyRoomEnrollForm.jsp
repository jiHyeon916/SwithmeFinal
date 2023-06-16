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
 
    #studyRoomList{
    	margin:auto;
    }
    #studyRoomList th, td{
        border: 1px solid rgb(205, 203, 203);
    }
     #studyRoomList > thead{
        text-align: center;
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
.sRoomCreate, .sRoomDelete{
    background-color: rgb(3, 195, 115);
    color: white;
    width : 90px;
    height: 38px;
	border-radius : 5px;
    border: none;
    margin-left: 10px;
}
.updateBtn{
    background-color: lightgray;
    color: black;
    width : 50px;
    height: 30px;
	border-radius : 5px;
    border: none;
    margin-left: 10px;
}
 .deleteBtn{
    background-color: red;
    color: white;
    width : 50px;
    height: 30px;
	border-radius : 5px;
    border: none;
    margin-left: 10px;
}

/* 테이블 */
#studyRoomList{
	width : 100%;
	margin-bottom : 20px;
	font-size: smaller;
}
#studyRoomList th, td{
	text-align : center;
}
th{
	border-bottom : 1px solid #9d9d9d;
	background-color : #efefef;
}
tr{
	height : 60px;
	border-bottom : 1px solid #cecece;
}
tr:last-child{
	border : none;
}
tr.hover{
	background-color: rgb(207, 254, 227);
}
tr:hover{
	background-color: rgb(207, 254, 227);
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
                        <div class="post_content" >
                            <span>스터디룸 이름</span> 
                            <input type="text" name="sutdyRoomName" id="studyRoomName"><br>
                            <span>지역</span>
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
                            </select><br>
                            <span>주소</span>
                            <input type="text" id="studyRoomAddress" placeholder="주소">
                            <input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
                            <span>전화번호</span>
                            <input type="text" id="studyRoomPhone"><br>
                            <span>소개글</span>
                            <textarea name="studyRoomInfo" id="studyRoomInfo" cols="40" rows="8" style="resize:none;"></textarea><br>
                            <span>사진</span><button>업로드</button><br>
                            <div></div> &nbsp;&nbsp;
                        </div>
                         <div class="btn">
                                <button type="button">취소</button>
                                <button id="insertBtn">등록</button>
                        </div>

                </div>
	      </div>
	   </div>
    <script>
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
                            var coordsLat = result.x;
                            var coordsLng = result.y;
                            $('#insertBtn').click(function(){
                                $.ajax({
                                    url : 'insertStudyRoom.me',
                                    data : {
                                        studyRoomName : $('#studyRoomName').val(),
                                        studyRoomLocation : $("#studyRoomLocation option:selected").text(),
                                        studyRoomAddress : $('#studyRoomAddress').val(),
                                        studyRoomLat : coordsLat,
                                        studyRoomLng : coordsLng,
                                        studyRoomPhone : $('#studyRoomPhone').val(),
                                        studyRoomIntroduce : $('#studyRoomInfo').val()
                                    },
                                    success : function(){
                                        console.log('추가 성공');
                                    }, 
                                    error : function(){
                                        console.log('실패');
                                    }
                                });
                            });

                        }
                    });
                }
            }).open();

        }
    </script>
     

<br><br><br><br><br><br><br><br><br>
</body>
</html>