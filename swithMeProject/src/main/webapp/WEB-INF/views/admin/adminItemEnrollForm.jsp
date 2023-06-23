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
                <span class="noneSpan" onclick="location.href = 'itemList.ad'">아이템목록</span>
                <span class="selectSpan">아이템등록</span>
            </div>

			<div class="block">
                <form action="insertItem.ad" method="post" enctype="multipart/form-data" onsubmit="return enrollItem();">

                    <!-- 파일첨부 / 미리보기 -->
                    <div id="itemEnroll">
                        <div id="itemImg"><img id="itemImgView" src="resources/images/member/none.jpeg" /></div>
                        <p id="uploadText">⦁ 박스를 클릭하여 파일을 첨부해주세요.</p>
                        <input type="file" id="itemFileOrigin" name="upFile" value="" onchange="preview(this);" required>
                    </div>

                    <!-- 아이템 정보 등록란 -->
                    <div id="itemColumn">
                        <div class="myBtn">
                            <button type="button" class="noneBtn">배경</button>
                            <button type="button" class="noneBtn">캐릭터</button>
                            <!-- 
                            <button type="button" class="noneBtn">모자</button>
                            <button type="button" class="noneBtn">도구</button>
                             -->
                            <input type="hidden" id="itemCate" name="itemCategory" value="">
                        </div>

                        <p>이름<input type="text" id="itemName" name="itemName" required placeholder="아이템 이름을 입력해주세요."></p>
                        <p><span>설명</span><textarea id="itemContent" name="itemContent" placeholder="아이템 설명을 입력해주세요."></textarea></p>
                        <p>가격<input type="number" id="itemPrice" name="itemPrice" required placeholder="ex) 300" min="0"> Point</p>

                        <div id="itemEnrollBtn">
                            <button type="button" class="qnaBack" onclick="backPage();">취소</button>
                            <button type="submit" class="qnaEnroll">등록</button>
                        </div>
                    </div>
                </form>
			</div>
			<br><br><br>
		</div>
	</div> 
	
	<jsp:include page="../common/footer.jsp" />

    <script>
        var selectCate = '';
        var noneImg = 'resources/images/member/none.jpeg';

        $(function(){
            // 카테고리 버튼 선택
            // 1. 해당 버튼 표시
            // 2. input에 카테고리 값 담기
            $('.myBtn > button').click(function(e){
                selectCate = e.target.innerText;
                $('.myBtn > button').each(function(index, i){
                    if($(this).text() == selectCate){
                        $(this).addClass('selectBtn').removeClass('noneBtn');
                        $('.myBtn>button').not(this).removeClass('selectBtn').addClass('noneBtn');
                        $('#itemCate').val(selectCate);
                    };
                });
            });

            // 파일 첨부 멘트
            $('#uploadText').css('visibility', 'visible');
        });

        // div 클릭시 파일첨부 창 열리기
        $('#itemImg').click(function(){
            $('#itemFileOrigin').click();
        })


        // 파일 첨부시 사진 미리보기
        function preview(inputFile){
            // 파일이 첨부되었는지 확인
            if(inputFile.files.length == 1){
                let reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
                reader.onload = e => {
                    $('#itemImgView').attr('src', e.target.result);
                };
                $('#uploadText').css('visibility', 'hidden');
            } else {
                $('#itemImgView').attr('src', noneImg);
                $('#uploadText').css('visibility', 'visible');
            };
        };


        // 취소버튼 클릭
        function backPage(){
            if(confirm('작성한 내용은 저장되지 않습니다. 취소하시겠습니까?')){
                location.href = "itemList.ad";
            };
        };
        

        // 등록하기 버튼 클릭
        // 1. 첨부파일이 비어있는지 확인 -> 비어있으면 작성불가 : required
        // 2. 카테고리 선택되어 있는지 확인 -> 미선택시 작성불가
        // 3. 아이템 이름 작성 확인 : required
        // 4. 가격 작성 확인 : required
        function enrollItem(){
            var flag = '';
            if( $('#itemImgView').attr('src') == noneImg){
                flag = false;
            } else {
                flag = true;
            };

            if(selectCate != ''){
                flag = true;
            } else {
                alert('아이템 카테고리를 선택해주세요.');
                flag = false;
            };
            return flag;
        };

    </script>
</body>
</html>