package com.app.Dao;

import java.io.Serializable;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.app.model.RegisterModel;
import com.app.utility.HibernateUtil;

public class RegisterDao {
	Serializable id = null;
	public Serializable RegDao(RegisterModel rmodel)
	{	
		Session ses = HibernateUtil.getSf().openSession();
		Transaction txn = ses.beginTransaction();
		try {
			id = ses.save(rmodel);
			txn.commit();
		} catch (Exception e) {
			if(txn!=null && txn.getStatus().canRollback())
			{
				txn.rollback();
			}
		}
		return id;
	}
}
