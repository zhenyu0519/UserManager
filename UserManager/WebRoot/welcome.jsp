<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'welcome.jsp' starting page</title>
    
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
    Log In Successfully! Welcome <%= request.getParameter("username") %><br>
    <a href="login.jsp">Return to Log In</a>
    <h1>User Information</h1>
    <%
        //define the page variable
        int pageSize = 5; //the number of records for each page
        int pageNow = 1;//the current page
        int pageCount = 0;//the number of pages
        int rowCount = 0;//total records
        
        //receive the page the user want to jump to
        String targetPage = request.getParameter("pageNow");
        if(targetPage != null){
            //if the pageNow is received for example jump to welcome page from verify page. The pageNow will be null
            pageNow = Integer.parseInt(targetPage);
        }
        //query the row count
        //1.load driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        //2.get the connection
        Connection connection = DriverManager.getConnection("jdbc:sqlserver://127.0.0.1:1433;databaseName=UserManager","sa","362908227");
        //3.create statement
        Statement statement = connection.createStatement();
        //4.Query
        ResultSet resultSet = statement.executeQuery("select count (*) from users ");
        //get the row count
        if(resultSet.next()){
            rowCount=resultSet.getInt(1);
        }
        //caculate the page count
        if(rowCount%5==0){
            pageCount=rowCount/pageSize;
        }else{
            pageCount=rowCount/pageSize+1;
        }
        //get the record to display for current page
        resultSet = statement.executeQuery("select top "+pageSize+" * from users where id not in (select top "+pageSize*(pageNow-1)+" id from users)");
        
        //create table to display the records
     %>
     <table border="1">
        <tr><td>id</td><td>name</td><td>password</td><td>email</td><td>grade</td></tr>
        <% 
        while(resultSet.next()){
        %>
                <tr><td><%=resultSet.getInt(1) %></td><td><%=resultSet.getString(2) %></td><td><%=resultSet.getString(3) %></td>
                <td><%=resultSet.getString(4) %></td><td><%=resultSet.getInt(5) %></td></tr>
         <%
            }
         %>
     </table>
     <%
     //create prev page link
     if(pageNow!=1){
        out.println("<a href=welcome.jsp?pageNow="+(pageNow-1)+">[Prev]</a>");
     }
     //get the link for each page
     for(int i=1; i<pageCount;i++){
        out.println("<a href=welcome.jsp?pageNow="+i+">["+i+"]</a>");
     }
     if(pageNow!=pageCount){
        //create next page link
        out.println("<a href=welcome.jsp?pageNow="+(pageNow+1)+">[Next]</a>");
     }
     %>
  </body>
</html>
