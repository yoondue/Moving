<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
section {
	padding-top: 90px;
	padding-bottom: 100px;
	font-family: 'Noto Sans KR', sans-serif;
}

#setProfile {
	text-decoration: none;
}

#separate {
	height: 20px;
}

.background {
	height: 200px;
	background-color: #EFE8E3;
	border-top: 1.5px solid #F2F2F2;
	border-bottom: 1.5px solid #F2F2F2;
}

.circle {
	background-color: gray;
	border-radius: 1000px !important;
	overflow: hidden;
	width: 100px;
	height: 100px;
	border: 8px solid rgba(255, 255, 255, 0.7);
}

/* tab */
#tabs {
	color: #eee;
}

#tabs h6.section-title {
	color: #eee;
}

#tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	color: #f3f3f3;
	background-color: transparent;
	border-bottom: 4px solid #894242 !important;
	font-size: 20px;
	font-weight: bold;
	background-color: transparent;
}

#tabs .nav-tabs .nav-link {
	border: transparent;
	border-top-left-radius: .25rem;
	border-top-right-radius: .25rem;
	color: #eee;
	font-size: 20px;
}

.list-group-item {
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<div class="background">
			<div class="row" id="separate"></div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2">
					<div class="circle">
						<!-- User Profile Image -->
						<img class="profile-pic" src="">
					</div>
				</div>
				<div class="col-md-9" style="">
					<h4>닉네임</h4>
					<small>닉네임 변경</small>
				</div>
			</div>
			<div class="row" id="separate"></div>
			<div class="row">
				<div class="col-md-10"></div>
				<div class="col-md-2">
					<a href="" id="setProfile">프로필 설정</a>
				</div>
			</div>
		</div>
		<!-- background -->

		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<nav>
					<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="nav-home-tab"
							data-toggle="tab" href="#nav-home" role="tab"
							aria-controls="nav-home" aria-selected="true">내 리뷰</a> <a
							class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab"
							href="#nav-profile" role="tab" aria-controls="nav-profile"
							aria-selected="false">스크랩</a>
					</div>
				</nav>
				<div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<!-- contents -->
						<ul class="list-group">
							<li class="list-group-item">First item</li>
							<li class="list-group-item">Second item</li>
							<li class="list-group-item">Third item</li>
						</ul>
					</div>
					<div class="tab-pane fade" id="nav-profile" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<!-- contents -->
						<ul class="list-group">
							<li class="list-group-item">First item</li>
							<li class="list-group-item">Second item</li>
							<li class="list-group-item">Third item</li>
						</ul>
					</div>
				</div>

			</div>
			<div class="col-md-2"></div>
		</div>
	</section>
</body>
</html>