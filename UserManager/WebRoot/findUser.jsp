<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Antic'>
	<link rel="stylesheet" href="css/search.css">

  </head>
  
  <body>
  <%
            //prevent user login illeaglelly
            String username = (String) session.getAttribute("username");
            if (username == null) {
                response.sendRedirect("login.jsp?err=1");
                return;
            }
        %>
    <a href="main.jsp">Main Menu</a>
    <center>
        <form action="UserController?flag=findUser" method="post" class="login">
            <div style="padding:200px">
            <input class="button" style = "height:50px; width:500px; font-size:20pt;" type="text" name="username"  class="login-input"  placeholder="Type the user name..."/><br>
            <!-- <input type="submit" value="Add"  class="login-submit"/><input type="submit" value="Add"  class="login-submit"/><br> -->
            </div>
        </form>
    </center>
  </body>
</html>
