<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Edit Position</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
	<link href="<c:url value="/css/form-design.css"/>" rel="stylesheet" type="text/css">
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
        		<a class="nav-link" href="<c:url value = "/employees/employees-of-the-month"/>">Top 5 Employees of the month</a>
      		</li>
   		</ul>
 	 	</div>
	</nav>

	<c:if test="${editPositionSuccessful}">
		<div class="row d-flex justify-content-center mt-4 mb-0">
			<div class="alert alert-success w-25"> 
				Changes on "${editPosition.seniorityAndDepartment}" saved to database!
			</div>
		</div>
	</c:if>
	
	<c:if test="${editPositionSuccessful != null && !editPositionSuccessful}">
		<div class="row d-flex justify-content-center mt-4 mb-0">
			<div class="alert alert-danger w-25"> 
				Error: could not save to database. 
			</div>
			<c:if test="${errorMessage != null }">
				<div> ${errorMessage }</div>
			</c:if>
		</div>
	</c:if>
	
	
	<div class="form-body">
    	<div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                    	<h3>Edit position</h3>
                        <p>Alter the data below.</p>
						<form:form action="/positions/edit-position" method="POST" modelAttribute="position">
							<form:input type="hidden" path="id"/>
							<form:input type="hidden" path="employees"/>
							<div class="form-row">
								<form:input type="text" path="department" placeholder="Department"/> 
								<form:errors path="department" cssClass="error"/> <br>
							</div>
							<div class="form-row">
								<form:label path="seniority"> Seniority: </form:label>
								<form:select path="seniority">
									<form:option value="0" label="Intern"/>
									<form:option value="1" label="Junior"/>
									<form:option value="2" label="Medior"/>
									<form:option value="3" label="Senior"/>
								</form:select> 
								<form:errors path="seniority" cssClass="error"/> <br>
							</div>
							<div class="form-button mt-3">
								<input type="submit" value="Save changes" class="btn btn-primary btn-lg">
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>