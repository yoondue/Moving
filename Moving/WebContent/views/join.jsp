<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
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

.title {
	color: white;
	font-size: 20px;
	font-weight: bold;
}

h3 {
	color: white;
}

.form {
	margin: 0 auto;
}

.genre {
	display: inline;
	float: left;
	margin-right: 10px;
}

.genre span {
	text-align: center;
	display: block;
}

.genre .image {
	width: 80px;
	height: 80px;
	border: 1px solid white;
	cursor: pointer;
}

.genre .image img {
	width: 80px;
	height: 80px;
}

.check {
	width: 400px;
	height: 110px;
	margin-bottom: 10px;
}

.checked-image {
	background-color: #717072;
}

.check input[type=checkbox] {
	display: none;
}

.email {
	width: 100%;
}

#email, #nickname {
	display: block;
	width: 77%;
	float: left;
}

.join-btn {
	background-color: #894242;
	/* 		border: 1px solid white; */
}

.cancel-btn {
	/* 		background-color: red; */
	
}

.box1 {
	margin: 0 auto;
}

.box2 {
	width: 100%;
	text-align: center;
}
</style>

<script type="text/javascript">
	$(function() {

		// 체크박스가 변경되면 실행됨
		$("input:checkbox[name='genre']").change(function() {
			// 체크된 상태면 checked-image 클래스 추가
			if ($(this).is(":checked")) {
				$(this).prev('label').addClass('checked-image');
			} else {
				$(this).prev('label').removeClass('checked-image');
			}
		});

	});
</script>

</head>
<body>
	<section>
		<div class="container">
			<div class="row" style="height: 60px;"></div>

			<div class="row">
				<div class="col-md-3"></div>

				<div class="col-md-9">
					<p class="title">회원가입</p>
					<div class="row box1">
						<div class="col-md-1"></div>
						<div class="col-md-8">
							<form action="${pageContext.request.contextPath}/join_ok.do"
								method="post" class="form">
								<label for="email" class="email-label">이메일 주소</label>
								<div class="form-group email">
									<input type="email" name="user_id" class="form-control"
										id="email" placeholder="example@gmail.com">
									<button type="submit" class="btn btn-secondary">중복확인</button>
								</div>
								<div class="form-group">
									<label for="pw">패스워드</label> <input type="password"
										name="user_pw" class="form-control" id="pw"
										placeholder="패스워드는 8자 이상, 20자 이하로 영문/숫자/특수문자 포함">
								</div>
								<div class="form-group">
									<label for="pw2">패스워드 확인</label> <input type="password"
										name="user_pw2" class="form-control" id="pw2"
										placeholder="패스워드는 8자 이상, 20자 이하로 영문/숫자/특수문자 포함">
								</div>

								<label for="nickname">닉네임</label>
								<div class="form-group">
									<input type="text" name="nickname" class="form-control"
										id="nickname" placeholder="특수문자 불가">
									<button type="submit" class="btn btn-secondary">중복확인</button>
								</div>

								<div>
									<br>
									<hr>
									<strong>※영화 맞춤 추천 시 사용되어집니다!</strong><br> <br> <label>연령대</label><br>
									<select name="age">
										<option value="">연령대를 선택하세요</option>
										<option value="10">10대</option>
										<option value="20">20대</option>
										<option value="30">30대</option>
										<option value="40">40대</option>
										<option value="50">50대이상</option>
									</select>
								</div>

								<div>
									<br> <label>성별</label><br>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="gender"
											id="gender-male" value="M" checked> <label
											class="form-check-label" for="gender-male">남 </label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="gender"
											id="gender-female" value="F"> <label
											class="form-check-label" for="gender-female">여 </label>
									</div>
								</div>

								<div>
									<br> <label>내가 좋아하는 영화장르<small>(추천 영화 제공,
											최대 3개까지 선택 가능)</small></label><br> <br>

									<div class="check">
										<div class="genre">
											<label class="image" for="action"> <img
												src="/Moving/images/genre/action.png"></label> <input
												type="checkbox" name="genre" id="action" value="액션"><span>액션</span>
										</div>

										<div class="genre">
											<label class="image" for="animation"> <img
												src="/Moving/images/genre/animation.png"></label> <input
												type="checkbox" name="genre" id="animation" value="애니메이션"><span>애니메이션</span>
										</div>
										<div class="genre">
											<label class="image" for="comedy"><img
												src="/Moving/images/genre/comedy.png"></label> <input
												type="checkbox" name="genre" id="comedy" value="코미디"><span>코미디</span>
										</div>
										<div class="genre">
											<label class="image" for="crime"><img
												src="/Moving/images/genre/crime.png"></label> <input
												type="checkbox" name="genre" id="crime" value="범죄"><span>범죄</span>
										</div>
									</div>

									<div style="clear: both;"></div>

									<div class="check">
										<div class="genre">
											<label class="image" for="drama"><img
												src="/Moving/images/genre/drama.png"></label> <input
												type="checkbox" name="genre" id="drama" value="드라마"><span>드라마</span>
										</div>
										<div class="genre">
											<label class="image" for="family"><img
												src="/Moving/images/genre/family.png"></label> <input
												type="checkbox" name="genre" id="family" value="가족"><span>가족</span>
										</div>
										<div class="genre">
											<label class="image" for="fantasy"><img
												src="/Moving/images/genre/fantasy.png"></label> <input
												type="checkbox" name="genre" id="fantasy" value="판타지"><span>판타지</span>
										</div>
										<div class="genre">
											<label class="image" for="horror"><img
												src="/Moving/images/genre/horror.png"></label> <input
												type="checkbox" name="genre" id="horror" value="호러"><span>호러</span>
										</div>
									</div>

									<div style="clear: both;"></div>

									<div class="check">
										<div class="genre">
											<label class="image" for="music"><img
												src="/Moving/images/genre/music.png"></label> <input
												type="checkbox" name="genre" id="music" value="뮤지컬"><span>뮤지컬</span>
										</div>
										<div class="genre">
											<label class="image" for="romance"><img
												src="/Moving/images/genre/romance.png"></label> <input
												type="checkbox" name="genre" id="romance" value="로맨스"><span>로맨스</span>
										</div>
										<div class="genre">
											<label class="image" for="sf"><img
												src="/Moving/images/genre/sf.png"></label> <input
												type="checkbox" name="genre" id="sf" value="SF"><span>SF</span>
										</div>
										<div class="genre">
											<label class="image" for="thriller"><img
												src="/Moving/images/genre/thriller.png"></label> <input
												type="checkbox" name="genre" id="thriller" value="스릴러"><span>스릴러</span>
										</div>
									</div>
								</div>

								<br> <br>
								<div class="box2">
									<input type="submit" class="btn btn-secondary join-btn"
										value="회원가입"> <input type="submit"
										class="btn btn-default cancel-btn" value="취소">
								</div>

							</form>
						</div>
					</div>

				</div>


			</div>
		</div>

	</section>

	<footer> </footer>

</body>
</html>
