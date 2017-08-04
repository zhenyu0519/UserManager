<%@ page language="java" import="java.util.*,java.sql.*,com.um.model.*" pageEncoding="ISO-8859-1"%>
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
        int pageNow = 1;//the current page
        
        //receive the page the user want to jump to
        String targetPage = request.getParameter("pageNow");
        if(targetPage != null){
            //if the pageNow is received for example jump to welcome page from verify page. The pageNow will be null
            pageNow = Integer.parseInt(targetPage);
        }
       //call userbean to done the pagination
       //UserBeanOperation ubo = new UserBeanOperation();
       //ArrayList recordList = ubo.getPagination(pageNow);
       //display the information from request
       ArrayList recordList=(ArrayList)request.getAttribute("recordList");
       
        //create table to display the records
     %>
     <table border="1">
        <tr><td>id</td><td>name</td><td>password</td><td>email</td><td>grade</td></tr>
        <% 
        for(int i =0;i<recordList.size();i++){
        //get the userbean from recordList
        UserBean ub = (UserBean)recordList.get(i);
        %>
                <tr><td><%=ub.getId() %></td><td><%=ub.getName() %></td><td><%=ub.getPassword() %></td>
                <td><%=ub.getEmail() %></td><td><%=ub.getGrade() %></td></tr>
         <%
            }
         %>
     </table>
     <%
     //create prev page link
     if(pageNow!=1){
        out.println("<a href=UserController?pageNow="+(pageNow-1)+">[Prev]</a>");
     }
     //get the pageCount
     int pageCount = Integer.parseInt((String)request.getAttribute("pageCount"));
     //get the link for each page
     for(int i=1; i<pageCount;i++){
        out.println("<a href=UserController?pageNow="+i+">["+i+"]</a>");
     }
     if(pageNow!=pageCount){
        //create next page link
        out.println("<a href=UserController?pageNow="+(pageNow+1)+">[Next]</a>");
     }
     %>
  </body>
</html>
