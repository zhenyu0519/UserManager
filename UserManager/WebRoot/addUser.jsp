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

<link rel="stylesheet" type="text/css" href="css/form.css">

</head>

<body>
    <a href="main.jsp">Main Menu</a>
    <center>
        <form action="UserController?flag=add" method="post" class="login">
            <h1>Enter New User</h1>
            <input type="text" name="username"  class="login-input"  placeholder="Username"/><br>
            <input type="password" name="password"  class="login-input" placeholder="Password"/><br>
            <input type="text" name="email"  class="login-input"  placeholder="Email"/><br>
            <input type="text" name="grade"  class="login-input"  placeholder="Grade"/><br>
            <input type="submit" value="Add"  class="login-submit"/><input type="reset" value="Reset" name="rest" class="login-submit" />
        </form>
    </center>
</body>
</html>