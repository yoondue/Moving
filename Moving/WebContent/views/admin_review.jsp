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
	h3{
		margin: 10px;
		margin-bottom: 20px;
	}
	.list-group{
		margin-top: 20px;
	}
	.page{
		margin-top: 30px;
	}
	.table-box{
		width: 100%;	
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
					  <a href="#" class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span> 회원 관리</a>
					  <a href="#" class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span> 리뷰 관리</a>
					  <a href="#" class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span> 추천리스트 관리</a>
					  <a href="#" class="list-group-item"><span class="glyphicon glyphicon-hand-right"></span> 에디터 추천 영화</a>
					</div>
				</div>
				
				<div class="col-md-9">
					<div class="row">
						<h3>리뷰 관리</h3>
						<div class="table-box">
							<table class="table">
								<tr>
									<th>#</th>
									<th>영화 제목</th>
									<th>내용</th>
									<th>작성자</th>
									<th>별점</th>
									<th>추천 수</th>
								</tr>
								<tr>
									<td>1</td>
									<td>토이스토리4</td>
									<td>선택과 성장에 대한 이야기...</td>
									<td>꼬부기</td>
									<td>5.0</td>
									<td>10</td>
								</tr>
								<tr>
									<td>2</td>
									<td>엑시트</td>
									<td>일정 글자 이상 넘어가면 ...처리</td>
									<td>파이리</td>
									<td>4.0</td>
									<td>2</td>
								</tr>
								<tr>
									<td>1</td>
									<td>토이스토리4</td>
									<td>선택과 성장에 대한 이야기...</td>
									<td>꼬부기</td>
									<td>5.0</td>
									<td>10</td>
								</tr>
								<tr>
									<td>2</td>
									<td>엑시트</td>
									<td>일정 글자 이상 넘어가면 ...처리</td>
									<td>파이리</td>
									<td>4.0</td>
									<td>2</td>
								</tr>
								<tr>
									<td>1</td>
									<td>토이스토리4</td>
									<td>선택과 성장에 대한 이야기...</td>
									<td>꼬부기</td>
									<td>5.0</td>
									<td>10</td>
								</tr>
								<tr>
									<td>2</td>
									<td>엑시트</td>
									<td>일정 글자 이상 넘어가면 ...처리</td>
									<td>파이리</td>
									<td>4.0</td>
									<td>2</td>
								</tr>
								<tr>
									<td>1</td>
									<td>토이스토리4</td>
									<td>선택과 성장에 대한 이야기...</td>
									<td>꼬부기</td>
									<td>5.0</td>
									<td>10</td>
								</tr>
								<tr>
									<td>2</td>
									<td>엑시트</td>
									<td>일정 글자 이상 넘어가면 ...처리</td>
									<td>파이리</td>
									<td>4.0</td>
									<td>2</td>
								</tr>
								<tr>
									<td>1</td>
									<td>토이스토리4</td>
									<td>선택과 성장에 대한 이야기...</td>
									<td>꼬부기</td>
									<td>5.0</td>
									<td>10</td>
								</tr>
								<tr>
									<td>10</td>
									<td>엑시트</td>
									<td>일정 글자 이상 넘어가면 ...처리</td>
									<td>파이리</td>
									<td>4.0</td>
									<td>2</td>
								</tr>
							</table>
							
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
		</div>
		
	</section>

	<footer>
	
	</footer>



</body>
</html>