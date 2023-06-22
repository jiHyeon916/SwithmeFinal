<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- MemberCss -->
    <link rel="stylesheet" href="/swithme/resources/css/band/bandMember.css">
</head>
<body>

	<jsp:include page="bandHeader.jsp"/>
	
	<div class="wrap">
		<jsp:include page="bandSideBar.jsp"/>
		    <div id="blank">.</div>

	    <div class="mainDiv">
	    	<br><br>
	    	<div>
		        <span class="Writer">
	       			<strong class="menuInfo">밴드 멤버</strong>
	       		</span>
	    	</div>
	    	<br><br><br>
	    	
	    	<div class="bandMemList">
	    		<ul>
	    			<c:forEach var="ml" items="${ memList }">
		    			<li class="bandMemTitle">
		    				<div class="bMember">
		    					<span class="bandNic">${ ml.memberId }</span>
		    					<c:if test="${ ml.sort eq '리더' }">
		    						<p class="bLeader"> 리더</p>
		    					</c:if>
								
								<input type="hidden" class="sNo" name="sbNo" value="">
								<input type="hidden" id="memId" class="memId" name="memId" value="${ ml.memId }">
								<c:if test="${bandInfomation.memberIdId eq loginMember.memberId}">
			    					<c:if test="${ ml.sort eq '일반' }">
				    					<span id="pointT"><button class="bMemberBtn" data-toggle="modal" data-target="#banishBandMember">강제탈퇴</button></span>			
			    					</c:if>
								</c:if>

		    				</div>
		    			</li>
	    			</c:forEach>	    			
	    		</ul>
	    	</div>
	    </div>
	</div>
	
		<!--밴드 강제탈퇴창-->
       	<div class="modal" id="banishBandMember">
        	<div class="modal-dialog">
            	<div class="modal-content">
            
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">밴드 강제 탈퇴</h4>
	                </div>
	                
	                <!-- Modal body -->
	                <div class="modal-body">
	                    <form action="deleteMem.sb" method="post">
	                 		<br>
	                        <div class="form-group">
	                        	<p class="textModal"></p>
	                        	<input type="hidden" id="delMem" name="deleteMem" value="">
	                        	<input type="hidden" class="sNo" name="sbNo" value="">
	                        </div>
	                        <br>
	                        <div class="btnGroup">
		                        <button id="banish" class="enrollConfirm" type="submit">탈퇴</button>
		                        <button class="enrollDismiss" type="button" data-dismiss="modal">취소</button>
	                        </div>
	                    </form>
	                </div>
            	</div>
        	</div>
		</div>

	<script>

		$(function(){
			var query = window.location.search;     
			var param = new URLSearchParams(query);
			var sno = param.get('sno');
			
			$('.sNo').attr('value', sno);
			console.log($('.sNo').val());

		}); 

		
		$(document).on('click', '.bMemberBtn', function(){
			var Btn = $(this).parent().siblings('.bandNic').html();
			var mem = $(this).parent().siblings('.memId').val();
			
			console.log(mem);
			$('#delMem').attr('value', mem);
			$('.textModal').html('"' + Btn + '"' + '님을 탈퇴시키시겠습니까?');
		});

		$(document).on('click', '#banish', function(){
			// console.log(message);
			alert('강제탈퇴 완료되었습니다.');

		});
	</script>


	<br><br><br>
</body>
</html>