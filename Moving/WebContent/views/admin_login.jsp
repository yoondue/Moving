<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="/Moving/assets/css/bootstrap.min.css" />
<script src="/Moving/assets/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	margin-top: 30px;
}

.list-group {
	margin-top: 20px;
}

#btn {
	height: 80px;
	background-color: #666666;
	color: white;
}
</style>

</head>
<body>

	<header> </header>

	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="list-group">
						<!-- ${pageContext.request.contextPath}: 현재경로 = localhost:8080/Moving -->
						<a href="${pageContext.request.contextPath}/admin_member.do"
							class="list-group-item"><span
							class="glyphicon glyphicon-hand-right"></span> 회원 관리</a> <a href="#"
							class="list-group-item"><span
							class="glyphicon glyphicon-hand-right"></span> 리뷰 관리</a> <a href="#"
							class="list-group-item"><span
							class="glyphicon glyphicon-hand-right"></span> 추천리스트 관리</a> <a
							href="#" class="list-group-item"><span
							class="glyphicon glyphicon-hand-right"></span> 에디터 추천 영화</a>
					</div>
				</div>

				<div class="col-md-9">
					<div class="row">
						<h3>
							<span class="glyphicon glyphicon-cog"></span> 관리자 로그인
						</h3>
						<br>
						<br>
						<br>
						<div class="col-md-5">
							<form>
								<div class="form-group">
									<input type="text" class="form-control"
										placeholder="id@movie.com">
								</div>
								<div class="form-group">
									<input type="password" class="form-control"
										placeholder="password">
								</div>

							</form>
						</div>
						<div class="col-md-7">
							<input type="submit" value="LOGIN" class="btn btn-default btn-lg"
								id="btn">
						</div>
					</div>
				</div>

			</div>
		</div>

	</section>

	<footer> </footer>

</body>
</html>