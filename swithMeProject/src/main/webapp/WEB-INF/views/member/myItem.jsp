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
			<div id="character"></div>
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
					<table>
						<!-- 리스트 반복 -->
					</table>
				</div>

				<!-- <div id="myItem2">
					<table>
						<tr>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button id="testBtn">미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
						</tr>
						<tr>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td> 
						</tr>
					</table>
				</div> -->
			</div>
			<br><br><br>
		</div>
	</div>

	<script>
		let item = '';
		
		$(function(){
			$('#myItem1').click(); // 배경버튼 자동 클릭
			
			item = '전체보기';
			selectMyItemList(item);

			// 카테고리 변경 때마다 메소드 호출
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

							value += '<td>'
										+ '<input type="hidden" name="category" class="category" value="' + list[i].itemCategory + '" >'
										+ '<input type="hidden" name="price" class="price" value="' + list[i].itemPrice + '" >'
										+ '<input type="hidden" name="content" class="content" value="' + list[i].itemContent + '" >'
										+ '<p>' + list[i].itemName + '</p>'
										+ '<div><img src="' + list[i].itemPhoto + '" /></div>'
										+ '<button class="deleteItemBtn">삭제</button>'
										+ status 
								   + '</td>';
						}

					}
					$('#myItem > table').html(value);
				},
				error : () => {
					console.log('실패');
				}
			});
		};
		


	</script>
</body>
</html>