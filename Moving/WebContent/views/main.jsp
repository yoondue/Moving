<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>

<%!
	Connection conn; // 드라이버 로드

	// DB 접속 확인
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "codelab";
	String pw = "oracleyj";%>

<%
	try {
		// 1. JDBC 드라이버 로딩하기
		Class.forName(driver);

		// 2. DB 서버 접속하기
		conn = DriverManager.getConnection(url, id, pw);
		//out.println("정상적으로 데이터베이스에 접속되었습니다.");

	} catch (SQLException e) {
		out.println("예외가 발생하였습니다.");
	}
%>
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
							<img class="d-block w-100" src="../images/carousel1.png"
								alt="First slide" id="carouselMovie1">
							<div class="carousel-caption d-none d-md-block"
								style="text-align: left">
								<h3>몽환적인 분위기의</h3>
								<h1>그랜드 부다페스트 호텔</h1>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="../images/carousel2.png"
								alt="Second slide" id="carouselMovie2">
							<div class="carousel-caption d-none d-md-block"
								style="text-align: left">
								<h3>노래와 영상미가 아름다운</h3>
								<h1>라라랜드</h1>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="../images/carousel3.png"
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
			<div class="row" id="separate"></div>

			<!-- card (movie) -->
			<div class="row" id="part1">
				<div class="row" id="subtitle">
					<h4>○○○님을 위한 추천 영화</h4>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<div class="card-deck">
							<div class="card movie1">
								<img src="../images/dummy.png" class="card-img-top" alt="...">
								<div class="card-body movieBody">
									<h6 class="card-title">레미제라블</h6>
									<p class="card-text">
										<small class="text-muted">2015 · 드라마</small>
									</p>
								</div>
							</div>
							<div class="card movie2">
								<img src="../images/dummy.png" class="card-img-top" alt="...">
								<div class="card-body deckBody">
									<h6 class="card-title">레미제라블</h6>
									<p class="card-text">
										<small class="text-muted">2015 · 드라마</small>
									</p>
								</div>
							</div>
							<div class="card movie3">
								<img src="../images/dummy.png" class="card-img-top" alt="...">
								<div class="card-body deckBody">
									<h6 class="card-title">레미제라블</h6>
									<p class="card-text">
										<small class="text-muted">2015 · 드라마</small>
									</p>
								</div>
							</div>
							<div class="card movie4">
								<img src="../images/dummy.png" class="card-img-top" alt="...">
								<div class="card-body deckBody">
									<h6 class="card-title">레미제라블</h6>
									<p class="card-text">
										<small class="text-muted">2015 · 드라마</small>
									</p>
								</div>
							</div>
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
						<a href="review.jsp" id="moreReview">더보기</a>
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

	<script type="text/javascript">
		$(function() {
			// carousel
			$("#carouselMovie1").click(function() {
				location.href = "#";
			});
			$("#carouselMovie2").click(function() {
				location.href = "#";
			});
			$("#carouselMovie3").click(function() {
				location.href = "#";
			});

			// card (movie)
			var movie1 = "http://naver.com";
			var movie2 = "http://google.com";
			var movie3 = "http://daum.net";
			var movie4 = "http://naver.com";

			$(".movie1").click(function() {
				location.href = movie1;
			});
			$(".movie2").click(function() {
				location.href = movie2;
			});
			$(".movie3").click(function() {
				location.href = movie3;
			});
			$(".movie4").click(function() {
				location.href = movie4;
			});

			// card (review)
			var review1 = "http://naver.com";
			var review2 = "http://google.com";
			var review3 = "http://daum.net";
			var review4 = "http://naver.com";

			$(".review1").click(function() {
				location.href = review1;
			});
			$(".review2").click(function() {
				location.href = review2;
			});
			$(".review3").click(function() {
				location.href = review3;
			});
			$(".review4").click(function() {
				location.href = review4;
			});

		});
	</script>
</body>
</html>