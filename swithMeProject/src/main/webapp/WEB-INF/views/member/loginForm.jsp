<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<style>

     #loginTitle{
        color: rgb(3, 195, 115);
    }

    #loginMember{
        background-color: rgb(240, 240, 240);
        border-radius: 20px;
        width: 490px;
        margin: auto;
    }
    
    #loginMember table td{
        width: 150px;
    }
   
   #loginMember button{
        background-color: rgb(3, 195, 115);
        border: none;
        border-radius: 5px;
        width: 285px;
        height: 35px;  
        color : white;
        
    }
    
  
     
    #loginMember input{
    border-radius: 5px;
    border-color: lightgray;
    border-style: double;
    height: 23px;
    width: 200px;
    font-size:12px;
}
    #loginMember input:focus{
  	  border-color:rgb(3, 195, 115);
  	  outline: none;
  	  
}
    #loginMember a{
        text-decoration: none;
        color: black;
        font-size: 14px;
        color: rgb(85, 85, 85);
        
    }
    #loginMember table{
    	margin-left:90px;
    }

</style>
<body>
    
    
    <jsp:include page="../common/header.jsp"/><br><br><br>
    
    

    <h1 id="loginTitle" align="center">로그인</h1><br><br>
    
    <form action="login.me" method="post">
    
        <div id="loginMember">
            <table border="0" align="center" width="180px;">
                <br><br>
                <tr>
                    <th>아이디</th>
                    <td colspan="2"><input type="text" name="memberId"  required placeholder=" 아이디를 입력해주세요." ></td>
                </tr>
                <tr><td><br></td></tr>
                
                <tr>
                    <th>비밀번호</th>
                    <td colspan="2"><input type="password" required placeholder=" 비밀번호를 입력해주세요."></td>
                </tr><td><br></td></tr>
                
                <tr>
                    <td colspan="3"><button >로그인</button></td>
                    
                </tr><td><br></td></tr>
               

                <tr>
                    <td style=" text-align:right;"><a href="searchIdForm.me">아이디 찾기 </a></td>
                    <td style=" width: 120px; text-align:right;"><a href="searchPwdForm.me">비밀번호 찾기</a></td>
                    <td style=" width: 90px; text-align:right;"><a href="memberEnrollForm.me">회원가입</a></td>
                </tr><td><br></td></tr>

            </table>
        </div><br><br><br><br><br><br>
 					<jsp:include page="../common/footer.jsp"/>
    </form>
    
    
    <script>
    
    	
    
    
    </script>
    
    
    
    
    
</body>
</html>