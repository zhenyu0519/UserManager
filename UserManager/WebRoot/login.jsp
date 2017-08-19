<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

    <link rel="stylesheet" type="text/css" href="css/style.css">


</head>

<body>
    <center>
    <% String err=request.getParameter("err"); 
       if(err!=null){
           if(err.equals("1")){
                out.println("login failed");           
           }
       }
    %>
        <br>
        <form action="LoginControl" method="post" class="login">
            <h1>User Login</h1>
            <input type="text" name="username" class="login-input" placeholder="Username"><br>
            <input type="text" name="password" class="login-input" placeholder="Password"><br> 
            <input type="submit" value="Login" class="login-submit">
            <input type="reset"  value="Reset" class="login-submit">
        </form>
    </center>
</body>
</html>