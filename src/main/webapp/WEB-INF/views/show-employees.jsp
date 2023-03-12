<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Employees</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.3/css/dataTables.bootstrap5.min.css">
</head>
<body>
	<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
  		<div class="container-fluid">
  		<a class="navbar-brand" href="<c:url value = "/"/>">
      			<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Spring_Framework_Logo_2018.svg/1200px-Spring_Framework_Logo_2018.svg.png" alt="Logo" 
      				width="100" height="25" class="d-inline-block align-text-top">
     	 		Homepage
    			</a>
    	<!-- Links -->
    	<ul class="navbar-nav">
      		<li class="nav-item">
        		<a class="nav-link" href="<c:url value = "/employees/"/>">Employees</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="<c:url value = "/tasks/"/>">Tasks</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="<c:url value = "/positions/"/>">Positions</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="<c:url value = "/employees/employees-of-the-month"/>">Employee of the month</a>
      		</li>
   		</ul>
 	 	</div>
	</nav>

	<div class="container">
	<div class="row">
		<form action="add-employee" method="GET">
			<input type="submit" value="Add Employee"/>
		</form>
	</div>
	<div class="row">
		<table id="employees_table" class="table table-striped table-hover table-active" style="width:100%">
		<thead>
    	<tr>
    		<th>ID </th>
    		<th>Name </th>
    		<th>E-mail address</th>
        	<th>Phone number</th>
        	<th>Date of birth</th>
        	<th>Salary</th>
        	<th>Position</th>
        	<th></th>
        	<th></th>
    	</tr>
    </thead>
    <tbody>
    <c:forEach items="${employees}" var="employee" varStatus="status">
        <tr>
        	<td>${employee.id}</td>
        	<td>${employee.fullName}</td>
        	<td>${employee.email}</td>
            <td>${employee.phoneNumber}</td>
            <td>${employee.dateOfBirth}</td>
            <td>${employee.monthlySalary}€</td>
            <td>${employee.position.seniorityAndDepartment } </td>
            <td>
            	<form action="edit-employee" method="GET">
            		<input type="hidden" name="employeeId" value="${employee.id }" />
            		<input type="submit" value="Edit"/>
            	</form>
            </td>
            <td>
            	<form action="" method="POST"> 
            		<input type="hidden" name="employeeId" value="${employee.id }">
            		<input type="submit" value="Delete"/>
            	</form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
	</table>
	</div>
	</div>

	
	<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>
	<script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"> </script>
	<script src="https://cdn.datatables.net/1.13.3/js/dataTables.bootstrap5.min.js"> </script>
	<script>
		$(document).ready(function () {
	    	$('#employees_table').DataTable();
		});
	</script>
</body>
</html>