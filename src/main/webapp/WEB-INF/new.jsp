<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Song</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
	<main class="container">
		<a class="float-end" href="/dashboard">Dashboard</a>
		<form:form class="mt-5" action="/dashboard" method="POST" modelAttribute="Song">
		    <div class="mb-3">
		        <form:label class="form-label" path="title">Title</form:label>
		        <form:input class="form-control" path="title"/>
		        <form:errors class="text-danger" path="title"/>
		    </div>
		    <div class="mb-3">
		        <form:label class="form-label" path="artist">Artist</form:label>
		        <form:input class="form-control" path="artist"/>
		        <form:errors class="text-danger" path="artist"/>
		    </div>
		    <div class="mb-3">
		        <form:label class="form-label" path="rating">Rating(1-10)</form:label>
		        <form:input class="form-control" path="rating"/>
		        <form:errors class="text-danger" path="rating"/>
		    </div>
		    <input class="btn btn-primary float-end" type="submit" value="Submit"/>
		</form:form>
	</main>
</body>
</html>