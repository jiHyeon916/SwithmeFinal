<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/adminPageMain.css">
<link rel="stylesheet" href="resources/css/member/myPoint.css">
</head>
<style>
 
    #adminMemberBtn{
        border: none;
        border-radius: 5px;
        width: 50px;
        height: 29px;
        background-color: rgb(3, 195, 115);  
        color : white;      
    }

    #adminMemberBtn:hover{
        cursor: pointer;
    }
    
    #adminMemberTable{
    	margin:auto;
    }
    #adminMemberTable th{
        width: 150px;
        padding-right: 10px;
        
    }
    #adminMemberTable th, td{
        border: 1px solid rgb(205, 203, 203);
    }
     #adminMemberTable > thead{
        text-align: center;
    }
    #adminMemberForm input:focus{
       border-color:rgb(3, 195, 115);
       outline: none;
       height:29px;
    }
      #adminMemberForm input{
         height:29px;
         border-radius : 5px;
         border-color : lightgray;
     }
    #adminMemberForm select:focus{
        border-color:rgb(3, 195, 115);
        outline: none;
        border-radius : 5px;
    }
    #adminMemberForm  > select {
          border-radius : 5px;
    }
     #adminMemberForm{
        margin-left:255px;
     }
     /* .paBtn{
     	margin-left:300px;
     } */

</style>
<body>

   <jsp:include page="../common/header.jsp" />
   
   <div class="page-blank"></div>
      
   <div class="wrap clear">
      <div class="adSide">
         <jsp:include page="adminMenuBar.jsp" />
      </div>
      
      <div class="content">
         <div class="topBlock">스터디밴드 관리</div>
         	 <div class="block">
            
	         </div>
	      </div>
	   </div>
<br><br><br><br><br><br><br><br><br>
</body>
</html>