package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.neu.cs5200.model.User;
import edu.neu.cs5200.model.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	RequestDispatcher dispatcher = null;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDao userDao = new UserDao();
		int userId = userDao.findUserId(username);
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setId(userId);
		PrintWriter out=response.getWriter();  
		boolean checkUser=userDao.verifyUser(user);
		
		if(checkUser) {
			HttpSession session = request.getSession(true);
			session.setAttribute("currentUser", user);
			dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			
		} else {
			out.print("<script language='javascript'>alert('Username and password not match!!');window.location.href='login.jsp';</script>");

		}
	}

}
