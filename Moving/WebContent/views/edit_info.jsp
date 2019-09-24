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
 	body{ 
 		background-image: url("/Moving/images/background.jpg"); 
 		background-size: 100%; 
 	} 
	.container{
		padding-top: 120px;
	}
	h3{
		color: white;
	}
	.form{
		margin: 0 auto;
	}
 	.genre{
 		display: inline;
 		float: left;
 		margin-right: 10px;
 	}
	 .genre span{
	 	text-align: center;
  		display: block;
  	} 
	.genre .image{
		width: 80px;
		height: 80px;
		border: 1px solid white;
	}
	.genre .image img{
		width: 80px;
		height: 80px;
	}
	.check{
		width: 400px;
		height: 110px;
		margin-bottom: 10px;
	}
	.checked-image{
		background-color: #EFEEEE;
	}
	.check input[type=checkbox]{
		display: none;
	}
	.email{
		width: 100%;
	}
	#email{
		display: block;
		width: 100%;
	}
	#nickname{
		display: block;
		width: 77%;
		float:left;
	}
	.join-btn{
		background-color: #894242;
/* 		border: 1px solid white; */
	}
	.cancel-btn{
/* 		background-color: red; */
	}
	.box1{
		margin: 0 auto;
	}
	.box2{
		width: 100%;
		text-align: center;
	}

</style>

<script type="text/javascript">
	$(function(){
		
		// 회원이 체크했던 장르 선택되게		
		$("input:checkbox[name='check']:checked").each(function(index, item){
			var value = $(item).val();
			$(item).prev('label').attr('class','image checked-image');
		});
		
		// 체크박스가 변경되면 실행됨
		$("input:checkbox[name='check']").change(function(){
			// 체크된 상태면 checked-image 클래스 추가
			if($(this).is(":checked")){
				$(this).prev('label').addClass('checked-image');
			}else{
				$(this).prev('label').removeClass('checked-image');
			}
		});
		
	});
	
</script>

</head>
<body>

	<header>
	
	</header>
	
	<section>
		<div class="container">
		
			<div class="row">
				<div class="col-md-3">
					
				</div>

				<div class="col-md-6">
				
					<div class="row">
						<div class="col-md-1">
						
						</div>
						<div class="col-md-11">
							<h3>회원 정보 수정</h3>
						</div>
						
					</div>

					<div class="row box1">
						<form method="post" action="" class="form">
						 					
							<div class="form-group email">
								<label for="email" class="email-label">이메일 주소</label>
								<input type="email" class="form-control" id="email" value="email@naver.com" disabled>
							</div>
						

						<div class="form-group">
							<label for="pw">패스워드</label> 
							<input type="password" class="form-control" id="pw" value="a1234!@#">
						</div>
						<div class="form-group">
							<label for="pw2">패스워드 확인</label> 
							<input type="password" class="form-control" id="pw2" value="a1234!@#">
						</div>

						<label for="nickname">닉네임</label>
						<div class="form-group">
							<input type="text" class="form-control" id="nickname" value="김유니">
							<button type="submit" class="btn btn-secondary">중복확인</button>
						</div>

						<div>
							<br>선택 정보: 영화 맞춤 추천 시 사용되어집니다!<br>
							<br> <label>연령대</label><br> <select name="age">
								<option value="">연령대를 선택하세요</option>
								<option value="10대">10대</option>
								<option value="20대" selected>20대</option>
								<option value="30대">30대</option>
								<option value="40대">40대</option>
								<option value="50대">50대이상</option>
							</select>
						</div>

						<div>
							<br>
							<label>성별</label><br>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender" id="gender-male" value="male"> 
								<label class="form-check-label" for="gender-male">남 </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender" id="gender-female" value="female" checked> 
								<label class="form-check-label" for="gender-female">여 </label>
							</div>
						</div>

						<div>
							<br>
							<label>내가 좋아하는 영화장르 (선택 시, 추천 영화 제공)</label><br>
							<br>

							<div class="check">
								<div class="genre">
									<label class="image" for="action"> <img src="/Moving/images/genre/action.png"></label> 
									<input type="checkbox" name="check" id="action" value="action" checked><span>액션</span>
								</div>

								<div class="genre">
									<label class="image" for="animation"> <img src="/Moving/images/genre/animation.png"></label> 
									<input type="checkbox" name="check" id="animation" value="animation" checked><span>애니메이션</span>
								</div>
								<div class="genre">
									<label class="image" for="comedy"><img src="/Moving/images/genre/comedy.png"></label> 
									<input type="checkbox" name="check" id="comedy" value="comedy" checked><span>코미디</span>
								</div>
								<div class="genre">
									<label class="image" for="crime"><img src="/Moving/images/genre/crime.png"></label> 
									<input type="checkbox" name="check" id="crime" value="crime"><span>범죄</span>
								</div>
							</div>

							<div style="clear: both;"></div>

							<div class="check">
								<div class="genre">
									<label class="image" for="drama"><img src="/Moving/images/genre/drama.png"></label> 
									<input type="checkbox" name="check" id="drama" value="drama"><span>드라마</span>
								</div>
								<div class="genre">
									<label class="image" for="family"><img src="/Moving/images/genre/family.png"></label> 
									<input type="checkbox" name="check" id="family" value="family"><span>가족</span>
								</div>
								<div class="genre">
									<label class="image" for="fantasy"><img src="/Moving/images/genre/fantasy.png"></label> 
									<input type="checkbox" name="check" id="fantasy" value="fantasy"><span>판타지</span>
								</div>
								<div class="genre">
									<label class="image" for="horror"><img src="/Moving/images/genre/horror.png"></label> 
									<input type="checkbox" name="check" id="horror" value="horror"><span>호러</span>
								</div>
							</div>

							<div style="clear: both;"></div>

							<div class="check">
								<div class="genre">
									<label class="image" for="music"><img src="/Moving/images/genre/music.png"></label> 
									<input type="checkbox" name="check" id="music" value="music"><span>뮤지컬</span>
								</div>
								<div class="genre">
									<label class="image" for="romance"><img src="/Moving/images/genre/romance.png"></label> 
									<input type="checkbox" name="check" id="romance" value="romance"><span>로맨스</span>
								</div>
								<div class="genre">
									<label class="image" for="sf"><img src="/Moving/images/genre/sf.png"></label> 
									<input type="checkbox" name="check" id="sf" value="sf"><span>SF</span>
								</div>
								<div class="genre">
									<label class="image" for="thriller"><img src="/Moving/images/genre/thriller.png"></label> 
									<input type="checkbox" name="check" id="thriller" value="thriller"><span>스릴러</span>
								</div>
							</div>
						</div>

						<br>
						<br> 
						<div class="box2">
							<input type="submit" class="btn btn-secondary join-btn" value="수정하기">
							<input type="submit" class="btn btn-default cancel-btn" value="취소">
						</div>
						
					</form>
				</div>
					
				</div>
				
				<div class="col-md-3">
					
				</div>



			</div>
		</div>
		
	</section>

	<footer>
	
	</footer>

</body>
</html>
