<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Details</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<main class="container mt-5">
		<div style="display: flex; justify-content: end;">
			<a href="/dashboard">Dashboard</a>
		</div>
		<div class="border border-1 rounded p-2 row mt-5 gy-3">
			<h5 class="col-4">Title:</h5>
			<h5 class="col-8">
				<c:out value="${song.title}" />
			</h5>
			<h5 class="col-4">Artist:</h5>
			<h5 class="col-8">
				<c:out value="${song.artist}" />
			</h5>
			<h5 class="col-4">Rating:</h5>
			<h5 class="col-8">
				<c:out value="${song.rating}" />
			</h5>
			<form class="my-3" action="/delete/${song.id}" method="post">
				<input type="hidden" name="_method" value="delete">
				<button class="btn btn-danger float-end">Delete</button>
			</form>
		</div>
	</main>
</body>
</html>

