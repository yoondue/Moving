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
	.titleBox{
		margin-bottom: 20px;
	}
	.subject{
		padding: 0px;
	}
	.table{
		width: 90%;
	}
	.page{
		width: 235px;
		margin: 0 auto;
	}
</style>

</head>
<body>

	<header>
	
	</header>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="list-group">
					  <a href="#" class="list-group-item">회원 관리</a>
					  <a href="#" class="list-group-item">리뷰 관리</a>
					  <a href="#" class="list-group-item">추천리스트 관리</a>
					  <a href="#" class="list-group-item">에디터 추천 영화</a>
					</div>
				</div>
				
				<div class="col-md-9">
					<div class="row titleBox">
						<div class="col-md-9 subject">
							<h3> 에디터 추천 영화 관리</h3>
						</div>
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="submit">등록하기</button>
						</div>
					</div>
					<div class="row">
							<table class="table">
								<tr>
									<th>#</th>
									<th>영화 제목</th>
									<th>이미지</th>
									<th>수정/삭제</th>
								</tr>
								<tr>
									<td>1</td>
									<td>토이스토리 4</td>
									<td>파일 경로</td>
									<td>
										<button type="submit" class="btn btn-success btn-sm" id="modify">수정하기</button>
										<button type="submit" class="btn btn-danger btn-sm" id="delete">삭제하기</button>
										</td>
								</tr>
								<tr>
									<td>2</td>
									<td>토이스토리 4</td>
									<td>파일 경로</td>
									<td>
										<button type="submit" class="btn btn-success btn-sm" id="modify">수정하기</button>
										<button type="submit" class="btn btn-danger btn-sm" id="delete">삭제하기</button>
										</td>
								</tr>
								<tr>
									<td>3</td>
									<td>토이스토리 4</td>
									<td>파일 경로</td>
									<td>
										<button type="submit" class="btn btn-success btn-sm" id="modify">수정하기</button>
										<button type="submit" class="btn btn-danger btn-sm" id="delete">삭제하기</button>
										</td>
								</tr>
								<tr>
									<td>4</td>
									<td>토이스토리 4</td>
									<td>파일 경로</td>
									<td>
										<button type="submit" class="btn btn-success btn-sm" id="modify">수정하기</button>
										<button type="submit" class="btn btn-danger btn-sm" id="delete">삭제하기</button>
										</td>
								</tr>
								<tr>
									<td>5</td>
									<td>토이스토리 4</td>
									<td>파일 경로</td>
									<td>
										<button type="submit" class="btn btn-success btn-sm" id="modify">수정하기</button>
										<button type="submit" class="btn btn-danger btn-sm" id="delete">삭제하기</button>
										</td>
								</tr>
								<tr>
									<td>6</td>
									<td>토이스토리 4</td>
									<td>파일 경로</td>
									<td>
										<button type="submit" class="btn btn-success btn-sm" id="modify">수정하기</button>
										<button type="submit" class="btn btn-danger btn-sm" id="delete">삭제하기</button>
										</td>
								</tr>
								<tr>
									<td>7</td>
									<td>토이스토리 4</td>
									<td>파일 경로</td>
									<td>
										<button type="submit" class="btn btn-success btn-sm" id="modify">수정하기</button>
										<button type="submit" class="btn btn-danger btn-sm" id="delete">삭제하기</button>
										</td>
								</tr>
								<tr>
									<td>8</td>
									<td>토이스토리 4</td>
									<td>파일 경로</td>
									<td>
										<button type="submit" class="btn btn-success btn-sm" id="modify">수정하기</button>
										<button type="submit" class="btn btn-danger btn-sm" id="delete">삭제하기</button>
										</td>
								</tr>
							</table>
						
						<br>
						<div class="page">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<li class="page-item"><a class="page-link" href="#">Previous</a></li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">Next</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
	
	</footer>


</body>
</html>