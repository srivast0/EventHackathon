package com.app.Servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.Dao.LoginDAO;

@SuppressWarnings("serial")
@WebServlet("/Login")
@MultipartConfig(maxFileSize = 116999999999l)
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter pw = resp.getWriter();
		resp.setContentType("text/html");
		LoginDAO dao = new LoginDAO();
		int loginD = dao.loginD(req);
		if(loginD>0)
		{
			RequestDispatcher rd = req.getRequestDispatcher("AdminHome.jsp");
			rd.forward(req, resp);
		}
		else
		{
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('Invalid Credentials');");
			pw.println("location='Alogin.jsp';");
			pw.println("</script>");
		}
	}
}
