<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>


<style>
#title{
 color: rgb(3, 195, 115);
 margin : 30px !important;
}

#con{
	width : 490px;
	margin : 0 auto;
	margin-top : 100px;
}
#updateMember{
    background-color: rgb(240, 240, 240);
    border-radius: 20px;
    width: 490px;
    height:730px;
}

.btn123{
   background-color: rgb(3, 195, 115);
   border: none;
   border-radius: 5px;
   margin: 3px;
   color: white;
   width:70px;
   font-size:14px;
   
   
  
}

.btn123:hover{
    cursor: pointer;
}

#updateMember  input{ 
    border-radius: 5px;
    border-color: lightgray; 
    border-style: double;
    height: 30px;
    font-size: 13px;
    
 
    
}
 #updateMember input:focus{
  	  border-color:gray;
  	  outline: none;
  	  
}

#idMessage{
	color:gray;
}
#pwdMessage{
	color:gray;
	background-color: rgb(241, 88, 88);
	
}

#enrollBtn{
	background-color : gray;
	}




</style>
<body>

	<jsp:include page="../common/header.jsp"/>

<div id="con">
    <form action="update.mem" method="post">
    <h1 id="title" align="center">정보수정</h1><br>
        <div id="updateMember">
            <table  style="margin-left: 115px;">
               
               <br>
                <tr>
                    <th align="left">아이디</th>
                </tr>
                <tr>
                    <td><input id="writeId"  type="text" name="memberId" value="${loginMember.memberId }" style="width:225px; background-color:lightgray;" readonly ><br>
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">새 비밀번호</th>
                </tr>
                <tr>
                    <td><input id="writePwd" type="password" name="memberPwd" placeholder="변경할 비밀번호를 입력하세요" style="width:225px" required></td>
                </tr>
                <tr>
                  <td style="font-size: 10px; " id="checkPwd"> </td>
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">비밀번호 재확인</th>
                </tr>
                <tr>
                    <td><input id="writePwdCheck" type="password" nmae="memberPwdChk"  style="width:225px" required ></td><br>
                </tr>
                <tr>
                  <td style="font-size: 10px; " id="RecheckPwd"> </td>
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">이름</th>
                </tr>
                <tr>
                    <td><input id="writeName" type="text" name="memberName" value="${loginMember.memberName }" style="width:225px" required></td>
                </tr>
                 <tr>
                 <tr>
                  <td style="font-size: 10px; " id="checkName"> </td>
                </tr><td><br></td></tr>
                <tr>
                    <th align="left">닉네임</th>
                </tr>
                <tr>
                    <td><input id="writeNick" type="text" name="nickName"   value ="${loginMember.nickName }" style="width:225px" required></td>
                </tr>
                <tr>
                  <td style="font-size: 10px; " id="checkNick"> </td>
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">이메일</th>
                </tr>
                <tr>
                    <td><input  id="writeEmail" type="email" name="memberEmail" value="${loginMember.memberEmail }" style="width:225px;" required></td>
                </tr>
                <tr>
                <tr>
                  <td style="font-size: 10px; " id="checkMail"> </td>
                </tr><td><br></td></tr>
                    <td><button  style="width:233px; height: 35px; color: white;"  class="btn123" id="enrollBtn" >수정하기</button></td>
                </tr>  <tr><td><br></td></tr>
                
            </table>
		</div>
		
    </form>
   </div>
   
   <br><br><br><br><br><br>
 					<jsp:include page="../common/footer.jsp"/>
 					
    <script>
    
    const enrollBtn = $('#enrollBtn');
   
   
	//기존 비밀번호 확인
	 $(function() {
		 //let chkPwd = /^[a-zA-Z\d!@#$%^]{8,16}/;
		 
		   const exeistPwdchk = $('#exeistPwdchk');
		   const EpwdInput = $('#passwordChk');
		   //const memId = $('#writeId');
		   
		   EpwdInput.keyup(function() {
			   
				if(EpwdInput.val() == ''){
					EpwdInput.css('border-color', 'red');
					exeistPwdchk.css('color', 'red').html('필수 입력사항입니다.');
				    enrollBtn.attr('disabled', true).css('background-color', 'gray');
					
				}else{
					
					   	$.ajax({
					   		
					   			url : 'memberPwdChk.me',
					   			data : {memberPwd : EpwdInput.val()},
						   		success : function(result) {
						   				console.log(result);
						   				
						   				if(result == 'true'){
						   					$('#checkPwd').html('기존의 비밀번호와 일치합니다.');
						   				}else{
						   					$('#checkPwd').html('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
						   				}
						   			
						   		},error : () => {console.log('실패');}
					   	});
				}	   
		   
		   
		   });
	 }); 
		 
		   
		   
	   
		   
	  
	   
	   
	   
	   
	   
	   
	   
 
   
    //새 비밀번호
    $(function() {
		  let chkPwd = /^[a-zA-Z\d!@#$%^]{8,16}/;
		
		  const pwdInput = $('#writePwd');
		  const pwdChkInput = $('#writePwdCheck');
		  const cehckPwd = $('#checkPwd');
		  const RecheckPwd = $('#RecheckPwd');
		 
		  pwdInput.keyup(function() {
		    if (pwdInput.val() === '') {	//조건 1
		      pwdInput.css('border-color', 'red');
		      cehckPwd.css('color', 'red').html('비밀번호는 필수 입력사항입니다.');
		      enrollBtn.attr('disabled', true).css('background-color', 'gray');
		      
		    } else if (!chkPwd.test(pwdInput.val())) {  //조건2 정규식조건을 만족하지 않을때
		    	
			      if (pwdInput.val() !== pwdChkInput.val()) {// 비밀번호 재확인(일치하지 않을때)
				        pwdChkInput.css('border-color', 'red');
				        RecheckPwd.css('color', 'red').html('비밀번호가 일치하지 않습니다.');
				        enrollBtn.attr('disabled', true).css('background-color', 'gray');
				        
				      } else { // (일치할때)
				        pwdChkInput.css('border-color', 'rgb(3, 195, 115)');
				        RecheckPwd.css('color', 'rgb(3, 195, 115)').html('비밀번호가 일치합니다.');
				        enrollBtn.removeAttr('disabled').css('background-color', 'rgb(3, 195, 115)');
				      }
		      pwdInput.css('border-color', 'red');
		      cehckPwd.css('color', 'red').html('8~16자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
		      enrollBtn.attr('disabled', true).css('background-color', 'gray');
		      
		    } else { // 비밀번호 조건맞춰입력 3
		      pwdInput.css('border-color', 'rgb(3, 195, 115)');
		      cehckPwd.css('color', 'rgb(3, 195, 115)').html('올바른 비밀번호입니다.');
			      
			      if (pwdInput.val() !== pwdChkInput.val()) {// 비밀번호 재확인(일치하지 않을때)
			        pwdChkInput.css('border-color', 'red');
			        RecheckPwd.css('color', 'red').html('비밀번호가 일치하지 않습니다.');
			        enrollBtn.attr('disabled', true).css('background-color', 'gray');
			        
			      } else { // 일치할때
			        pwdChkInput.css('border-color', 'rgb(3, 195, 115)');
			        RecheckPwd.css('color', 'rgb(3, 195, 115)').html('비밀번호가 일치합니다.');
			        enrollBtn.removeAttr('disabled').css('background-color', 'rgb(3, 195, 115)');
			        
			      }
			    }
			  });
		  
		  pwdChkInput.keyup(function() { // 비밀번호 재확인 keyup
		    if (pwdInput.val() !== pwdChkInput.val()) {
		      pwdChkInput.css('border-color', 'red');
		      RecheckPwd.css('color', 'red').html('비밀번호가 일치하지 않습니다.');
		      enrollBtn.attr('disabled', true).css('background-color', 'gray');
		      
		    } else {
		      pwdChkInput.css('border-color', 'rgb(3, 195, 115)');
		      RecheckPwd.css('color', 'rgb(3, 195, 115)').html('비밀번호가 일치합니다.');

		      	if (chkPwd.test(pwdInput.val())) {
		      		RecheckPwd.css('color', 'rgb(3, 195, 115)').html('비밀번호가 일치합니다.');
		        	enrollBtn.removeAttr('disabled').css('background-color', 'rgb(3, 195, 115)');
		        }
		      }
		   });
		});
    
	  
    
    //이름
    $(function() {
    	
    	let chkName = /^[가-힣]{2,7}$/;
    	const nameInput = $('#writeName');
    	const checkName = $('#checkName');
    	
    	nameInput.keyup(function() {
    		
    		if(!chkName.test(nameInput.val())){ //정규표현식에 맞지 않으면
    			checkName.css('color','red').html('이름은 필수 입력사항입니다.');
    			enrollBtn.attr('disabled', true).css('background-color', 'gray');
    			nameInput.css('border-color','red');
    		}else{ //OK
    			nameInput.css('border-color','rgb(3, 195, 115)');	
    			checkName.css('color','rgb(3, 195, 115)').html('멋진 이름이네요 !');
    			enrollBtn.removeAttr('disabled').css('background-color', 'rgb(3, 195, 115)');
    		}
    	});
    });
    
    
    
    //닉네임중복
    $(function() {
    	
    	let chkNick = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;  //2자 이상 16자 이하, 영어 또는 숫자 또는 한글로 구성, 	*한글 초성 및 모음은 허가하지 않는다.
	
    	const nickInput = $('#writeNick');
    	const nickBtn = $('#nickBtn');
    	const checkNick = $('#checkNick');
    	
    	
    	nickInput.keyup(function() {
    		
    		if(!chkNick.test(nickInput.val())){ //사용자가 입력한 값이 정규표현식이랑 같지 않으면
    			checkNick.css('color','red').html('2~16자 이하 영어 또는 숫자 또는 한글로 입력해주세요.');
    			nickInput.css('border-color','red');
				enrollBtn.attr('disabled', true).css('background-color', 'gray');
    			
    		}else{
    			
    				$.ajax({
	    					url : 'nickCheck.me',
	    					data : {checkNick : nickInput.val()},
	    					success : function(result){
    						
	    						if(result == 'N'){ //존재할때
	    							checkNick.css('color','red').html('이미 존재하는 닉네임 입니다.');
	    							nickInput.css('border-color','red');
	    							enrollBtn.attr('disabled', true).css('background-color', 'gray');
	    						}else{ //성공
	    							checkNick.css('color','rgb(3, 195, 115').html('센스있는 닉네임이네요 !');
	    							nickInput.css('border-color','rgb(3, 195, 115)');	
	    							enrollBtn.removeAttr('disabled').css('background-color', 'rgb(3, 195, 115)');
	    						};
	    					},error: () => {console.log('실패');}
	    				});
    		  		 }
    	 		 });
    		});
    			
    	
	
    	//이메일
       	$(function() {
       		
       		 var chkMail =  /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
       		 const emailInput = $('#writeEmail');
       		 const checkMail = $('#checkMail');
       		
       		 	emailInput.keyup(function() {
       			
       			 if(!chkMail.test(emailInput.val())){
       				emailInput.css('border-color','red');
       				checkMail.html('올바른 형식으로 작성해주세요.').css('color','red');
       				enrollBtn.attr('disabled', true).css('background-color', 'gray');
       			 }else{

						$.ajax({
							
							url : 'emailCheck.me',
							data : {checkEmail : emailInput.val()},
							success : function(result) {
								
								if(result == 'N'){ // 이메일 존재할 때
									checkMail.html('이미 존재하는 이메일 입니다.').css('color','red');
									emailInput.css('border-color','red');
								}else{
									checkMail.html('사용 가능한 이메일입니다.').css('color','rgb(3, 195, 115)');
									enrollBtn.removeAttr('disabled').css('background-color', 'rgb(3, 195, 115)');
									emailInput.css('border-color','rgb(3, 195, 115)');
								}
							},error : () => {console.log('실패');}
						});
       				 }
       		 	});
			});
        		
    </script>
   

    
  
</body>
</html>