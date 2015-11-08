package com.rongnan.dbutil.login.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rongnan.dbutil.login.dao.Login;
import com.rongnan.dbutil.login.service.LoginService;

public class LoginAction extends HttpServlet {

	private LoginService mService;
	/**
	 * Constructor of the object.
	 */
	public LoginAction() {
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
		
		String path = request.getContextPath();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		List<Object> mParam = new ArrayList<Object>();
		mParam.add(userName);
		mParam.add(password);
		

		boolean flag = mService.loginService(mParam);
		if (flag) {
			HttpSession session=request.getSession();
			session.setAttribute("userName", userName);
			if(session.isNew()){
				System.out.println("===================新的session！=================="+(String)session.getAttribute("userName"));
			}else{
				System.out.println("------------------------已经存在的session！=================="+(String)session.getAttribute("userName"));
				
			}
			
			response.sendRedirect(path + "/main.jsp");
		}
		
	
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

		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		mService = new Login();
		System.out.println("start the loginAction------------");
	}

}
