<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%@ page import="java.sql.*" %>
	<%@ page import="javax.sql.*" %>
	<%
		String uid=request.getParameter("userid");
		String pass=request.getParameter("password");
		
		

		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("currentuser", uid);

		ResultSet rs=null;
		Connection conn=null;
		PreparedStatement ps=null;

		String query="SELECT user,pass from login WHERE user=? and pass=?";
		
		try{
		Class.forName("com.mysql.jdbc.Driver");
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","12345");
		
			ps=conn.prepareStatement(query);
			ps.setString(1,uid);
			ps.setString(2,pass);
		
		rs=ps.executeQuery();
		if(rs.next())
		{
			if((rs.getString(1)).equals(uid)&&(rs.getString(2)).equals(pass))
			{
				
					response.sendRedirect("Homepage.jsp");
				
			}
			
		}
		else
			response.sendRedirect("Login.html");
	}
	catch(Exception e){ 
		out.println(e);
	}
	finally {
  	  	try { if (rs != null) rs.close(); } catch (Exception e) {};
    	try { if (ps != null) ps.close(); } catch (Exception e) {};
   		try { if (conn != null) conn.close(); } catch (Exception e) {};
}

%>
</body>
</html>