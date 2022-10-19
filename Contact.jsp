<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<link rel="stylesheet" href="css/Login.css">
</head>
<body>
<%@ page import="java.sql.*" %>
	<%@ page import="javax.sql.*" %>

<%
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phn=request.getParameter("phn");
		String message=request.getParameter("message");
		
		out.print(name+email+address+phn+message);
		
		
		ResultSet rs=null;
		Connection conn=null;
		PreparedStatement ps=null;
		String query="insert into contact values(?,?,?,?,?)";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/sonu_1","root","12345");
			
				ps=conn.prepareStatement(query);
				ps.setString(1,name);
				ps.setString(2,email);
				ps.setString(3,address);
				ps.setString(4,phn);
				ps.setString(5,message);
				
				int i=ps.executeUpdate();
				
				if(i>0){
					out.print("sucess");
				
					response.sendRedirect("sucess.jsp");
				}
		}
		catch(Exception e){ 
			out.println(e);
		}
		
%>



</body>
</html>
