<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Add Task</title>
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
        		<a class="nav-link" href="<c:url value = "/employees/employees-of-the-month"/>">Top 5 Employees of the month</a>
      		</li>
   		</ul>
 	 	</div>
	</nav>

	<c:if test="${savedTaskSuccessful}">
		<div> Task "${savedTask.title }" saved to database!</div>
	</c:if>
	
	<c:if test="${savedTaskSuccessful != null && !savedTaskSuccessful}">
		<div> Error: could not save to database. </div>
		<c:if test="${errorMessage != null }">
			<div> ${errorMessage }</div>
		</c:if>
	</c:if>
	
	<form:form action="/tasks/add-task" method="POST" modelAttribute="task">
		<form:input type="text" path="title" placeholder="Task title"/> 
			<form:errors path="title" cssClass="error"/> <br>
		<form:textarea path="description" placeholder="Task description" rows="3" cols="20"/> 
			<form:errors path="description" cssClass="error"/> <br>
		<form:label path="dueDate"> Due date: </form:label> 
			<form:input type="date" path="dueDate" value="2023-03-13" max="2033-12-31" min="2020-01-01"/> 
				<form:errors path="dueDate" cssClass="error"/> <br>
		<form:label path="employee"> Assign employee: </form:label>
			<form:select path="employee">
				<c:forEach items="${allEmployees }" var="employee" varStatus="status">
					<form:option value="${employee }" label="${employee.fullNameAndId }"/>
				</c:forEach>
			</form:select> 
				<form:errors path="employee" cssClass="error"/> <br>
		<form:label path="completed"> Completed? </form:label> 
			<form:checkbox checked="true" id="checkboxCompleted" onclick="hideCompletionDateInput()" path="completed"/> 
				<form:errors path="completed" cssClass="error"/> <br>
		<div id="completionDateInputDiv">
			<form:label path="completionDate"> Completed on: </form:label> 
			<form:input type="date" path="completionDate" value="2023-03-13" max="2033-12-31" min="2020-01-01"/> 
		</div>
		<input type="submit" value="Save" class="btn btn-outline-success">
	</form:form>
	
	<script type="text/javascript">
		function hideCompletionDateInput() {
			var checkboxCompleted = document.getElementById("checkboxCompleted");
			var completionDateInputDiv = document.getElementById("completionDateInputDiv");
			if (checkboxCompleted.checked == true) 
				completionDateInputDiv.style.display = "block";
			else
				completionDateInputDiv.style.display = "none";
		}
	</script>
</body>
</html>