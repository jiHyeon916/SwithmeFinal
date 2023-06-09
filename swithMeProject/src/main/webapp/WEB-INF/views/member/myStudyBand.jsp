<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
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
.post_studyBand{text-align: left;}
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
.checkFavorite{background-color: white;}
.studyBandImg{width : 250px;height : 250px;padding: 10px;}
.studyBand {
    display: inline-block;
	width: 250px;
	margin: 20px;
    border : 1px solid lightgrey;
}
.detailBtn{
    float: right;
}

</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	
	<div class="page-blank"></div>
		
	<div class="wrap clear">
		<div class="mySide">
			<jsp:include page="myMenuBar.jsp" />
		</div>
		
        <!-- 컨텐츠 영역 -->
		<div class="content">
            <!-- 게시글 -->
			<div class="topBlock">
                <span>스터디밴드</span>
            </div>

            <div class="block">
                <div class="post_studyBand">
                    <h4>즐겨찾는 밴드</h4>
                </div>
                <div class="favoriteStudyBand"></div>
                <hr>
                <div class="post_studyBand">
                    <h4>전체 밴드</h4>
                </div>
                <div class="allStudyBand"></div>

            </div>
			
		</div>
        
	</div>

    <script>
        $(function(){
            allStudyBandList();   
            favoriteStudyBand();
            
        });

    
        // 전체 북마크 조회
        function allStudyBandList(){
    		$.ajax({
                url : 'allStudyBandList.me',
                method : 'POST',
                data : {
                    memberId : '${loginMember.memberId}' 
                },
                success : function(list){

                    var value='';
                    for(let i in list){
                        value += '<div class="studyBand">'
                                + '<button class="checkFavorite" id="checkFavorite'+list[i].sbNo+'" onclick="checkFavorite('+list[i].sbNo+');">☆</button>'
                                + '<input type="hidden" value="'+list[i].sbNo+'">'
                                + '<div class="studyBandImgBox"><img class="studyBandImg" src="'+ list[i].sbChangeName+'"></div>'
                                + '<span>'+ list[i].sbTitle+'</span>'
                                + '<button class="detailBtn" onclick="detailView('+ list[i].sbNo+');">바로가기</button>'
                                + '</div>';
                            }
                    $('.allStudyBand').html(value);

                },
                error : function(){
                    console.log('밴드 조회 실패');
                }
            });
        }

        //즐겨찾는 밴드 조회
        function favoriteStudyBand(){
            $.ajax({
                url : 'favoriteStudyBandList.me',
                method : 'POST',
                data : {
                    memberId : '${loginMember.memberId}' 
                },
                success : function(list){
                    console.log(list);
                    if(list != ''){
                		$('#message').remove();
                        var value='';
	                    for(let i in list){
	                        value += '<div class="studyBand">'
                                + '<button class="favorite" id="avorite'+list[i].sbNo+'" style="border:none; color:red;" onclick="checkFavorite('+list[i].sbNo+');">☆</button>'
                                + '<input type="hidden" value="'+list[i].sbNo+'">'
                                + '<div class="studyBandImgBox"><img class="studyBandImg" src="'+ list[i].sbChangeName+'"></div>'
                                + '<span>'+ list[i].sbTitle+'</span>'
                                + '<button class="detailBtn" onclick="detailView('+ list[i].sbNo+');">바로가기</button>'
                                + '</div>';
	                    }    
	                    $('.favoriteStudyBand').html(value);
                	} else {
                		$('.favoriteStudyBand').append('<p id="message">즐겨찾는 밴드를 등록해보세요!</p>');
                	}
                	
                },
                error : function(){
                    console.log('밴드 조회 실패');
                }
            });
        }

        // 북마크상태니?
       	function checkFavorite(checkBandNo){
            console.log($(this));     
            $.ajax({
        		url : 'selectSbandBookmark.me',
                method : 'POST',
        		data : {
        			sbNo : checkBandNo,
                    memberId : '${loginMember.memberId}' 
        		},
        		success : function(result){
        			console.log(result);
        			if(result>0){
        				deleteBookmark(checkBandNo);
        			} else{
        				insertBookmark(checkBandNo);
        				
        			}
        			location.reload();
        		},
        		error : function(){
        			console.log('실패');
        		}
        	});
        
        }

        
        //북마크 삭제
        function deleteBookmark(checkBandNo){
        	$.ajax({
                url : 'deleteSbandBookmark.me',
                method : 'POST',
                data : {
                    sbNo : checkBandNo,
                    memberId : '${loginMember.memberId}' 
                },
                success : function(){
                    console.log('북마크 삭제 성공');
                },
                error : function(){
                    console.log('실패');
                }
            });  
        }
        
        //북마크 추가
        function insertBookmark(checkBandNo){
        	$.ajax({
                url : 'insertSbandBookmark.me',
                method : 'POST',
                data : {
                    sbNo : checkBandNo,
                    memberId : '${loginMember.memberId}' 
                },
                success : function(){
                    console.log('북마크 등록 성공');
                },
                error : function(){
                    console.log('실패');
                }
            });
        }
        
        //
        
        // 바로가기
        function detailView(sno){
            location.href = "studyBand.bo/detail.bo?sno="+sno;
        }




    </script>
</body>
</html>