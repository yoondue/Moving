<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
section {
	padding-top: 120px;
	padding-bottom: 100px;
	font-family: 'Noto Sans KR', sans-serif;
}

.d-block, .card {
	cursor: pointer;
}

#separate {
	height: 100px;
}

#subtitle {
	margin-bottom: 20px;
}

.movieBody {
	height: 80px;
}

#part2 {
	/* background-color: #EFEEEE; */
	
}

.container {
	width: 100%;
}

.userImage {
	border: 2px solid #EFEEEE;
	border-radius: 50%;
	width: 80px;
	height: 80px;
	margin: 20px;
}

.reviewBody {
	background-color: #EFEEEE;
	margin: 10px;
}

.moreReview {
	margin-bottom: 10px;
}

#moreReview {
	color: #894242;
	font-size: 13px;
	text-decoration: none;
	font-weight: bold;
}

#carouselExampleIndicators, #align{
	margin: 0 auto;
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
	.titleBox{
		width:100%;
		height: 35px;
	}
	.movieTitle{
		font-size: 20px;
		margin-top: 5px;
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
		height: 125px;
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
	$(function() {
		location.href = "${pageContext.request.contextPath}/main.do";
	});
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div class="container">
			<!-- carousel -->
			<div class="row">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100"
								src="${pageContext.request.contextPath}/images/carousel1.png"
								alt="First slide" id="carouselMovie1">
							<div class="carousel-caption d-none d-md-block"
								style="text-align: left">
								<h3>몽환적인 분위기의</h3>
								<h1>그랜드 부다페스트 호텔</h1>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="${pageContext.request.contextPath}/images/carousel2.png"
								alt="Second slide" id="carouselMovie2">
							<div class="carousel-caption d-none d-md-block"
								style="text-align: left">
								<h3>노래와 영상미가 아름다운</h3>
								<h1>라라랜드</h1>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100"
								src="${pageContext.request.contextPath}/images/carousel3.png"
								alt="Third slide" id="carouselMovie3">
							<div class="carousel-caption d-none d-md-block"
								style="text-align: left">
								<h3>픽사의 감동 애니메이션</h3>
								<h1>코코</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" id="separate">
				<hr>
			</div>
			<!-- card (movie) -->
			<div class="row" id="part1">
				<div class="row" id="subtitle">
					<h4>
						<strong style="color: #894242">${loginInfo.nickname}</strong>님을 위한
						추천 영화
					</h4>
				</div>
				<div class="row" id="align">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="card-deck">
							<c:forEach var="movie" items="${recommendedMovie}" begin="0"
								end="3" step="1">
								<div class="card movie1">
									<a
										href="${pageContext.request.contextPath}/movie_info.do?title=${movie.title}"><img
										src="${movie.image}" class="card-img-top" alt="..."> </a>
									<div class="card-body movieBody">
										<h6 class="card-title">${movie.title}</h6>
										<p class="card-text">
											<small class="text-muted">${movie.pubDate} ·
												${movie.genre1}</small>
										</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
			<div class="row" id="separate"></div>

			<!-- card (review) -->
			<div id="part2">
				<div class="row" id="subtitle">
					<h4>실시간 리뷰</h4>
				</div>
				<div class="row moreReview">
					<div class="col-md-10"></div>
					<div class="col-md-2">
						<a href="review.jsp" id="moreReview">더보기 </a>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-2">
					</div>
					
					<div class="col-md-8">
						<div class="row">
						
							<c:forEach var="review" items="${reviewList }" begin="0" end="1">
								<div class="col-md-6">
									<div class="review">
										<div class="titleBox">
											<span class="movieTitle">${review.movieName }</span>
										</div>
										<hr>
											
										<div class="writer">
											<img src="${review.profileImg }" class="rounded-circle">
											<div class="nickname">
												<span>${review.nickname }</span>
											</div>
											<div class="star-box">
												<img src="/Moving/images/star2.png" class="star">
												<span>${review.grade }</span>
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
											<button type="submit" class="btn btn-light like-btn">좋아요</button>
										</div>
									</div>
								</div>
							
							</c:forEach>
						</div>			
					</div>
					
				</div>
					
					<div class="col-md-2">
					</div>
				
				
				
				
				
				
				
				
				
				
<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-1"></div> -->
<!-- 					<div class="col-md-5"> -->
<!-- 						<div class="card mb-3 review1" style="max-width: 350px;"> -->
<!-- 							<div class="row no-gutters"> -->
<!-- 								<div class="col-md-5"> -->
<!-- 									<div class="userImage"></div> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-7"> -->
<!-- 									<div class="card-body reviewBody"> -->
<!-- 										<p class="card-text">User ID:</p> -->
<!-- 										<h5 class="card-title">contents' title</h5> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-5"> -->
<!-- 						<div class="card mb-3 review2" style="max-width: 350px;"> -->
<!-- 							<div class="row no-gutters"> -->
<!-- 								<div class="col-md-5"> -->
<!-- 									<div class="userImage"></div> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-7"> -->
<!-- 									<div class="card-body reviewBody"> -->
<!-- 										<p class="card-text">User ID:</p> -->
<!-- 										<h5 class="card-title">contents' title</h5> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-1"></div> -->
<!-- 				</div> -->

<!-- 				<div class="row"> -->
<!-- 					<div class="col-md-1"></div> -->
<!-- 					<div class="col-md-5"> -->
<!-- 						<div class="card mb-3 review3" style="max-width: 350px;"> -->
<!-- 							<div class="row no-gutters"> -->
<!-- 								<div class="col-md-5"> -->
<!-- 									<div class="userImage"></div> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-7"> -->
<!-- 									<div class="card-body reviewBody"> -->
<!-- 										<p class="card-text">User ID:</p> -->
<!-- 										<h5 class="card-title">contents' title</h5> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-5"> -->
<!-- 						<div class="card mb-3 review4" style="max-width: 350px;"> -->
<!-- 							<div class="row no-gutters"> -->
<!-- 								<div class="col-md-5"> -->
<!-- 									<div class="userImage"></div> -->
<!-- 								</div> -->
<!-- 								<div class="col-md-7"> -->
<!-- 									<div class="card-body reviewBody"> -->
<!-- 										<p class="card-text">User ID:</p> -->
<!-- 										<h5 class="card-title">contents' title</h5> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-md-1"></div> -->
<!-- 				</div> -->

			</div>
			<!-- <div class="row" id="part2"> -->
		</div>
		<!-- container -->
	</section>
		<jsp:include page="footer.jsp" />
	
</body>
</html>