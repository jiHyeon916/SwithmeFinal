<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 폼 </title>
</head>
<style>

   #searchPwdTitle{
        color: rgb(3, 195, 115);
    }

    #searchPwdForm{
        background-color: rgb(240, 240, 240);
        border-radius: 20px;
        width: 490px;
        margin: auto;
    }
    
    #searchPwdForm table td{
        width: 150px;
    }
   
   #searchPwdForm button{
        background-color: rgb(3, 195, 115);
        border: none;
        border-radius: 5px;
        width: 285px;
        height: 35px;
        margin-left: 20px; 
        color: white;
        
    }
     #searchPwdForm input{
    border-radius: 5px;
    border-color: lightgray;
    border-style: double;
    height: 23px;
    width: 200px;
    font-size:12px;
}
   #searchPwdForm input:focus{
    border-color:rgb(3, 195, 115);
    outline: none;
    
}
    #searchPwdForm a{
        text-decoration: none;
        color: black;
        font-size: 10px;
        color: rgb(85, 85, 85);
        
    }
    
     #searchPwdForm button:hover{
        cursor: pointer;
    }

    #PwderrorMsg{
        height: 15px; 
        width: 100px;
        font-size: 14px; 
        color:rgb(209, 27, 27);
        text-align: center;
        
    }
    
       #searchPwdForm table{
    	margin-left:90px;
    }

</style>
<body>

	<jsp:include page="../common/header.jsp"/><br><br><br>
    
    <h1 id="searchPwdTitle" align="center">비밀번호 찾기</h1><br><br>

    <form action="searchPwd.me" method="post">
        <div id="searchPwdForm">
            <table  border="0" align="center" width="180px;">
                <br><br>
                <tr>
                    <th>이름</th>
                    <td colspan="2"><input type="text" name="memberName"  required placeholder=" 이름을 입력해주세요." ></td>
                </tr><td><br></td></tr>
                <tr>
                    <th>아이디</th>
                    <td colspan="2"><input type="text" name="memberId"  required placeholder=" 아이디를 입력해주세요." ></td>
                </tr><td><br></td></tr>
                
                <tr>
                    <th>이메일</th>
                    <td colspan="2"><input type="eamil" name="userEmail" required placeholder=" 비밀번호를 입력해주세요."></td>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <td id="PwderrorMsg" colspan="3" style="display:n***;" >
                        * 이름 / 아이디 / 이메일을 다시 입력해주세요.
                    </td>
                 
                </tr><td><br></td></tr>
                    
                <tr>
                    <td colspan="3"><button onclick="location.href='###'">찾기</button></td>
                </tr><td><br></td></tr>
                
            </table>
        </div>
    </form>
     <br><br><br><br><br><br>
 					<jsp:include page="../common/footer.jsp"/>

   
</body>
</html>