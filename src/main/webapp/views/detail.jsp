<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Detail</title>

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
					<div class="col-12">
						<div class="card">
					        <div class="card-header">
					          <h3 class="text-center">${product.name }</h3>
					        </div>
					        <div class="card-body">
					          <div class="row">
					          	<div class="col-md-8">
					          		<img src="/images/${product.image}" class="img-fluid mb-3 rounded" />
					          	</div>
					          	<div class="col-md-4">
					          		<ul class="list-group mb-3">
							            <li class="list-group-item">
							            	<h3 class="text-danger"><i class="fa-solid fa-dollar-sign"></i> ${product.price }</h3>
							            </li>
							            <li class="list-group-item"><strong>Category: </strong>
							            	<span>${product.category.name }</span>
							            </li>
							          </ul>
							          <a class="btn btn-primary" href="/cart/add/${product.id}">Add to cart</a>
					          	</div>
					          </div>
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