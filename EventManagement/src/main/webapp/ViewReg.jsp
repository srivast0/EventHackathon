<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.app.model.AdminLoginModel"%>
<%@page import="javax.persistence.criteria.Root"%>
<%@page import="com.app.model.RegisterModel"%>
<%@page import="javax.persistence.criteria.CriteriaQuery"%>
<%@page import="javax.persistence.criteria.CriteriaBuilder"%>
<%@page import="com.app.utility.HibernateUtil"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Admin</title>
</head>
<body>
<jsp:include page="AdminMenu.jsp"/>
<br/>
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Registration No</th>
      <th scope="col">Date</th>
      <th scope="col">Name</th>
    </tr>
  </thead>
  <tbody>
	<%
		Session ses = HibernateUtil.getSf().openSession();
		CriteriaBuilder builder = ses.getCriteriaBuilder();
		CriteriaQuery<RegisterModel> query = builder.createQuery(RegisterModel.class);
		Root<RegisterModel> root = query.from(RegisterModel.class);
		query.select(root);
		Query<RegisterModel> qry = ses.createQuery(query);
		List<RegisterModel> rmodel =qry.list();
		HttpSession hs = request.getSession();
		hs.setAttribute("RegModel", rmodel);
		int count=1;
		for(RegisterModel rm:rmodel)
		{
			
			%><tr>
		      <th scope="row"><%out.println(count++); %></th>
		      <td><a href="select?id=<%out.println(rm.getRegId());%>"><%out.println(rm.getRegId());%></a></td>
		      <td><%out.println(rm.getRegDate());%></td>
		      <td><%out.println(rm.getFullname());%></td>
		    </tr>
			<%
		}
	%>
	
  </tbody>
</table>
</body>
</html>