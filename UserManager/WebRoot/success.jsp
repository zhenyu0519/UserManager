<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'success.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/button.css">


</head>

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
	<%
	    //get the flag to tell if it is add or delete
		String flag = (String) session.getAttribute("flag1");
		String message = "";
		if (flag.equals("add")) {
			message = " Add new user successfully,";
		} else if(flag.equals("delete")){
			message = " Delete user successfully,";
		}
	%>
	<center style="padding:250px">
		<h1>
			<span style="color: #EC5C93;">Yeah! </span><%=message %> Click the button &darr; go
			to<span style="color: #EC5C93;"> main menu</span>
		</h1>
		<br>
		<div class="btn btn-blob">
			<a href="main.jsp">&spades;</a>
		</div>
	</center>
</body>
</html>
