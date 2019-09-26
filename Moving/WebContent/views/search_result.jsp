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
	.img-box{
		width: 100%;
	}
	.span-box{
		width: 100%;
		margin-top: 5px;
		margin-bottom: 15px;
	}
	.title{
		font-size: 20px;
	}
	.content{
/* 		font-weight: bold;  */
		color: #c3c2c4;
	}	
	span{
		display: block;
	}
	a:link {text-decoration:none; color:#646464;}
	a:visited {text-decoration:none; color:#646464;}
	a:active {text-decoration:none; color:#646464;}
	a:hover {text-decoration:none; color:#646464;}
	
	.img-thumbnail{
		width: 100%;
		height: 300px;
	}

</style>

<script type="text/javascript">
	

</script>

</head>
<body>

	<header>
	
	</header>
	
	<section>
		<div class="container">
			<div class="row">
				<div class="col-md-1 col-2"></div>
				
				<div class="col-md-10 col-8">
					<div class="row">
						<c:choose>
							<c:when test="${fn:length(movieList)>0 }">
								<c:forEach var="movie" items="${movieList}" varStatus="status">
									<div class="col-md-3">
										<div class="img-box">
											<a href="${pageContext.request.contextPath}/movie_info.do?title=${movie.title}"><img src="${movie.image}" class="img-thumbnail"></a>
										</div>
										<div class="span-box">
											<a href="#"><span class="title">${movie.title}</span></a>
											<span class="content">${movie.pubDate}・${movie.country}</span>
											
											<c:choose>
												<c:when test="${ null ne movie.genre3 }">
													<span class="content">${movie.genre1}・${movie.genre2 }・${movie.genre3 }</span>
												</c:when>
												<c:when test="${ null ne movie.genre2 }">
													<span class="content">${movie.genre1}・${movie.genre2 }</span>
												</c:when>
												<c:when test="${ null ne movie.genre1 }">
													<span class="content">${movie.genre1}</span>
												</c:when>
											</c:choose>
											
											
											
<%-- 											<c:if test="${ null ne movie.genre3 }"> --%>
<%-- 												<span class="content">${movie.genre1}</span> --%>
<%-- 											</c:if> --%>
<%-- 											<c:if test="${movie.genre3 == null }"> --%>
<%-- 												<span class="content">${movie.genre1}・${movie.genre2 }</span> --%>
<%-- 											</c:if> --%>
<%-- 											<c:if test="${movie.genre1 != null }"> --%>
<%-- 												<span class="content">${movie.genre1}・${movie.genre2 }</span> --%>
<%-- 											</c:if> --%>
										</div>						
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
									<tr>
					           			<td colspan="5" class="text-center" style="line-height: 100px;">조회된 글이 없습니다.</td>
					        		</tr>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
				<div class="col-md-1 col-2"></div>
		</div>
	</section>

	<footer>
	
	</footer>

</body>
</html>
