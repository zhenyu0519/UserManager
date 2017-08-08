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
    <script type="text/javascript">
        function confirmDialog(){
            console.log("i got called");
            return window.confirm("Are you sure you want to delete this user?");
            
        }
    </script>
  </head>
  
  <body>
  <% //prevent user login illeaglelly
          String username = (String) session.getAttribute("username");
          System.out.println("username is " + username);
          if(username==null){
            response.sendRedirect("login.jsp?err=1");
            return;
          }
   %>
    Log In Successfully! Welcome <%=username %><br>
    <a href="login.jsp">Return to Log In</a>&nbsp;&nbsp;<a href="main.jsp">Return to Main Menu</a>
    <h1>User Information</h1>
    <%
        
       //call userbean to done the pagination
       //UserBeanOperation ubo = new UserBeanOperation();
       //ArrayList recordList = ubo.getPagination(pageNow);
       //display the information from request
       ArrayList recordList=(ArrayList)request.getAttribute("recordList");
       
        //create table to display the records
     %>
     <table border="1">
        <tr><td>id</td><td>name</td><td>password</td><td>email</td><td>grade</td><td>modify</td><td>delete</td></tr>
        <% 
        for(int i =0;i<recordList.size();i++){
        //get the userbean from recordList
        UserBean ub = (UserBean)recordList.get(i);
        %>
                <tr><td><%=ub.getId() %></td><td><%=ub.getName() %></td><td><%=ub.getPassword() %></td>
                <td><%=ub.getEmail() %></td><td><%=ub.getGrade() %></td>
                <td><a href=#>modify</a></td><td><a onclick="return confirmDialog();" href="UserController?flag=delete&id=<%=ub.getId() %>">delete</a></td></tr>
         <%
            }
         %>
     </table>
     <%
     //get the pageNow from request
     int pageNow =Integer.parseInt((String)request.getAttribute("pageNow"));
     //create prev page link
     if(pageNow!=1){
        out.println("<a href=UserController?pageNow="+(pageNow-1)+"&flag=pagination>[Prev]</a>");
     }
     //get the pageCount
     int pageCount = Integer.parseInt((String)request.getAttribute("pageCount"));
     //get the link for each page
     for(int i=1; i<pageCount;i++){
        out.println("<a href=UserController?pageNow="+i+"&flag=pagination>["+i+"]</a>");
     }
     if(pageNow!=pageCount){
        //create next page link
        out.println("<a href=UserController?pageNow="+(pageNow+1)+"&flag=pagination>[Next]</a>");
     }
     %>
  </body>
</html>