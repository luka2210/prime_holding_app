<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Add Employee</title>
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
	
	<c:if test="${savedEmployeeSuccessful}">
		<div class="row d-flex justify-content-center mt-4 mb-0">
			<div class="alert alert-success w-25"> 
				Employee ${savedEmployee.firstName } ${savedEmployee.lastName } saved to database!
			</div>
		</div>
	</c:if>
	
	<c:if test="${savedEmployeeSuccessful != null && !savedEmployeeSuccessful}">
		<div class="row d-flex justify-content-center mt-4 mb-0">
			<div class="alert alert-danger w-25"> 
				Error: could not save to database. 
				<c:if test="${errorMessage != null }">
					<div>
						${errorMessage }
					</div>
				</c:if>
			</div>
		</div>
	</c:if>
	
	<div class="form-body">
    	<div class="row">
            <div class="form-holder">
                <div class="form-content">
                    <div class="form-items">
                    	<h3>Add new employee</h3>
                        <p>Fill in the data below.</p>
						<form:form action="/employees/add-employee" method="POST" modelAttribute="employee">
							<div class="form-row">
								<form:input type="text" path="firstName" placeholder="First name"/> 
									<form:errors path="firstName" cssClass="error"/> 
							</div>
							<div class="form-row">
								<form:input type="text" path="lastName" placeholder="Last name"/>
								<form:errors path="lastName" cssClass="error"/>
							</div> 
							<div class="form-row">
								<form:input type="text" path="email" placeholder="E-mail address"/> 
								<form:errors path="email" cssClass="error"/> 
							</div>
							<div class="form-row">
								<form:input type="text" path="phoneNumber" placeholder="Phone number"/> 
								<form:errors path="phoneNumber" cssClass="error"/>
							</div>
							<div class="form-row">
								<form:label path="dateOfBirth"> Date of birth: </form:label> 
								<form:input type="date" path="dateOfBirth" value="1999-10-22" max="2005-12-31" min="1923-01-01"/> 
								<form:errors path="dateOfBirth" cssClass="error"/>
							</div>
							<div class="form-row">
								<form:label path="position"> Position: </form:label>
								<form:select path="position">
									<c:forEach items="${allPositions }" var="position" varStatus="status">
										<form:option value="${position }" label="${position.seniorityAndDepartment }"/>
									</c:forEach>
								</form:select>
								<form:errors path="position" cssClass="error"/> 
							</div> 
							<div class="form-row">
								<form:input type="number" path="monthlySalary" placeholder="Monthly salary (in €)"/> 
								<form:errors path="monthlySalary" cssClass="error"/> 
							</div>
							<div class="form-button mt-3">
								<input type="submit" value="Save" class="btn btn-primary btn-lg">
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>