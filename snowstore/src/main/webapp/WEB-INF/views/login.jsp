<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css/" />
<spring:url var="js" value="/resources/js/" />
<spring:url var="images" value="/resources/images/" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Snow Store - ${title}</title>

<link rel="icon" href='<c:url value="/resources/images/favicon.ico" />' type="image/x-icon">

<script>
	window.menu = '${title}';

	window.contextRoot = '${contextRoot}';
</script>

<!-- Bootstrap core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Slate Theme -->
<link href="${css}/bootstrap-slate-theme.css" rel="stylesheet">

<!-- Bootstrap DataTable -->
<link href="${css}/dataTables.bootstrap4.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${css}/myapp.css" rel="stylesheet">

<!-- Font Awesome reference through CDN -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

</head>

<body>

	<div class="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="container">
				<a class="navbar-brand" href="${contextRoot}/home">Snow Store</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
			</div>
		</nav>


		<!-- Page Content -->
		<div class="container">
		
		<!-- this will be displayed if the credentials are wrong -->
		<c:if test="${not empty message}">
		    <div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
					   <div class="alert alert-danger">${message}</div>
					</div>
			</div>
		</c:if>
		
		<!-- this will be displayed when the user logs out -->
		<c:if test="${not empty logout}">
		    <div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
					   <div class="alert alert-success">${logout}</div>
					</div>
			</div>
		</c:if>
		
			<form class="form-horizontal" role="form" method="POST"
				action="${contextRoot}/login">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<h2>Please Login</h2>
						<hr>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<div class="form-group has-danger">
							<label class="sr-only" for="username">E-Mail Address</label>
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fa fa-at"></i>
								</div>
								<input type="text" name="username" class="form-control"
									id="username" placeholder="you@example.com" required autofocus>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="sr-only" for="password">Password</label>
							<div class="input-group mb-2 mr-sm-2 mb-sm-0">
								<div class="input-group-addon" style="width: 2.6rem">
									<i class="fa fa-key"></i>
								</div>
								<input type="password" name="password" class="form-control"
									id="password" placeholder="Password" required>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-6" style="padding-top: .35rem">
						<div class="form-check mb-2 mr-sm-2 mb-sm-0">
							<label class="form-check-label"> <input
								class="form-check-input" name="remember" type="checkbox">
								<span style="padding-bottom: .15rem">Remember me</span>
							</label>
						</div>
					</div>
				</div>
				
				<div class="row" style="padding-top: 1rem">
					<div class="col-md-3"></div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success" value="Login"><i class="fa fa-sign-in"></i> Login</button>
						<input type="hidden" name ="${_csrf.parameterName}" value ="${_csrf.token}" />
						<a class="btn btn-link" href="${contextRoot}/register">New User?</a>
					</div>
				</div>
				
				<!-- Add forgot password with ${contextRoot}/password/reset -->
			</form>
		</div>

		<!-- Footer -->
		<%@include file="./shared/footer.jsp"%>


		<!-- jQuery -->
		<script src="${js}/jquery.min.js"></script>

		<!-- jQuery Validate Plugin -->
		<script src="${js}/jquery.validate.js"></script>

		<!-- Bootstrap core JavaScript -->
		<script src="${js}/bootstrap.bundle.min.js"></script>

		<!-- Self coded JavaScript -->
		<script src="${js}/myapp.js"></script>


	</div>

</body>

</html>