<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Profile</title>

<link rel="stylesheet" href="<c:url value='/views/css/index.css'/>" />

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid">
		<c:url var="url" value="/account"/>

		<!-- Navigation -->

		<%@include file="layout/nav.jsp"%>

		<!-- Main -->

		<div class="row">
			<article class="col-sm-9">
				<div class="row mt-3">
					<div class="w-100 m-auto">
						<div class="card">
							<div class="card-header">
								<h3>Profile</h3>
							</div>
							<div class="card-body">
								<form:form action="${url}/profile" method="post" modelAttribute="account">
									<div class="mb-3">
										<label for="username" class="form-label">Username</label> 
										<form:input
											type="text" class="form-control" id="username" path="username" 
											value="${account.username}"
											/>
										<div class="mt-2">
							              	<form:errors path="username" class="badge text-bg-danger"></form:errors>
							              </div>
									</div>
									
									<div class="mb-3">
										<label for="firstName" class="form-label">Firstname</label> 
										<form:input
											type="text" class="form-control" id="firstName" path="firstName"
											value="${account.firstName}"
											/>
										<div class="mt-2">
							              	<form:errors path="firstName" class="badge text-bg-danger"></form:errors>
							              </div>
									</div>
									
									<div class="mb-3">
										<label for="lastName" class="form-label">Lastname</label> 
										<form:input
											type="text" class="form-control" id="lastName" path="lastName"
											value="${account.lastName}"
											/>
										<div class="mt-2">
							              	<form:errors path="lastName" class="badge text-bg-danger"></form:errors>
							              </div>
									</div>
									
									<div class="mb-3">
										<label for="email" class="form-label">Email</label> 
										<form:input
											type="text" class="form-control" id="email" path="email"
											value="${account.email}"
											/>
										<div class="mt-2">
						              	<form:errors path="email" class="badge text-bg-danger"></form:errors>
						              </div>
									</div>
									
									
									<div class="mb-3">
										<span class="text-primary">${message}</span>
									</div>
									<button type="submit" class="btn btn-primary">Update</button>
									<button type="reset" class="btn btn-secondary">Cancel</button>
								</form:form>
							</div>
						</div>
					</div>
					
				</div>
			</article>

			<%@include file="layout/aside.jsp"%>
		</div>

		<!-- Footer -->

		<%@include file="layout/footer.jsp"%>
	</div>

	<!-- Bootstrap JS -->
	<script src="https://kit.fontawesome.com/c4e33664cc.js"
		crossorigin="anonymous"></script>
</body>
</html>