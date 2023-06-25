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
	<div class="container mt-5">
		<div style="
    display: flex;
    justify-content: space-between">
			<h2>Top Ten Songs:</h2>
			<a href="/dashboard">Dashboard</a>
		</div>
		<ul class="list-unstyled border border-1 rounded p-2 mt-3">
			<c:forEach items="${topTen}" var="song">
				<li class="my-3">
					<h5>
						<c:out value="${song.rating}" />
						- <a href="/songs/${song.id}"> <c:out value="${song.title}" /></a>
						-
						<c:out value="${song.artist}" />
					</h5>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>