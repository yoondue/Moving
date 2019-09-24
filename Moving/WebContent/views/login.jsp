<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body {
	background-image: url("../images/ticket.jpg");
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

#naverLogin {
	width: 220px;
	padding-left: 60px;
	cursor: pointer;
}

.loginInfo {
	height: 50px;
	width: 280px;
	border-radius: 5px;
	border: none;
	margin: 3px;
	width: 280px;
}

#joinBtn, #loginBtn {
	border: none;
	background-color: rgba(239, 238, 238, 0.5);
	color: #717072;
}

button:focus {
	outline: none;
}

#joinBtn {
	width: 100px;
	border-radius: 20px;
	padding: 3px;
	margin-bottom: 30px;
}

#loginBtn {
	height: 80px;
	width: 100px;
	border-radius: 40px;
	margin-top: 40px;
}

#find_pw {
	color: white;
	font-size: 13px;
	text-decoration: none;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-10"></div>
				<div class="col-md-2">
					<button id="joinBtn">
						<a href="${pageContext.request.contextPath}/join.do">회원가입</a>
					</button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-9">
					<p class="title">로그인</p>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-5">
							<form action="${pageContext.request.contextPath}/login_ok.do"
								method="post">
								<input type="text" placeholder="이메일(example@gmail.com)"
									class="loginInfo" name="user_id"> <br> <input
									type="password" placeholder="패스워드" class="loginInfo"
									name="user_pw"><br> <a
									href="${pageContext.request.contextPath}/find_pw.do"
									id="find_pw">비밀번호를 잊으셨나요?</a>

								<hr style="width: 300px;">
						</div>
						<div class="col-md-6">
							<button id="loginBtn" type="submit" value="login">로그인</button>
						</div>
						</form>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-4">
							<img src="../images/naverLogin.png" id="naverLogin">
						</div>
						<div class="col-md-7"></div>
					</div>
				</div>
			</div>
		</div>

	</section>
</body>
</html>