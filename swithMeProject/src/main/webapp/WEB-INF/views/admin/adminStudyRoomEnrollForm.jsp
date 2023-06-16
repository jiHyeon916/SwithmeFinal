<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/*공통*/
.adSide{
	position : fixed;
}
.content{
	width : 100%;
	float:left;
	padding-left : 250px;
}
 
    #studyRoomList{
    	margin:auto;
    }
    #studyRoomList th, td{
        border: 1px solid rgb(205, 203, 203);
    }
     #studyRoomList > thead{
        text-align: center;
    }
.page-blank{
	margin-top : 80px;
}
.mySide{
	position : fixed;
}
.content{
	width : 100%;
	float:left;
	padding-left : 250px;
    margin-bottom: 50px;
}

/* 상단 블럭 */
.topBlock{
	height : 55px;
	padding : 13px 20px;
	border : 1.5px solid rgb(175, 175, 175);
	border-radius: 10px;
	box-sizing : border-box;
	font-size : 16px;
	font-weight : 500;
	margin-bottom : 30px;
}
.topBlock>span{
    margin-right: 10px;
    cursor: pointer;
    color :rgb(136, 136, 136);
}
.topBlock>span:nth-of-type(1){
    margin-right: 10px;
    color : rgb(3, 195, 115);
    cursor: pointer;
}

/* 내역블록 */
.block{
	padding : 25px;
	border : 1.5px solid rgb(175, 175, 175);
	border-radius: 10px;
	box-sizing : border-box;
	margin : auto;
}

/* 게시글 리스트 */
.postList{
    display: block;
}

.post_block{
    margin-bottom: 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid rgb(227, 227, 227);
    /* background-color: antiquewhite; */
}
.post_block:last-child{
    border-bottom: none;
    margin-bottom: 0;
}
.post_top{
    height: 50px;
}


/* 카테고리 버튼 */
.post_head{
    /* background-color: pink; */
    width: 100%;
    height : 50px;
    margin-bottom: 10px;
}
#sRoom_left, #sRoom_right{
    display: inline-block;
}
#sRoom_right{
    float: right;
}
.sRoomCreate, .sRoomDelete{
    background-color: rgb(3, 195, 115);
    color: white;
    width : 90px;
    height: 38px;
	border-radius : 5px;
    border: none;
    margin-left: 10px;
}
.updateBtn{
    background-color: lightgray;
    color: black;
    width : 50px;
    height: 30px;
	border-radius : 5px;
    border: none;
    margin-left: 10px;
}
 .deleteBtn{
    background-color: red;
    color: white;
    width : 50px;
    height: 30px;
	border-radius : 5px;
    border: none;
    margin-left: 10px;
}

/* 테이블 */
#studyRoomList{
	width : 100%;
	margin-bottom : 20px;
	font-size: smaller;
}
#studyRoomList th, td{
	text-align : center;
}
th{
	border-bottom : 1px solid #9d9d9d;
	background-color : #efefef;
}
tr{
	height : 60px;
	border-bottom : 1px solid #cecece;
}
tr:last-child{
	border : none;
}
tr.hover{
	background-color: rgb(207, 254, 227);
}
tr:hover{
	background-color: rgb(207, 254, 227);
}


</style>
<body>

   <jsp:include page="../common/header.jsp" />
   
   <div class="page-blank"></div>
      
   <div class="wrap clear">
      <div class="adSide">
         <jsp:include page="adminMenuBar.jsp" />
      </div>
      
      <div class="content">
         <div class="topBlock">스터디룸 관리</div>
         	 <div class="block">
            	<!-- 상단버튼 -->
                <div class="post_head">
                    <div id="sRoom_left">
                        <h4>스터디룸 등록</h4>
                    </div>
	         	</div>
	         	
	         	<div class="post_list">
	
	         	</div>
	         	
	      </div>
	   </div>

	   <script>

	   </script>

<br><br><br><br><br><br><br><br><br>
</body>
</html>