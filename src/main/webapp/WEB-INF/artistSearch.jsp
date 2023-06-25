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
<title>Search</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<main class="container justify-content-center mt-5">
		<div class="row" style="display: flex; justify-content: space-between">
			<h5 class="col-6">Song by artists: <c:out value="${q}"/></h5>
			<form class="col-6" action="/search" method="get">
				<div class="input-group">
					<input type="text" class="form-control" name="q">
					<button type="submit" class="btn btn-primary" type="button">New Search</button>
				</div>
			</form>
		</div>
		<table class="table table-striped mt-5 border border-1">
			<thead>
				<tr>
					<th>Name</th>
					<th>Rating</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="item">
					<tr>
						<td><a href="/songs/${item.id}"> <c:out
									value="${item.title}" /></a></td>
						<td><c:out value="${item.rating}" /></td>
						<td>
							<form action="./delete/${item.id}" method="post">
								<input type="hidden" name="_method" value="delete">
								<button class="btn btn-outline-danger">Delete</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</main>
</body>
</html>