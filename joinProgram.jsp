<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
	//통로
		Class.forName("oracle.jdbc.driver.OracleDriver");
	//보안카드
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		//(이클립스에서하는거라 유알엘까지 적어야)
		String db_id = "hr";
		String db_pw = "hr";
		
		//(보안카드에담아줄껀데 타입이 커넥션
		Connection conn = DriverManager.getConnection(db_url, db_id, db_pw);
	
		String sql = "insert into member values(?,?,?)";
		//(컨을거쳐 Prepared타입의 psmt에 넣어서)
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,id);
		psmt.setString(2,pw);
		psmt.setString(3,name);
		//아직엔터안쳤고
		//excute에 쿼리 업데이트 두개잇는데 db변동잇으면 업엣변동없으면 쿼리
		//실제로 커맨드라인창에서 인서트즉업뎃하면 1rowcreated 이것만나옴 몇개바꼇는지만
		
		//psmt.executeUpdate()만해도 엔터친효과 
		
		int cnt = psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		//stringsql오류나서 psmt 이미 닫혀있는 상황에서 psmtclose하면 에러
		//그래서열려잇을때만닫히라고해야함
		
		if(psmt != null){
			psmt.close();
		}
		
		if(conn != null){
			conn.close();
		}
		
		if(cnt>0){
			System.out.print("회원가입 성공");
			response.sendRedirect("login.jsp");
		}else{
			System.out.print("회원가입 실패");
			response.sendRedirect("join.jsp");
		}
	%>

</body>
</html>