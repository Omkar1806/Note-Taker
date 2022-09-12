<%@ page import="java.util.List"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.Query"%>
<%@ page import="com.helper.FactoryProvider"%>
<%@ page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All notes: Note Taker</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="containe-fluid">
   <%@include file="navbar.jsp" %> 
   <br>
   <h1>All notes</h1>
   <div class="row">
   <div class="col-12">
   <%
   Session s = FactoryProvider.getFactory().openSession();
   Query q=s.createQuery("from Note");
   List<Note> list=q.list();
   for(Note note:list){
   %>
   <div class="card mt-3">
  <img class="card-img-top pl-4 pt-4" style="max-width:60px;" src="image/writing.png" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title"><%= note.getTitle() %></h5>
    <p class="card-text"><%= note.getContent() %></p>
    <p><b><%= note.getAddedDate() %></b></p>
    <a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
    <a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
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