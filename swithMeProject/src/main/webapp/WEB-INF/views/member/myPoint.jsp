<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/myPoint.css">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<jsp:include page="myMenuBar.jsp" />
		</div>
		
		<div class="content">
			<div class="topBlock">포인트</div>
			
			<div id="todayPoint">
				<div>오늘 얻은 포인트</div>
				<p>${ todayPoint }</p>
				<span>point</span>
			</div><!-- 
		 --><div id="totalPoint">
		 		<div>사용 가능한 포인트</div>
				<p>${ totalPoint }</p>
				<span>point</span>
			</div>
			
			<div class="block">
				<table id="pointList">
					<thead>
						<tr>
							<th>날짜</th>
							<th>적립</th>
							<th>내용</th>
							<th>포인트</th>
						</tr>
					</thead>				
					<tbody>
						<c:set var="myTotalPoint" value="${ totalPoint }" />
						<c:set var="pointAccumulation" value="0" />
						<c:set var="pointUsage" value="0" />
						<c:set var="pointValue" value="${ myTotalPoint }" />
	
						<c:forEach items="${list}" var="p">
							<c:if test="${p.pointStatus eq 'Y'}">
								<c:set var="pointUsage" value="${myTotalPoint - p.pointScore}" />
								<c:set var="myTotalPoint" value="${pointUsage}" />
							</c:if>
							<c:if test="${p.pointStatus eq 'N'}">
								<c:set var="pointAccumulation" value="${myTotalPoint + p.pointScore}" />
								<c:set var="myTotalPoint" value="${pointAccumulation}" />
							</c:if>
	
							<tr>
								<td>${p.pointTime}</td>
								<c:choose>
									<c:when test="${p.pointStatus eq 'Y'}">
										<td>+ ${p.pointScore}</td>
									</c:when>
									<c:otherwise>
										<td>- ${p.pointScore}</td>
									</c:otherwise>
								</c:choose>
								<td>${p.pointDetail}</td>
								<td>${pointValue}</td>
							</tr>
							<c:set var="pointValue" value="${myTotalPoint}" />
						</c:forEach>
					</tbody>
				</table>
				
                <div class="paBtn">
                	<c:choose>
                      <c:when test="${ pi.currentPage eq 1 }">
                          <button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">&lt;</button>
                       </c:when>
                       <c:otherwise>
                           <button onclick="location.href='point.me?cPage=${ pi.currentPage -1 }'">&lt;</button>
                       </c:otherwise>
                    </c:choose>
                    
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
                    		<c:when test="${ p eq pi.currentPage }">
		                       <button disabled style="background-color : rgb(3, 195, 115); color : white; " onclick="location.href='point.me?cPage=${ p }'">${ p }</button>
                    		</c:when>
                    		<c:otherwise>
		                       <button onclick="location.href='point.me?cPage=${ p }'">${ p }</button>
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                      <c:when test="${ pi.currentPage eq pi.maxPage }">
                          <button disabled style="border : 1px solid rgb(175, 175, 175); color : rgb(175, 175, 175);">&gt;</button>
                       </c:when>
                       <c:otherwise>
                          <button onclick="location.href='point.me?cPage=${ pi.currentPage + 1 }'">&gt;</button>
                       </c:otherwise>
                    </c:choose>
				</div>				
			</div>
			
			<br><br><br>
		</div>
	</div>
	
	<script>
		$(function(){
			
		}); // $function
		
		
		
		
		
		
		
		
		
		
	</script>


</body>
</html>