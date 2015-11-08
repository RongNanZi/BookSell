package com.rongnan.dbutil.shopcart.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rongnan.dbutil.shopcart.dao.ShopcartDao;
import com.rongnan.dbutil.shopcart.service.ShopcartService;

public class Shopcart extends HttpServlet {

	private ShopcartService service;
	/**
	 * Constructor of the object.
	 */
	public Shopcart() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String keystring = request.getParameter("userid");
		System.out.println("entry in the shopcart servlet! key ="+keystring);
		
		List<Map<String,Object>> mlist = new ArrayList<Map<String,Object>>();	
		
		mlist = service.view(keystring);
		System.out.println("the result is "+mlist.isEmpty());
		
		request.setAttribute("List", mlist);
		request.getRequestDispatcher("/book/myShopcart.jsp").forward(request, response);
		
		out.flush();
		out.close();
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean flag = false;
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		List<Object> add2cart = new ArrayList();
		add2cart.add((String)request.getParameter("username"));
		add2cart.add((String)request.getParameter("bookid"));
		
		flag = service.add(add2cart);
		
		if(flag) 
			out.write("true");
		else 
			out.write("false");
		
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		service = new ShopcartDao();
	}

}
