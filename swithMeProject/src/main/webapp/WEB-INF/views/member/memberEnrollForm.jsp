<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
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
#joinMember{
    background-color: rgb(240, 240, 240);
    border-radius: 20px;
    width: 490px;
    height:640px;
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

#joinMember  input{ 
    border-radius: 5px;
    border-color: lightgray; 
    border-style: double;
    height: 30px;
    font-size: 13px;
    
 
    
}
 #joinMember input:focus{
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
    <form action="join.mem" method="post">
    <h1 id="title" align="center">회원가입</h1><br>
        <div id="joinMember">
            <table  style="margin-left: 115px;">
               
               <br>
                <tr>
                    <th align="left">아이디</th>
                </tr>
                <tr>
                    <td><input id="writeId"  type="text" name="memberId" placeholder=" 아이디를 입력하세요" style="width:225px" required><br>
                </tr>
                <tr>
                   <td style="font-size: 10px; " id="checkId"> </td>
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">비밀번호</th>
                </tr>
                <tr>
                    <td><input id="writePwd" type="password" name="memberPwd" placeholder=" 비밀번호를 입력하세요" style="width:225px" required></td>
                </tr>
                <tr>
                  <td style="font-size: 10px; " id="checkPwd"> </td>
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">비밀번호 재확인</th>
                </tr>
                <tr>
                    <td><input id="writePwdCheck" type="password" nmae="memberPwdChk"  style="width:225px" required ></td><br>
                    
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">이름</th>
                </tr>
                <tr>
                    <td><input id="writeName" type="text" name="memberName"  style="width:225px" required></td>
                </tr>
                 <tr>
                 <tr>
                  <td style="font-size: 10px; " id="checkName"> </td>
                </tr><td><br></td></tr>
                <tr>
                    <th align="left">닉네임</th>
                </tr>
                <tr>
                    <td><input id="writeNick" type="text" name="nickName"  style="width:160px" required><button type="button" style="height: 27px;" class="btn123" id="nickBtn" >중복확인</button></td>
                </tr>
                <tr>
                  <td style="font-size: 10px; " id="checkNick"> </td>
                </tr><tr><td><br></td></tr>
                <tr>
                    <th align="left">이메일</th>
                </tr>
                <tr>
                    <td><input  id="writeEmail" type="email" name="userEmail"  style="width:160px" required><button type="button" style="height: 27px;" class="btn123" >메일확인</button></td>
                </tr>
                <tr><td><br></td></tr>
                    <td><button type="button" style="width:233px; height: 35px; color: white;"  class="btn123" id="enrollBtn" disabled>가입하기</button></td>
                </tr>  <tr><td><br></td></tr>
                
            </table>
		</div>
		
    </form>
   </div>
   
   <br><br><br><br><br><br>
 					<jsp:include page="../common/footer.jsp"/>
 					
 
    <script>
    
    
   
   
    // 정규표현식에 맞으면 초록색 테두리
    // 정규표현식에 맞지 않으면 빨간색 테두리
   //아이디 중복체크
    $(function() {

    	 let chkId = /^[a-zA-Z0-9\d-_^]{4,19}$/;
    	 
    	const idInput = $('#writeId');
    	
        idInput.keyup(function() {
        	
        	//console.log(idInput.val());
			//공백 
			if(idInput.val() === '') {
				$('#checkId').css('color','gray').html('아이디는 필수 입력사항입니다.');
				
			
			//정규표현식에 맞지 않을때
			}else if(!chkId.test(idInput.val())) {
				idInput.css('border-color','gray');
				$('#checkId').css('color','gray').html('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
				
			}else {
				
				//아이디 중복체크
				$.ajax({
					
					url : 'idCheck.me',
					data : {checkId : idInput.val()},
					success : function(result) {
						
						if(result === "N"){
							$('#checkId').css('color','gray').html('중복된 아이디가 존재합니다.');
							
						}else{
							idInput.css('border-color','rgb(3, 195, 115)');
							$('#checkId').css('color','rgb(3, 195, 115)').html('사용가능한 아이디입니다.');
						}
					},
					error : function(){
						console.log('아이디 중복');
					}
				});
	     	  }
	      });
	  });
		  
   
    
    //비밀번호
    $(function() {
    	
    	let chkPwd = /^[a-zA-Z\d!@#$%^]{8,16}/;
    	
    	const pwdInput = $('#writePwd');
    	
    	pwdInput.keyup(function() {
    	
    		if(pwdInput.val() === ''){
    			pwdInput.css('border-color','gray');
    			$('#checkPwd').css('color','gray').html('비밀번호는 필수 입력사항입니다.');
				
    		
    		}else if(!chkPwd.test(pwdInput.val())) {
    			
	    		pwdInput.css('border-color','gray');
				$('#checkPwd').css('color','gray').html('8~16자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
				
		    	} else {
		    		
		    		pwdInput.css('border-color','rgb(3, 195, 115)');	
		    		
		    	}
    	
		      });
			});
    	
    
    
    
    //비밀번호 재확인
    $(function() {
    	
    const pwdChkInput = $('#writePwdCheck');
    const pwdInput = $('#writePwd');
    
    pwdChkInput.keyup(function() {

    	if(pwdInput.val() === pwdChkInput.val()){
    		pwdChkInput.css('border-color','rgb(3, 195, 115)');	
    	
    	}else{
    		pwdChkInput.css('border-color','gray');	
    		
			
			return false;
    	}
    });
   });
    
    	
    	
    
    //이름
    $(function() {
    	
    	let chkName = /^[가-힣]{2,7}$/;
    	
    	const nameInput = $('#writeName');
    	
    	nameInput.keyup(function() {
    		
    		console.log(nameInput.val());
    		
    		
    		if(!chkName.test(nameInput.val())){ //정규표현식에 맞지 않으면
    			$('#checkName').css('color','gray').html('이름은 필수 입력사항입니다.');
    			nameInput.css('border-color','gray');	
    			
    			
    		}else{ //OK
    			nameInput.css('border-color','rgb(3, 195, 115)');	
    			
    		}
    	});
    });
    
    
    
    //닉네임
    $(function() {
    	
    	let chkNick = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;  //2자 이상 16자 이하, 영어 또는 숫자 또는 한글로 구성, 	*한글 초성 및 모음은 허가하지 않는다.
	
    	const nickInput = $('#writeNick');
    	
    	nickInput.keyup(function() {
    		
    		console.log(nickInput.val());
    		
    		if(!chkNick.test(nickInput.val())){ //사용자가 입력한 값이 정규표현식이랑 같지 않으면
    			$('#nickBtn').attr('disabled', true);
    			$('#checkNick').css('color','gray').html('2~16자 이하 영어 또는 숫자 또는 한글로 입력해주세요.');
    			nickInput.css('background-color','rgb(226, 222, 222)');
    		}else{
    			
    			$('#nickBtn').removeAttr('disabled', true);
    			nickInput.css('background-color','white');
    			$('#nickBtn').click(function() {
    				
    				$.ajax({
    					
    					url : 'nickCheck.me',
    					data : {checkNick : nickInput.val()},
    					success : function(result){
    						

    						if(result == 'N'){ //존재할때
    							$('#checkNick').css('color','red').html('이미 존재하는 닉네임 입니다.');
    							nickInput.css('border-color','gray');
    							
    						
    						}else{ //성공
    							$('#checkNick').css('color','rgb(3, 195, 115').html('사용가능한 닉네임입니다.');
    							nickInput.css('border-color','rgb(3, 195, 115)');	
    						
    						};
    					},
    					error: () => {
    						console.log('실패');
    					}
    				});
    			});
    		  }
    	  });
      });
     		
 
    
    
    
    
    //이메일 중복확인 안누르고 가입하기 눌렀을때 예외처리
    $(function() {
    	
    	 count = 0;
    	
    
    	
    	$('#nickBtn').on('click',function() {
    		count ++;	
    		//console.log(count);
    	});
    
    	
   	<%--
   	 $(function() {
   	    	$('#enrollBtn').click(function() {
   	    		if(allInputs === ''){
   	    			alert('필수입력사항을 입력해주세요.');
   	    		}
   	    		if(count == 0){
   	    			alert('닉네임 중복확인이 필요합니다.');
   	    			$('#nickBtn').focus();
   	    			
   	    			return false;
   	    		}else{
   	    			$('#enrollBtn').removeAttr('disabled',true);
   	    		}
   	    		
   	    	});
   	    })	
    	--%>		
  });
    
    	
    $(function() {
    	
    	
    	
    	var allInputs = $('form input');//배열로옴
    	
    	var test = document.getElementsByTagName('input').innerText;
		console.log(test2);
    	// console.log(allInputs);
    	

		var test = '';
    	$(allInputs).each(function(index, item){
    		if(item.val() == ''){
				test += 1;
			}
			
		});
    	
		if(test == 6){
			$('#enrollBtn').removeAttr('disabled');
		}
    		/*
    		 for(var i in allInputs){
    			
    		 	if(allInputs[i].val() !== ""){
    				
    		 		$('#enrollBtn').removeAttr('disabled');
    				
    			
    	
    			
    			
    			
    			
    			
    			
    			
    		 };
    	
    		 };
    */
    });
    
    
    function () {
    	
		var allInputs = $('form input');//배열로옴
    	
    
			
	
    		
	
    		
    		 for(var i in allInputs){
    			
    		 	if(allInputs.eq(i).val() !== ''){
    		 		
    		 	
    				
    		 		
    				$('#enrollBtn').css('background-color', 'rgb(3, 195, 115)');
    				$('#enrollBtn').removeAttr('disabled');
    			
    		 };
    			
    		
    	
    }
    }
    	/*
 	   var allInputs = $('form input');//배열로옴
 	   
    	console.log( $('form input').val());
 	   
 	   
 	   
 	  
 	 
    	var test = document.getElementsByTagName('input').val();
		console.log(test);
    	// console.log(allInputs);
    	

		var test = '';
    	$(allInputs).each(function(index, item){
    		if(item.val() == ''){
				test += 1;
				
			}
			
		});
    	
		if(test == 6){
			$('#enrollBtn').removeAttr('disabled');
    	
    	
    } 
    
 }

	/*  let test = document.getElementsByTagName('input').value;
	 
 	console.log(test);
	 var vari = ''
	 $(test).each(function(index, item){
	 
	    if(item != ''){
	       vari += 1
	    }
	 });
	 
	 if(vari == 6){
		 $('#enrollBtn').removeAttr('disabled');
	 }
	} */

    </script>
   

    
  
</body>
</html>