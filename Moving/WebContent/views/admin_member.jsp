<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
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
	.title{
		width: 100%;
	}
	.tableBox{
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
					  <a href="${pageContext.request.contextPath}/admin_member.do" class="list-group-item">회원 관리</a>
					  <a href="${pageContext.request.contextPath}/admin_review.do" class="list-group-item">리뷰 관리</a>
					  <a href="${pageContext.request.contextPath}/admin_list_movie.do" class="list-group-item">에디터 추천 영화</a>
					</div>
				</div>
				
				<div class="col-md-9">
					<div class="row">
						<div class="title">
							<h3>회원 관리</h3>
						</div>
						<div class="tableBox">
							<table class="table">
<!-- 								<thead> -->
									<tr>
										<th>회원번호</th>
										<th>이메일</th>
										<th>닉네임</th>
										<th>관심장르</th>
										<th>성별</th>
										<th>연령대</th>
										<th>가입일</th>
										<th>회원삭제</th>
									</tr>
<!-- 								</thead> -->
								
<!-- 								<tbody> -->
									<c:choose>
										<c:when test="${fn:length(memberList)>0 }">
											<c:forEach var="member" items="${memberList}">
												<tr>
													<td>${member.id }</td>
													<td>${member.userId }</td>
													<td>${member.nickname }</td>
													<td>${member.genre1 }</td>
													<td>${member.gender }</td>
													<td>${member.age }</td>
													<td>${member.regDate }</td>
													<td><input type="submit" value="삭제하기" class="btn btn-danger btn-sm"></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
				           						<td colspan="5" class="text-center" style="line-height: 100px;">조회된 글이 없습니다.</td>
				        					</tr>
										</c:otherwise>
									</c:choose>
<!-- 								</tbody> -->
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