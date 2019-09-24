<%-- <%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*"%>

<!-- 로그인 정보를 가지고 bean에 담고, DB에 연결하여 회원인지 체크하는  쿼리 수행 -->

<%!Connection conn; // 드라이버 로드
	Statement statement;
	ResultSet resultSet;

	// DB 접속 확인
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id = "testuser";
	String pw = "dbslfnd";%>

<%
	try {
		// 1. JDBC 드라이버 로딩하기
		Class.forName(driver);

		// 2. DB 서버 접속하기
		conn = DriverManager.getConnection(url, id, pw);

		// 3. Statement OR PreparedStatement 객체 (SQL문 실행 객체) 생성하기
		statement = conn.createStatement();

		// 아이디, 비밀번호 이용하여 쿼리 수행
		//String uid = "dragon";
		//String upw = "5678";
		String uid = request.getParameter("uid");
		String upw = request.getParameter("upw");
		String sql = "SELECT * FROM student WHERE id='" + uid + "' AND passwd='" + upw + "'";

		// 4. SQL 실행
		resultSet = statement.executeQuery(sql); // select 결과를 저장하는 ResultSet

		// UNIQUE 속성 주었다는 전제하에 -> ID가 UNIQUE할 때
		User userBean = null;
		if (resultSet.next()) { // 데이터가 존재하면,
			userBean = new User();
			userBean.setUid(resultSet.getString("id"));
			userBean.setUpw(resultSet.getString("passwd"));
			userBean.setUname(resultSet.getString("name"));
			userBean.setRegdate(resultSet.getString("reg_date"));
		}

		// 자원 정리
		resultSet.close();
		statement.close();

		if (userBean == null) {
			out.println("<script>");
			out.println("alert('아이디 또는 패스워드가 잘못되었습니다.')");
			out.println("location.href='login.jsp'");
			out.println("</script>");
		} else {
			// bbs.jsp로
			request.setAttribute("user", userBean); // user 정보 같이 넘기기
			RequestDispatcher rd = request.getRequestDispatcher("bbs.jsp");
			rd.forward(request, response);
		}

	} catch (SQLException e) {
		e.printStackTrace();
	}
%> --%>