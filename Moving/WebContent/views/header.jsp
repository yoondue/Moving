<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.net.URLEncoder" %>
<%
	String[] genre = {"드라마", "스릴러", "코미디", "액션", "로맨스", "공포",
						"애니메이션", "범죄", "판타지", "SF", "가족", "뮤지컬"};

	for(int i=0; i<genre.length; i++){
		genre[i] = URLEncoder.encode(genre[i], "UTF-8");
	}

%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="lib.jsp"%>
<style>
@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

header {
	font-size: 15px;
	width: 100%;
	background-color: red;
}

footer {
	color: #B8BAC3;
	text-align: center;
	position: relative;
	clear: both;
	bottom: 0;
}

#logo {
	padding: 10px;
	width: 120px;
	margin-left: 10px;
	padding-bottom: 10px;
}

form {
	padding-top: 20px;
	padding-bottom: 20px;
}
/* Style the search field */
form.search input[type=text] {
	font-size: 13px;
	border: none;
	border-bottom: 1px solid grey;
	width: 300px;
	background: none;
	outline: none;
}

form.search button {
	font-size: 17px;
	border: none;
	background: none;
	color: #5D5965;
}

form.search input:focus {
	border-bottom-width: 1.5px;
}

#ck_search {
	font-size: 13px;
}

.dropdown-menu {
	width: 650px;
}

/* checkbox */
input[type=checkbox] {
	display: none;
}

input[type=checkbox]+label {
	display: inline-block;
	position: relative;
	padding: 8px;
	background-color: white;
	border: 1px solid #D55C5A;
	border-radius: 5px;
	width: 8px;
}

input[type=checkbox]:checked+label {
	color: #CC679D;
}

input[type=checkbox]:checked+label:after {
	position: absolute;
	left: 8px;
	top: 0px;
	color: #fff;
	content: '\2714';
	font-size: 10px;
}

.dropdown-menu {
	border: none;
	background-color: rgba(239, 238, 238, 0.9);
}

#searchBtn, #searchExitBtn {
	border-radius: 5px;
	color: white;
	border: none;
	width: 100px;
	padding: 5px;
	cursor: pointer;
}

#searchBtn {
	background-color: #D55C5A;
}

#searchExitBtn {
	background-color: #61656A;
}

#search, #user {
	cursor: pointer;
}

#loginDropDown {
	list-style: none;
}

#loginDropDownMenu {
	align-content: center;
	width: 20px;
}
</style>

<script type="text/javascript">
	$(function() {

		$('#searchExitBtn').click(function() {
			$('#menu').removeClass('nav-item dropdown show');
			$('#menu').addClass('nav-item dropdown');

			$('#menuBox').removeClass('dropdown-menu show');
			$('#menuBox').addClass('dropdown-menu');
		});

		$("#user").click(function() {
			location.href = "${pageContext.request.contextPath}/login.do";
		});
	});
</script>

</head>
<body>

	<nav id="#fixed"
		class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/main.do"><img
			src="/Moving/images/logo.png" id="logo"></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">★</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a class="nav-link dropdown"
					href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"><i
						class="fa fa-bars" id="menu"></i></a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown"
						id="menuBox">
						<p style="padding: 30px 0 0 150px;">장르별&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
							&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;평점별</p>
						<form action="${pageContext.request.contextPath}/search_result.do"
							method="get" id="ck_search">
							<div style="float: left; margin: 0 40px 30px 50px;">
								<br> <input type="checkbox" name="genre" value="<%=genre[0] %>"
									id="chk1"><label for="chk1"></label>드라마<br> <input
									type="checkbox" name="genre" value="<%=genre[1] %>" id="chk2"><label
									for="chk2"></label>스릴러<br> <input type="checkbox"
									name="genre" value="<%=genre[2] %>" id="chk3"><label for="chk3"></label>코미디<br>
								<input type="checkbox" name="genre" value="<%=genre[3] %>" id="chk4"><label
									for="chk4"></label>액션
							</div>
							<div style="float: left; margin: 0 40px 30px 0;">
								<br> <input type="checkbox" name="genre" value="<%=genre[4] %>"
									id="chk5"> <label for="chk5"></label>로맨스<br> <input
									type="checkbox" name="genre" value="<%=genre[5] %>" id="chk6"><label
									for="chk6"></label>공포<br> <input type="checkbox"
									name="genre" value="<%=genre[6] %>" id="chk7"><label
									for="chk7"></label>애니메이션<br> <input type="checkbox"
									name="genre" value="<%=genre[7] %>" id="chk8"><label for="chk8"></label>범죄<br>
								<br> <br> <input type="submit" value="검색하기"
									id="searchBtn">
							</div>
							<div style="float: left; margin: 0 40px 30px 0;">
								<br> <input type="checkbox" name="genre" value="<%=genre[8] %>"
									id="chk9"><label for="chk9"></label> 판타지<br> <input
									type="checkbox" name="genre" value="<%=genre[9] %>" id="chk10"><label
									for="chk10"></label>SF<br> <input type="checkbox"
									name="genre" value="<%=genre[10] %>" id="chk11"><label
									for="chk11"></label>가족<br> <input type="checkbox"
									name="genre" value="<%=genre[11] %>" id="chk12"><label
									for="chk12"></label>뮤지컬
							</div>

							<div style="float: right; margin: 0 80px 30px 50px;">
								<br> <input type="checkbox" name="star" value="9" id="chk13"><label
									for="chk13"></label>9점 이상 <br> <input type="checkbox"
									name="star" value="8"  id="chk14"><label for="chk14"></label>8점 이상
								<br> <input type="checkbox" name="star"
									value="7" id="chk15"><label for="chk15"></label>7점 이상 <br>
								<input type="checkbox" name="star" value="6"  id="chk16"><label
									for="chk16"></label>6점 이상<br> <br> <br> <input
									type="button" value="닫기" id="searchExitBtn">
							</div>

						</form>
					</div></li>
			</ul>
			<form class="search" action="${pageContext.request.contextPath}/search_name_result.do"
							method="get" id="name_search">
				<input type="text" placeholder="검색어를 입력하세요." name="keyword">
				<button type="submit">
					<i class="fa fa-search" id="search"></i>
				</button>
				<c:choose>
					<c:when test="${loginInfo == null}">
						<button type="button">
							<i class="fa fa-user" id="user"></i>
						</button>
					</c:when>
					<c:otherwise>
						<li class="dropdown" id="loginDropDown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							style="padding: 5px">${loginInfo.nickname} <span
								class="caret"></span>
						</a> <!-- 로그인한 경우 표시될 메뉴 -->
							<ul class="dropdown-menu" id="loginDropDownMenu">
								<li><a href="${pageContext.request.contextPath}/logout.do">
										로그아웃</a></li>
								<li><a href="${pageContext.request.contextPath}/my_review.do">
										마이페이지</a></li>
								<li><a href="${pageContext.request.contextPath}/out.do">
										회원탈퇴</a></li>
							</ul></li> 
					</c:otherwise>
				</c:choose>
			</form>

		</div>
		<!-- collapse navbar-collapse -->
	</nav>

</body>
</html>