<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PHONE-BOOK</title>

</head>
<body>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">

	<script src="resources/js/jquery-3.4.1.slim.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>



	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Phone Book App</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">HOME
						<span class="sr-only">(current)</span>
				</a></li>

				<!-- one option start-->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> CONTACTS </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="addContact">ADD CONTACTS</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="viewContacts">VIEW CONTACT'S
							DETAILS</a>
					</div></li>
				<!-- one option end -->

			</ul>
		</div>
	</nav>
	<div class="container"
		style="background-color: rgba(205, 220, 57, 0.1);">
		<div class="card">
			<div class="card-header bg-primary text-white text-center">
				<H3>Add Contact Details</H3>
			</div>

			<div class="card-body">
				<form:form action="saveContact" method="POST"
					modelAttribute="contact">
					<form:hidden path="contactId" />
					<div class="row">
						<div class="col-4">
							<label for="contactName">Contact Name</label>
						</div>

						<div class="col-4">
							<form:input path="contactName" />
						</div>
						<div class="col-4">
							<!-- Error Message -->
						</div>
					</div>

					<div class="row">
						<div class="col-4">
							<label for="contactEmail">Contact Email</label>
						</div>

						<div class="col-4">
							<form:input path="contactEmail" />
						</div>
						<div class="col-4">
							<!-- Error Message -->
						</div>
					</div>

					<div class="row">
						<div class="col-4">
							<label for="contactNumber">Contact Number</label>
						</div>

						<div class="col-4">
							<form:input path="contactNumber" />
						</div>
						<div class="col-4">
							<!-- Error Message -->
						</div>
					</div>

					<div class="row">
						<div class="col-4">
							<input type="submit" value="Save" class="btn btn-primary" /> <input
								type="reset" value="Reset" class="btn btn-danger" />
						</div>
					</div>

				</form:form>
			</div>

			<!-- end of body -->
			<!-- Message-->
			<div>
				<font color='green'>${success}</font>
			</div>
			<div>
				<font color='red'>${error}</font>
			</div>
		</div>
		<!-- End of card -->
	</div>
	<!-- container end -->
</body>
</html>