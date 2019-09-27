<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
      
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
	.title-box{
		width: 100%;
	}

	.img-thumbnail{
		width: 22%;
		height: auto;
		float: left;
	}
	.title{
		display: inline-block;
		width: 75%;
		height: auto;
		margin-left: 20px;
		background-color: white;
/* 		float:left; */
	}
	.content{
		width: 100%;
		height: auto;
		background-color: white;
		border: 1px solid #ededed;
		border-radius: 5px;
/* 		margin-top: 15px; */
		margin: 15px;
		padding: 20px;
	}
	.box1{
		background-color: #f5f5f5;
		margin-top: 15px;
	}
	.review{
		width: 100%;
		height: 350px;
		background-color: #f5f5f5;
		border-radius: 15px;
		padding: 10px;
/* 		margin: 5px; */
		float: left;
	}
	.writer{
		width: 100%;
		height: 35px;
		margin: 15px 5px 5px 0px;
	}
	.rounded-circle{
		display: inline-block;
		width: 35px;
		height: 35px;
		float: left;
	}
	.nickname{
		display: inline-block;
		width: 58%;
		height: 40px;
		margin-top: 7px;
		margin-left: 10px;
		float: left;
	}
	.star-box{
		display: inline-block;
		width: 20%;
		height: 30px;
		border: 1px solid #ededed;
		border-radius: 15px;
		background-color: white;
		padding-left: 5px;
		margin-left: 15px;
		margin-top: 5px;
		float: left;
	}
	.star{
		display: inline-block;
		width: 16px;
		height: 16px;
		margin-left: 3px;
	}
	.star-span{
		display: inline-block;
		width: 40%;
		margin-top: 2px;
	}
	.simg-box{
		display: inline-block;
		width:auto;
	}
	
	.review-content{
		width: 100%;
		height: 170px;
	}
	.like{
		width: 100%;
		height: 30px;
	}
	.thumbs-up{
		display: inline-block;
		width: 20px;
		height: 20px;
	}
	.like-btn{
		display: inline-block;
		background-color: transparent;
	}

	.like-span{
		margin-top: 4px;
	}
	
	.co-row{
		margin: 0 auto;
	}
	
	.co-box{
		padding-left: 0px; 
	}
	
	.more-box{
		padding-right: 0px; 
	}
	
	.co-title{
		width: 100%;
		display: inline-block;
	}
	.more{
		float:right;
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
				<div class="col-md-2 col-">
				
				</div>
				
				<div class="col-md-8 col-12 title-box">
					<div class="row">
						<img src=${movie.image } class="img-thumbnail">
						<div class="title">
							<h3>${movie.title }</h3>
							<span>${movie.pubDate }</span><span>・</span><span>${movie.genre }</span>
							<hr>
							<span>평점 ★${review.grade }</span>
							<hr>
							<button type="submit" class="btn" id="addReview" onclick="location.href='${pageContext.request.contextPath}/add_review.do?title=${movie.title }'">리뷰 쓰기</button>
							<button type="submit" class="btn" id="addScrap">스크랩</button>
						</div>
						
					</div>
				</div>
				
				<div class="col-md-2 col-">
				
				</div>
			</div>
			
			<div class="row box1">
				<div class="col-md-2">
				
				</div>
				<div class="col-md-8">
					<div class="row">
						<br>
						<div class="content">
							<h5>기본 정보</h5>
							<span>${movie.contents }</span>
							<hr>
							<h5>출연/제작</h5>
							<span>${movie.director }(감독), ${movie.actor }
							</span>
							<hr>
							
							<div class="row co-row">
								<div class="col-md-10 col-9 co-box">
									<h5 class="co-title">코멘트</h5>
								</div>
								<div class="col-md-2 col-3 more-box">
									<a href="${pageContext.request.contextPath}/movie_review_list.do?title=${movie.title }" class="btn btn-light like-btn more" style="color:#894242">더보기</a>						
								</div>
							</div>
							
							<div class="row">
								<c:forEach var="review" items="${reviewList }" begin="0" end="1">
								<div class="col-md-6">
									<div class="review">
											<div class="writer">
												<img src="${review.profileImg }" class="rounded-circle">
												<div class="nickname">
													<span>${review.nickname }</span>
												</div>
												
	<!-- 											span글씨 조정하려고 simg-box, star-sapn div 생성 -->
												<div class="star-box">
													<div class="simg-box">
														<img src="/Moving/images/star2.png" class="star">
													
													</div>
													<div class="star-span">
														<span>${review.grade }</span>
													</div>
													
												</div>
											</div>
											<hr>
											<div class="review-content">
												<span>${review.contents }</span>
											</div>
											<hr>
											<div class="like">
													<img src="/Moving/images/thumbs-up.png" class="thumbs-up">
													<span class="like-span">${review.likeCount }</span>
													<button type="submit" class="btn btn-light like-btn" 
														onclick="location.href='${pageContext.request.contextPath}/review_like.do?title=${movie.title }&reviewId=${review.id}'">
														좋아요</button>
											</div>
									
									</div>
								</div>
								</c:forEach>
								
<!-- 								<div class="col-md-6"> -->
<!-- 									<div class="review"> -->
<!-- 										<div class="writer"> -->
<!-- 											<img src="/Moving/images/profile2.jpg" class="rounded-circle"> -->
<!-- 											<div class="nickname"> -->
<!-- 												<span>제시</span> -->
<!-- 											</div> -->
<!-- 											<div class="star-box"> -->
<!-- 												<img src="/Moving/images/star2.png" class="star"> -->
<!-- 												<span>5.0</span> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<hr> -->
<!-- 										<div class="review-content"> -->
<!-- 											<span>누가 뭐래도 나를 울린건 자베르의 거칠고 투박하지만 진정성 있는 목소리.</span> -->
<!-- 										</div> -->
<!-- 										<hr> -->
<!-- 										<div class="like"> -->
<!-- 											<img src="/Moving/images/thumbs-up.png" class="thumbs-up"> -->
<!-- 											<span class="like-span">32</span> -->
<!-- 											<button type="submit" class="btn btn-light like-btn">좋아요</button> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
							
							</div>
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
