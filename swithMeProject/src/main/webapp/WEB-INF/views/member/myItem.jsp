<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/member/myItem.css">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<jsp:include page="myMenuBar.jsp" />
		</div>
		
		<div class="content">
			<div class="character">
				<!-- 레이어 순서 : 맨뒤 배경 > 캐릭터 > 모자 > 도구 -->
				<img id="wearItem0" class="wearItem" src="" alt="도구"/>
				<img id="wearItem1" class="wearItem" src="" alt="모자"/>
				<img id="wearItem2" class="wearItem" src="" alt="배경"/>
				<img id="wearItem3" class="wearItem" src="" alt="캐릭터"/>
			</div>
			<div class="block">
				<div class="myBtn">
					<button id="myItem1" class="noneBtn" onclick="selectBtn(this);">전체보기</button>
					<button id="myItem2" class="noneBtn" onclick="selectBtn(this);">배경</button>
					<button id="myItem3" class="noneBtn" onclick="selectBtn(this);">캐릭터</button>
					<button id="myItem4" class="noneBtn" onclick="selectBtn(this);">모자</button>
					<button id="myItem5" class="noneBtn" onclick="selectBtn(this);">도구</button>
				</div>

				<!-- 아이템목록 -->
				<div id="myItem">
					<!-- 리스트 반복 -->
				</div>
			</div>
			<br><br><br>
		</div>
	</div>

	<script>
		let item = '';
		
		$(function(){
			myCharacter(); // 내 캐릭터
			console.log($('#wearItem' + 0).attr('alt'))
			
			$('#myItem1').click(); // 배경버튼 자동 클릭
			
			item = '전체보기';
			selectMyItemList(item);

			// 카테고리 변경 때마다 함수 호출
			$('.myBtn > button').click(function(e){
				item = e.target.innerText;
				selectMyItemList(item);
			});
		});

		// 카테고리 버튼 선택
		function selectBtn(e){
			const selectSort = e.innerText; // 선택된 버튼
			switch(selectSort){
				case '전체보기' : $('#myItem1').addClass('selectBtn').removeClass('noneBtn'); $('.myBtn>button').not('#myItem1').removeClass('selectBtn').addClass('noneBtn'); break;
				case '배경' : $('#myItem2').addClass('selectBtn').removeClass('noneBtn'); $('.myBtn>button').not('#myItem2').removeClass('selectBtn').addClass('noneBtn'); break;
				case '캐릭터' : $('#myItem3').addClass('selectBtn').removeClass('noneBtn'); $('.myBtn>button').not('#myItem3').removeClass('selectBtn').addClass('noneBtn'); break;
				case '모자' : $('#myItem4').addClass('selectBtn').removeClass('noneBtn'); $('.myBtn>button').not('#myItem4').removeClass('selectBtn').addClass('noneBtn'); break;
				case '도구' : $('#myItem5').addClass('selectBtn').removeClass('noneBtn'); $('.myBtn>button').not('#myItem5').removeClass('selectBtn').addClass('noneBtn'); break;
			};
		};

		// 아이템 리스트
		function selectMyItemList(item){
			$.ajax({
				url : 'selectMyItemList.ad',
				data : {
					itemCategory : item
				},
				success : jObj => {
					let pi = jObj.pi;
					let list = jObj.list;
					// console.log(pi);
					console.log(list);
					let value = '';
					let status = '';
					let teset = '';

					if(list.length == 0){
						value = '<td colspan="4" class="emptyList">등록된 아이템이 없습니다.</td>';
					} else {
						
						for(let i in list){
							if(list[i].wearStatus == 'Y'){
								status = '<button class="wear" onclick="wearUpdate(this);" value="N" name="' + list[i].itemNo + '">착용중</button>';
							} else {
								status = '<button class="notWear" onclick="wearUpdate(this);" value="Y" name="' + list[i].itemNo + '">미착용</button>';
							}

							value += '<div class="tableList">'
										+ '<input type="hidden" name="category" class="category" value="' + list[i].itemCategory + '" >'
										+ '<input type="hidden" name="price" class="price" value="' + list[i].itemPrice + '" >'
										+ '<input type="hidden" name="content" class="content" value="' + list[i].itemContent + '" >'
										+ '<p>' + list[i].itemName + '</p>'
										+ '<div><img src="' + list[i].itemPhoto + '" /></div>'
										+ '<button class="deleteItemBtn" onclick="deleteItem(' + list[i].itemNo + ');">삭제</button>'
										+ status 
								   + '</div>';
						}

					}
					$('#myItem').html(value);
				},
				error : () => {
					console.log('실패');
				}
			});
		};

		// 아이템 삭제
		function deleteItem(itemNo){
			if(confirm('아이템 삭제 시 복구가 불가능합니다. 삭제하시겠습니까?')){
				$.ajax({
					url : 'deleteItem.me',
					data : {
						memberId : '${ loginMember.memberId }',
						itemNo : itemNo
					},
					success : result => {
						if(result > 0){
							alert('아이템이 삭제되었습니다.');
							selectMyItemList(item);
						}
					},
					error : () => {
		
					}
				});
			};
		};
		
		// 착용 아이템
		function myCharacter(){
			let wearItemArr = $('.wearItem');
			
			$.ajax({
				url : 'myCharacter.me',
				data : {
					memberId : '${ loginMember.memberId }'
				},
				success : list => {
					console.log(list);
					value = '';
					for(let i in list){
						// 순서 : 도구 > 모자 > 배경 > 캐릭터
						$('.wearItem').each(function(){
							let imgAlt = $(this).attr('alt');
							
							if(list[i].itemCategory == imgAlt){
								$(this).attr('src', list[i].itemPhoto);
								$(this).css('display', 'inline');
							};
						});
					};

					// $('.wearItem').each(function(){
					// 	if($(this).attr('src') == ''){
					// 		$(this).css('display', 'none');
					// 	}
					// });

				},
				error : () => {
				}
			});
		};

	</script>
</body>
</html>