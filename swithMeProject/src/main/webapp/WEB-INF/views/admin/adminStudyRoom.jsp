<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	cursor:pointer;
}
tr:hover{
	background-color: rgb(207, 254, 227);
	cursor:pointer;
}
input[name=checkSRoom]{
	width: 20px;
  	height: 20px;
}
.selectAll{
	width: 20px;
  	height: 20px;
}
th, td{
	padding: 3px;
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
                        <h4>스터디룸 조회</h4>
                    </div>

                    <div id="sRoom_right">
                        <button class="sRoomCreate" onclick="location.href='adminstudyRoomInsert.ad'">추가</button>
                        <button class="sRoomDelete" onclick="sRoomDelete();">선택 삭제</button>
                    </div>
	         	</div>
	         	
	         	<div class="post_list">
	         		<table id="studyRoomList">
	         			<thead>
							<tr>
								<th><input type="checkbox" class="selectAll"></th>
								<th>NO</th>
								<th>스터디룸 명</th>
								<th>지역</th>
								<th>주소</th>
								<th>전화번호</th>
								<th>수정</th>
							</tr>
	         			</thead>
	         			<tbody>
	         				<c:forEach items="${list}" var="sr" varStatus="status">
								<tr class="checkSRoomTr">
									<td><input type="checkbox" value="${sr.studyRoomNo}" name="checkSRoom" class="checkDelete"></td>
									<td>${status.count}</td>
									<td>${sr.studyRoomName}</td>
									<td>${sr.studyRoomLocation}</td>
									<td>${sr.studyRoomAddress}</td>
									<td>${sr.studyRoomPhone}</td>
									<td>
										<button class="updateBtn" onclick="location.href='updateStudyRoomForm.ad?studyRoomNo=${sr.studyRoomNo}'">수정</button>&nbsp;
										<button class="updateBtn" onclick="location.href='studyRoomDetail.bo?studyRoomNo=${sr.studyRoomNo}'">상세보기</button>
									</td>
	         					</tr>
	         				</c:forEach>
	         			</tbody>
	         		</table>
	         	</div>

				<!-- 페이징버튼 -->
				<div class="paBtn">
				<c:choose>
					<c:when test="${p1.currentPage eq 1}">
					 	<button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);"><a href="#"></a>&lt;</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='adminStudyRoom.ad?aPage=${ pi.currentPage -1 }'">&lt;</button>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:choose>
						<c:when test="${ p eq pi.currentPage }">
							<button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">${p}</button>
						</c:when>
						<c:otherwise>
							<button style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);" onclick="location.href='adminStudyRoom.ad?aPage=${p}'">${p}</button>
						</c:otherwise>
					</c:choose>
				</c:forEach>					
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">&gt;</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='adminStudyRoom.ad?aPage=${ pi.currentPage + 1 }'">&gt;</button>
					</c:otherwise>
				</c:choose>
				</div>
	      </div>
	   </div>

	   <script>
		$(function(){
			checkBox();
		})

		// 스터디룸 선택 삭제
		function sRoomDelete(){
			let checkArr=[];
			$('input[name=checkSRoom]:checked').each(function(index){
				checkArr[index]=$(this).val();
			})
			if($('input[name=checkSRoom]:checked').length == 0){
				alert('선택된 스터디룸이 없습니다.');
			} else {
				if(confirm($('input[name=checkSRoom]:checked').length + '개의 스터디룸을 삭제하시겠습니까?')){
					$.ajax({
						url : 'deleteCheckStudyRoom.ad',
						data : {
							studyRoomNo : checkArr
						},
						success : function(){
							console.log('삭제 성공');
							location.reload();
							alert('스터디룸이 삭제되었습니다.');
						},
						error : function(){
							console.log('삭제 실패');
						}
					});
				}
			}
		}

		// 체크박스 선택 시 hover
		function checkBox(){
			$('input[name=checkSRoom]').click(function() {
				var checkbox = $(this);
   			 	var checkTr = checkbox.parent().parent();

				if (checkbox.is(':checked')) {
					checkTr.addClass('hover');
				} else {
					checkTr.removeClass('hover');
				}
			});
		}

		// 전체 선택
		$(function() {
			$(".selectAll").click(function() {
				var isChecked = $(this).is(":checked");
				// 모든 checkSRoom 클래스를 가진 체크박스 상태를 전체 선택 체크박스와 동기화
				$("input[name='checkSRoom']").prop("checked", isChecked);
			});

			$("input[name='checkSRoom']").click(function() {
				var allChecked = ($("input[name='checkSRoom']:checked").length === $("input[name='checkSRoom']").length);
				$(".selectAll").prop("checked", allChecked);
			});
		});
		


	   </script>

<br><br><br><br><br><br><br><br><br>
</body>
</html>