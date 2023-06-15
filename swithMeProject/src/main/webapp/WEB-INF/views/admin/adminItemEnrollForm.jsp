<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/adminItemEnrollForm.css">
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="adSide">
			<jsp:include page="adminMenuBar.jsp" />
		</div>
		
		<div class="content"> 

            <div class="topBlock">
                <span>아이템목록</span>
                <span>아이템등록</span>
            </div>

			<div class="block">
                <form action="" method="">

                    <!-- 파일첨부 / 미리보기 -->
                    <div id="itemEnroll">
                        <div id="itemImg">dd</div>
                        <input type="file" name="" value="">
                    </div>

                    <!-- 아이템 정보 등록란 -->
                    <div id="itemColumn">
                        <div class="myBtn">
                            <button>배경</button>
                            <button>캐릭터</button>
                            <button>모자</button>
                            <button>도구</button>
                        </div>

                        <p>이름 : <input type="text" name="itemName"></p>
                        <p>설명 : <textarea></textarea></p>
                        <p>가격 : <input type="text" name="itemPrice"></p>

                    <!-- 아이템목록 -->
                    <div id="myItem">
                        
                    </div>
                </form>
			</div>
			<br><br><br>
		</div>
	</div>

</body>
</html>