a<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지 프로필</title>
</head>
<style>
    #manage{
        color: rgb(3, 195, 115);
        border: 2px solid lightgray;
        border-radius: 10px;
        width: 600px;
        height: 50px;
       
    }
   
    button{
        border: none;
        border-radius: 5px;
        width: 50px;
        height: 25px;
        background-color: rgb(3, 195, 115);        
    }

    button:hover{
        cursor: pointer;
    }

    input{
        height: 19px;
        border-radius: 5px;
        border-color: lightgray;
        border-style: double;
    }

    select{
        height: 25px;
        border-color: lightgray;
        border-style: double;
        border-radius: 5px;
    }

    #search-area{

    padding-left: 160px;
    padding-top: 50px;        
    }


    
    #manage > div{
        height:50px; 
        font-size: 25px; 
        font-weight: bold;
        margin-top: 7px;
        margin-left: 15px;
    }

    th{
        width: 100px;
        padding-right: 10px;
    }
    table{
        
        border-collapse: collapse;
        margin-right: 28px;
    }
    th, td{
        border: 1px solid rgb(205, 203, 203);
       
    }

    thead{
        background-color: rgb(230, 229, 229);
        
    }
    table>tbody{
        text-align: center;
    }
    form input:focus{
    border-color:rgb(3, 195, 115);
    outline: none;
    }
    form select:focus{
        border-color:rgb(3, 195, 115);
        outline: none;
    }

</style>

<body>

    <div id="manage">
        <div >
            회원관리
        </div>
          
    </div>

    <div id="search-area">

        <form action="search.mem" method="post">

            <input type="hidden" name="currentPage" value="1">

            <select name="condition" >
                <option value="memberId">아이디</option>
                <option value="nickName">닉네임</option>
            </select>

            <input type="text" name="keyword">
            <button type="submit">검색</button>

        </form>
        <br><br><br>
        <table>
           <thead>
                <tr>
                    <th>NO</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>닉네임</th>
                    <th>가입날짜</th>
                    <th>정지여부</th>
                </tr>
                
           </thead>
           <tbody>
                <tr>
                    <td>#no</td>
                    <td>#아이디</td>
                    <td>#이름</td>
                    <td>#닉네임</td>
                    <td>#가입날짜</td>
                    <td>#정지여부</td>
                </tr>
           </tbody>

        </table>


    </div>
    
  

</body>
</html>