<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      
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
					<c:forEach var="review" items="${reviewList }">
						<div class="review">
							<div class="row writer">
								<div class="col-md-10 col-9">
									<img src="${review.profileImg }" class="rounded-circle">
									<div class="nickname">
										<span>${review.nickname}</span>
									</div>
								</div>
								
								<div class="col-md-2 col-3">
									<div class="star-box">
									<img src="/Moving/images/star2.png" class="star"> <span>${review.grade }</span>
									</div>
								</div>
							</div>
							<hr>
							<div class="row review-content">
								<span>${review.contents }</span>
							</div>
							<hr>
							
							<div class="row like">
								<img src="/Moving/images/thumbs-up.png" class="thumbs-up">
								<span class="like-span">${review.likeCount }</span>
								<button type="submit" class="btn btn-light like-btn">좋아요</button>
							</div>
						</div>
					
					
					
					</c:forEach>
				
				
				
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
