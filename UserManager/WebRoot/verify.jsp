<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'verify.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <%
        //receive the username and password to verify
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        //connect the database
        //1.load driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2.get the connection
        Connection connection = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;databaseName=UserManager","sa","362908227");
        //3.create statement
        Statement statement = connection.createStatement();
        //4.Query
        ResultSet resultSet = statement.executeQuery("select password from users where name='"+username+"'");
        //5. check result
        if(resultSet.next()){
            //means the username is existed
            if(resultSet.getString(1).equals(password)){
                response.sendRedirect("welcome.jsp?username="+username);
            }else{
                //password is not correct
                response.sendRedirect("login.jsp?error=1");
            }
        }else{
            //user name is not existed
            response.sendRedirect("login.jsp?error=2");
        }
        //simple verify
        /* if(username.equals("jeffery")&&password.equals("123")){
            response.sendRedirect("welcome.jsp?username="+username);
        }else{
            response.sendRedirect("login.jsp");
         }*/
     %>
     <br>
  </body>
</html>
