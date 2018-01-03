<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily Class Routine Schedule, IICT</title>
</head>
<body>

	<%@ include file="home.html" %>
	
	<%
		if(request.getParameter("username") != null && request.getParameter("key") != null) {
			try {
				String dbUserName = null;
				String dbPassWord = null;
				String userName = request.getParameter("username");
				String passWord = request.getParameter("key");
				String sql = "SELECT * FROM `user_login` WHERE `user_name` = ? AND `password` = ?;";
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/class_routine", "root", "");
				
				PreparedStatement ps = connection.prepareStatement(sql);
				ps.setString(1, userName);
				ps.setString(2, passWord);
				ResultSet resultSet = ps.executeQuery();
				
				while(resultSet.next()) {
					dbUserName = resultSet.getString("user_name");
					dbPassWord = resultSet.getString("password");
				}
				
				if(userName.equals(dbUserName) && passWord.equals(dbPassWord)) {
					out.println("You've successfully logged in!!");
				} else {
					response.sendRedirect("login.jsp");
				}
			} catch(ClassNotFoundException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			} catch(SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		} else {
			
		}
	%>

</body>
</html>
