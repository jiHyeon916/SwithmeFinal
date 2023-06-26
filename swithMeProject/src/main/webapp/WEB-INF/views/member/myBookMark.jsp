<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* 공통 */
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

/* 포인트페이지 */
/* 상단 포인트 블럭 */
.topBlock{
	height : 55px;
	padding : 13px 20px;
	border : 1.5px solid rgb(175, 175, 175);
	border-radius: 10px;
	box-sizing : border-box;
	color : rgb(3, 195, 115);
	font-size : 16px;
	font-weight : 500;
	margin-bottom : 30px;
}

/* 내역블록 */
.block{
	padding : 25px;
	border : 1.5px solid rgb(175, 175, 175);
	border-radius: 10px;
	box-sizing : border-box;
	margin : auto;
}

/* 카테고리 버튼 */
.post_Btn{
    /* background-color: pink; */
    width: 100%;
    height : 50px;
    margin-bottom: 10px;
}
#qna_left, #qna_right{
    display: inline-block;
}
#qna_right{
    float: right;
}
.qna_all, .answer, .unAnswer{
    background-color: white;
    width : 80px;
    height: 38px;
    border : 1.5px solid #cecece;
	border-radius : 5px;
	color : #cecece;
	margin-right : 10px;
}
.qnaCreate, .deleteBtn_yj{
    background-color: rgb(3, 195, 115);
    color: white;
    width : 90px;
    height: 38px;
	border-radius : 5px;
    border: none;
    margin-left: 10px;
}

/* 게시글(문의글) 리스트 */
.postList{
    display: block;
}
.post_block{
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 1px solid rgb(227, 227, 227);
    /* background-color: #164b35; */
}
.post_block:last-child{
    border-bottom: none;
    margin-bottom: 0;
}
.post_top{
    height: 50px;
}
input[type=checkbox]{
    display: inline-block;
    margin-right: 10px;
}
.post_cate{
    display: inline-block;
    background-color: #03c373;
    color: #fff;
    padding: 4px 8px 4px;
    border-radius: 5px;
    margin-right: 16px;
    font-size: 13px;
}
.post_title{
    display: inline-block;
    line-height: 32px;
    font-size: 17px;
    font-weight: bold;
}
.post_con{
    display : inline-block;
    width: 800px;
	overflow : hidden;
	text-overflow : ellipsis;
	white-space : nowrap;
    margin-bottom : 8px;
    /* background-color: #03c373; */
    height: 25px;
    white-space:pre-line;
    text-align: justify;
}
#post_etc{
    margin: 0;
    padding : 0;
}
#post_etc>li{
    display: inline-block;
    /* background-color: aqua; */
    margin-right: 5px;
    font-size: 14px;
}
/* 페이징버튼 */
.paBtn{
	width : 265px;
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
}
.paBtn > button:first-child{
	background-color : rgb(3, 195, 115);
	color : white;
	border : none; 
	box-sizing : border-box;
}

</style>
<title>Insert title here</title>
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
			<div class="topBlock">북마크</div>

            <div class="block">
                <!-- 상단버튼 -->
                <div class="post_Btn">
                    <div id="qna_left">
                        <h4>북마크한 글 ${pi.listCount}</h4>
                    </div>

                    <div id="qna_right">
                        <button class="deleteBtn_yj" onclick="removeBookMark();">선택삭제</button>
                    </div>
                </div>

                <!-- 목록 -->
                <div class="postList">
                	<c:choose>
                		<c:when test="${ not empty list }">
                			<c:forEach items="${list}" var="bm">
	                			<input type="checkbox" name="bMarkCheck">
	                			<div class="post_block"  onclick="location.href='freeBoardDetail.bo?boardNo=${ bm.boardNo }'">
	                				<div class="post_top">
			                            <input type="hidden" value="${bm.boardNo }">
			                            <div class="post_cate">${bm.category}</div>
			                            <p class="post_title">${bm.boardTitle}</p>
			                        </div>
			                        <p class="post_con">${bm.summary}</p>
			                        <ul id="post_etc">
			                        	<c:if test="${bm.boardType eq 'free'}">
			                        		<li>자유게시판</li>
			                        	</c:if>
			                        	<c:if test="${bm.boardType eq 'info'}">
			                        		<li>정보게시판</li>
			                        	</c:if>
			                            <li>${bm.createDate }</li>
			                        </ul>
			                    </div>
                    		</c:forEach>
                    				                    
		                     <!-- 페이징버튼 -->
			                <div class="paBtn">
			                <c:choose>
			                	<c:when test="${p1.currentPage eq 1}">
			                		 <button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);"><a href="#"></a>&lt;</button>
			                	</c:when>
			                	<c:otherwise>
			                		 <button onclick="location.href='bookmark.me?cPage=${ pi.currentPage -1 }'">&lt;</button>
			                	</c:otherwise>
			                </c:choose>
			                <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			                    	<c:choose>
			                    		<c:when test="${ p eq pi.currentPage }">
			                    			<button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">${p}</button>
			                    		</c:when>
			                    		<c:otherwise>
			                    		<button></button>
			                    		</c:otherwise>
			                    	</c:choose>
			                    </c:forEach>
			                    
			                    <c:choose>
			                      <c:when test="${ pi.currentPage eq pi.maxPage }">
			                          <button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">&gt;</button>
			                       </c:when>
			                       <c:otherwise>
			                          <button onclick="location.href='bookmark.me?cPage=${ pi.currentPage + 1 }'">&gt;</button>
			                       </c:otherwise>
			                    </c:choose>
							</div>
                    	</c:when>
                    	<c:otherwise>
                    		<span class="emptyList">등록된 북마크가 없습니다.</span>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </div>
		</div>
	</div>
	
	<script>
		
		function removeBookMark(){
			if($('input[name=bMarkCheck]:checked').length == 0){
				alert('삭제할 북마크가 없습니다.');
			} else {
				if(confirm('삭제하시겠습니까?')){
					let checkArr = [];
					$('input[name=bMarkCheck]:checked').each(function(index){
						checkArr[index] = $(this).next().children().children().val();	
					})
					console.log(checkArr);
					
					$.ajax({
						url : 'deleteBookMark.me',
						data : {
							memberId : '${loginMember.memberId}',
							boardNo : checkArr
						},
						success : function(){
							console.log('삭제 성공');
							location.reload();
						},
						error : function(){
							console.log('실패!');
						}
						
					});
					} 
				}
			}
	
	
	</script>
	
	
	
</body>
</html>