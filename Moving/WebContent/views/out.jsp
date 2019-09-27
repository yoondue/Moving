<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body {
	background-image:
		url("${pageContext.request.contextPath}/images/ticket.jpg");
	background-size: cover;
	background-repeat: none;
}

section {
	padding-top: 120px;
	font-family: 'Noto Sans KR', sans-serif;
}

button {
	cursor: pointer;
}

.title {
	color: white;
	font-size: 20px;
	font-weight: bold;
}

#inputPw {
	height: 50px;
	width: 280px;
	border-radius: 5px;
	border: none;
	margin: 3px;
	width: 280px;
}

button:focus {
	outline: none;
}

#outBtn {
	border: none;
	background-color: rgba(239, 238, 238, 0.5);
	color: #717072;
	height: 50px;
	width: 300px;
	border-radius: 40px;
	margin-top: 40px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div class="container">
			<div class="row" style="height: 60px;"></div>
			<div class="row">
				<div class="col-md-10"></div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-9">
					<p class="title">회원 탈퇴</p>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-5">
							<form action="${pageContext.request.contextPath}/out_ok.do"
								method="post" name="myform">
								<div class="form-group">
									<input type="password" name="user_pw" class="form-control"
										id="inputPw" placeholder="패스워드" />
								</div>
								<div class="form-group">
									<button type="submit" id="outBtn">회원 탈퇴</button>
								</div>
						</div>
						</form>
					</div>

				</div>
			</div>
		</div>
	</section>
</body>
</html>