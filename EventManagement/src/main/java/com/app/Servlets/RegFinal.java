package com.app.Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.app.Dao.RegisterDao;
import com.app.model.RegisterModel;

@SuppressWarnings("serial")
@WebServlet("/regfinal")
public class RegFinal extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter pw = resp.getWriter();
		RegisterDao dao = new RegisterDao();
		HttpSession hs = req.getSession();
		RegisterModel attr =(RegisterModel)hs.getAttribute("viewModel");
		Serializable regDao = dao.RegDao(attr);
		pw.println("<script type=\"text/javascript\">");
		pw.println("alert('Registration Successful with Reg. ID: "+regDao+" ');");
		pw.println("location='index.jsp';");
		pw.println("</script>");
		hs.invalidate();
		
	}
}
