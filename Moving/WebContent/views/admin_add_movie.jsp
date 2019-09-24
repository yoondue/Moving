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
	section {
 	  	padding-top: 120px;
  	 	padding-bottom: 100px;
	}
	.list-group{
		margin-top: 20px;
	}
 	.form-box1{ 
 		width: 70%; 
 	} 
 	.form-box2{ 
 		width: 100%; 
 	} 
	#div-table{
		height: 300px;
		overflow: scroll;
		overflow-x: hidden;
	}
	#submit{
		float: right;
	}
	.btn-box{
		float: right;
	}

</style>

</head>
<body>

	<header>
	
	</header>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-3">
					<div class="list-group">
					  <a href="#" class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span> 회원 관리</a>
					  <a href="#" class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span> 리뷰 관리</a>
					  <a href="#" class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span> 추천리스트 관리</a>
					  <a href="#" class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span> 에디터 추천 영화</a>
					</div>
				</div>
				
				<div class="col-md-8 col-8">
					<div class="row">
						<h3>에디터 추천 영화 작성</h3>
					</div>
					<div class="row">
						<form class="form-box1">
							<div class="input-group mb-3">
							  <input type="text" class="form-control" placeholder="영화 제목을 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2">
							  <div class="input-group-append">
							    <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
							  </div>
							</div>
						
						</form>
					</div>
					
					<div class="row" id="div-table">
						<form class="form-box2">
							<table class="table">
								<tr>
									<th>영화제목</th>
									<th>감독</th>
									<th>장르</th>
									<th>연도</th>
									<th>선택하기</th>
								</tr>
								<tr>
									<td>토이스토리 1</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio"></td>
								</tr>
								<tr>
									<td>토이스토리 2</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio"></td>
								</tr>
								<tr>
									<td>토이스토리 3</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio"></td>
								</tr>
								<tr>
									<td>토이스토리 4</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio"></td>
								</tr>
								<tr>
									<td>토이스토리 5</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio"></td>
								</tr>
								<tr>
									<td>토이스토리 6</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio"></td>
								</tr>
								<tr>
									<td>토이스토리 7</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio"></td>
								</tr>
								<tr>
									<td>토이스토리 8</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio"></td>
								</tr>
								<tr>
									<td>토이스토리 9</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio"></td>
								</tr>
								<tr>
									<td>토이스토리 10</td>
									<td>ㅇㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>ㅇㅇ</td>
									<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="radio"></td>
								</tr>
							</table>
						</form>	
					</div>
					<br><br>
					<div class="row btn-box">
						<button type="submit" class="btn btn-primary" id="submit">등록하기</button>
					</div>
				</div>
			</div>
		</div>
		
	</section>

	<footer>
	
	</footer>


</body>
</html>