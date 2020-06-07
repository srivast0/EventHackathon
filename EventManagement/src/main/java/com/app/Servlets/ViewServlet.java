package com.app.Servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.app.model.RegisterModel;
import com.app.utility.HibernateUtil;

@WebServlet("select")
public class ViewServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		HttpSession hs = req.getSession();
		RegisterModel rmodel = (RegisterModel)hs.getAttribute("RegModel");
		
	}
}
