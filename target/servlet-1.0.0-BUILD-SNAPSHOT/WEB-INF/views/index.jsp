<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<title>Login</title>
<meta content="Admin Dashboard" name="description" />
<meta content="Themesbrand" name="author" />
<link rel="shortcut icon" href="assets/images/favicon.ico">

<link
	href="${pageContext.request.contextPath}/resources/template/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/template/css/metismenu.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/template/css/icons.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/template/css/style.css"
	rel="stylesheet" type="text/css">
</head>

<body>

	<!-- Begin page -->
	<div class="wrapper-page">

		<div class="card">
			<div class="card-body">

				<div class="p-3">
					<h4 class="text-muted font-18 m-b-5 text-center">Login !</h4>

					<c:if test="${volunteersignupsucess eq 'yes'}">
						<p>Sign up sucessfull Please login</p>
					</c:if>
					<form class="form-horizontal m-t-30"
						action="${pageContext.request.contextPath}/signin" method="post">

						<div class="form-group">
							<label for="username"> Username</label> <input type="text"
								class="form-control" id="username" name="username"
								placeholder="Enter login" required="required">
						</div>

						<div class="form-group">
							<label for="userpassword">Password</label> <input type="password"
								class="form-control" id="userpassword" name="userpassword"
								placeholder="Enter mot de passe" required="required">
						</div>

						<div class="form-group row m-t-20"></div>

						<div align="center">
							<button class="btn btn-primary w-md waves-effect waves-light"
								type="submit">Sign in</button>
							<a class="btn btn-primary"
								href="${pageContext.request.contextPath}/users/showVolunteerForm"
								role="button">Sign Up As Volunteer</a>
						</div>






					</form>
				</div>

			</div>
		</div>

		<div class="m-t-40 text-center">
			<p>
				© 2019 - 2020 Ngo. created by <i
					class="mdi mdi-heart text-danger"></i> by Ashrith Pradeep
			</p>
		</div>

	</div>


	<!-- jQuery  -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/metisMenu.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/jquery.slimscroll.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/template/js/waves.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/template/plugins/jquery-sparkline/jquery.sparkline.min.js"></script>

	<!-- App js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/app.js"></script>

</body>
</html>