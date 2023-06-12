<!DOCTYPE html>
<html lang="en">
<head>
	<%@ page contentType="text/html; charset=UTF-8" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <title>아이디 찾기</title>
</head>
<style>

  #serchIdTitle{
        color: rgb(3, 195, 115);
    }

    #searchIdForm{
        background-color: rgb(240, 240, 240);
        border-radius: 20px;
        width: 490px;
        margin: auto;
    }
    
    #searchIdForm table td{
        width: 150px;
        height:57px;
    }
   
   #searchIdForm button{
        background-color: rgb(3, 195, 115);
        border: none;
        border-radius: 5px;
        width: 285px;
        height: 40px;
        margin-left: 20px; 
        color: white;
        
    }
    #searchIdForm input{
    border-radius: 5px;
    border-color: lightgray;
    border-style: double;
    height: 23px;
    width: 200px;
    font-size:12px;
}
    #searchIdForm input:focus{
    border-color:rgb(3, 195, 115);
    outline: none;
}
    #searchIdForm a{
        text-decoration: none;
        color: black;
        font-size: 14px;
        color: rgb(85, 85, 85);
        
    }
    
    #searchIdForm button:hover{
        cursor: pointer;
    }

    #idSearchErrorMsg{
        height: 15px; 
        width: 100px;
        font-size: 14px; 
        color:rgb(209, 27, 27);
        text-align: center;
        
    }
    
     #searchIdForm table{
    	margin-left:90px;
    }
	#searchIdMessage{
		padding-left:33px;
		
	}
	#noSearchResult{
		padding-left:85px;
	}


  
</style>
<body>

	 <jsp:include page="../common/header.jsp"/><br><br><br>
    
    <h1 id="serchIdTitle" align="center">아이디 찾기</h1><br><br>
    

    
        <div id="searchIdForm">
            <table  border="0" align="center" width="180px;">
                <br><br>
                
                <c:choose>
                	<c:when test="${!empty searchMember }">
	                <tr>
	                    <th id="searchIdMessage">회원님의 아이디는 ${searchMember.memberId} 입니다.</th>
	                </tr> <tr><td></td></tr>
	                <tr>
	                    <td colspan="3"><button onclick="location.href='loginForm.me'">로그인 화면으로 돌아가기</button></td>
	                </tr><td><br></td></tr>
                	</c:when>
                	<c:otherwise>
                		<tr>
	                   		 <th id="noSearchResult">조회된결과가 없습니다.</th>
	                	</tr> <tr><td></td></tr>
	                	<tr>
                    		<td colspan="3"><button onclick="location.href='searchIdForm.me'">다시 찾아보기</button></td>
                		</tr><td><br></td></tr>
                	</c:otherwise>
                </c:choose>
              
                    
                
            </table>
        </div>
	
	
	
<%-- 
    <h1 id="searchIdTitle" align="center">아이디 찾기</h1>
    <div id="searchId">
       <div align="center" id="searchIdMessage">
      		회원님의 아이디는 ${searchMember.memberId} 입니다.
       </div>
        <div>
            <button onclick="location.href='loginForm.me'">로그인 화면으로 돌아가기</button>
        </div>

    </div>
    --%>
    
 <br><br><br><br><br><br>
 					<jsp:include page="../common/footer.jsp"/>




    
    
</body>
</html>