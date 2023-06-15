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
img{width : 250px;height : 250px;padding: 10px;}
.studyBand {
    display: inline-block;
	width: 250px;
	margin: 20px;
    border : 1px solid lightgrey;
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
        });

    
        // 전체 북마크 조회
        function allStudyBandList(){
    		$.ajax({
                url : 'allStudyBandList.me',
                data : {
                    memberId : '${loginMember.memberId}' 
                },
                success : function(list){
                    console.log(list);
                    var value='';
                    for(let i in list){
                        value += '<div class="studyBand">'
                                + '<button class="checkFavorite" id="checkFavorite'+list[i].sbNo+'" style="border:none;">☆</button>'
                                + '<input type="hidden" value="'+list[i].sbNo+'">'
                                + '<div id="studyBandImg"><img src="'+ list[i].sbChangeName+'"></div>'
                                + '<div id="studyBandImg">'+ list[i].sbTitle+'</div>'
                                + '</div>';
                            }
                    $('.allStudyBand').html(value); 
                    favoriteStudyBand();   
                    checkFavorite();
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
                data : {
                    memberId : '${loginMember.memberId}' 
                },
                success : function(list){
                	if(list != ''){
                		$('#message').remove();
	                    for(let i in list){
	                        var checkFavorite = $('#checkFavorite'+list[i].sbNo);
	                        var p = checkFavorite.parent();
	                        checkFavorite.css('color','red');
	                        $('.favoriteStudyBand').append(p);
	                    }                		
                	} else {
                		$('.favoriteStudyBand').append('<p id="message">즐겨찾는 밴드를 등록해보세요!</p>');
                	}
                	
                },
                error : function(){
                    console.log('밴드 조회 실패');
                }
            });
        }

        //북마크 등록/삭제
        function checkFavorite(){
            $('.checkFavorite').click(function(){
                var color = $(this).css('color');
                var checkBandNo = $(this).next().val();
                var checkBand = $(this);
                var p = $(this).next().parent();
                if(color === 'rgb(255, 0, 0)'){
                    checkBand.css('color','black');
                    $('.allStudyBand').append(p);
                    $.ajax({
                        url : 'deleteSbandBookmark.me',
                        data : {
                            sbNo : checkBandNo,
                            memberId : '${loginMember.memberId}' 
                        },
                        success : function(){
                            console.log('북마크 삭제 성공');
                            favoriteStudyBand();
                        },
                        error : function(){
                            console.log('실패');
                        }
                    });  
                } else {
                    checkBand.css('color','red');
                    $('.favoriteStudyBand').append(p);

                    $.ajax({
                        url : 'insertSbandBookmark.me',
                        data : {
                            sbNo : checkBandNo,
                            memberId : '${loginMember.memberId}' 
                        },
                        success : function(){
                            console.log('북마크 등록 성공');
                            favoriteStudyBand();
                        },
                        error : function(){
                            console.log('실패');
                        }
                    });

                }
            })

        }
        




    </script>
</body>
</html>