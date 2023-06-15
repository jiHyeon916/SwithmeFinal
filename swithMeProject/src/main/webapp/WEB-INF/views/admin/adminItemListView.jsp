<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/adminItemListView.css">
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
                <span onclick="location.href='itemEnrollForm.ad'">아이템등록</span>
            </div>

			<div class="block">
				<div class="myBtn">
					<button>배경</button>
					<button>캐릭터</button>
					<button>모자</button>
					<button>도구</button>
				</div>
                <div class="status">
                    <span>⦁ 전체보기</span>
                    <span>⦁ 판매중</span>
                    <span>⦁ 판매중단</span>
                </div>

                <!-- 아이템목록 -->
				<div id="myItem">
					<table>
						<tr>
							<td>
								<p>No.153</p>		
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button class="testBtn">수정</button>				
								<button>판매중</button>				
							</td>
							<td>
								<p>No.153</p>		
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button class="testBtn">수정</button>				
								<button>판매중</button>			
							</td>
							<td>
								<p>No.153</p>		
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button class="testBtn">수정</button>				
								<button>판매중</button>		
							</td>
							<td>
								<p>No.153</p>		
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button class="testBtn">수정</button>				
								<button>판매중</button>				
							</td>
						</tr>
						<tr>
							<td>
								<p>No.153</p>		
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button>미착용</button>				
								<button>삭제</button>				
							</td>
							<td>
								<p>No.153</p>		
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button class="testBtn">수정</button>				
								<button>판매중</button>				
							</td>
							<td>
								<p>No.153</p>		
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button class="testBtn">수정</button>				
								<button>판매중</button>				
							</td>
							<td>
								<p>No.153</p>		
								<p>아이템이름</p>		
								<div><img src="resources/images/member/none.jpeg" /></div>	
								<button class="testBtn">수정</button>				
								<button>판매중</button>				
							</td>
						</tr>
					</table>
				</div>
			</div>
			<br><br><br>
		</div>
	</div>

</body>
</html>