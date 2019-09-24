<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Moving</title>
<meta name="keywords"
	content="fullpage,jquery,demo,scroll,loop,continuous" />
<meta name="Resource-type" content="Document" />
<link rel="stylesheet" type="text/css" href="../dist/fullpage.css" />
<style type="text/css">
.section {
	font-family: 'Noto Sans KR', sans-serif;
}

#section1 {
	background-image: url("../images/welcome1.jpg");
	background-size: cover;
}

#section2 {
	background-image: url("../images/welcome2.jpg");
	background-size: cover;
}

#section3 {
	background-image: url("../images/welcome3.jpg");
	background-size: cover;
}

.welcomePost {
	padding: 30px;
	font-weight: bold;
	text-align: center;
	background-color: #ffffff;
	opacity: 0.6;
}
</style>
<script type="text/javascript">
	window.onload = function() {
		// 페이지가 로딩된 후 실행해야 되는 코드를 추가한다.
		alert(request.getParameter("uid"));
		/* if(request.getParameter("uid").equals("")) {
			alert("!");
		} else {
			alert("${user.uid }" + "님 안녕하세요!");
		} */
	}
</script>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div id="fullpage">
		<div class="section" id="section1">
			<h5 class="welcomePost">
				당신을 위한 영화의 모든 것.<br>지금 바로 무빙과 함께해요!
			</h5>
		</div>
		<div class="section" id="section2">
			<h5 class="welcomePost">
				나누고 공유하기.<br>당신의 인생 영화를 추천하고 추천 받으세요!
			</h5>
		</div>

		<div class="section" id="section3">
			<div class="intro">
				<h5 class="welcomePost">
					무비 플레이리스트 만들기.<br>나만의 스토리보드를 만들어 보여주세요!
				</h5>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="../dist/fullpage.js"></script>
	<script type="text/javascript">
		var myFullpage = new fullpage('#fullpage', {
			anchors : [ 'first', 'second', 'third' ],
			menu : '#menu',
			lazyLoad : true
		});
	</script>
</body>

</html>