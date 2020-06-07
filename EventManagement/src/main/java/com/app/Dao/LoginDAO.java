package com.app.Dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.app.model.AdminLoginModel;
import com.app.utility.HibernateUtil;

public class LoginDAO {
	public int update;
	Session ses = HibernateUtil.getSf().openSession();
	Transaction txn = ses.beginTransaction();
	public int loginD(HttpServletRequest req)
	{
		String string = req.getParameter("userName");
		String pass = req.getParameter("password");
		String hql = " from com.app.model.AdminLoginModel where userName=?0 and passWord=?1";
		Query qry = ses.createQuery(hql);
		qry.setParameter(0, string);
		qry.setParameter(1, pass);
		List<AdminLoginModel> al = qry.list();
		if(al.size()>0) {
			AdminLoginModel alm =al.get(0);
			HttpSession hs = req.getSession();
			hs.setAttribute("LogD", alm);
			update=1;
		}
		return update;
	}
}
