package test;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.app.model.RegisterModel;
import com.app.utility.HibernateUtil;

public class Test {
	public static void main(String[] args) {
		Session ses = HibernateUtil.getSf().openSession();
		CriteriaBuilder builder = ses.getCriteriaBuilder();
		CriteriaQuery<Object[]> cq = builder.createQuery(Object[].class);
		Root<RegisterModel> root = cq.from(RegisterModel.class);
		cq.multiselect(builder.count(root.get("rtype")),root.get("rtype"));
		cq.groupBy(root.get("rtype"));
		Query<Object[]> qry=ses.createQuery(cq);
		List<Object[]> list = qry.list();
		for(Object[] ob:list)
		{
			System.out.println(ob[1]+" "+ob[0]);
		}
	}
}
