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
				<div class="row">
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
					<div class="col-md-1"></div>
					<div class="col-md-5">
						<div class="card mb-3 review1" style="max-width: 350px;">
							<div class="row no-gutters">
								<div class="col-md-5">
									<div class="userImage"></div>
								</div>
								<div class="col-md-7">
									<div class="card-body reviewBody">
										<p class="card-text">User ID:</p>
										<h5 class="card-title">contents' title</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="card mb-3 review2" style="max-width: 350px;">
							<div class="row no-gutters">
								<div class="col-md-5">
									<div class="userImage"></div>
								</div>
								<div class="col-md-7">
									<div class="card-body reviewBody">
										<p class="card-text">User ID:</p>
										<h5 class="card-title">contents' title</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>

				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-5">
						<div class="card mb-3 review3" style="max-width: 350px;">
							<div class="row no-gutters">
								<div class="col-md-5">
									<div class="userImage"></div>
								</div>
								<div class="col-md-7">
									<div class="card-body reviewBody">
										<p class="card-text">User ID:</p>
										<h5 class="card-title">contents' title</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="card mb-3 review4" style="max-width: 350px;">
							<div class="row no-gutters">
								<div class="col-md-5">
									<div class="userImage"></div>
								</div>
								<div class="col-md-7">
									<div class="card-body reviewBody">
										<p class="card-text">User ID:</p>
										<h5 class="card-title">contents' title</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>

			</div>
			<!-- <div class="row" id="part2"> -->
		</div>
		<!-- container -->
	</section>
</body>
</html>