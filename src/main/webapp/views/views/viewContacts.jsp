<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Contact Details</title>
</head>
<body>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="resources/css/jquery.dataTables.min.css">

	<script src="resources/js/jquery-3.4.1.slim.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.dataTables.min.js"></script>
	<script src="resources/js/jquery-3.5.1.js"></script>
	<script>
		function confirmDelete(){
				return confirm("Are you sure to delete?");
			}

		$(document).ready(function() {
		    $('#contact_table').DataTable( {
		        "pagingType": "full_numbers"
		    } );
		} );
	</script>

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
						<a class="dropdown-item" href="viewContacts">VIEW CONTACT'S DETAILS</a>
					</div></li>
				<!-- one option end -->

			</ul>
		</div>
	</nav>
	<div class="container" style="background-color: rgba(205, 220, 57, 0.1);">
		<div class="card">
			<div class="card-header bg-primary text-white text-center">
				<H3>All Contact Details</H3>
			</div>
			<div class="card-body">
		<c:choose>
			<c:when test="${!empty contactDetailsList }">
			<table  class="table table-bordered table-hover display" id="contact_table" style="width:100%">
				<tr class="bg-success text-white">
					<th>Sl.No.</th>
					<th>Name</th>
					<th>Email</th>
					<th>Phone No.</th>
					<th>Actions</th>
					 
				</tr>
				<c:forEach items="${contactDetailsList}" var="contactDetailsList" varStatus="index">
					<tr>
						<td>${index.count}</td>
						<td>${contactDetailsList.contactName}</td>
						<td>${contactDetailsList.contactEmail}</td>
						<td>${contactDetailsList.contactNumber}</td>
					
						<td>
							<a class="btn btn-warning" href="editContact?cid=${contactDetailsList.contactId}">EDIT</a>
						|
							<a class="btn btn-danger" href="deleteContact?cid=${contactDetailsList.contactId}" onclick="return confirmDelete()">DELETE</a>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			</c:when>
			<c:otherwise>
				<H4><font color='red'>NO DATA FOUND!!</font></H4>
			</c:otherwise>
		</c:choose>
		</div>
		
			
		</div> <!-- card end -->	
	</div><!-- container end -->
</body>
</html>