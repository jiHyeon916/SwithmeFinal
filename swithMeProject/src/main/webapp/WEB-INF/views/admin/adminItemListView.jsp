<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/adminItemListView.css">
<link rel="stylesheet" href="resources/css/board/itemBoardView.css">
</head>
<body>
	<c:if test="${ not empty failMsg }">
		<script>
			alert('${failMsg}');
		</script>
	</c:if>

	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="adSide">
			<jsp:include page="adminMenuBar.jsp" />
		</div> 
		
		<div class="content"> 

            <div class="topBlock">
                <span class="selectSpan">아이템목록</span>
                <span class="noneSpan" onclick="location.href='itemEnrollForm.ad'">아이템등록</span>
            </div> 

			<div class="block">
				<div class="myBtn">
					<button id="item1" class="noneBtn" onclick="selectBtn(this);">전체보기</button>
					<button id="item2" class="noneBtn" onclick="selectBtn(this);">배경</button>
					<button id="item3" class="noneBtn" onclick="selectBtn(this);">캐릭터</button>
					<button id="item4" class="noneBtn" onclick="selectBtn(this);">모자</button>
					<button id="item5" class="noneBtn" onclick="selectBtn(this);">도구</button>
				</div>
                <div class="status">
                    <span id="filter1" class="noneStatus" onclick="selectSpan(this);">⦁ 전체보기</span>
                    <span id="filter2" class="noneStatus" onclick="selectSpan(this);">⦁ 판매중</span>
                    <span id="filter3" class="noneStatus" onclick="selectSpan(this);">⦁ 판매중단</span>
                </div>

                <!-- 아이템목록 -->
				<div id="myItem">
					<table>
						<!-- 리스트 반복 -->
					</table>
				</div>


			</div>
			<br><br><br>
		</div>

		<!-- 아이템 모달 -->
		<div class="modal msg1">
			
		</div>
		<div class="modal_body msg1_body">
			<form method="post" enctype="multipart/form-data" id="reUpFileForm">
				<input type="hidden" name="msgNo" class="msgNo1">
				<input type="hidden" id="hiddenItemNo" name="itemNo" value="">
				<input type="hidden" id="hiddenItemCategory" name="itemCategory" value="">
				<input type="hidden" id="hiddenItemStatus" name="itemStatus" value="">
				<input type="hidden" id="originPhoto" name="originPhoto" value="">
				<div id="itemImg2">
					<img src="" alt="">
					<input type="file" id="reUpFile" name="reUpFile" value="" onchange="preview(this);"/>
					<!-- <input type="file" id="upFile" name="upFile" value="" onchange="preview(this);"/> -->
				</div>
				<p>No.<span class="itemNo"></span></p>
				<div id="itemIntro2">
					<p id="modalCate1" class="itemType3" onclick="modalCategory(this.innerText);">배경</p>
					<p id="modalCate2" class="itemType3" onclick="modalCategory(this.innerText);">캐릭터</p>
					<p id="modalCate3" class="itemType3" onclick="modalCategory(this.innerText);">모자</p>
					<p id="modalCate4" class="itemType3" onclick="modalCategory(this.innerText);">도구</p>
					<div class="mainInfo clear">
						이름 : <input type="text" class="itemName" name="itemName"> <br>
						가격 : <input type="number" class="itemPrice" name="itemPrice">point
					</div>
					설명 : <textarea class="itemText" name="itemContent" val="" ></textarea>
					
					
					<div class="itemBtn clear">
						<button type="button" class="cloesBtn">닫기</button>
						<button type="button" onclick="itemUpdate();">수정하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script>
		let item = '';
		let filter = '';
		
		$(function(){
			$('#item1').click(); // 배경버튼 자동 클릭
			$('#filter1').click(); // 전체보기 버튼 자동 클릭

			// 페이지 첫 로드 시
			item = '전체보기';
			filter = 'all';
			selectItemList(item, filter);

			// 카테고리 변경 때마다 메소드 호출
			$('.myBtn > button').click(function(e){
				item = e.target.innerText;
				selectItemList(item, filter);
			});
			
			// 필터 변경 때마다 메소드 호출
			$('.status > span').click(function(e){
				let testStr = e.target.innerText;
				switch(testStr){
					case '⦁ 전체보기' : filter = 'all'; break;
					case '⦁ 판매중' : filter = 'Y'; break;
					case '⦁ 판매중단' : filter = 'N'; break;
				}
				selectItemList(item, filter);
			});
			
		});


		// 수정하기 모달
		// 필요변수
		let updateNo;
		let updateCategory = '';
		let updateName = '';
		let updateContent = '';
		let updatePrice = '';
		let updateStatus = '';
		let updateImg = '';
		let originImg = '';

		$(document).on('click', '.btn-open-popup', function(e){
			$('.msg1_body').show().css('z-index','7777');
			$('.msg1').show();

			// 아이템 새로운 이미지
			updateImg = $(this).prev().children().eq(0).attr('src');
			$('#itemImg2 > img').attr('src', updateImg);
			
			// 아이템 기존 이미지
			$('#originPhoto').val(updateImg);
			console.log($('#originPhoto').val());
			
			// 아이템 상태
			if($(this).next().val() == 'Y'){
				updateStatus = 'N'
			} else {
				updateStatus = 'Y'
			}
			$('#hiddenItemStatus').val(updateStatus);
			
			// 아이템 카테고리
			updateCategory = $(this).siblings('.category').val();
			let itemTypeArr = $('.itemType3');
			itemTypeArr.each(function(index, i){
				changeCate = itemTypeArr[index].innerText;
				if(itemTypeArr[index].innerText == updateCategory){
					modalCategory($(this).text());
				};
			});

			// 아이템 번호
			updateNo = $(this).prev().prev().prev().text();
			updateNo = updateNo.substring(4);
			$('.itemNo').text(updateNo);
			$('#hiddenItemNo').val(updateNo);

			// 아이템 이름
			updateName = $(this).prev().prev().text();
			$('.itemName').val(updateName);

			// 아이템 가격
			updatePrice = $(this).siblings('.price').val();
			$('.itemPrice').val(updatePrice);

			// 아이템 설명
			updateContent = $(this).siblings('.content').val();
			console.log($(this).siblings('.content').val());
			let vo = '';
			if(updateContent == typeof undefined){
				$('.itemText').val('');
			} else {
				$('.itemText').val(updateContent);
			}

			$('body').css('overflow','hidden');
			$('.msg1').click(function(){
				$('.msg1_body').hide();
				$('.msg1').hide();
				$('body').css('overflow','auto');
			});
			$('.cloesBtn').click(function(){
				$('.msg1_body').hide();
				$('.msg1').hide();
				$('body').css('overflow','auto');
			});
		});

		// 모달 카테고리 버튼 선택
		function modalCategory(testStr){
			switch(testStr){
				case '배경' : $('#modalCate1').addClass('itemType2').removeClass('itemType3'); $('#itemIntro2 > p').not('#modalCate1').removeClass('itemType2').addClass('itemType3'); break;
				case '캐릭터' : $('#modalCate2').addClass('itemType2').removeClass('itemType3'); $('#itemIntro2 > p').not('#modalCate2').removeClass('itemType2').addClass('itemType3'); break;
				case '모자' : $('#modalCate3').addClass('itemType2').removeClass('itemType3'); $('#itemIntro2 > p').not('#modalCate3').removeClass('itemType2').addClass('itemType3'); break;
				case '도구' : $('#modalCate4').addClass('itemType2').removeClass('itemType3'); $('#itemIntro2 > p').not('#modalCate4').removeClass('itemType2').addClass('itemType3'); break;
			};
			$('#hiddenItemCategory').val(testStr);
		};

		// 모달 사진 첨부 창 열리기
		$(document).on('click', '#itemImg2 > img', function(){
			$('#reUpFile').click();
		});

		// 모달 파일 첨부시 사진 미리보기
		function preview(reUptFile){
            // 파일이 첨부되었는지 확인
            if(reUptFile.files.length == 1){
                let reader = new FileReader();
                reader.readAsDataURL(reUptFile.files[0]);
                reader.onload = e => {
                    $('#itemImg2 > img').attr('src', e.target.result);
                };
            } else {
				// 새로운 파일을 첨부하지 않았을 경우 : 원래 사진을 띄워줌
				// input file 에는 value 넣지 않음
				$('#itemImg2 > img').attr('src', updateImg);
			}
        };

		// 카테고리 버튼 선택
		function selectBtn(e){
			console.log(e);
			const selectSort = e.innerText; // 선택된 버튼
			switch(selectSort){
				case '전체보기' : $('#item1').addClass('selectBtn').removeClass('noneBtn'); $('.myBtn>button').not('#item1').removeClass('selectBtn').addClass('noneBtn'); break;
				case '배경' : $('#item2').addClass('selectBtn').removeClass('noneBtn'); $('.myBtn>button').not('#item2').removeClass('selectBtn').addClass('noneBtn'); break;
				case '캐릭터' : $('#item3').addClass('selectBtn').removeClass('noneBtn'); $('.myBtn>button').not('#item3').removeClass('selectBtn').addClass('noneBtn'); break;
				case '모자' : $('#item4').addClass('selectBtn').removeClass('noneBtn'); $('.myBtn>button').not('#item4').removeClass('selectBtn').addClass('noneBtn'); break;
				case '도구' : $('#item5').addClass('selectBtn').removeClass('noneBtn'); $('.myBtn>button').not('#item5').removeClass('selectBtn').addClass('noneBtn'); break;
			};
		};

		// 필터버튼
		function selectSpan(e){
			const selectFilter = e.innerText; // 선택된 버튼
			switch(selectFilter){
				case '⦁ 전체보기' : $('#filter1').addClass('selectStatus').removeClass('noneStatus'); $('.status>span').not('#filter1').removeClass('selectStatus').addClass('noneStatus'); break;
				case '⦁ 판매중' : $('#filter2').addClass('selectStatus').removeClass('noneStatus'); $('.status>span').not('#filter2').removeClass('selectStatus').addClass('noneStatus'); break;
				case '⦁ 판매중단' : $('#filter3').addClass('selectStatus').removeClass('noneStatus'); $('.status>span').not('#filter3').removeClass('selectStatus').addClass('noneStatus'); break;
			};
		};
		
		// 카테고리 리스트 불러오기
		function selectItemList(item, filter){

			$.ajax({
				url : 'selectItemList.ad',
				data : {
					itemCategory : item,
					itemStatus : filter
				},
				success : jObj => {
					let pi = jObj.pi;
					let list = jObj.list;
					// console.log(pi);
					// console.log(list);
					let value = '';
					let status = '';
					let teset = '';

					if(list.length == 0){
						value = '<td colspan="4" class="emptyList">등록된 아이템이 없습니다.</td>';
					} else {
						
						for(let i in list){
							if(list[i].itemStatus == 'Y'){
								status = '<button class="sale" onclick="statusUpdate(this);" value="N" name="' + list[i].itemNo + '">판매중</button>';
							} else {
								status = '<button class="notSale" onclick="statusUpdate(this);" value="Y" name="' + list[i].itemNo + '">판매중단</button>';
							}

							value += '<td>'
										+ '<input type="hidden" name="category" class="category" value="' + list[i].itemCategory + '" >'
										+ '<input type="hidden" name="price" class="price" value="' + list[i].itemPrice + '" >'
										+ '<input type="hidden" name="content" class="content" value="' + list[i].itemContent + '" >'
										+ '<p> No.' + list[i].itemNo + '</p>'
										+ '<p>' + list[i].itemName + '</p>'
										+ '<div><img src="' + list[i].itemPhoto + '" /></div>'
										+ '<button class="update btn-open-popup">수정</button>'
										+ status 
								   + '</td>';

							/*
							if( i % 4 != 0){
								test = '<tr>' + value + '</tr>';
							}
							*/
						}

					}
					$('#myItem > table').html(value);
				},
				error : () => {
					console.log('실패');
				}
			});
		};
		
		// 아이템 상태 변경
		function statusUpdate(e){
			let itemNo = $(e).prop('name'); // 아이템 넘버
			let statusText = e.value; // 아이템 판매 상태

			let alertComment = '';
			if(e.innerText == '판매중'){ alertComment = '[ No. ' + itemNo + ' ] 아이템을 판매중단 하시겠습니까?'}
			else{ alertComment = '[ No. ' + itemNo + ' ] 판매중으로 변경하시겠습니까?'}
			
			if(confirm(alertComment)){
				$.ajax({
					url : 'itemSatusUpdate.ad',
					data : {
						itemNo : itemNo,
						itemStatus : statusText
					},
					success : result => {
						if(result > 0){
							selectItemList(item, filter);			
						} else {
							alert('아이템 상태 변경 실패')
						}
					},
					error : () => {
						console.log('상태변경 실패')
					}
				});
			};
		};

		// 아이템 수정
		function itemUpdate(){
		    
			if(confirm('아이템 정보를 수정하시겠습니까?')){
				var form = $('#reUpFileForm')[0];
			    var formData = new FormData(form);
			    
				$.ajax({
					url : 'itemUpdate.ad',
					type : 'post',
			        contentType : false,
			        processData : false,
					data : formData,
					success : result => {
						console.log('아이템 수정 성공');
						console.log(result);
						if(result > 0){
							$('.cloesBtn').click();
						}
						selectItemList(item, filter);
						console.log('item : ' + item + ' / filter : ' + filter);
					},
					error : () => {
						console.log('아이템 수정 실패');
					}
				});
			};
		};



	</script>

</body>
</html>