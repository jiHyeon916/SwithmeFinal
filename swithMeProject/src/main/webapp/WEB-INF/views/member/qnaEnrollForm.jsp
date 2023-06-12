<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/qnaEnrollForm.css">

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
            <div class="topBlock">문의글 작성</div>

            <div class="block">
            	<form action="insertQna.me" method="post">
	                <div>
	                    <p>제목</p>
	                    <input type="text" name="qnaTitle" required/>
	                </div>
	                <br>
	                <div>
	                    <p>내용</p>
	                    <textarea name="qnaContent" onkeyup="qnaText(this);"></textarea>
	                </div>
	
	                <div id="myQnaBtn">
	                    <button type="button" class="qnaBack" onclick="location.href='qna.me'">취소</button>
	                    <button type="submit" class="qnaEnroll">등록</button>
	                </div>
                </form>
            </div>
			
		</div>
	</div>
	<script>
		$(function(){
			
			
			
			
			
		});
		
		function qnaText(e){
			console.log(e.value.length);
			
			let textLeng = e.value.length;
			
			
			
			
			
			
			
		};
		
		
		
	</script>
</body>
</html>