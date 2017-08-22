<%@ page language="java" import="java.util.*,com.um.model.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="css/default.css">
	<link rel="stylesheet" type="text/css" href="css/component.css">
	<script src="js/modernizr.custom.js"></script>

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
    <div class="container"> 
    <h2 style="padding:20px">Welcome, <%=username%></h2>
            <header>
                <h1>Main Menu</h1>
                <h2><a href="UserController?flag=logout">Clear Session and Log Out</a></h2>    
            </header>
            <div class="main clearfix">
                <nav id="menu" class="nav"><button type="button" id="menutoggle" class="navtoogle" aria-hidden="true"><i aria-hidden="true" class="icon-menu"> </i> Menu</button>                   
                    <ul>
                        <li>
                            <a href="UserController?pageNow=1&flag=manageUser">
                                <span class="icon">
                                    <i aria-hidden="true" class="icon-home"></i>
                                </span>
                                <span>manage user</span>
                            </a>
                        </li>
                        <li>
                            <a href="addUser.jsp">
                                <span class="icon"> 
                                    <i aria-hidden="true" class="icon-services"></i>
                                </span>
                                <span>add user</span>
                            </a>
                        </li>
                        <li>
                            <a href="findUser.jsp">
                                <span class="icon">
                                    <i aria-hidden="true" class="icon-portfolio"></i>
                                </span>
                                <span>find user</span>
                            </a>
                        </li>
                        <li>
                            <a href="UserController?pageNow=1&flag=deleteUser">
                                <span class="icon">
                                    <i aria-hidden="true" class="icon-blog"></i>
                                </span>
                                <span>delete user</span>
                            </a>
                        </li> 
                    </ul>
                </nav>
            </div>
        </div>
        
        
        <script>
            //  The function to change the class
            var changeClass = function (r,className1,className2) {
                var regex = new RegExp("(?:^|\\s+)" + className1 + "(?:\\s+|$)");
                if( regex.test(r.className) ) {
                    r.className = r.className.replace(regex,' '+className2+' ');
                }
                else{
                    r.className = r.className.replace(new RegExp("(?:^|\\s+)" + className2 + "(?:\\s+|$)"),' '+className1+' ');
                }
                return r.className;
            };  

            //  Creating our button in JS for smaller screens
            var menuElements = document.getElementById('menu');
            menuElements.insertAdjacentHTML('afterBegin','<button type="button" id="menutoggle" class="navtoogle" aria-hidden="true"><i aria-hidden="true" class="icon-menu"> </i> Menu</button>');

            //  Toggle the class on click to show / hide the menu
            document.getElementById('menutoggle').onclick = function() {
                changeClass(this, 'navtoogle active', 'navtoogle');
            }

            // http://tympanus.net/codrops/2013/05/08/responsive-retina-ready-menu/comment-page-2/#comment-438918
            document.onclick = function(e) {
                var mobileButton = document.getElementById('menutoggle'),
                    buttonStyle =  mobileButton.currentStyle ? mobileButton.currentStyle.display : getComputedStyle(mobileButton, null).display;

                if(buttonStyle === 'block' && e.target !== mobileButton && new RegExp(' ' + 'active' + ' ').test(' ' + mobileButton.className + ' ')) {
                    changeClass(mobileButton, 'navtoogle active', 'navtoogle');
                }
            }
        </script>
        
</body>
</html>
