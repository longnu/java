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
	//���
		Class.forName("oracle.jdbc.driver.OracleDriver");
	//����ī��
		String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
		//(��Ŭ���������ϴ°Ŷ� ���˿����� �����)
		String db_id = "hr";
		String db_pw = "hr";
		
		//(����ī�忡����ٲ��� Ÿ���� Ŀ�ؼ�
		Connection conn = DriverManager.getConnection(db_url, db_id, db_pw);
	
		String sql = "insert into member values(?,?,?)";
		//(�������� PreparedŸ���� psmt�� �־)
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,id);
		psmt.setString(2,pw);
		psmt.setString(3,name);
		//�������;��ư�
		//excute�� ���� ������Ʈ �ΰ��մµ� db���������� �������������� ����
		//������ Ŀ�ǵ����â���� �μ�Ʈ������ϸ� 1rowcreated �̰͸����� ��ٲ�������
		
		//psmt.executeUpdate()���ص� ����ģȿ�� 
		
		int cnt = psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		//stringsql�������� psmt �̹� �����ִ� ��Ȳ���� psmtclose�ϸ� ����
		//�׷�����������������������ؾ���
		
		if(psmt != null){
			psmt.close();
		}
		
		if(conn != null){
			conn.close();
		}
		
		if(cnt>0){
			System.out.print("ȸ������ ����");
			response.sendRedirect("login.jsp");
		}else{
			System.out.print("ȸ������ ����");
			response.sendRedirect("join.jsp");
		}
	%>

</body>
</html>