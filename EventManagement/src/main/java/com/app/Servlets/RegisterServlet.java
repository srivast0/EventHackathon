package com.app.Servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.app.Dao.RegisterDao;
import com.app.model.RegisterModel;

@SuppressWarnings("serial")
@WebServlet("/register")
@MultipartConfig(maxFileSize = 169999999999L)
public class RegisterServlet extends HttpServlet{
	byte [] img;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Part partfile=req.getPart("icard");
			InputStream istream=null;
			if(partfile!=null) {
				istream =partfile.getInputStream();
				 img=istream.readAllBytes();
			}
		}
			catch (Exception e) {
				e.printStackTrace();
			}
		RegisterModel rmodel = new RegisterModel();
		rmodel.setFullname(req.getParameter("fname"));
		rmodel.setMobile(Long.parseLong(req.getParameter("mobile")));
		rmodel.setEmail(req.getParameter("mail"));
		rmodel.setRtype(req.getParameter("Rtype"));
		rmodel.setTktNo(Integer.parseInt(req.getParameter("ticketNo")));
		rmodel.setIcardimg(img);
		rmodel.setRegDate(new Date().toString());
		HttpSession hs = req.getSession();
		hs.setAttribute("viewModel", rmodel);
		RequestDispatcher rd = req.getRequestDispatcher("ViewModel.jsp");
		rd.forward(req, resp);
	}
}
