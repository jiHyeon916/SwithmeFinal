<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/adminItemListView.css">
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
						<tr>
						
						</tr>
					</table>
				</div>
			</div>
			<br><br><br>
		</div>
	</div>

	<script>
		
		$(function(){
			$('#item1').click(); // 배경버튼 자동 클릭
			$('#filter1').click(); // 전체보기 버튼 자동 클릭

			// 페이지 첫 로드 시
			let item = '배경';
			let filter = 'all';
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

		// 카테고리 버튼 선택
		function selectBtn(e){
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
			console.log('item : ' + item);
			console.log('filter : ' + filter);

			$.ajax({
				url : 'selectItemList.ad',
				data : {
					itemCategory : item,
					itemStatus : filter
				},
				success : jObj => {
					let pi = jObj.pi;
					let list = jObj.list;
					console.log(pi);
					console.log(list);
					value = '';

					if(list.length == 0){
						value = '<tr><td colspan="4"><span class="emptyList">등록된 아이템이 없습니다.</span></td></tr>';
					} else {

						for(let i in list){
							value += '<td>'
								   + '<p> No.' + list[i].itemNo + '</p>'
								   + '<p>' + list[i].itemName + '</p>'
								   + '<div><img src="' + list[i].itemPhoto + '" /></div>'
								   + '<button class="testBtn">수정</button>'
								   + '<button>판매중</button>'
								   + '</td>';
						}
					}
					$('#myItem').html(value);
				},
				error : () => {
					console.log('실패');
				}
			});
		};



	</script>

</body>
</html>