<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes : Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">

		<%@include file="navbar.jsp"%>

		<br>

		<h1 class="text-uppercase">All Notes</h1>

		<div class="row">

			<div class="col-12">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note note : list) {
				%>
				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto" style="max-width:70px;" src="img/pencil.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title px-5"><%= note.getTitle() %></h5>
						<p class="card-text px-5"><%= note.getContent() %></p>
						<div class="container text-center mt-2">
						<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
						</div>
						<p><b class ="text-primary">Last Updated On: <%= note.getAddedDate() %></b></p>
					</div>
				</div>

				<%
				}
				s.close();
				%>

			</div>


		</div>


	</div>

</body>
</html>