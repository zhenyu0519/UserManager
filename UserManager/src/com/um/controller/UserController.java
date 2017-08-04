//this controller will deal with the pagination and add, modify, delete user
package com.um.controller;
import com.um.model.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.um.model.UserBeanOperation;

public class UserController extends HttpServlet {

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
		try {
			//get the current pageNow
			int pageNow = Integer.parseInt(request.getParameter("pageNow"));
			//call userBeanOperation
			UserBeanOperation ubo = new UserBeanOperation();
			//prepare the data that need to display before jump to welcome page
			ArrayList recordList = ubo.getPagination(pageNow);
			int pageCount = ubo.getPageCount();
			//put recordList and pageCount into request
			request.setAttribute("recordList", recordList);
			request.setAttribute("pageCount", pageCount+"");
			
			//redirect to welcome
			request.getRequestDispatcher("welcome.jsp").forward(request, response);
			System.out.println("useing the user controller to do the pagination");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		this.doGet(request, response);
	}

}