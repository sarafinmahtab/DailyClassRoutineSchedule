<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>

<body>
	
	<%@ include file="login.html" %>
	
	<script language="javascript" type="text/javascript">
	
		function updateLoginResult(str) {
			document.getElementById("login_result").style.display = "block";
			document.getElementById("login_result").innerHTML = str;
		}
		
	</script>	
	
	<%
		if(session.getAttribute("login_failed") != null) {
			String str = session.getAttribute("login_failed").toString();
			%>
				<script language="javascript" type="text/javascript">
					var string = "<%= str %>";
					updateLoginResult(string);
				</script>
			<%
		}
	%>
	
</body>
</html>
