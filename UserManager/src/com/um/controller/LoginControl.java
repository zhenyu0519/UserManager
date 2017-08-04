//this is a controller and it is to verify the user
//controller is not going to do verification. it will call some model to do it
package com.um.controller;
import  com.um.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginControl extends HttpServlet {

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//get the username and password
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		//use model(UserBeanOperation) to do the verification
		//1. create UserBeanOperation object
		UserBeanOperation ubo = new UserBeanOperation();
		if(ubo.verifyUser(username, password)){
			//prepare the data that need to display before jump to welcome page
			ArrayList recordList = ubo.getPagination(1);
			int pageCount = ubo.getPageCount();
			//put recordList and pageCount into request
			request.setAttribute("recordList", recordList);
			request.setAttribute("pageCount", pageCount+"");
			//response.sendRedirect("welcome.jsp"); does not have good performance
			//this one has good performance and the content of request can be used in next page
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
			System.out.print("I am really here in servelet");
		}else{
			//response.sendRedirect("login.jsp"); does not have good performance
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//combine the get and post
		this.doGet(request, response);
	}

}