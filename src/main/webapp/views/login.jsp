<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>

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
								<h3>Login</h3>
							</div>
							<div class="card-body">
								<form action="${url}/login" method="post">
									<div class="mb-3">
										<label for="username" class="form-label">Username</label> <input
											type="text" class="form-control" id="username" name="id" value="${id}"
											/>
									</div>
									<div class="mb-3">
										<label for="password" class="form-label">Password</label> <input
											name="password" type="password"
											class="form-control" id="password" value="${password}"/>
									</div>
									<c:choose>
										<c:when test="${not empty id}">
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="true" id="remember" name="remember" checked>
											  <label class="form-check-label" for="remember">
											    Remember me?
											  </label>
											</div>
										</c:when>
										<c:otherwise>
											<div class="form-check">
											  <input class="form-check-input" type="checkbox" value="true" id="remember" name="remember">
											  <label class="form-check-label" for="remember">
											    Remember me?
											  </label>
											</div>
										</c:otherwise>
									</c:choose>
									
									<div class="mb-3">
										<span class="text-danger">${message}</span>
									</div>
									<button type="submit" class="btn btn-primary">Login</button>
									<button type="reset" class="btn btn-secondary">Cancel</button>
								</form>
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