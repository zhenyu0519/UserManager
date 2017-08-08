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
<!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
    <center>
        <h1>Please Enter Your Info</h1>
        <form action="UserController?flag=add" method="post">
            <table border="1">
            <tr><td>username</td><td><input type="text" name="username" /></td></tr>
            <tr><td>password</td><td><input type="password" name="password" /></td></tr>
            <tr><td>email</td><td><input type="text" name="email" /></td></tr>
            <tr><td>grade</td><td><input type="text" name="grade" /></td></tr>
            <td><input type="submit" value="add" /></td>&nbsp;&nbsp;<td><input type="reset" name="rest" /></td>
            </table>
        </form>
    </center>
</body>
</html>