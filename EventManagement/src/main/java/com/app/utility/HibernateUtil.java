package com.app.utility;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;

import com.app.model.AdminLoginModel;
import com.app.model.RegisterModel;


@SuppressWarnings("unused")
public class HibernateUtil {
	private static SessionFactory sf=null;
	static {
		Properties p = new Properties();
		p.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
		p.put(Environment.URL, "jdbc:mysql://localhost:3306/eventmanagement");
		p.put(Environment.USER, "root");
		p.put(Environment.PASS, "root");
		p.put(Environment.SHOW_SQL, true);
		p.put(Environment.FORMAT_SQL, true);
		p.put(Environment.DIALECT, "org.hibernate.dialect.MySQL8Dialect");
		p.put(Environment.HBM2DDL_AUTO, "update");
		
		Configuration cfg = new  Configuration();
		cfg.setProperties(p);
		cfg.addAnnotatedClass(RegisterModel.class);
		cfg.addAnnotatedClass(AdminLoginModel.class);
		StandardServiceRegistry sreg = new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
		sf=cfg.buildSessionFactory();
	}
	public static SessionFactory getSf() {
		return sf;
	}
}
