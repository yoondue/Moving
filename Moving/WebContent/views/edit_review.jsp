<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
      
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<style type="text/css">
	section {
 	  	padding-top: 120px;
  	 	padding-bottom: 100px;
	}
	.container{
		height: 753px;
/* 		background-color: #f5f5f5; */
	}
	.box1{
		width: 60%;
		height: auto;
		margin: 0 auto;
	}
	
	.bg-box{
		background-color: #f5f5f5;
		padding: 0px 30px 30px 30px;
	}
	.review-box{
		width: 100%;
		height: 500px;
		margin: 0 auto;
		margin-top: 10px;
		background-color: white;
		border-radius: 15px;
	}
	.title{
		width: 100%;
		height: 50px;
		font-size: 20px;
		border-bottom: 1px solid rgba(0,0,0,.1);
		margin: 0 auto;
		padding-top: 10px;
		text-align: right;
	}
	.content{
		width: 100%;
		height: auto;
/* 		margin-left: 15px; */
	}
	.comment{
		width: 100%;
		margin-left: 10px;
		height: 50px;
		padding-top: 10px;
	}
	textarea{
		border: none;
		resize: none;
		padding: 15px;
	}
	textarea:focus{
		outline: none;
	}
	.title2{
		display: inline-block;
		width: 60%;
		height: 50px;
		padding-left: 15px;
		padding-right: 0px;
		text-align: left;
		float: left;
	}
	.star-box{
		display: inline-block;
		width: 30%;
		height: 50px;
		padding: 0;
	}
	.star{
    	width: 25px;
    	height: 25px;
    }
    .btn{
    	height: 32px;
    	text-align: right;
    	float:right;
    	margin-left: 5px;
    }
    h3{
    	display: inline-block;
    }
    .content-ta{
    	width: 100%;
    	
    }
    
    textarea{
    	display: block;
    	width: 100%;
    	height: 100%;
    	margin: 0 auto;
    	margin-left: 15px;
    }
    
    #star_grade{
    	display: inline-block;
		width: 100%;
		padding-right: 10px;
    }
    
    .co-col{
    	padding-left: 0px;
    	
    }
    .btn-col{
    	float: right;
    }
    
</style>

<script type="text/javascript">
	$(function(){
		
		// star는 db에서 받아온 별점(4는 테스트)
		var star = 4;
		
		// 별점만큼 표시
		for(var i=1; i<=star; i++){
			$('.star').eq(i-1).attr('src', '/Moving/images/star2.png');
		}
		
		// 별 클릭했을때 변하게
		$('#star_grade a').click(function(){
			
			// 클릭한 별 숫자로 만들기
			for(var i=0; i<=4; i++){
				if($(this)[0] == $('#star_grade a')[i]){
					star = i+1;
					
					// 테스트 하려고 추가, 개발할때 지우기!
					$('textarea').append(star);
				}
			}
			
			// 모든 별을 빈 별로 만들기
			$(this).parent().children("a").children("img").attr('src', '/Moving/images/star1.png');
			
			// 선택한 별과 이전의 별 모두 채워진 별로 만들기
			$(this).children("img").attr('src', '/Moving/images/star2.png');
			$(this).prevAll("a").children("img").attr('src', '/Moving/images/star2.png');
	
		    return false;
		});
	});

</script>

</head>
<body>

	<header>
	
	</header>
	
	<section>
		<div class="container">
			
			<div class="row">
				<div class="col-md-2">
				
				</div>

				<div class="col-md-8 bg-box">
					<div class="row comment">
						<div class="col-md-8 col-6 co-col">
							<h3>코멘트 작성</h3>
						</div>
						<div class="col-md-4 col-6 btn-col">
							<button type="submit" class="btn btn-outline-secondary btn-sm">취소</button>
							<button type="submit" class="btn btn-outline-secondary btn-sm">수정하기</button>
						</div>
						<hr>
					</div>

					<div class="row review-box">
						<div class="row title">
							<div class="col-md-7 col-7 title2">레미제라블</div>
							<div class="col-md-5 col-5 star-box">
								<span id="star_grade"> 
									<a href="#"><img src="/Moving/images/star1.png" class="star"></a> 
									<a href="#"><img src="/Moving/images/star1.png" class="star"></a> 
									<a href="#"><img src="/Moving/images/star1.png" class="star"></a> 
									<a href="#"><img src="/Moving/images/star1.png" class="star"></a> 
									<a href="#"><img src="/Moving/images/star1.png" class="star"></a> 
								</span>
							</div>
						</div>
						
						<div class="row content">
							<form class="content-ta">
								<textarea rows="16">이전에 작성한 데이터가 들어감!!</textarea>
							</form>
						</div>
						
					</div>
				</div>

				<div class="col-md-2">
				
				</div>
			
			</div>
			
		</div>
		
	</section>

	<footer>
	
	</footer>

</body>
</html>
