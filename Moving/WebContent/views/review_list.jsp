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
	.review-box{
		border-top: 1px solid #ededed;
	}
	
	.review{
		width: 100%;
		height: auto;
		background-color: #f5f5f5;
		border-radius: 15px;
		padding: 15px;
		margin: 15px auto;
		float: left;
	}
	.writer{
		width: 100%;
		height: 35px;
		margin: 5px 5px 5px 0px;
	}
	.rounded-circle{
		display: inline-block;
		width: 35px;
		height: 35px;
		float: left;
	}
	.nickname{
		display: inline-block;
		width: 75%;
		height: 40px;
		margin-top: 7px;
		margin-left: 10px;
		float: left;
	}
	.star-box{
		display: inline-block;
		width: 60px;
		height: 30px;
		border: 1px solid #ededed;
		border-radius: 15px;
		background-color: white;
		padding-left: 5px;
		margin-top: 5px;
		float: left;
	}
	.star{
		display: inline-block;
		width: 16px;
		height: 16px;
	}
	.review-content{
		width: 100%;
		height: auto;
		margin: 0 auto;
	}
	.like{
		width: 100%;
		height: 30px;
		margin: 0 auto;
	}
	.thumbs-up{
		display: inline-block;
		width: 20px;
		height: 20px;
    	margin-top: 9px;
    	margin-right: 5px;
	}
	.like-btn{
		display: inline-block;
		margin-left: 5px;
	}

	.like-span{
		margin-top: 8px;
	}
	.col-md-10, .col-9{
		padding-left: 0px;
	}
	.col-md-2, .col-3{
		padding-left: 30px;
	}

</style>

<script type="text/javascript">
	

</script>

</head>
<body>

	<header>
	
	</header>
	
	<section>
		<div class="container">
			<div class="row">
				<h3>코멘트</h3>
				<hr>
			</div>

			<div class="row review-box">
				<div class="col-md-2">
				
				</div>

				<div class="col-md-8">
					<div class="review">
						<div class="row writer">
							<div class="col-md-10 col-9">
								<img src="/Moving/images/profile1.jpg" class="rounded-circle">
								<div class="nickname">
									<span>이동진 평론가</span>
								</div>
							</div>
							
							<div class="col-md-2 col-3">
								<div class="star-box">
								<img src="/Moving/images/star.png" class="star"> <span>4.0</span>
								</div>
							</div>
						</div>
						<hr>
						<div class="row review-content">
							<span>연출과 연기보다는 기획과 제작의 힘.연출과 연기보다는 기획과 제작의 힘.연출과 연기보다는
								기획과 제작의 힘. 연출과 연기보다는 기획과 제작의 힘.</span>
						</div>
						<hr>
						
						<div class="row like">
							<img src="/Moving/images/thumbs-up.png" class="thumbs-up">
							<span class="like-span">554</span>
							<button type="submit" class="btn btn-light like-btn">좋아요</button>
						</div>
					</div>
					<div class="review">
						<div class="row writer">
							<div class="col-md-10 col-9">
								<img src="/Moving/images/profile2.jpg" class="rounded-circle">
							<div class="nickname">
								<span>제시</span>
							</div>
							</div>
							
							<div class="col-md-2 col-3">
								<div class="star-box">
								<img src="/Moving/images/star.png" class="star"> <span>5.0</span>
							</div>
							</div>
						</div>
						<hr>
						<div class="row review-content">
							<span>누가 뭐래도 나를 울린건 자베르의 거칠고 투박하지만 진정성 있는 목소리.</span>
						</div>
						<hr>
						
						<div class="row like">
							<img src="/Moving/images/thumbs-up.png" class="thumbs-up">
							<span class="like-span">32</span>
							<button type="submit" class="btn btn-light like-btn">좋아요</button>
						</div>
					</div>
					<div class="review">
						<div class="row writer">
							<div class="col-md-10 col-9">
								<img src="/Moving/images/profile2.jpg" class="rounded-circle">
							<div class="nickname">
								<span>제시</span>
							</div>
							</div>
							
							<div class="col-md-2 col-3">
								<div class="star-box">
								<img src="/Moving/images/star.png" class="star"> <span>5.0</span>
							</div>
							</div>
						</div>
						<hr>
						<div class="row review-content">
							<span>누가 뭐래도 나를 울린건 자베르의 거칠고 투박하지만 진정성 있는 목소리.</span>
						</div>
						<hr>
						
						<div class="row like">
							<img src="/Moving/images/thumbs-up.png" class="thumbs-up">
							<span class="like-span">32</span>
							<button type="submit" class="btn btn-light like-btn">좋아요</button>
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
